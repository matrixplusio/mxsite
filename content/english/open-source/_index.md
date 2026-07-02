---
title: "Open Source"
meta_title: "Open Source — MatrixPlus"
description: "We believe security infrastructure should be open. MatrixPlus open-source projects are auditable, extensible, and free of vendor lock-in."
layout: "open-source"
draft: false

org_link:
  url: "https://github.com/matrixplusio"
  label: "github.com/matrixplusio"

label_license: "License"
label_language: "Languages"
label_category: "Category"
label_repo: "GitHub repo"
label_product: "Product page"
label_docs: "Docs"
label_note: "Note"

projects:
  - key: "mxcwpp"
    tag: "Cloud Workload Protection"
    name: "mxcwpp"
    tagline: "Cloud Workload Protection Platform (CWPP)"
    status:
      key: "public"
      label: "Open source"
    license: "AGPL-3.0 (Community) · Commercial (Enterprise)"
    language: "Go · TypeScript"
    category: "CWPP / cloud-native security"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/en/products/mxcwpp/"
    description: "mxcwpp is a Cloud Workload Protection Platform for the cloud-native era — unified protection across hosts, containers, and Kubernetes. The Community Edition is fully open source — auditable and extensible. The Enterprise Edition targets production-scale customers with high availability, multi-tenancy, and SLA support."
    features:
      - "Unified protection across hosts, containers, and Kubernetes"
      - "eBPF-based runtime threat detection"
      - "Image scanning and vulnerability management"
      - "CIS / NIST / MLPS configuration baselines"
      - "Code scanning (SAST) and dependency audit"
      - "OpenTelemetry / OCSF open standards"
      - "Plugin-based detection rule architecture"
      - "Attack-chain visualization and remediation"
    editions:
      - name: "Community Edition"
        license:
          open: true
          label: "AGPL-3.0 · open"
        description: "Full core capability, free and open. Built for individuals, small teams, learners, and community contributors."
        points:
          - "Full detection and scanning capability"
          - "Single-host or small-cluster deployment"
          - "Community docs and GitHub Discussions"
          - "Fully open to forking and extension"
      - name: "Enterprise Edition"
        license:
          open: false
          label: "Commercial"
        description: "Built for production at scale. Adds enterprise governance, scale-out deployment, and operational guarantees on top of the Community Edition."
        points:
          - "High-availability clusters and multi-tenancy"
          - "Fine-grained RBAC and audit trail"
          - "Compliance reporting and regulator-ready evidence"
          - "SLA support, version maintenance, and upgrades"
          - "Custom integration and on-site engineer placement"

  - key: "mxcmdb"
    tag: "Configuration · CMDB"
    name: "mxcmdb"
    tagline: "Open-source IT asset and configuration management database"
    status:
      key: "public"
      label: "Open source"
    license: "AGPL-3.0 (Community) · Commercial (Enterprise)"
    language: "Go · TypeScript"
    category: "CMDB / configuration management"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/en/products/mxcmdb/"
    description: "Put all enterprise IT assets — domains, servers, services, network devices, certificates — into one graph. Community Edition is fully open; Enterprise Edition targets scale-out and multi-group governance."
    features:
      - "Multi-type asset models (domains / hosts / services / devices / certificates)"
      - "Relationship graph and topology visualization"
      - "Agent discovery + agentless scanning"
      - "Cloud resource sync (Alibaba / Tencent / AWS / GCP)"
      - "Custom asset types and fields"
      - "REST API + webhooks"
      - "Native integration with mxcwpp / mxid / ticketdesk"
      - "Audit trail and change history"
    editions:
      - name: "Community Edition"
        license:
          open: true
          label: "AGPL-3.0 · open"
        description: "Full CMDB core, free and open."
        points:
          - "All asset models and graph capability"
          - "Agent / scanning discovery engine"
          - "Full REST API"
          - "Community and GitHub Discussions support"
      - name: "Enterprise Edition"
        license:
          open: false
          label: "Commercial"
        description: "Built for scale-out and multi-group governance."
        points:
          - "HA clusters and multi-tenancy"
          - "Cross-group merged view with isolation"
          - "Deep integration (ITSM / CI/CD / SIEM)"
          - "SLA support and version maintenance"

  - key: "ticketdesk"
    tag: "Ticketing & Service Desk"
    name: "ticketdesk"
    tagline: "Open-source enterprise ticketing and service desk"
    status:
      key: "public"
      label: "Open source"
    license: "AGPL-3.0 (Community) · Commercial (Enterprise)"
    language: "Go · TypeScript"
    category: "ITSM / ticketing"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/en/products/ticketdesk/"
    description: "Open-source ticketing for IT, security, and customer support teams — multi-channel intake, SLA, automated workflows, and a customer portal. Community Edition is fully open; Enterprise Edition targets large-scale support and compliance audit scenarios."
    features:
      - "Multi-channel intake (web / email / API / IM)"
      - "Assignment rules and escalation policies"
      - "SLA management and timeout alerts"
      - "Visual workflow editor"
      - "Customer self-service portal and knowledge base"
      - "Reports, dashboards, and exports"
      - "Linked with mxcmdb / mxcwpp / mxid"
      - "Full REST API"
    editions:
      - name: "Community Edition"
        license:
          open: true
          label: "AGPL-3.0 · open"
        description: "Full ticketing and service desk, free and open."
        points:
          - "End-to-end ticket lifecycle"
          - "SLA, workflows, knowledge base"
          - "Customer portal"
          - "API and webhooks fully open"
      - name: "Enterprise Edition"
        license:
          open: false
          label: "Commercial"
        description: "Built for large-scale support and audit-grade compliance."
        points:
          - "HA deployment and multi-tenancy"
          - "Compliance audit and evidence export"
          - "Deep integration (CMDB / security / IM)"
          - "SLA support and version maintenance"

  - key: "mxid"
    tag: "Identity & Access"
    name: "mxid"
    tagline: "Enterprise Identity & Access Management (EIAM)"
    status:
      key: "public"
      label: "Open source"
    license: "AGPL-3.0 (Community) · Commercial (Enterprise)"
    language: "Go · TypeScript"
    category: "EIAM / identity governance"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/en/products/mxid/"
    description: "mxid is a unified Enterprise Identity & Access Management platform. The Community Edition open-sources the full EIAM core — teams can build their own identity foundation on top of it. The Enterprise Edition targets large-scale enterprise governance with HA, compliance, and long-term support."
    features:
      - "OAuth 2.0 / OIDC / SAML / SCIM protocol implementations"
      - "Connector SDK (HR / AD / business systems)"
      - "Passkey / WebAuthn client"
      - "Policy-as-code engine (RBAC / ABAC / ReBAC)"
      - "SSO and adaptive MFA"
      - "Audit log schema and export tooling"
      - "OPA / Cedar policy adapters"
      - "CLI admin tooling and Terraform Provider"
    editions:
      - name: "Community Edition"
        license:
          open: true
          label: "AGPL-3.0 · open"
        description: "Full EIAM core, free and open. Built for SMBs, startups, and engineering teams self-hosting their identity foundation."
        points:
          - "OAuth / OIDC / SAML / SCIM stack"
          - "SSO / MFA / lifecycle basics"
          - "Policy-as-code authorization engine"
          - "Connector SDK and CLI tooling"
      - name: "Enterprise Edition"
        license:
          open: false
          label: "Commercial"
        description: "Built for enterprise scale. Adds governance, compliance, HA, and long-term support on top of the Community Edition."
        points:
          - "High-availability deployment with multi-region failover"
          - "Fine-grained authorization audit and least-privilege scans"
          - "SOC 2 / ISO 27001 / MLPS compliance reporting"
          - "Workforce + Customer identity governance"
          - "SLA support, version maintenance, and upgrades"
          - "Custom integration for customer scenarios"

