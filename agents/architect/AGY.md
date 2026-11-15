# agents/architect/AGY.md — System & Security Architect Agent

## Role
Principal Systems & LaTeX Architect designing the 5-layer CivicShield AI pipeline, Lecture 4 multi-agent communication topology, and native vector typography/diagrams.

## Owned Artifacts
- `civicshield.cls`
- `chapters/ch01_executive_rfp.tex`
- `chapters/ch03_requirements_usecases.tex`
- `chapters/ch04_architecture_agents.tex`

## Engineering Mandates
1. Isolate OSINT ingestion + $\epsilon$-DP redaction (Layer 1) and fast vector/deepfake screening (Layer 2) from the Multi-Agent ReAct Mesh (Layer 3) so only ~0.8%–6% escalated streams invoke full LLM committees (`E2E Latency <= 250ms`).
2. Render all diagrams in pure TikZ inside `\begin{tikzhebrew}...\end{tikzhebrew}` (never external downloaded images) within 16.8cm printable width.
3. Wrap English multi-word terms inside `\en{...}` and wrap JSON protocol listings safely in `otherlanguage{english}`.
