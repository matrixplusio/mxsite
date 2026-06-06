---
title: "mxsec-platform"
meta_title: "mxsec-platform — 开源云工作负载保护平台 (CWPP) — MatrixPlus"
description: "mxsec-platform 是面向云原生时代的开源云工作负载保护平台 (CWPP)，统一保护主机、容器、Kubernetes 与 Serverless 工作负载。已在 3000+ 台主机部署运行。"
date: 2026-06-06
draft: false
---

## 概览

**mxsec-platform** 是 MatrixPlus 开源的**云工作负载保护平台（CWPP）**，专为云原生时代的安全防护而设计。它在主机、容器、Kubernetes 与无服务器工作负载之间提供统一的安全防护视角，并把**入侵检测、漏洞管理、基线合规、容器安全、病毒查杀**五大能力收拢到同一套控制面，让 DevSecOps 团队拥有真正可落地的纵深防御能力。

目前 mxsec-platform 已在 **3000+ 台主机** 上稳定部署运行，覆盖跨国企业海外子公司、政企客户与互联网业务多类典型场景。

## 关键指标

- **3000+** 部署主机
- **AGPL-3.0** 开源协议（社区版）
- **双版本** 社区版 + 企业版
- **8 个 Kafka Topic** + **DLQ 死信** 业务域级数据面拆分
- **6 个调度器** 灰度发布 / 规则同步 / 告警治理 / IOC 同步 / 插件分发 / 重启编排
- **低开销** 基于 eBPF 的运行时检测，CPU 通常 < 2%、内存 < 80 MiB
- **mTLS** Agent ↔ Server 全链路加密，支持无证书首次接入并由 Server 下发

## 整体架构

mxsec-platform 采用 **控制面 / 数据面 / 检测面 三层分离** 设计，每一层都独立水平扩展，避免单点瓶颈。

{{< mermaid >}}
graph LR
  subgraph WL[工作负载]
    H[主机]
    C[容器]
    K[Kubernetes]
    S[Serverless]
  end

  AG[mxsec-agent<br/>eBPF · Plugins · 本地检测]

  H --> AG
  C --> AG
  K --> AG
  S --> AG

  AG -->|gRPC BiDi · mTLS| AC[AgentCenter ×N<br/>接入层 / 命令下发]

  subgraph CP[控制面]
    MGR[Manager ×N<br/>REST API · JWT · RBAC]
    REDIS[(Redis<br/>服务发现 · 缓存)]
    MYSQL[(MySQL<br/>规则 · 任务 · 资产)]
  end

  AC <-->|HTTP 控制流| MGR
  MGR <--> REDIS
  MGR <--> MYSQL

  AC -->|8 Topics + DLQ| KAFKA[(Kafka<br/>业务域级数据面)]

  KAFKA --> CONS[Consumer ×N<br/>CEL · 序列检测 · 富化]

  subgraph DP[检测与存储]
    ENG[Engine 检测引擎<br/>告警治理 / 关联检测]
    CH[(ClickHouse<br/>事件 · 指标)]
  end

  CONS --> ENG
  CONS --> CH
  ENG -.->|告警| MGR

  MGR -->|HTTPS| WEB[Web 控制台<br/>SPA + REST API]
  ENG -.->|外发| SIEM[Syslog / Kafka<br/>SIEM / 工单]
{{< /mermaid >}}

## 核心能力（7 大模块）

### 1. 服务端架构

- 控制面 / 数据面 / 检测面三层独立伸缩，三个二进制：`manager` / `agentcenter` / `consumer`
- 内嵌服务发现：Redis HSet + Pub/Sub + 30s 全量兜底，多 Manager 副本秒级同步
- 主动健康探测（10s 探测 + 60s 心跳 TTL）+ 失败计数双轨判活
- Power-of-Two-Choices 负载均衡，避免长尾热点 AC
- 任务全链路可靠投递：MySQL 持久化 → Redis 精准路由 → AC HTTP → gRPC → Agent ACK 回流

### 2. Agent

- 单进程 Go Agent + 插件生命周期 + 看门狗
- 退避重启 + 休眠唤醒状态机
- WAL + 内存 Cache 双层断网兜底，离线 7 天不丢数据
- 资源限制：CPU < 2%、RAM < 80 MiB
- mTLS 全链路加密，支持首次无证书接入由 Server 下发
- 灰度升级：5%→25%→100% + 失败阈值暂停 + 自动回滚

### 3. 基线合规

- Linux + Kubernetes 双引擎规则模型
- CIS / NIST / 等保 2.0 三套标准基线
- 规则灰度发布与热重载，无需 Agent 重启
- 修复闭环：扫描 → 推荐 → 灰度修复 → 验证

### 4. 运行时 / EDR

- 基于 eBPF 的实时行为采集与异常检测
- 攻击链路（Storyline）可视化
- 端口扫描检测 / Web Shell 检测 / 反弹 Shell 检测
- CEL 引擎 + 序列检测 + 关联告警治理
- 一键阻断 / 隔离 / 文件 quarantine 响应

### 5. 容器 / Kubernetes

- 节点层 + Pod 层 + 集群层三级安全视图
- 镜像漏洞 + Secret + Dockerfile 扫描
- K8s Audit 接入（含 GCP Pub/Sub）
- 集群基线（CIS Kubernetes Benchmark）

### 6. 漏洞管理

- 国内最完整的多源 advisory 融合（GitHub / NVD / 国内厂商）
- 主机 / 容器镜像 / 代码三层漏洞统一视图
- CVE 优先级排序 + EPSS 接入
- 修复建议与一键工单转交

### 7. 病毒 / IOC

- YARA-X 规则引擎 + IOC 信誉库
- 文件信誉、进程信誉、域名信誉三类查询
- 病毒库自动同步与热更新

## 与 MatrixPlus 生态联动

mxsec-platform 不是孤岛 —— 它与 MatrixPlus 旗下其他三款开源产品天然集成：

| 联动 | 价值 |
|------|------|
| **[mxcmdb](/products/mxcmdb/)** · 资产图谱 | 告警与漏洞直接关联到资产，影响面一目了然 |
| **[mxid](/products/mxid/)** · 统一身份 | 控制台 SSO、操作审计、API 鉴权 |
| **[ticketdesk](/products/ticketdesk/)** · 工单 | 告警一键转工单，处置流程闭环 |

## 部署形态

| 形态 | 适用场景 |
|------|----------|
| **二进制** | 传统主机环境，单机或多机直接安装 |
| **Docker / Compose** | 单节点容器化，开箱即用 |
| **Kubernetes (Helm)** | 多集群、跨可用区、高可用 |
| **私有化 / 离线** | 政企信创场景，完全离线运行 |

## 适用场景

- 大规模 Kubernetes 集群安全治理
- 多云 / 混合云统一安全管控
- 自建数据中心向云原生演进的过渡期防护
- 等保 2.0 合规与监管审计
- 跨国企业海外子公司远程安全运营
- 红蓝对抗与护网行动支撑

## 已落地案例

- **某英国上市集团日本子公司** —— mxsec-platform 企业版 + 2 人驻场，1 年 0 入侵
- **多家政企客户** —— 国家级护网行动期间安全运营支撑
- **MatrixPlus 自营业务** —— 自营电商体系的全栈防护

→ [查看相关案例](/cases/#security)

## 开始使用

→ 仓库：[github.com/matrixplusio](https://github.com/matrixplusio)
→ 许可证：AGPL-3.0
→ 文档与部署指南随仓库发布

需要私有化部署、定制集成、企业版授权或长期运营支持，欢迎[联系我们](/contact/)。