# Why open source
principles_title: "Why we open-source"
principles_subtitle: "Security infrastructure is only trustworthy when it's auditable; engineering is only worth depending on when it's open."
principles:
  - index: "01"
    title: "Auditable, therefore trustworthy"
    description: "The tooling that protects your core systems should be readable, testable, and audit-friendly. A black-box security product is itself a risk."
  - index: "02"
    title: "No lock-in"
    description: "We embrace open standards — OAuth, OIDC, SCIM, OpenTelemetry, eBPF. Customers can fork, self-host, or migrate at any time. No technical debt holding them hostage."
  - index: "03"
    title: "The community is the moat"
    description: "Engineering problems are ultimately solved by engineers. Open source lets the whole world refine the code — single-vendor effort cannot match a community."
  - index: "04"
    title: "Engineer's pride"
    description: "We are engineers. We want our code to be read, reused, and criticized. Open source is how we talk to our peers."

# How to contribute
contribute_title: "How to contribute"
contribute_subtitle: "Multiple ways to join the MatrixPlus open-source community."
contribute:
  - icon: "⭐"
    title: "Star"
    description: "Watch and star the projects — visibility matters."
  - icon: "🐛"
    title: "Issue"
    description: "File bugs or feature requests."
  - icon: "🤝"
    title: "Pull Request"
    description: "Contribute code — all levels welcome."
  - icon: "💬"
    title: "Discussions"
    description: "Talk to the team and the community on GitHub Discussions."

cta_title: "Bring open standards to your next project"
cta_subtitle: "Need an enterprise deployment, a custom integration, or long-term operational support? We stand behind it."
cta_label: "Talk to us"
---
