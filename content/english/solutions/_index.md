---
title: "Industry Solutions"
meta_title: "Industry Solutions — MatrixPlus"
description: "MatrixPlus composes its four capability domains — security, engineering, commerce, and training — into industry-specific solutions."
layout: "solutions"
draft: false

# Stats band
stats:
  - value: "6"
    label: "Industries served"
  - value: "4"
    label: "Composable domains"
  - value: "10+"
    label: "Active customers"
  - value: "0"
    label: "Lock-in clauses"

label_offering: "What we deliver"
label_capabilities: "Key capabilities"
label_view_case: "See related case"
cta_title: "Don't see your industry?"
cta_subtitle: "We compose capabilities around your specific scenario — tell us what you're trying to do."
cta_label: "Talk through your scenario"

solutions:
  - key: "finance"
    industry: "Financial services"
    title: "A security and compliance foundation for regulated finance"
    challenge: "Banks, insurers, securities, and fintech firms juggle heavy regulation, hardened authentication, and serious adversarial pressure — without a unified, auditable security plane."
    offering:
      - "mxid for identity, SSO/MFA/SCIM, and policy-as-code authorization"
      - "mxcwpp protecting core business systems and Kubernetes workloads"
      - "Pentest plus annual red-team / on-site blue-team support"
      - "Regulator-ready audit and evidence exports"
    capabilities: ["mxid", "mxcwpp", "Pentest", "Red Team"]
    case_link: "/en/cases/#security"
    case_label: "See security cases"

  - key: "gov-soe"
    industry: "Government & SOEs"
    title: "Private deployment with end-to-end compliance"
    challenge: "Government and central / state-owned enterprises require private deployment, MLPS 2.0 compliance, and national-level red-team support — single-product vendors cannot cover the full chain."
    offering:
      - "mxcwpp private deployment (host / container / Kubernetes)"
      - "MLPS 2.0 baseline scanning, remediation, and compliance reporting"
      - "On-site blue team plus external red team during national exercises"
      - "Continuous exposure mapping for critical infrastructure"
    capabilities: ["mxcwpp", "MLPS 2.0", "On-site Blue Team", "Pentest"]
    case_link: "/en/cases/#security"
    case_label: "See government cases"

  - key: "multinational"
    industry: "Multinationals"
    title: "Turnkey security operations for overseas subsidiaries"
    challenge: "Overseas subsidiaries of multinational groups lack local security teams. Group compliance and local operations both demand attention — generic outsourcing rarely covers engineering-grade operations."
    offering:
      - "mxcwpp Enterprise with long-term on-site engineers"
      - "Continuous vulnerability remediation and baseline hardening"
      - "Local code audit and pentest"
      - "Group-aligned security audit and reporting"
    capabilities: ["mxcwpp", "On-site Service", "Code Audit", "Security Operations"]
    case_link: "/en/cases/#security"
    case_label: "See UK-group case"

  - key: "internet"
    industry: "Internet / SaaS"
    title: "Cloud-native security plus engineering reinforcement"
    challenge: "Internet companies ship fast, security teams are under-staffed, and DevSecOps is hard to land. Business systems also need data platforms, custom tooling, and managed operations to keep up."
    offering:
      - "mxcwpp across large-scale Kubernetes and hybrid cloud"
      - "DevSecOps pipeline integration with policy guardrails"
      - "On-demand custom development and data platforms"
      - "SRE / managed operations for core systems"
    capabilities: ["mxcwpp", "DevSecOps", "Custom dev", "SRE"]
    case_link: "/en/cases/#engineering"
    case_label: "See engineering case"

  - key: "live-commerce"
    industry: "Live commerce brands & factories"
    title: "End-to-end live commerce, from factory to host"
    challenge: "Factories have inventory but no creators; brands have budget but no live-commerce muscle; independent hosts lack inventory, studios, and ops. The chain is long, inefficient, and trust-poor."
    offering:
      - "Source factories ↔ live channel direct connection"
      - "Shajing and Humen studios with equipment and operations"
      - "Host incubation platform (selection / scheduling / settlement)"
      - "Fully managed live-commerce ops and studio setup co-pilot"
      - "Cross-border channels including Shopee"
    capabilities: ["Managed Ops", "Host Incubation", "Studio Setup", "Cross-border"]
    case_link: "/en/cases/#commerce"
    case_label: "See commerce cases"

  - key: "gaming"
    industry: "Gaming & interactive"
    title: "Security and engineering for high-concurrency, high-adversary workloads"
    challenge: "Gaming and interactive entertainment face high concurrency, hostile actors (cheating, bots, grey markets), youth-protection compliance, and overseas-publishing demands all at once. In-house teams need a reliable security foundation plus reinforceable engineering capacity."
    offering:
      - "mxcwpp protecting game servers and containerized backends"
      - "mxid account system with KYC and anti-addiction compliance hooks"
      - "Anti-cheat and grey-market countermeasures"
      - "Custom backend, platform, and blockchain modules on demand"
    capabilities: ["mxcwpp", "mxid", "Anti-cheat", "Custom dev"]
    case_link: "/en/cases/#engineering"
    case_label: "See engineering case"

# Credentials
credentials_title: "Credentials"
credentials_subtitle: "Our team holds core industry certifications; company-level qualifications are pursued progressively as customer scenarios require."
credentials_team_label: "Team certifications"
credentials_company_label: "Company qualifications"
credentials_team:
  - name: "CISP · Certified Information Security Professional"
    badge: "CISP"
    description: "Core security engineers hold CISP, covering MLPS consulting, penetration testing, and security audit work."
credentials_company:
  - name: "Bytematrix (Shenzhen) Technology Co., Ltd."
    status: "active"
    status_label: "Registered"
    description: "Registered with the Shenzhen Administration for Market Regulation; verifiable on the National Enterprise Credit Information Publicity System."
  - name: "CCRC Information Security Service Qualification"
    status: "pending"
    status_label: "In progress"
    description: "Key qualification for government and enterprise delivery, pursued in line with customer requirements."
  - name: "ISO 27001 ISMS"
    status: "pending"
    status_label: "In progress"
    description: "International information security standard for multinational and financial customers."
  - name: "Other industry qualifications"
    status: "planned"
    status_label: "On demand"
    description: "MLPS assessment, ITSS, CMMI, and others — pursued as specific customer projects require."

# Capability matrix
matrix_title: "Capability matrix"
matrix_subtitle: "MatrixPlus's four capability domains compose freely per industry. Typical combinations are shown below."
matrix_industry_header: "Industry"
matrix_columns: ["Security", "Engineering", "Commerce", "Training"]
matrix_legend_core: "Primary"
matrix_legend_support: "Supporting"
matrix_legend_none: "Not applicable"
matrix:
  - industry: "Financial services"
    marks: ["core", "support", "none", "support"]
  - industry: "Government & SOEs"
    marks: ["core", "support", "none", "support"]
  - industry: "Multinationals"
    marks: ["core", "support", "none", "none"]
  - industry: "Internet / SaaS"
    marks: ["core", "core", "none", "support"]
  - industry: "Live commerce brands & factories"
    marks: ["none", "support", "core", "support"]
  - industry: "Gaming & interactive"
    marks: ["core", "core", "none", "none"]
---
