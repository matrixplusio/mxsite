---
title: "mxid"
meta_title: "mxid — 开源企业身份与访问管理 (EIAM) 平台 — MatrixPlus"
description: "mxid 是一体化的开源企业身份与访问管理 (EIAM) 平台，覆盖 SSO、自适应 MFA、生命周期、策略即代码授权与合规审计。"
date: 2026-06-07
draft: false
---

## 概览

**mxid** 是 MatrixPlus 开源的**企业身份与访问管理（EIAM）平台**。它把一家公司里散落的「员工身份、第三方合作伙伴、客户账号、各业务系统的权限」收拢到一个权威源，让**安全、IT、合规与业务团队**在同一套数据上工作。

mxid 以开放标准（OAuth 2.0 / OIDC / SAML / SCIM）为根基，**社区版完整开源核心能力**，企业可基于其搭建自有身份底座；**企业版**面向规模化企业场景，提供高可用、治理、合规审计与长期支持。

## 关键指标

- **AGPL-3.0** 开源协议（社区版）
- **双版本** 社区版 + 企业版
- **5 类协议** OAuth 2.0 / OIDC / SAML 2.0 / SCIM 2.0 / LDAP
- **3 种授权模型** RBAC / ABAC / ReBAC
- **Passwordless** Passkey / WebAuthn / OTP 全栈支持
- **Workforce + Customer** 单平台双域治理（员工身份 + 客户身份）

## 整体架构

mxid 采用 **接入层 / 核心层 / 治理层 / 存储层** 四层架构，每一层都可独立扩展。

{{< mermaid >}}
graph LR
  subgraph CLI[客户端 / 应用]
    APP1[业务系统]
    APP2[SaaS 应用]
    APP3[内部门户]
    CLI1[CLI / Terraform]
  end

  APP1 -->|OIDC| GW
  APP2 -->|SAML| GW
  APP3 -->|OIDC| GW
  CLI1 -->|REST API| GW

  GW[接入层<br/>SSO / API Gateway]

  subgraph CORE[核心层]
    AUTH[认证<br/>密码 · MFA · Passkey]
    POLICY[策略引擎<br/>RBAC · ABAC · ReBAC]
    SESSION[会话管理]
  end

  GW --> AUTH
  AUTH --> POLICY
  AUTH --> SESSION

  subgraph GOV[治理层]
    LIFECYCLE[生命周期<br/>入职 · 转岗 · 离职]
    GOVERN[权限治理<br/>最小权限扫描]
    AUDIT[审计与合规<br/>SOC2 / ISO27001 / 等保]
  end

  POLICY --> GOV

  subgraph DIR[目录层]
    DIRECTORY[(统一身份目录)]
    GROUPS[(组 / 角色 / 策略)]
  end

  POLICY <--> DIRECTORY
  POLICY <--> GROUPS
  LIFECYCLE <--> DIRECTORY

  subgraph SRC[身份源]
    HR[HR / 钉钉 / 飞书]
    AD[AD / LDAP]
    SYS[业务系统]
  end

  HR -->|SCIM| LIFECYCLE
  AD -->|LDAP Sync| LIFECYCLE
  SYS -->|SCIM| LIFECYCLE

  AUDIT -.-> CMDB[mxcmdb]
  AUTH -.-> MXSEC[mxcwpp]
{{< /mermaid >}}

## 核心能力（5 大模块）

### 1. 统一身份目录

- 多源身份汇聚：HR / 钉钉 / 飞书 / AD / LDAP / 业务系统
- 标准协议接入：SCIM 2.0 / LDAP / API 同步
- 全员工生命周期：入职 / 转岗 / 离职自动化
- 客户身份（CIAM）与员工身份（Workforce）双域治理

### 2. 强身份认证

- 单点登录（SSO）覆盖所有应用，支持 OAuth 2.0 / OIDC / SAML 2.0
- 自适应多因素认证（Adaptive MFA）：基于设备、地理、行为风险动态触发
- Passwordless：Passkey / WebAuthn / OTP / 推送通知
- 风险信号驱动：异常 IP / 异常设备 / 不可能登录场景

### 3. 细粒度授权

- 策略即代码（Policy-as-Code）
- 三种授权模型：RBAC（角色）/ ABAC（属性）/ ReBAC（关系）
- 应用级、API 级、字段级权限控制
- 与 OPA / Cedar 等开放策略引擎集成

### 4. 治理与合规

- 完整访问审计日志（不可篡改）
- 持续最小权限扫描（Least Privilege）
- 合规报表：SOC 2 / ISO 27001 / GB/T 22239（等保 2.0）/ 商业银行 API 安全规范
- 证据导出：监管审计一键导出 PDF / CSV

### 5. 开放生态

- 完整 REST API + Terraform Provider
- 命令行管理工具与 SDK
- Webhook 事件流（用户创建 / 登录失败 / 权限变更）
- 与 OPA、Cedar 等策略引擎适配

## 与 MatrixPlus 生态联动

| 联动 | 价值 |
|------|------|
| **[mxcwpp](/products/mxcwpp/)** · 安全平台 | 异常登录、权限滥用直接生成安全告警 |
| **[mxcmdb](/products/mxcmdb/)** · 资产图谱 | 身份与资产权限关联，回答"谁有什么权限" |
| **[ticketdesk](/products/ticketdesk/)** · 工单 | 权限申请走审批流，全程可追溯 |

## 部署形态

| 形态 | 适用场景 |
|------|----------|
| **Docker / Compose** | 单节点快速试用 |
| **Kubernetes (Helm)** | 多副本、多可用区高可用 |
| **多区域容灾** | 跨 Region 主备同步（企业版） |
| **私有化 / 离线** | 政企信创场景，完全离线运行 |

## 适用场景

- 中大型企业的统一身份与权限治理
- 大型并购后的身份目录融合
- 零信任架构的身份底座
- 强监管行业（金融 / 政企 / 跨国集团）的合规建设
- SaaS 厂商的 Customer IAM（CIAM）底座

## 已落地案例

- **MatrixPlus 自营业务** —— 所有内部系统统一身份, 包含 mxcwpp、mxcmdb、ticketdesk 自身
- **企业客户** —— 与 mxcwpp 一起在跨国集团子公司部署, 完成 SSO + 审计落地

→ [查看相关案例](/cases/#engineering)

## 开始使用

→ 仓库：[github.com/matrixplusio](https://github.com/matrixplusio)
→ 许可证：AGPL-3.0
→ 文档与部署指南随仓库发布

需要私有化部署、跨 Region 容灾、合规咨询或长期支持，欢迎[联系我们](/contact/)。
