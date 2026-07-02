---
title: "mxcmdb"
meta_title: "mxcmdb — Open-source IT asset and configuration database (CMDB) — MatrixPlus"
description: "mxcmdb consolidates enterprise IT assets — domains, servers, services, network devices, certificates — into one graph, with native integration to mxcwpp, mxid, and ticketdesk."
date: 2026-06-07
draft: false
---

## Overview

**mxcmdb** is the MatrixPlus open-source **Configuration Management Database (CMDB)**, built for modern IT and security operations. It pulls asset information out of scripts, spreadsheets, and ad-hoc platforms into **one graph**, so mxcwpp, mxid, and ticketdesk can all read from the **same source of truth**.

A CMDB should not be a passive database. mxcmdb treats itself as a **developer-facing internal API**: every asset is queryable, subscribable, traversable, and audited.

## Key metrics

- **AGPL-3.0** open-source license (Community Edition)
- **Two editions** Community + Enterprise
- **N asset types** Hosts / containers / services / devices / certificates / domains / custom
- **Multi-cloud sync** Alibaba / Tencent / AWS / GCP / Azure
- **Dual discovery** Agent reporting + agentless scanning
- **Full API** REST + Webhook + Terraform Provider

## Architecture overview

mxcmdb is organized around the **asset graph**, decoupled into four tiers: discovery → model → service → consumption.

{{< mermaid >}}
graph LR
  subgraph DISC[Discovery]
    AG[Agent reporting<br/>Hosts · containers · processes]
    SCAN[Agentless scanning<br/>Network · certs · ports]
    CLOUD[Cloud APIs<br/>Alibaba · Tencent · AWS · GCP]
    MAN[Manual / Excel / Terraform]
  end

  AG --> ING
  SCAN --> ING
  CLOUD --> ING
  MAN --> ING

  ING[Asset ingestion<br/>Normalize · dedup · relationship inference]

  subgraph MODEL[Model]
    ASSET[(Asset objects<br/>Type · fields · tags)]
    REL[(Relationship graph<br/>Many-to-many · multi-view)]
    HIST[(Change history)]
  end

  ING --> ASSET
  ASSET <--> REL
  ASSET --> HIST

  subgraph SVC[Service]
    API[REST API + GraphQL]
    HOOK[Webhook]
    SUB[Subscription]
    VIZ[Graph visualization]
  end

  ASSET --> API
  REL --> VIZ
  ASSET --> HOOK
  ASSET --> SUB

  subgraph CON[Consumers]
    MXSEC[mxcwpp<br/>Alert ↔ asset]
    MXID[mxid<br/>Identity ↔ entitlement]
    TICKET[ticketdesk<br/>Ticket ↔ asset]
    EXT[External ITSM / SIEM]
  end

  API --> MXSEC
  API --> MXID
  API --> TICKET
  HOOK --> EXT
  SUB --> EXT
{{< /mermaid >}}

## Core capabilities (five modules)

### 1. Multi-type asset model

- Hosts: physical, VM, container, pod
- Services: apps, databases, message queues, caches
- Network: devices, load balancers, CDNs, domains, subdomains
- Certificates: full SSL/TLS coverage with expiry monitoring
- Custom types: any business object can be modeled

### 2. Automatic discovery + manual upkeep

- Agent reporting: shares the channel with mxcwpp-agent
- Agentless network scanning: for devices and certificates
- Cloud API sync: Alibaba / Tencent / AWS / GCP / Azure
- Bulk import: Excel / API / Terraform Provider

### 3. Relationship graph and topology

- Many-to-many relationship modeling
- Three-tier view: business / application / infrastructure
- Impact analysis and change rehearsal ("if this host moves, what breaks?")
- Topology visualization (dependency / call / network graph)

### 4. Open interface and events

- Full REST API + GraphQL queries
- Webhook delivery for change events
- Asset subscriptions: long-lived listeners filtered by type and tag
- Terraform Provider for IaC

### 5. Audit and change management

- Full change history (who / when / what)
- Field-level diff before and after
- Approval-required changes via ticketdesk integration
- Immutable audit log

## Integration with the MatrixPlus stack

| Integration | Value |
|-------------|-------|
| **[mxcwpp](/en/products/mxcwpp/)** · security | Alerts and vulnerabilities auto-link to assets — blast radius in one glance |
| **[mxid](/en/products/mxid/)** · unified identity | Identity-to-entitlement matrix — "who can log into which host" |
| **[ticketdesk](/en/products/ticketdesk/)** · ticketing | Tickets link to assets; changes and incidents are traceable |

## Deployment options

| Form | Best for |
|------|----------|
| **Docker / Compose** | Single-node quick start with bundled PostgreSQL + Redis |
| **Kubernetes (Helm)** | Multi-replica with high-availability graph storage |
| **Air-gapped** | Government / regulated, fully offline |

## Where it fits

- Enterprise IT asset inventory and lifecycle
- Domain and SSL certificate expiry monitoring
- Asset foundation for security operations (impact analysis)
- Change management and rehearsal
- Multi-cloud unified governance

## Live deployments

- **MatrixPlus self-operated business** — unified asset view across engineering, ops, and commerce
- **Enterprise customers** — paired with mxcwpp for asset inventory and vulnerability impact analysis at government/enterprise customers

→ [Related case studies](/en/cases/#engineering)

## Get started

→ Repository: [github.com/matrixplusio](https://github.com/matrixplusio)
→ License: AGPL-3.0
→ Documentation and deployment guides ship with the repo

For private deployment, deep ITSM/SIEM integration, or long-term operational support, [contact us](/en/contact/).
