#!/usr/bin/env bash
#
# MatrixPlus VPS bootstrap for Rocky Linux 10.
# Run ONCE as root (or with sudo) on a fresh VPS.
#
#   curl -fsSL https://raw.githubusercontent.com/matrixplusio/mxsite/main/deploy/vps-init.sh | sudo bash
#
# What it does:
#   1. dnf update + install nginx + firewalld + curl + git + rsync + fail2ban + policycoreutils-python-utils
#   2. Enable EPEL for tooling
#   3. Create a non-root `deploy` user with ~/.ssh/authorized_keys
#   4. Configure firewalld (open ssh + http + https), enable it
#   5. Write the nginx site config for matrixplus.io and enable it
#   6. Create the web root /var/www/mxsite owned by `deploy`
#   7. Apply SELinux contexts so nginx can serve the directory
#   8. Print next-step instructions
#
set -euo pipefail

DEPLOY_USER="${DEPLOY_USER:-deploy}"
WEB_ROOT="${WEB_ROOT:-/var/www/mxsite}"
DOMAIN_PRIMARY="${DOMAIN_PRIMARY:-matrixplus.io}"
DOMAIN_WWW="${DOMAIN_WWW:-www.matrixplus.io}"
NGINX_CONF_DIR="/etc/nginx/conf.d"
NGINX_SITE="${NGINX_CONF_DIR}/matrixplus.io.conf"

require_root() {
  if [[ "$EUID" -ne 0 ]]; then
    echo "ERROR: run as root (use sudo)." >&2
    exit 1
  fi
}

dnf_install() {
  echo "==> Refreshing dnf and installing base packages"
  dnf -y install dnf-plugins-core
  dnf -y install epel-release || true
  dnf -y update
  dnf -y install \
    nginx \
    firewalld \
    curl \
    git \
    rsync \
    fail2ban \
    policycoreutils-python-utils \
    openssh-server \
    ca-certificates
  systemctl enable --now nginx
  systemctl enable --now firewalld
  systemctl enable --now sshd
}

create_deploy_user() {
  if id "$DEPLOY_USER" >/dev/null 2>&1; then
    echo "==> User '$DEPLOY_USER' already exists, skipping"
  else
    echo "==> Creating deploy user '$DEPLOY_USER' (no password, ssh-key only)"
    useradd --create-home --shell /bin/bash "$DEPLOY_USER"
    passwd -l "$DEPLOY_USER"   # lock password — ssh-key only
  fi
  install -d -m 700 -o "$DEPLOY_USER" -g "$DEPLOY_USER" "/home/$DEPLOY_USER/.ssh"
  touch "/home/$DEPLOY_USER/.ssh/authorized_keys"
  chmod 600 "/home/$DEPLOY_USER/.ssh/authorized_keys"
  chown "$DEPLOY_USER:$DEPLOY_USER" "/home/$DEPLOY_USER/.ssh/authorized_keys"
  # SELinux: allow user homedir SSH
  restorecon -R "/home/$DEPLOY_USER/.ssh" || true
}

create_web_root() {
  echo "==> Creating web root $WEB_ROOT (owned by $DEPLOY_USER)"
  install -d -m 755 -o "$DEPLOY_USER" -g "$DEPLOY_USER" "$WEB_ROOT"
  if [[ ! -f "$WEB_ROOT/index.html" ]]; then
    cat >"$WEB_ROOT/index.html" <<HTML
<!doctype html>
<html><head><meta charset="utf-8"><title>MatrixPlus</title></head>
<body><h1>MatrixPlus</h1><p>Awaiting first deploy.</p></body></html>
HTML
    chown "$DEPLOY_USER:$DEPLOY_USER" "$WEB_ROOT/index.html"
  fi

  echo "==> Applying SELinux context to $WEB_ROOT (httpd_sys_content_t)"
  semanage fcontext -a -t httpd_sys_content_t "${WEB_ROOT}(/.*)?" 2>/dev/null || true
  restorecon -R "$WEB_ROOT" || true
}

