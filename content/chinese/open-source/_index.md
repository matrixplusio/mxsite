---
title: "开源产品"
meta_title: "开源产品 — MatrixPlus"
description: "我们相信安全基础设施应当开放。MatrixPlus 旗下开源项目可审计、可扩展、绝不锁定客户。"
layout: "open-source"
draft: false

org_link:
  url: "https://github.com/matrixplusio"
  label: "github.com/matrixplusio"

# 区块文案
label_license: "许可证"
label_language: "语言"
label_category: "类型"
label_repo: "GitHub 仓库"
label_product: "产品介绍"
label_docs: "文档"
label_note: "说明"

projects:
  - key: "mxcwpp"
    tag: "云工作负载保护"
    name: "mxcwpp"
    tagline: "开源云工作负载保护平台 (CWPP)"
    status:
      key: "public"
      label: "开源中"
    license: "AGPL-3.0 (社区版) · 商业 (企业版)"
    language: "Go · TypeScript"
    category: "CWPP / 云原生安全"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/products/mxcwpp/"
    description: "mxcwpp 是面向云原生时代的云工作负载保护平台，提供主机、容器与 Kubernetes 工作负载的统一安全防护视角。社区版完整开源，可审计、可扩展；企业版面向生产规模化客户，提供高可用、多租户与 SLA 支持。"
    features:
      - "主机、容器、Kubernetes 统一防护"
      - "基于 eBPF 的运行时威胁检测"
      - "镜像扫描与漏洞管理"
      - "CIS / NIST / 等保 配置基线"
      - "代码扫描 (SAST) 与依赖审计"
      - "OpenTelemetry / OCSF 开放标准"
      - "插件化检测规则架构"
      - "可视化攻击链路与处置建议"
    editions:
      - name: "社区版 · Community"
        license:
          open: true
          label: "AGPL-3.0 · 开源"
        description: "完整核心能力，免费开源。适用于个人、小团队、学习与社区贡献者。"
        points:
          - "全部核心检测与扫描能力"
          - "单机或小集群部署"
          - "社区文档与 GitHub Discussions 支持"
          - "对二次开发完全开放"
      - name: "企业版 · Enterprise"
        license:
          open: false
          label: "商业授权"
        description: "面向生产规模化客户。在社区版之上提供企业治理、规模化部署与运营保障。"
        points:
          - "高可用集群与多租户管理"
          - "细粒度 RBAC 与审计追溯"
          - "合规报表与监管证据导出"
          - "SLA 工单、版本支持与升级保障"
          - "面向客户场景的定制集成与驻场支持"

  - key: "mxcmdb"
    tag: "配置管理 · CMDB"
    name: "mxcmdb"
    tagline: "开源企业 IT 资产与配置管理数据库"
    status:
      key: "public"
      label: "开源中"
    license: "AGPL-3.0 (社区版) · 商业 (企业版)"
    language: "Go · TypeScript"
    category: "CMDB / 配置管理"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/products/mxcmdb/"
    description: "把企业 IT 资产 —— 域名、服务器、应用服务、网络设备、证书 —— 全部纳入同一图谱。社区版完整开源，企业版面向规模化与多集团治理。"
    features:
      - "多类型资产模型 (域名 / 主机 / 服务 / 设备 / 证书)"
      - "关系图谱与拓扑可视化"
      - "Agent 自动发现 + Agentless 扫描"
      - "云资源同步 (阿里 / 腾讯 / AWS / GCP)"
      - "自定义资产类型与字段"
      - "REST API + Webhook"
      - "与 mxcwpp / mxid / ticketdesk 原生集成"
      - "审计追溯与变更历史"
    editions:
      - name: "社区版 · Community"
        license:
          open: true
          label: "AGPL-3.0 · 开源"
        description: "完整核心 CMDB 能力，免费开源。"
        points:
          - "全部资产模型与图谱能力"
          - "Agent / 扫描发现引擎"
          - "REST API 完整开放"
          - "社区与 GitHub Discussions 支持"
      - name: "企业版 · Enterprise"
        license:
          open: false
          label: "商业授权"
        description: "面向规模化与多集团治理。"
        points:
          - "高可用集群与多租户"
          - "跨集团合并视图与权限隔离"
          - "深度集成 (ITSM / CI/CD / SIEM)"
          - "SLA、版本支持与升级保障"

  - key: "ticketdesk"
    tag: "工单与服务台"
    name: "ticketdesk"
    tagline: "开源企业工单与服务台系统"
    status:
      key: "public"
      label: "开源中"
    license: "AGPL-3.0 (社区版) · 商业 (企业版)"
    language: "Go · TypeScript"
    category: "ITSM / 工单系统"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/products/ticketdesk/"
    description: "面向 IT、安全与客户支持团队的开源工单系统：多渠道受理、SLA、自动化工作流与客户门户。社区版完整开源，企业版面向规模化客户服务与合规审计场景。"
    features:
      - "多渠道工单受理 (Web / 邮件 / API / IM)"
      - "工单分配与升级策略"
      - "SLA 管理与超时提醒"
      - "可视化工作流编排"
      - "客户自助门户与知识库"
      - "报表、看板与导出"
      - "与 mxcmdb / mxcwpp / mxid 联动"
      - "完整 REST API"
    editions:
      - name: "社区版 · Community"
        license:
          open: true
          label: "AGPL-3.0 · 开源"
        description: "完整工单与服务台能力，免费开源。"
        points:
          - "工单全生命周期管理"
          - "SLA、工作流、知识库"
          - "客户门户"
          - "API 与 Webhook 完整开放"
      - name: "企业版 · Enterprise"
        license:
          open: false
          label: "商业授权"
        description: "面向规模化客户服务与合规审计场景。"
        points:
          - "高可用部署与多租户"
          - "合规审计与证据导出"
          - "深度集成 (CMDB / 安全平台 / IM)"
          - "SLA、版本支持与升级保障"

  - key: "mxid"
    tag: "身份与访问管理"
    name: "mxid"
    tagline: "企业身份与访问管理 (EIAM) 平台"
    status:
      key: "public"
      label: "开源中"
    license: "AGPL-3.0 (社区版) · 商业 (企业版)"
    language: "Go · TypeScript"
    category: "EIAM / 身份治理"
    repo_url: "https://github.com/matrixplusio"
    product_url: "/products/mxid/"
    description: "mxid 是一体化企业身份与访问管理平台 (EIAM)，统一身份、访问与合规。社区版完整开源核心能力，企业可基于其搭建自有身份底座；企业版面向规模化企业场景，提供高可用、治理、合规与长期支持。"
    features:
      - "OAuth 2.0 / OIDC / SAML / SCIM 协议实现"
      - "Connector SDK (HR / AD / 业务系统接入)"
      - "Passkey / WebAuthn 客户端"
      - "策略即代码 (RBAC / ABAC / ReBAC) 引擎"
      - "单点登录 (SSO) 与自适应多因素认证 (MFA)"
      - "审计日志结构与导出工具"
      - "OPA / Cedar 策略适配器"
      - "命令行管理工具与 Terraform Provider"
    editions:
      - name: "社区版 · Community"
        license:
          open: true
          label: "AGPL-3.0 · 开源"
        description: "完整核心 EIAM 能力，免费开源。适用于中小企业、初创团队与自建身份底座的工程团队。"
        points:
          - "OAuth / OIDC / SAML / SCIM 协议栈"
          - "SSO / MFA / 生命周期基础流程"
          - "策略即代码授权引擎"
          - "Connector SDK 与命令行工具"
      - name: "企业版 · Enterprise"
        license:
          open: false
          label: "商业授权"
        description: "面向规模化企业。在社区版之上提供企业治理、合规、高可用与长期支持。"
        points:
          - "高可用部署与多区域容灾"
          - "细粒度授权审计与权限合规扫描"
          - "SOC 2 / ISO 27001 / 等保合规报表"
          - "Workforce / Customer 双域治理"
          - "SLA 工单、版本支持与升级保障"
          - "面向客户场景的定制集成"

