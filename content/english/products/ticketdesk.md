---
title: "ticketdesk"
meta_title: "ticketdesk — Open-source project-based ticketing with alert orchestration — MatrixPlus"
description: "ticketdesk is an open-source project-based ticketing and alert-orchestration system for ops and engineering teams, combining tickets, alerts, approvals, and a workflow engine."
date: 2026-06-07
draft: false
---

## Overview

**ticketdesk** is the MatrixPlus open-source **project-based ticketing and alert orchestration** system, built for ops, security, and engineering teams — **every problem is a ticket, every alert must be followed up.**

It merges Jira-like ticketing, automatic alert-to-ticket, a visual workflow engine, and approval flows into one platform that covers the full lifecycle from "discovered" to "closed". With native integration to mxcmdb / mxcwpp / mxid, an alert can automatically link to assets, generate a ticket, run an approval flow, and land on the right engineer's desk.

## Key metrics

- **AGPL-3.0** open-source license (Community Edition)
- **Two editions** Community + Enterprise
- **6 ticket types** Epic / Task / Bug / Fault / Change / ServiceRequest
- **Multi-source alert intake** Prometheus / Alertmanager / Nightingale (N9E) / custom webhooks
- **Visual workflow engine** Vue Flow drag-and-drop with approval nodes, work nodes, and dynamic branches
- **Real-time delivery** WebSocket inbox + email + webhook

## Architecture overview

Internally, ticketdesk is split by business module (project / issue / workflow / alert / reporting / notification ...), with the alert-to-ticket flow as the main data spine.

{{< mermaid >}}
graph LR
  subgraph SRC[Alert & trigger sources]
    PROM[Prometheus<br/>Alertmanager]
    N9E[Nightingale N9E]
    MXSEC[mxcwpp<br/>alerts]
    WEB[Web UI<br/>manual creation]
  end

  PROM --> ING
  N9E --> ING
  MXSEC --> ING
  WEB --> ING

  ING[Alert intake<br/>Fingerprint dedup / window merge / silence rules]

  ING --> ISSUE[Issue core<br/>Project · Type · Fields · SLA]

  subgraph FLOW[Workflow engine]
    WF[Workflow<br/>Approval + work nodes]
    APPR[Approval<br/>Single / AND / OR]
  end

  ISSUE --> WF
  WF --> APPR

  ISSUE --> NOTIF[Notification<br/>WebSocket · Email · Webhook]
  ISSUE --> REPORT[Reporting<br/>MTTA · MTTR · SLA]
  ISSUE --> AUDIT[Audit log]

  ISSUE <--> MYSQL[(MySQL 8)]
  ISSUE <--> REDIS[(Redis 7)]

  ISSUE -.->|Link assets| MXCMDB[mxcmdb]
  ISSUE -.->|SSO / RBAC| MXID[mxid]
{{< /mermaid >}}

## Core capabilities (six modules)

### 1. Project-based ticketing (Jira-like)

- Per-project configuration: ticket types / workflow / custom fields / SLA
- Six ticket types: Epic / Task / Bug / Fault / Change / ServiceRequest
- Ticket relationships: parent/child / blocks / duplicates / relates-to
- Full operations: assignment, watchers, comments, attachments, labels, priority (P0–P3)

### 2. Alert-to-ticket orchestration

- Intake from Prometheus / Alertmanager / Nightingale (N9E) / custom webhooks
- Fingerprint-based dedup (rule ID + resource + labels)
- Time-window merge: same alert merges to one ticket; new ticket after window
- Label-based silencing: `==` / `!=` / `=~` / `!~` matchers for maintenance windows
- Bidirectional sync: ticket state changes flow back to alert state and vice versa

### 3. Workflow engine (approval + work nodes)

- Vue Flow drag-and-drop visual editor
- Approval nodes: single / AND / OR + timeout escalation
- Work nodes: assignment / subtasks / completion checks
- Custom transition conditions on edges (any label, not just approve/reject)
- Dynamic branches automatically render action buttons on the ticket page

### 4. Requirement pool

- Two-tier: global pool + per-project pool
- Lifecycle: pending review → in review → accepted → converted to ticket
- Kanban view: group by status / priority / assignee / timeline

### 5. Reporting and analytics

- Real-time panels: open tickets, priority distribution, alert trend, SLA countdown
- KPIs: MTTA (response) / MTTR (resolution) / SLA hit rate
- Data export: CSV

### 6. Permissions, notification, and audit

- RBAC: system-level + project-level roles
- Notification channels: WebSocket inbox, email, webhook
- Full audit log: field changes, assignment shifts, node transitions, approval comments

## Integration with the MatrixPlus stack

| Integration | Value |
|-------------|-------|
| **[mxcwpp](/en/products/mxcwpp/)** · security alerts | One-click alert-to-ticket with full traceability |
| **[mxcmdb](/en/products/mxcmdb/)** · asset graph | Tickets link to concrete assets / services / domains |
| **[mxid](/en/products/mxid/)** · unified identity | SSO login + RBAC sync + operation audit |

## Deployment options

| Form | Best for |
|------|----------|
| **Docker Compose** | Single-node, full stack one-command bootstrap (MySQL + Redis + Backend + Nginx) |
| **Kubernetes (Helm)** | Multi-replica, multi-AZ HA |
| **Binary + bring-your-own deps** | Enterprises with existing MySQL / Redis |
| **Air-gapped** | Government / regulated environments, fully offline |

## Where it fits

- Ops / SRE incident and change tickets
- Security team alert response and remediation
- Customer support / helpdesk
- Internal engineering collaboration (Bug / Task / Epic)
- Cross-team approval and process management

## Tech stack

- **Backend** Go 1.25 + Gin
- **Frontend** Vue 3 + TypeScript + Element Plus + Vue Flow
- **Storage** MySQL 8.0 + Redis 7
- **Auth** JWT (Access + Refresh Token)
- **Realtime** WebSocket
- **Deploy** Docker Compose / Kubernetes Helm
- **CI/CD** GitHub Actions

## Get started

→ Repository: [github.com/matrixplusio](https://github.com/matrixplusio)
→ License: AGPL-3.0
→ One-line bootstrap: `make prod-d` → open `http://localhost`

For private deployment, deep integration, audit-grade compliance, or long-term support, [contact us](/en/contact/).