write_nginx_site() {
  echo "==> Writing nginx site config for $DOMAIN_PRIMARY"

  # Disable the default Rocky placeholder server
  if [[ -f /etc/nginx/nginx.conf ]] && grep -q "default_server" /etc/nginx/nginx.conf; then
    sed -i 's/listen       80 default_server;/listen       80;/g' /etc/nginx/nginx.conf || true
    sed -i 's/listen       \[::\]:80 default_server;/listen       \[::\]:80;/g' /etc/nginx/nginx.conf || true
  fi

  cat >"$NGINX_SITE" <<NGINX
# Canonical host is www.matrixplus.io. Apex 301-redirects to www so that the
# Hugo baseURL (https://www.matrixplus.io/) matches the serving origin and
# avoids cross-origin / SRI failures.
#
# certbot --nginx --redirect will:
#   - upgrade each server block to listen 443 ssl with the shared cert
#   - add 80 -> 443 redirect to the serving (www) block
#   - leave the apex block's `return 301` intact (works on both 80 and 443)

# --- Apex -> www (HTTP; certbot will clone this to HTTPS too) ---
server {
    listen 80;
    listen [::]:80;
    server_name ${DOMAIN_PRIMARY};

    # ACME http-01 challenge — served from the same webroot as www so that
    # `certbot renew` works even though apex otherwise 301s everything.
    location ^~ /.well-known/acme-challenge/ {
        root ${WEB_ROOT};
        default_type "text/plain";
        try_files \$uri =404;
    }

    location / {
        return 301 \$scheme://${DOMAIN_WWW}\$request_uri;
    }
}

# --- www: actual site ---
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name ${DOMAIN_WWW};

    root ${WEB_ROOT};
    index index.html;

    # Long cache for fingerprinted assets, short cache for HTML.
    location ~* \.(?:css|js|woff2?|svg|jpe?g|png|gif|ico|webp|avif|mp4)$ {
        expires 30d;
        access_log off;
        add_header Cache-Control "public, max-age=2592000, immutable";
        try_files \$uri =404;
    }

    location / {
        try_files \$uri \$uri/ \$uri.html =404;
        add_header Cache-Control "public, max-age=300, must-revalidate";
    }

    # Hugo English subdir
    location /en/ {
        try_files \$uri \$uri/ \$uri.html =404;
    }

    error_page 404 /404.html;

    gzip on;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml;

    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    add_header Permissions-Policy "interest-cohort=()" always;
}
NGINX

  nginx -t
  systemctl reload nginx

  echo "==> Allowing nginx to serve from $WEB_ROOT via SELinux boolean"
  setsebool -P httpd_can_network_connect 1 || true
}

configure_firewall() {
  echo "==> Configuring firewalld"
  firewall-cmd --permanent --add-service=ssh
  firewall-cmd --permanent --add-service=http
  firewall-cmd --permanent --add-service=https
  firewall-cmd --reload
  firewall-cmd --list-all
}

print_next_steps() {
  cat <<MSG

==================================================================
VPS bootstrap complete (Rocky Linux 10).

Next steps:

  1. Add the GitHub Actions deploy public key (the .pub of the secret
     SSH_PRIVATE_KEY you put in the repo) to:

       /home/${DEPLOY_USER}/.ssh/authorized_keys

     Example:
       echo 'ssh-ed25519 AAAA...== github-actions-mxsite' \\
         | sudo tee -a /home/${DEPLOY_USER}/.ssh/authorized_keys

  2. Point DNS A records to this VPS's public IP:
       ${DOMAIN_PRIMARY}     A  <THIS_VPS_IP>
       ${DOMAIN_WWW}         A  <THIS_VPS_IP>

  3. Once DNS resolves to this VPS, issue TLS certs with certbot:
       sudo bash deploy/certbot.sh

  4. Trigger a deploy from the repo:
       git push origin main

GitHub Actions secrets you need to set on the repo
(github.com/matrixplusio/mxsite → Settings → Secrets and variables → Actions):

  SSH_HOST        <this VPS public IP>
  SSH_USER        ${DEPLOY_USER}
  SSH_PORT        22  (or your custom port)
  SSH_PRIVATE_KEY <the deploy key, including BEGIN/END lines>
  DEPLOY_PATH     ${WEB_ROOT}

Initial root password should be rotated NOW:
       passwd
==================================================================
MSG
}

main() {
  require_root
  dnf_install
  create_deploy_user
  create_web_root
  write_nginx_site
  configure_firewall
  print_next_steps
}

main "$@"
