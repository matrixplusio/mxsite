#!/usr/bin/env bash
#
# Issue Let's Encrypt TLS certificates for matrixplus.io + www.matrixplus.io.
# Run AFTER:
#   - deploy/vps-init.sh has completed
#   - DNS A records for both names point to this VPS
#
# Rocky Linux 10. Run as root (or with sudo).
#
set -euo pipefail

DOMAIN_PRIMARY="${DOMAIN_PRIMARY:-matrixplus.io}"
DOMAIN_WWW="${DOMAIN_WWW:-www.matrixplus.io}"
EMAIL="${EMAIL:-contact@matrixplus.io}"

if [[ "$EUID" -ne 0 ]]; then
  echo "ERROR: run as root (use sudo)." >&2
  exit 1
fi

echo "==> Installing certbot via dnf (requires EPEL)"
dnf -y install epel-release || true
dnf -y install certbot python3-certbot-nginx

echo "==> Requesting certificate for ${DOMAIN_PRIMARY}, ${DOMAIN_WWW}"
certbot --nginx \
  --non-interactive \
  --agree-tos \
  --redirect \
  -m "${EMAIL}" \
  -d "${DOMAIN_PRIMARY}" \
  -d "${DOMAIN_WWW}"

echo "==> Enabling certbot-renew timer for auto-renewal"
systemctl enable --now certbot-renew.timer 2>/dev/null \
  || systemctl enable --now certbot.timer 2>/dev/null \
  || true
systemctl list-timers | grep -i certbot || true

echo "==> Done. Verify TLS:  curl -I https://${DOMAIN_PRIMARY}/"
