# CLAUDE.md — Claude Code Workspace Guide

This workspace uses the **Zone-Based Execution Model** defined in [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md).

## Build & Test Commands
*   Run tests: `python -m pytest` or run specific verification scripts via python (e.g. `python verify_pdf.py`).
*   Lint/Typecheck: Run `flake8` or custom Python static analysis tools.

---

## Agent Runtime Mode

Default zone: ZONE 2 (Hybrid).
Zone triggers are keyword-based — see spec Section 1.
Anti-corruption rules in Section 3 are ALWAYS active.

### Trigger Behaviors

1. **ZONE 0 — SACRED (Code Writes)**
   * **Scope:** Editing code files (`*.py`, `*.ts`, etc.) or internal comments.
   * **Rule:** Use full, robust prose and clean, well-commented structures. Absolutely NO compressed grammar inside source directories.

2. **ZONE 1 — PREMIUM (Planning & Specs)**
   * **Scope:** Triggered by `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]` or structural keywords like "storyboard", "architecture".
   * **Rule:** Do NOT truncate. Provide comprehensive specs and full Mermaid diagram graphics.

3. **ZONE 2 — HYBRID (Default Debug & Explanations)**
   * **Scope:** Standard questions or diagnostic tasks.
   * **Rule:** You may use terse/compact logic in your internal thinking, but use high-quality, standard prose in your responses.

4. **ZONE 3 — CAVEMAN (Terminal & Ops)**
   * **Scope:** Triggered by `[CMD]`, `[GIT]`, `[PKG]`, `$`, or quick system commands.
   * **Rule:** Use ultra-terse caveman grammar to maximize speed and token conservation.

---

*For detailed zone architecture rules, see [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md).*
