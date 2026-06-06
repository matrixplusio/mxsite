---
title: "行业解决方案"
meta_title: "行业解决方案 — MatrixPlus"
description: "围绕安全、研发、电商、培训四大能力，MatrixPlus 为不同行业打造组合式解决方案。"
layout: "solutions"
draft: false

# Stats 横条
stats:
  - value: "6"
    label: "重点覆盖行业"
  - value: "4"
    label: "可组合能力板块"
  - value: "10+"
    label: "在服务客户"
  - value: "0"
    label: "锁定客户协议"

# 区块文案
label_offering: "我们的方案"
label_capabilities: "关键能力"
label_view_case: "查看相关案例"
cta_title: "您的行业还没列出来?"
cta_subtitle: "MatrixPlus 的能力可以围绕您的具体场景组合，欢迎告诉我们您的目标。"
cta_label: "聊聊您的方案"

solutions:
  - key: "finance"
    industry: "金融"
    title: "强监管下的安全与合规底座"
    challenge: "银行、保险、证券与金融科技公司同时面对监管合规 (等保 2.0、商业银行 API 安全)、强身份认证与高强度攻防压力，缺乏一个统一可审计的安全底座。"
    offering:
      - "mxid 企业身份与访问管理，覆盖 SSO/MFA/SCIM 与策略即代码授权"
      - "mxsec-platform 守护核心业务系统与 K8s 工作负载"
      - "渗透测试与年度护网驻场支撑"
      - "面向监管的审计报表与证据导出"
    capabilities: ["mxid", "mxsec-platform", "渗透测试", "护网行动"]
    case_link: "/cases/#security"
    case_label: "查看安全类案例"

  - key: "gov-soe"
    industry: "政府 / 央国企"
    title: "私有化部署与等保合规一体化"
    challenge: "政务部门与央国企对数据出境、私有化部署、等保合规与国家级护网行动有刚性要求，传统单一安全产品无法覆盖全链路。"
    offering:
      - "mxsec-platform 私有化部署 (主机 / 容器 / K8s 全栈)"
      - "等保 2.0 基线扫描、整改与合规报表"
      - "国家级护网行动期间蓝队驻场 + 红队演练"
      - "关键基础设施暴露面持续梳理"
    capabilities: ["mxsec-platform", "等保合规", "护网驻场", "渗透测试"]
    case_link: "/cases/#security"
    case_label: "查看政企护网案例"

  - key: "multinational"
    industry: "跨国企业"
    title: "海外子公司一站式安全运营"
    challenge: "跨国集团的海外子公司缺乏本地安全团队，集团合规与本地运营压力同时存在，常规外包难以覆盖工程化运营。"
    offering:
      - "mxsec-platform 企业版 + 长期驻场工程师"
      - "持续漏洞修复与系统基线整改"
      - "本地代码审计与渗透测试"
      - "符合集团总部口径的安全审计报表"
    capabilities: ["mxsec-platform", "驻场服务", "代码审计", "安全运营"]
    case_link: "/cases/#security"
    case_label: "查看英国集团子公司案例"

  - key: "internet"
    industry: "互联网 / SaaS"
    title: "云原生安全 + 工程外援"
    challenge: "互联网公司迭代速度快，安全团队人手紧张，DevSecOps 落地难；同时业务系统需要补足数据中台、定制工具与运维托管能力。"
    offering:
      - "mxsec-platform 覆盖大规模 Kubernetes 与混合云"
      - "DevSecOps 流水线接入与红线规则"
      - "数据中台与自研工具按需开发"
      - "SRE / 运维托管支撑核心业务"
    capabilities: ["mxsec-platform", "DevSecOps", "定制研发", "SRE"]
    case_link: "/cases/#engineering"
    case_label: "查看自营研发案例"

  - key: "live-commerce"
    industry: "直播电商品牌与工厂"
    title: "从源头到主播的一体化生态"
    challenge: "工厂有货但缺达人；品牌方有预算但缺直播能力；个人主播缺货源、缺场地、缺运营。中间环节冗长、效率低、信任成本高。"
    offering:
      - "源头工厂 ↔ 直播渠道直连"
      - "沙井 / 虎门直播基地 + 设备 + 运营"
      - "主播孵化平台 (选品 / 排播 / 结算)"
      - "直播代运营全托管 + 直播间搭建陪跑"
      - "海外渠道 (Shopee 等) 接入"
    capabilities: ["代运营", "主播孵化", "直播间搭建", "海外渠道"]
    case_link: "/cases/#commerce"
    case_label: "查看电商案例"

  - key: "gaming"
    industry: "游戏 / 互动娱乐"
    title: "面向高并发与强对抗的安全与研发"
    challenge: "游戏与互动娱乐业务面对高并发、强对抗 (外挂、刷量、黑产)、未成年合规与海外发行多重压力；自研团队需要稳定的安全底座与可外援的工程能力。"
    offering:
      - "mxsec-platform 守护游戏服务器与容器化后端"
      - "mxid 账号体系 + 实名 / 防沉迷合规接入"
      - "反外挂、反作弊与黑产对抗策略支持"
      - "定制后端 / 中台 / 区块链相关模块研发"
    capabilities: ["mxsec-platform", "mxid", "反外挂", "定制研发"]
    case_link: "/cases/#engineering"
    case_label: "查看研发案例"

# 资质与认证
credentials_title: "资质与认证"
credentials_subtitle: "团队持有行业核心认证，公司资质正在按客户场景逐步申请。"
credentials_team_label: "团队认证"
credentials_company_label: "公司资质"
credentials_team:
  - name: "CISP · 注册信息安全专业人员"
    badge: "CISP"
    description: "团队核心安全工程师持证，覆盖等保咨询、渗透测试与安全审计场景。"
credentials_company:
  - name: "字节矩阵（深圳）科技有限公司"
    status: "active"
    status_label: "已注册"
    description: "深圳市市场监督管理局注册，统一社会信用代码可在国家企业信用信息公示系统查询。"
  - name: "CCRC 信息安全服务资质"
    status: "pending"
    status_label: "筹备中"
    description: "面向政企交付的关键资质，按客户场景需求推进。"
  - name: "ISO 27001 信息安全管理体系"
    status: "pending"
    status_label: "筹备中"
    description: "面向跨国与金融客户的国际信息安全标准。"
  - name: "其他行业资质"
    status: "planned"
    status_label: "按需申请"
    description: "等保测评、ITSS、CMMI 等资质按客户与项目实际需要逐步申请。"

# 能力组合矩阵 (展示每行业用了哪些业务板块)
matrix_title: "能力组合矩阵"
matrix_subtitle: "MatrixPlus 的四大能力板块可以根据行业自由组合，下表展示典型搭配。"
matrix_industry_header: "行业"
matrix_columns: ["网络安全", "研发运维", "电子商务", "专业培训"]
matrix_legend_core: "主力能力"
matrix_legend_support: "辅助能力"
matrix_legend_none: "暂无 / 不适用"
matrix:
  - industry: "金融"
    marks: ["core", "support", "none", "support"]
  - industry: "政府 / 央国企"
    marks: ["core", "support", "none", "support"]
  - industry: "跨国企业"
    marks: ["core", "support", "none", "none"]
  - industry: "互联网 / SaaS"
    marks: ["core", "core", "none", "support"]
  - industry: "直播电商品牌与工厂"
    marks: ["none", "support", "core", "support"]
  - industry: "游戏 / 互动娱乐"
    marks: ["core", "core", "none", "none"]
---
