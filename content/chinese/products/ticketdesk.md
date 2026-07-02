---
title: "ticketdesk"
meta_title: "ticketdesk — 开源项目化工单与告警联动系统 — MatrixPlus"
description: "ticketdesk 是面向运维与技术团队的项目化工单与告警联动系统，把工单、告警、审批、流程引擎合到一起。"
date: 2026-06-07
draft: false
---

## 概览

**ticketdesk** 是 MatrixPlus 开源的**项目化工单与告警联动系统**，专为运维、安全与研发团队设计 —— **一切问题都是工单，一切告警都必须被跟进。**

它把 Jira-like 工单能力、告警自动建单、可视化流程引擎与权限审批合并到一个平台，覆盖问题从"被发现"到"被关闭"的完整闭环；通过与 mxcmdb / mxcwpp / mxid 的原生集成，可以让一条告警自动关联资产、生成工单、走完审批流，并落到正确的工程师手里。

## 关键指标

- **AGPL-3.0** 开源协议（社区版）
- **双版本** 社区版 + 企业版
- **6 类工单**：Epic / Task / Bug / Fault / Change / ServiceRequest
- **多告警源**：Prometheus / Alertmanager / 夜莺 N9E / 自定义 Webhook
- **可视化流程引擎**：Vue Flow 拖拽编排，支持审批节点 + 工作节点 + 动态分支
- **实时推送**：WebSocket 站内信 + 邮件 + Webhook 多通道

## 整体架构

ticketdesk 内部按业务模块分层（项目 / 工单 / 流程 / 告警 / 报表 / 通知 ...），数据流以告警与工单为主线。

{{< mermaid >}}
graph LR
  subgraph SRC[告警与触发源]
    PROM[Prometheus<br/>Alertmanager]
    N9E[夜莺 N9E]
    MXSEC[mxcwpp<br/>告警]
    WEB[Web UI<br/>手动建单]
  end

  PROM --> ING
  N9E --> ING
  MXSEC --> ING
  WEB --> ING

  ING[告警接入<br/>指纹去重 / 合并窗口 / 静默规则]

  ING --> ISSUE[工单核心<br/>项目 · 类型 · 字段 · SLA]

  subgraph FLOW[流程引擎]
    WF[Workflow<br/>审批 + 工作节点]
    APPR[审批<br/>单签 / 会签 / 或签]
  end

  ISSUE --> WF
  WF --> APPR

  ISSUE --> NOTIF[通知<br/>WebSocket · 邮件 · Webhook]
  ISSUE --> REPORT[报表<br/>MTTA · MTTR · SLA]
  ISSUE --> AUDIT[审计日志]

  ISSUE <--> MYSQL[(MySQL 8)]
  ISSUE <--> REDIS[(Redis 7)]

  ISSUE -.->|关联资产| MXCMDB[mxcmdb]
  ISSUE -.->|SSO / 权限| MXID[mxid]
{{< /mermaid >}}

## 核心能力（6 大模块）

### 1. 项目化工单（Jira-like）

- 多项目独立配置：工单类型 / 工作流 / 自定义字段 / SLA 策略
- 6 类工单：Epic / Task / Bug / Fault / Change / ServiceRequest
- 工单关联：父子 / 阻塞 / 重复 / 关联
- 完整能力：指派、关注人、评论、附件、标签、优先级（P0~P3）

### 2. 告警自动建单与调度闭环

- 接入 Prometheus / Alertmanager / 夜莺 N9E 等告警源
- 告警指纹去重：规则 ID + 资源 + 标签 三合一指纹
- 合并窗口：同名告警自动合并，超时自动新建
- 标签静默：`==` / `!=` / `=~` / `!~` 匹配器，维护窗口自动抑制
- 双向联动：工单状态变更同步告警，告警恢复同步工单

### 3. 流程引擎（审批 + 工作节点）

- Vue Flow 拖拽式可视化设计器
- 审批节点：单签 / 会签（AND）/ 或签（OR）+ 超时升级
- 工作节点：指派负责人 / 子任务 / 完成校验
- 自定义流转条件：边支持任意条件名（验收通过 / 需要修改等）
- 动态分支：工单详情页自动渲染对应操作按钮

### 4. 需求池

- 双层级：全局需求池 + 项目级需求池
- 完整生命周期：待评审 → 评审中 → 已接受 → 转化为工单
- 看板视图：按状态 / 优先级 / 负责人 / 时间线分组

### 5. 统计与报表

- 实时面板：未关闭工单数、优先级分布、告警趋势、SLA 倒计时
- 效率指标：MTTA（响应时间）/ MTTR（修复时间）/ SLA 命中率
- 数据导出：CSV

### 6. 权限、通知与审计

- RBAC 权限：系统级 + 项目级双层
- 通知渠道：WebSocket 站内信、邮件、Webhook
- 全量审计：字段修改、指派变化、节点流转、审批意见

## 与 MatrixPlus 生态联动

| 联动 | 价值 |
|------|------|
| **[mxcwpp](/products/mxcwpp/)** · 安全告警 | 安全告警一键转工单，处置全程可追溯 |
| **[mxcmdb](/products/mxcmdb/)** · 资产图谱 | 工单关联到具体资产 / 服务 / 域名 |
| **[mxid](/products/mxid/)** · 统一身份 | SSO 登录 + RBAC 同步 + 操作审计 |

## 部署形态

| 形态 | 适用场景 |
|------|----------|
| **Docker Compose** | 单节点全栈一键启动（含 MySQL + Redis + Backend + Nginx） |
| **Kubernetes (Helm)** | 多副本、多可用区高可用部署 |
| **二进制 + 自建依赖** | 已有 MySQL / Redis 基础设施的企业 |
| **私有化 / 离线** | 政企信创场景，完全离线运行 |

## 适用场景

- 运维与 SRE 团队的故障 / 变更工单
- 安全团队的告警响应与处置闭环
- 客户支持团队的服务台（Helpdesk）
- 内部研发协作 (Bug / Task / Epic)
- 跨团队审批与流程管理

## 技术栈

- **后端** Go 1.25 + Gin
- **前端** Vue 3 + TypeScript + Element Plus + Vue Flow
- **存储** MySQL 8.0 + Redis 7
- **认证** JWT (Access + Refresh Token)
- **实时** WebSocket
- **部署** Docker Compose / Kubernetes Helm
- **CI/CD** GitHub Actions

## 开始使用

→ 仓库：[github.com/matrixplusio](https://github.com/matrixplusio)
→ 许可证：AGPL-3.0
→ 一键启动：`make prod-d` → 访问 `http://localhost`

需要私有化部署、深度集成、合规审计或长期支持，欢迎[联系我们](/contact/)。
