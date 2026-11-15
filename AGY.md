# AGY.md — CivicShield AI ("מגן התודעה הלאומי") Project Protocol

## Identity & Scope
This repository contains the complete **Assignment 2 Preliminary Engineering & Academic Design Report** (`CivicShield_AI_Preliminary_Report.pdf`, ~40 pages) for **CivicShield AI**, an interdisciplinary Communications + Political Science + Multi-Agent AI system designed for the joint tender of Israel's Central Election Committee, National Cyber Directorate, and Ministry of Justice.

## Multi-Agent Committee Pattern (Lecture 4)
This project implements the Lecture 4 **Multi-Agent Orchestration** methodology (`team.json`):
- **Master Orchestrator (`agents/master/AGY.md`):** Owns `PRD.md`, `PLAN.md`, `TODO.md`, `main.tex`, `README.md`, and coordinates cross-chapter integration and page targets (37–45 pages).
- **Theory Agent (`agents/theory/AGY.md`):** Owns theoretical synthesis (`ch02`) and constitutional/ethical governance (`ch06`), mapping Agenda Setting, Entman Framing, Spiral of Silence, Habermas Public Sphere, Inoculation/Prebunking, Sharp Power, and Defensive Democracy.
- **Architect Agent (`agents/architect/AGY.md`):** Owns `civicshield.cls`, `ch01`, `ch03`, `ch04`, the 5-layer architecture, Hub JSON Envelope protocol, and all native TikZ diagrams.
- **Simulator Agent (`agents/simulator/AGY.md`):** Owns `scripts/generate_figures.py`, deterministic quantitative simulations (`SIRI ODEs`, `Hegselmann-Krause`, Bayesian Multimodal Deepfake Fusion, `M/M/c Erlang-C`, 5-year CAPEX/OPEX ROI), and `ch05` + `ch07`.
- **Red Team Agent (`agents/redteam/AGY.md`):** Owns `scripts/verify_report.py`, `ch08`, constitutional anti-censorship audits, and LuaLaTeX BiDi verification.

## Hard Technical & Legal Constraints
1. **No AI Auto-Censorship:** AI is strictly bounded to detection, contagion forecasting, and neutral cognitive prebunking advisories. Takedown petitions require a cryptographic `3-of-3 Ed25519 Quorum`.
2. **Offline-Safe LuaLaTeX BiDi:** All TeX sources compile under Windows MiKTeX `lualatex.exe --disable-installer -interaction=nonstopmode` with `babel` (`bidi=basic`) and system fonts (`David`, `Arial`, `Courier New`).
3. **Zero Internet Images:** All architectural/process diagrams are written in native TikZ (`tikzhebrew`); all quantitative plots are generated reproducibly by `scripts/generate_figures.py`.
4. **Honesty & Deterministic Verification:** No statistic or metric may appear in documentation or prose unless verified from executed simulation code or compiled PDF inspection.
