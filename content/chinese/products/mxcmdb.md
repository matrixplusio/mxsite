---
title: "mxcmdb"
meta_title: "mxcmdb — 开源企业 IT 资产与配置管理 (CMDB) — MatrixPlus"
description: "mxcmdb 把企业 IT 资产 —— 域名、服务器、应用服务、网络设备、证书 —— 全部纳入同一图谱，并与 mxsec、mxid、ticketdesk 原生联动。"
date: 2026-06-07
draft: false
---

## 概览

**mxcmdb** 是 MatrixPlus 开源的**配置管理数据库（CMDB）**，专为现代 IT 与安全运营场景而设计。它把散落在脚本、表格与各平台的资产信息收拢到**一张图谱**，让 mxsec、mxid、ticketdesk 都能消费**同一份事实来源**。

CMDB 不应该是被动数据库。mxcmdb 把它做成**开发者的内部 API**：所有资产数据可被消费、可被订阅、可被关系图遍历，每一次变更都有审计轨迹。

## 关键指标

- **AGPL-3.0** 开源协议（社区版）
- **双版本** 社区版 + 企业版
- **N 种资产类型** 主机 / 容器 / 服务 / 设备 / 证书 / 域名 / 自定义
- **多云同步** 阿里云 / 腾讯云 / AWS / GCP / Azure
- **双发现引擎** Agent 自动上报 + Agentless 网络扫描
- **完整 API** REST + Webhook + Terraform Provider

## 整体架构

mxcmdb 以**资产图谱**为核心，发现层 → 模型层 → 图谱层 → 消费层 四层解耦。

{{< mermaid >}}
graph LR
  subgraph DISC[发现层]
    AG[Agent 上报<br/>主机 · 容器 · 进程]
    SCAN[Agentless 扫描<br/>网络 · 证书 · 端口]
    CLOUD[云厂商 API<br/>阿里 · 腾讯 · AWS · GCP]
    MAN[手动 / Excel / Terraform]
  end

  AG --> ING
  SCAN --> ING
  CLOUD --> ING
  MAN --> ING

  ING[资产摄入<br/>归一 · 去重 · 关系推断]

  subgraph MODEL[模型层]
    ASSET[(资产对象<br/>类型 · 字段 · 标签)]
    REL[(关系图谱<br/>多对多 · 多层视图)]
    HIST[(变更历史)]
  end

  ING --> ASSET
  ASSET <--> REL
  ASSET --> HIST

  subgraph SVC[服务层]
    API[REST API + GraphQL]
    HOOK[Webhook]
    SUB[订阅]
    VIZ[图谱可视化]
  end

  ASSET --> API
  REL --> VIZ
  ASSET --> HOOK
  ASSET --> SUB

  subgraph CON[消费方]
    MXSEC[mxsec-platform<br/>告警关联资产]
    MXID[mxid<br/>身份与资产权限]
    TICKET[ticketdesk<br/>工单关联资产]
    EXT[外部 ITSM / SIEM]
  end

  API --> MXSEC
  API --> MXID
  API --> TICKET
  HOOK --> EXT
  SUB --> EXT
{{< /mermaid >}}

## 核心能力（5 大模块）

### 1. 多类型资产模型

- 主机：物理机 / 虚拟机 / 容器 / Pod
- 服务：应用、数据库、消息队列、缓存
- 网络：设备、负载均衡、CDN、域名、子域名
- 证书：SSL/TLS 全链路覆盖，含到期监控
- 自定义类型：任意业务对象都可建模

### 2. 自动发现 + 手动维护

- Agent 自动上报：与 mxsec-agent 复用通道
- Agentless 网络扫描：适用于设备与证书
- 云厂商 API 同步：阿里 / 腾讯 / AWS / GCP / Azure
- 批量导入：Excel / API / Terraform Provider

### 3. 关系图谱与拓扑

- 多对多关系建模
- 三层视图：业务 / 应用 / 基础设施
- 影响面分析与变更预演（"动这台机会影响哪些业务"）
- 拓扑可视化（依赖图 / 调用图 / 网络图）

### 4. 开放接口与事件

- 完整 REST API + GraphQL 查询
- Webhook 推送变更事件
- 资产订阅：长连接订阅指定类型 / 标签的变更
- Terraform Provider 实现 IaC

### 5. 审计与变更管理

- 完整变更历史（who / when / what）
- 变更前后字段 diff
- 与 ticketdesk 联动，重要变更需要审批
- 不可篡改审计日志

## 与 MatrixPlus 生态联动

| 联动 | 价值 |
|------|------|
| **[mxsec-platform](/products/mxsec-platform/)** · 安全平台 | 安全告警/漏洞自动关联资产，秒级看出影响面 |
| **[mxid](/products/mxid/)** · 统一身份 | 身份与资产权限矩阵，回答"谁能登录哪台机器" |
| **[ticketdesk](/products/ticketdesk/)** · 工单 | 工单关联到资产，变更与故障可追溯 |

## 部署形态

| 形态 | 适用场景 |
|------|----------|
| **Docker / Compose** | 单节点试用，自带 PostgreSQL + Redis |
| **Kubernetes (Helm)** | 多副本 + 图数据库高可用 |
| **私有化 / 离线** | 政企信创场景，完全离线运行 |

## 适用场景

- 企业级 IT 资产盘点与生命周期管理
- 域名与 SSL 证书到期监控
- 安全运营的资产基础（影响面分析）
- 变更管理与影响面预演
- 多云资源统一治理

## 已落地案例

- **MatrixPlus 自营业务** —— 为内部研发、运维、电商业务提供统一资产视图
- **企业客户** —— 与 mxsec 一起做政企客户的资产盘点与漏洞影响面分析

→ [查看相关案例](/cases/#engineering)

## 开始使用

→ 仓库：[github.com/matrixplusio](https://github.com/matrixplusio)
→ 许可证：AGPL-3.0
→ 文档与部署指南随仓库发布

需要私有化部署、与现有 ITSM/SIEM 深度集成或长期运营支持，欢迎[联系我们](/contact/)。
