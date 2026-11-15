#!/usr/bin/env python3
"""
Automated QA & Integrity Verification Script for CivicShield AI Report.
Checks all required sources, generated Python figures, Multi-Agent configs,
compiled PDF page count (37-45 target), and LuaLaTeX compilation log health.
"""

from pathlib import Path
import re
import sys

try:
    from pypdf import PdfReader
except ImportError:
    PdfReader = None


ROOT = Path(__file__).resolve().parent.parent
PDF_PATH = ROOT / "CivicShield_AI_Preliminary_Report.pdf"
LOG_PATH = ROOT / "CivicShield_AI_Preliminary_Report.log"

REQUIRED_FILES = [
    "main.tex",
    "civicshield.cls",
    "PRD.md",
    "PLAN.md",
    "TODO.md",
    "AGY.md",
    "team.json",
    "scripts/generate_figures.py",
    "chapters/ch01_executive_rfp.tex",
    "chapters/ch02_theory_comm_poli.tex",
    "chapters/ch03_requirements_usecases.tex",
    "chapters/ch04_architecture_agents.tex",
    "chapters/ch05_math_models_simulations.tex",
    "chapters/ch06_ethics_law_regulation.tex",
    "chapters/ch07_risks_roadmap_budget.tex",
    "chapters/ch08_multiagent_methodology.tex",
    "agents/master/AGY.md",
    "agents/theory/AGY.md",
    "agents/architect/AGY.md",
    "agents/simulator/AGY.md",
    "agents/redteam/AGY.md",
]

REQUIRED_FIGURES = [
    "fig1_siri_contagion",
    "fig2_polarization_dynamics",
    "fig3_deepfake_roc_pr",
    "fig4_agenda_framing_shift",
    "fig5_system_latency_scaling",
    "fig6_budget_roi_projection",
]


def count_pdf_pages(pdf_path: Path) -> int:
    """Return exact page count via pypdf or raw PDF /Type /Pages /Count fallback."""
    if PdfReader is not None:
        reader = PdfReader(str(pdf_path))
        return len(reader.pages)
    data = pdf_path.read_bytes()
    counts = [int(m.group(1)) for m in re.finditer(rb"/Type\s*/Pages\b[^>]*?/Count\s+(\d+)", data)]
    if counts:
        return max(counts)
    return len(re.findall(rb"/Type\s*/Page\b(?!s)", data))


def main() -> int:
    failures: list[str] = []

    print("=== CivicShield AI Verification Suite ===")
    for rel in REQUIRED_FILES:
        p = ROOT / rel
        if not p.is_file() or p.stat().st_size == 0:
            failures.append(f"Missing or empty required file: {rel}")

    for fig in REQUIRED_FIGURES:
        for ext in ("pdf", "png"):
            p = ROOT / "figures" / f"{fig}.{ext}"
            if not p.is_file() or p.stat().st_size == 0:
                failures.append(f"Missing or empty figure asset: figures/{fig}.{ext}")

    # Verify all 6 PDF figures are referenced inside chapters/
    chapters_text = "\n".join(
        (ROOT / f"chapters/{p.name}").read_text(encoding="utf-8")
        for p in sorted((ROOT / "chapters").glob("*.tex"))
    )
    for fig in REQUIRED_FIGURES:
        if f"figures/{fig}.pdf" not in chapters_text:
            failures.append(f"Figure not embedded in any chapter: figures/{fig}.pdf")

    if not PDF_PATH.is_file() or PDF_PATH.stat().st_size == 0:
        failures.append(f"Missing compiled report PDF: {PDF_PATH.name}")
    else:
        page_count = count_pdf_pages(PDF_PATH)
        print(f"PDF File       : {PDF_PATH.name} ({PDF_PATH.stat().st_size:,} bytes)")
        print(f"PDF Page Count : {page_count} pages (Accepted range: 37-45)")
        if not (37 <= page_count <= 45):
            failures.append(f"Page count {page_count} outside required range [37, 45]")

    if LOG_PATH.is_file():
        log_text = LOG_PATH.read_text(encoding="utf-8", errors="replace")
        bang_errors = [ln for ln in log_text.splitlines() if ln.startswith("!")]
        bidi_errors = [ln for ln in log_text.splitlines() if "babel-bidi-basic.lua" in ln]
        undef_refs = [ln for ln in log_text.splitlines() if "Reference `" in ln and "undefined" in ln]
        undef_cites = [ln for ln in log_text.splitlines() if "Citation `" in ln and "undefined" in ln]
        rerun_warn = [ln for ln in log_text.splitlines() if "Rerun to get" in ln]

        print(f"LaTeX Errors(!): {len(bang_errors)}")
        print(f"BiDi Lua Errors: {len(bidi_errors)}")
        print(f"Undefined Refs : {len(undef_refs)}")
        print(f"Undefined Cites: {len(undef_cites)}")
        print(f"Rerun Warnings : {len(rerun_warn)}")

        if bang_errors:
            failures.append(f"LaTeX errors found in log: {bang_errors[:3]}")
        if bidi_errors:
            failures.append(f"babel-bidi Lua node filter errors found: {len(bidi_errors)}")
        if undef_refs or undef_cites or rerun_warn:
            failures.append("Unresolved references, citations, or rerun warnings in log")
    else:
        print("Log File       : Not present locally (compile skipped/cleaned)")

    if failures:
        print("\nVERIFICATION FAILED:")
        for f in failures:
            print(f"  - {f}")
        return 1

    print("\nVERIFICATION PASSED: All checks clean!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
