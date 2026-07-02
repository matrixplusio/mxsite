---
title: "mxcwpp"
meta_title: "mxcwpp — Open-source Cloud Workload Protection Platform (CWPP) — MatrixPlus"
description: "mxcwpp is an open-source Cloud Workload Protection Platform (CWPP) for the cloud-native era — unified protection across hosts, containers, Kubernetes, and serverless workloads. Currently deployed on 3000+ production hosts."
date: 2026-06-06
draft: false
---

## Overview

**mxcwpp** is the MatrixPlus open-source **Cloud Workload Protection Platform (CWPP)**, purpose-built for the cloud-native era. It provides a unified security plane across hosts, containers, Kubernetes, and serverless workloads, and consolidates **runtime detection, vulnerability management, baseline compliance, container security, and antivirus** into a single control plane — so DevSecOps teams can run real defense-in-depth, not just dashboards.

mxcwpp is currently deployed on **3000+ production hosts**, spanning overseas subsidiaries of multinational groups, government and enterprise customers, and internet-business workloads.

## Key metrics

- **3000+** production hosts
- **AGPL-3.0** open-source license (Community Edition)
- **Two editions** Community + Enterprise
- **8 Kafka topics** + DLQ for business-domain data-plane partitioning
- **6 schedulers** canary rollout / rule sync / alert governance / IOC sync / plugin distribution / restart orchestration
- **Low overhead** eBPF-based runtime detection, typically under 2% CPU and 80 MiB RAM
- **mTLS everywhere** end-to-end Agent ↔ Server encryption, with first-touch enrollment

## Architecture overview

mxcwpp separates **control plane / data plane / detection plane** into three independently scalable tiers — no single bottleneck.

{{< mermaid >}}
graph LR
  subgraph WL[Workloads]
    H[Host]
    C[Container]
    K[Kubernetes]
    S[Serverless]
  end

  AG[mxcwpp-agent<br/>eBPF · Plugins · Local detection]

  H --> AG
  C --> AG
  K --> AG
  S --> AG

  AG -->|gRPC BiDi · mTLS| AC[AgentCenter ×N<br/>Ingestion / command dispatch]

  subgraph CP[Control plane]
    MGR[Manager ×N<br/>REST API · JWT · RBAC]
    REDIS[(Redis<br/>Service discovery · cache)]
    MYSQL[(MySQL<br/>Rules · tasks · assets)]
  end

  AC <-->|HTTP control| MGR
  MGR <--> REDIS
  MGR <--> MYSQL

  AC -->|8 topics + DLQ| KAFKA[(Kafka<br/>Business-domain data plane)]

  KAFKA --> CONS[Consumer ×N<br/>CEL · sequence detection · enrichment]

  subgraph DP[Detection & storage]
    ENG[Engine<br/>Alert governance / correlation]
    CH[(ClickHouse<br/>Events · metrics)]
  end

  CONS --> ENG
  CONS --> CH
  ENG -.->|Alerts| MGR

  MGR -->|HTTPS| WEB[Web console<br/>SPA + REST API]
  ENG -.->|Forward| SIEM[Syslog / Kafka<br/>SIEM / ticketing]
{{< /mermaid >}}

## Core capabilities (seven modules)

### 1. Server architecture

- Three independently scalable tiers: `manager` / `agentcenter` / `consumer`
- Embedded service discovery: Redis HSet + Pub/Sub + 30s reconciler
- Active health probing (10s probe + 60s heartbeat TTL) plus failure counter
- Power-of-Two-Choices load balancing — no hot-AC tail latency
- Reliable command delivery: MySQL persist → Redis routing → AC HTTP → gRPC → Agent ACK

### 2. Agent

- Single-process Go agent + plugin lifecycle + watchdog
- Backoff restart and sleep/wake state machine
- WAL + in-memory cache for 7-day offline buffering
- Resource ceiling: under 2% CPU and 80 MiB RAM
- mTLS everywhere, with first-touch enrollment (Server issues client cert)
- Canary upgrade: 5% → 25% → 100% with failure pause and auto-rollback

### 3. Baseline compliance

- Linux + Kubernetes dual rule model
- CIS / NIST / China MLPS 2.0 baselines out of the box
- Canary rule rollout with hot reload — no Agent restart
- Remediation loop: scan → recommend → canary remediation → verify

### 4. Runtime / EDR

- eBPF-based real-time behavior collection and anomaly detection
- Attack-chain (Storyline) visualization
- Port-scan / web-shell / reverse-shell detection out of the box
- CEL engine + sequence detection + correlated alert governance
- One-click block / isolate / file quarantine response

### 5. Container / Kubernetes

- Three-tier view: node / pod / cluster
- Image vulnerability + secret + Dockerfile scanning
- K8s audit log ingestion (including GCP Pub/Sub)
- CIS Kubernetes benchmark for cluster baselines

### 6. Vulnerability management

- Most comprehensive multi-source advisory ingestion in the Chinese open-source ecosystem (GitHub / NVD / domestic vendors)
- Unified view across host / image / source code
- CVE priority with EPSS feeds
- One-click ticket handoff and remediation guidance

### 7. Antivirus / IOC

- YARA-X rule engine + IOC reputation feeds
- File, process, and domain reputation
- Auto-updated virus database with hot reload

## Integration with the MatrixPlus stack

mxcwpp is not an island — it integrates natively with the other three MatrixPlus open-source products:

| Integration | Value |
|-------------|-------|
| **[mxcmdb](/en/products/mxcmdb/)** · asset graph | Alerts and vulnerabilities link directly to assets; blast radius is visible at a glance |
| **[mxid](/en/products/mxid/)** · unified identity | Console SSO, operation audit, API authentication |
| **[ticketdesk](/en/products/ticketdesk/)** · ticketing | One-click alert-to-ticket, full remediation loop |

## Deployment options

| Form | Best for |
|------|----------|
| **Binary** | Traditional hosts, single- or multi-node direct install |
| **Docker / Compose** | Single-node, container-first, out-of-the-box |
| **Kubernetes (Helm)** | Multi-cluster, multi-AZ, highly available |
| **Air-gapped** | Government / regulated environments, fully offline |

## Where it fits

- Large-scale Kubernetes security governance
- Unified security across multi-cloud and hybrid-cloud
- Transition-phase protection while migrating to cloud-native
- China MLPS 2.0 compliance and regulatory audit
- Remote security operations for overseas subsidiaries
- Red-team / blue-team exercise support

## Live deployments

- **Japan subsidiary of a UK-listed group** — mxcwpp Enterprise + 2 on-site engineers, one year, zero breaches
- **Government and enterprise customers** — security operations support during national-level red-team exercises
- **MatrixPlus self-operated business** — full-stack protection for our in-house commerce system

→ [Related case studies](/en/cases/#security)

## Get started

→ Repository: [github.com/matrixplusio](https://github.com/matrixplusio)
→ License: AGPL-3.0
→ Documentation and deployment guides ship with the repo

For private deployment, custom integration, Enterprise Edition licensing, or long-term operational support, [contact us](/en/contact/).