# 为什么开源
principles_title: "为什么我们坚持开源"
principles_subtitle: "安全基础设施只有开放才值得信任，工程能力只有可审计才值得长期依赖。"
principles:
  - index: "01"
    title: "可审计才可信"
    description: "保护核心业务的工具，必须能被客户自己读源码、跑测试、做合规审计。黑盒安全产品本身就是风险。"
  - index: "02"
    title: "不锁定客户"
    description: "拥抱开放标准 (OAuth、OIDC、SCIM、OpenTelemetry、eBPF)，客户可以随时换走、自建、二次开发，绝不被技术债绑架。"
  - index: "03"
    title: "社区即护城河"
    description: "工程问题最终靠工程师解决。开源让全球工程师共同打磨代码，单一厂商的力量无法与社区相比。"
  - index: "04"
    title: "工程师的尊严"
    description: "我们是工程师团队，希望自己的代码被认可、被复用、被批评。开源是我们与同行对话的方式。"

# 如何参与
contribute_title: "如何参与"
contribute_subtitle: "欢迎以多种方式加入 MatrixPlus 开源社区。"
contribute:
  - icon: "⭐"
    title: "Star"
    description: "关注与 Star 项目，让更多人看到。"
  - icon: "🐛"
    title: "Issue"
    description: "提交 bug 反馈或需求建议。"
  - icon: "🤝"
    title: "Pull Request"
    description: "提交代码贡献，欢迎所有等级。"
  - icon: "💬"
    title: "Discussions"
    description: "在 GitHub Discussions 与团队及社区交流。"

cta_title: "把开放标准带到您的下一个项目"
cta_subtitle: "需要企业版部署、定制集成或长期运营支持？我们在背后做。"
cta_label: "联系我们"
---
