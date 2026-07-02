---
title: "mxid"
meta_title: "mxid — Open-source Enterprise Identity & Access Management (EIAM) — MatrixPlus"
description: "mxid is a unified open-source EIAM platform — SSO, adaptive MFA, lifecycle, policy-as-code authorization, and compliance audit."
date: 2026-06-07
draft: false
---

## Overview

**mxid** is the MatrixPlus open-source **Enterprise Identity & Access Management (EIAM) platform**. It consolidates an organization's scattered identities — workforce, partners, customers, and per-system entitlements — into a single source of truth that **security, IT, compliance, and business teams** can all work from.

mxid is built on open standards (OAuth 2.0 / OIDC / SAML / SCIM). The **Community Edition** open-sources the full EIAM core; the **Enterprise Edition** targets large-scale enterprise scenarios with HA, governance, compliance audit, and long-term support.

## Key metrics

- **AGPL-3.0** open-source license (Community Edition)
- **Two editions** Community + Enterprise
- **5 protocols** OAuth 2.0 / OIDC / SAML 2.0 / SCIM 2.0 / LDAP
- **3 authorization models** RBAC / ABAC / ReBAC
- **Passwordless** Passkey / WebAuthn / OTP
- **Workforce + Customer** Both identity domains on one platform

## Architecture overview

mxid follows a four-tier architecture: **ingress / core / governance / directory**, each independently scalable.

{{< mermaid >}}
graph LR
  subgraph CLI[Clients & apps]
    APP1[Business systems]
    APP2[SaaS apps]
    APP3[Internal portal]
    CLI1[CLI / Terraform]
  end

  APP1 -->|OIDC| GW
  APP2 -->|SAML| GW
  APP3 -->|OIDC| GW
  CLI1 -->|REST API| GW

  GW[Ingress<br/>SSO / API Gateway]

  subgraph CORE[Core]
    AUTH[Authentication<br/>Password · MFA · Passkey]
    POLICY[Policy engine<br/>RBAC · ABAC · ReBAC]
    SESSION[Session manager]
  end

  GW --> AUTH
  AUTH --> POLICY
  AUTH --> SESSION

  subgraph GOV[Governance]
    LIFECYCLE[Lifecycle<br/>Joiner · Mover · Leaver]
    GOVERN[Least-privilege scan]
    AUDIT[Audit & compliance<br/>SOC2 / ISO27001 / MLPS]
  end

  POLICY --> GOV

  subgraph DIR[Directory]
    DIRECTORY[(Unified identity directory)]
    GROUPS[(Groups · roles · policies)]
  end

  POLICY <--> DIRECTORY
  POLICY <--> GROUPS
  LIFECYCLE <--> DIRECTORY

  subgraph SRC[Identity sources]
    HR[HR / DingTalk / Lark]
    AD[AD / LDAP]
    SYS[Business systems]
  end

  HR -->|SCIM| LIFECYCLE
  AD -->|LDAP Sync| LIFECYCLE
  SYS -->|SCIM| LIFECYCLE

  AUDIT -.-> CMDB[mxcmdb]
  AUTH -.-> MXSEC[mxcwpp]
{{< /mermaid >}}

## Core capabilities (five modules)

### 1. Unified identity directory

- Multi-source aggregation: HR / DingTalk / Lark / AD / LDAP / business systems
- Standards-based intake: SCIM 2.0 / LDAP / API sync
- Full workforce lifecycle: joiner / mover / leaver automation
- Both workforce and customer identity domains (CIAM)

### 2. Strong authentication

- SSO across every application via OAuth 2.0 / OIDC / SAML 2.0
- Adaptive MFA: device, geo, behavioral risk-driven challenges
- Passwordless: Passkey / WebAuthn / OTP / push
- Risk signals: anomalous IP, anomalous device, impossible-travel detection

### 3. Fine-grained authorization

- Policy-as-Code
- Three models: RBAC / ABAC / ReBAC
- Enforcement at application, API, and field level
- Integration with OPA, Cedar, and other policy engines

### 4. Governance and compliance

- Immutable access audit log
- Continuous least-privilege scanning
- Compliance reports: SOC 2, ISO 27001, China MLPS 2.0, banking API security standards
- One-click evidence export (PDF / CSV)

### 5. Open ecosystem

- Full REST API + Terraform Provider
- CLI tooling and SDKs
- Webhook event stream (user create / login failure / permission change)
- Adapters for OPA, Cedar, and other engines

## Integration with the MatrixPlus stack

| Integration | Value |
|-------------|-------|
| **[mxcwpp](/en/products/mxcwpp/)** · security | Anomalous logins and privilege abuse generate security alerts directly |
| **[mxcmdb](/en/products/mxcmdb/)** · asset graph | Identities link to assets and entitlements — "who has what access" |
| **[ticketdesk](/en/products/ticketdesk/)** · ticketing | Access requests run through approval flows with full traceability |

## Deployment options

| Form | Best for |
|------|----------|
| **Docker / Compose** | Single-node quick start |
| **Kubernetes (Helm)** | Multi-replica, multi-AZ HA |
| **Multi-region failover** | Cross-region active/passive sync (Enterprise) |
| **Air-gapped** | Government / regulated, fully offline |

## Where it fits

- Mid- to large-enterprise unified identity and authorization
- Directory integration after M&A
- Identity foundation for zero-trust rollout
- Regulated industries (finance / government / multinationals)
- Customer IAM (CIAM) backbone for SaaS providers

## Live deployments

- **MatrixPlus self-operated business** — unified identity across all internal systems, including mxcwpp, mxcmdb, and ticketdesk themselves
- **Enterprise customers** — deployed together with mxcwpp at multinational subsidiaries, delivering SSO and audit

→ [Related case studies](/en/cases/#engineering)

## Get started

→ Repository: [github.com/matrixplusio](https://github.com/matrixplusio)
→ License: AGPL-3.0
→ Documentation and deployment guides ship with the repo

For private deployment, multi-region failover, compliance consulting, or long-term support, [contact us](/en/contact/).
