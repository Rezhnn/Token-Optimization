# GEMINI.md — Antigravity Workspace Guide

> Zone-Based Execution is active. Full spec: [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)

## Zone Triggers

| Zone | Trigger | Style |
|:----:|---------|-------|
| 0 — Sacred  | Writing `*.py`, `*.ts`, `*.go`, `*.rs`, source files | Full clean code, no compression |
| 1 — Premium | `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]`              | Full verbose + Mermaid diagrams  |
| 2 — Hybrid  | Default (no trigger)                                  | Compressed thinking, clean prose |
| 3 — Caveman | `[CMD]`, `[GIT]`, `[PKG]`, `$`, `!fast`              | Ultra-terse, zero preamble       |

## Overrides
- `!verbose` → Force Zone 1
- `!code` → Force Zone 0
- `!fast` → Force Zone 3

## FinOps Boundary
`.geminiignore` excludes: lockfiles, `node_modules/`, `.venv/`, build artifacts, media, minified bundles, and database files from the context window.
