---
title: "All Products"
meta_title: "All Products — MatrixPlus"
description: "MatrixPlus builds an enterprise product portfolio around security and identity — open-source Community Editions, commercial Enterprise Editions, open standards, no lock-in."
layout: "products"
draft: false

label_detail: "Learn more"
label_contact: "Talk to sales"
label_highlights: "Key capabilities"

products:
  - key: "mxcwpp"
    tag: "Cloud Workload Protection · CWPP"
    name: "mxcwpp"
    tagline: "Cloud-native workload protection platform"
    status:
      key: "ga"
      label: "GA"
    description: "A unified security plane across hosts, containers, and Kubernetes. Runtime detection, vulnerability management, configuration baselines, and compliance audit — one platform. Community Edition is fully open source; Enterprise Edition targets production at scale."
    detail_url: "/en/products/mxcwpp/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/en/contact/"
    highlights:
      - "Host · container · Kubernetes unified protection"
      - "eBPF runtime threat detection"
      - "Image and host vulnerability scanning"
      - "CIS / NIST / MLPS configuration baselines"
      - "Code scanning (SAST) and dependency audit"
      - "OpenTelemetry / OCSF open standards"
      - "Plugin-based detection rule architecture"
      - "Attack-chain visualization and remediation"
    editions:
      - name: "Community Edition"
        open: true
        label: "AGPL-3.0"
        description: "Full core capability, free and open. Built for individuals, small teams, and community contributors."
      - name: "Enterprise Edition"
        open: false
        label: "Commercial"
        description: "Production at scale: HA, multi-tenancy, compliance, SLA, long-term support."

  - key: "mxcmdb"
    tag: "Configuration · CMDB"
    name: "mxcmdb"
    tagline: "Open-source IT asset and configuration database"
    status:
      key: "ga"
      label: "GA"
    description: "Unified management for IT assets and configuration data — domains, servers, services, network devices, certificates — all in one graph, consumed natively by mxcwpp, mxid, and downstream ticketing."
    detail_url: "/en/products/mxcmdb/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/en/contact/"
    highlights:
      - "Multi-type assets: domains / hosts / services / devices / certs"
      - "Relationship graph and topology visualization"
      - "Agent-based discovery + agentless scanning"
      - "Cloud resource sync (Alibaba / Tencent / AWS)"
      - "Flexible custom asset models"
      - "Full REST API + webhooks"
      - "Native integration with mxcwpp / mxid"
      - "Audit trail and change history"
    editions:
      - name: "Community Edition"
        open: true
        label: "AGPL-3.0"
        description: "Full CMDB core, free and open."
      - name: "Enterprise Edition"
        open: false
        label: "Commercial"
        description: "HA, multi-tenancy, deep integration, long-term support."

  - key: "ticketdesk"
    tag: "Ticketing & Service Desk"
    name: "ticketdesk"
    tagline: "Open-source ticketing and service desk"
    status:
      key: "ga"
      label: "GA"
    description: "Open-source ticketing for IT, security, and customer support teams — multi-channel intake, SLA management, automated workflows, and a customer portal. Works with mxcmdb / mxcwpp / mxid out of the box for a full operations loop."
    detail_url: "/en/products/ticketdesk/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/en/contact/"
    highlights:
      - "Multi-channel intake (web / email / API / IM)"
      - "Assignment rules and escalation policies"
      - "SLA management and timeout alerts"
      - "Visual workflow editor"
      - "Customer self-service portal and knowledge base"
      - "Reports, dashboards, and exports"
      - "Linked to CMDB and security platform"
      - "Full REST API"
    editions:
      - name: "Community Edition"
        open: true
        label: "AGPL-3.0"
        description: "Full ticketing and service desk, free and open."
      - name: "Enterprise Edition"
        open: false
        label: "Commercial"
        description: "HA, deep integration, compliance audit, long-term support."

  - key: "mxid"
    tag: "Identity & Access · EIAM"
    name: "mxid"
    tagline: "Enterprise identity and access management"
    status:
      key: "ga"
      label: "GA"
    description: "A unified Enterprise IAM platform — identity, access, and compliance in one source of truth. Community Edition open-sources the core; Enterprise Edition targets enterprise-scale governance with HA and long-term support."
    detail_url: "/en/products/mxid/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/en/contact/"
    highlights:
      - "OAuth 2.0 / OIDC / SAML / SCIM stack"
      - "SSO + adaptive multi-factor auth"
      - "Workforce lifecycle automation"
      - "Policy-as-code (RBAC / ABAC / ReBAC)"
      - "Passkey / WebAuthn passwordless login"
      - "Audit logs and compliance reporting"
      - "OPA / Cedar policy adapters"
      - "Terraform Provider and CLI"
    editions:
      - name: "Community Edition"
        open: true
        label: "AGPL-3.0"
        description: "Full EIAM core, free and open. Built for SMBs, startups, and teams self-hosting their identity foundation."
      - name: "Enterprise Edition"
        open: false
        label: "Commercial"
        description: "Enterprise scale: HA, compliance reporting, workforce + customer governance, SLA."

roadmap_title: "More to come"
roadmap_subtitle: "More capabilities around security, identity, and digital infrastructure are in progress."
roadmap:
  - tag: "Coming"
    name: "Next generation of capabilities"
    description: "We are evaluating the next batch of standalone products across security operations, data governance, and AI safety. Get in touch if you'd like to influence direction."

cta_title: "Not sure which product fits?"
cta_subtitle: "Tell us your scenario — we'll recommend selection and a deployment plan."
cta_label: "Talk to us"
---
