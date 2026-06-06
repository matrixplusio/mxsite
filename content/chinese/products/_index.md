---
title: "所有产品"
meta_title: "所有产品 — MatrixPlus"
description: "MatrixPlus 围绕「安全」与「身份」打造企业级产品矩阵 —— 社区版开源, 企业版商业, 标准接口, 拒绝锁定。"
layout: "products"
draft: false

label_detail: "查看详情"
label_contact: "联系销售"
label_highlights: "关键能力"

products:
  - key: "mxsec-platform"
    tag: "云工作负载保护 · CWPP"
    name: "mxsec-platform"
    tagline: "面向云原生的工作负载保护平台"
    status:
      key: "ga"
      label: "正式版"
    description: "在主机、容器、Kubernetes 之间提供统一的安全防护视角。运行时检测、漏洞管理、配置基线、合规审计一站式。社区版完整开源, 企业版面向规模化生产。"
    detail_url: "/products/mxsec-platform/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/contact/"
    highlights:
      - "主机 · 容器 · Kubernetes 统一防护"
      - "eBPF 运行时威胁检测"
      - "镜像 / 主机漏洞扫描与闭环"
      - "CIS / NIST / 等保 配置基线"
      - "代码扫描 (SAST) 与依赖审计"
      - "OpenTelemetry / OCSF 开放标准"
      - "插件化检测规则架构"
      - "攻击链路可视化与处置"
    editions:
      - name: "社区版 · Community"
        open: true
        label: "AGPL-3.0"
        description: "完整核心能力，免费开源。个人、小团队、社区贡献者均可使用。"
      - name: "企业版 · Enterprise"
        open: false
        label: "商业授权"
        description: "面向生产规模化客户。HA、多租户、合规、SLA 与长期支持。"

  - key: "mxcmdb"
    tag: "配置管理 · CMDB"
    name: "mxcmdb"
    tagline: "开源企业 IT 资产与配置管理数据库"
    status:
      key: "ga"
      label: "正式版"
    description: "面向企业 IT 资产与配置数据的统一管理：域名、服务器、应用服务、网络设备、证书等多类型资产，全部纳入同一图谱，可被 mxsec、mxid 与外部工单系统直接消费。"
    detail_url: "/products/mxcmdb/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/contact/"
    highlights:
      - "多类型资产：域名 / 服务器 / 服务 / 设备 / 证书"
      - "关系图谱与拓扑可视化"
      - "Agent 自动发现 + Agentless 扫描"
      - "云资源同步 (阿里 / 腾讯 / AWS)"
      - "灵活的自定义资产模型"
      - "完整 REST API + Webhook"
      - "与 mxsec / mxid 原生集成"
      - "审计追溯与变更历史"
    editions:
      - name: "社区版 · Community"
        open: true
        label: "AGPL-3.0"
        description: "完整核心 CMDB 能力，免费开源。"
      - name: "企业版 · Enterprise"
        open: false
        label: "商业授权"
        description: "高可用、多租户、深度集成与长期支持。"

  - key: "ticketdesk"
    tag: "工单与服务台"
    name: "ticketdesk"
    tagline: "开源企业工单与服务台系统"
    status:
      key: "ga"
      label: "正式版"
    description: "面向 IT、安全与客户支持团队的开源工单系统：多渠道受理、SLA 管理、自动化工作流与客户门户，一套搞定。可与 mxcmdb / mxsec / mxid 联动，形成完整的运营闭环。"
    detail_url: "/products/ticketdesk/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/contact/"
    highlights:
      - "多渠道工单受理 (Web / 邮件 / API / IM)"
      - "工单分配与升级策略"
      - "SLA 管理与超时提醒"
      - "可视化工作流编排"
      - "客户自助门户与知识库"
      - "报表、看板与导出"
      - "与 CMDB / 安全平台联动"
      - "完整 REST API"
    editions:
      - name: "社区版 · Community"
        open: true
        label: "AGPL-3.0"
        description: "完整工单与服务台能力，免费开源。"
      - name: "企业版 · Enterprise"
        open: false
        label: "商业授权"
        description: "高可用、深度集成、合规审计与长期支持。"

  - key: "mxid"
    tag: "身份与访问管理 · EIAM"
    name: "mxid"
    tagline: "企业身份与访问管理平台"
    status:
      key: "ga"
      label: "正式版"
    description: "一体化的企业 EIAM 平台，统一身份、访问与合规。社区版开源完整核心能力，企业版面向规模化企业治理与高可用部署。"
    detail_url: "/products/mxid/"
    repo_url: "https://github.com/matrixplusio"
    contact_url: "/contact/"
    highlights:
      - "OAuth 2.0 / OIDC / SAML / SCIM 协议栈"
      - "SSO + 自适应多因素认证 (MFA)"
      - "员工生命周期自动化"
      - "策略即代码 (RBAC / ABAC / ReBAC)"
      - "Passkey / WebAuthn 无密码登录"
      - "审计日志与合规报表"
      - "OPA / Cedar 策略适配"
      - "Terraform Provider 与 CLI"
    editions:
      - name: "社区版 · Community"
        open: true
        label: "AGPL-3.0"
        description: "完整 EIAM 核心能力，免费开源。中小企业、初创团队、自建身份底座的工程团队适用。"
      - name: "企业版 · Enterprise"
        open: false
        label: "商业授权"
        description: "面向规模化企业。HA、合规报表、Workforce + Customer 双域治理、SLA。"

# Roadmap (可选, 后续新产品时填)
roadmap_title: "更多产品在路上"
roadmap_subtitle: "围绕安全、身份与数字化基础设施的更多能力，正在打磨中。"
roadmap:
  - tag: "敬请期待"
    name: "更多能力"
    description: "围绕安全运营、数据治理、AI 安全等方向，我们正在评估下一批可独立成品的能力。如对某个方向感兴趣，欢迎与我们交流。"

cta_title: "想了解哪个产品适合您?"
cta_subtitle: "我们可以根据您的场景，提供产品选型建议与定制部署方案。"
cta_label: "联系我们"
---
