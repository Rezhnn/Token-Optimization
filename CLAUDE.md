# CLAUDE.md - Claude Code Workspace Guide

Zone-Based Execution is active.

Full spec: [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)

## FinOps Boundary

Use `.claudeignore` as the Claude Code boundary. Keep it aligned with:

- `.geminiignore`
- `.cursorignore`
- `.codexignore`
- `.openaiignore`

## Zone Triggers

| Zone | Trigger | Style |
|:----:|---------|-------|
| 0 - Sacred | Code/docs writes, comments, docstrings | Full clean-code prose, no compression |
| 1 - Premium | `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]`, `[BRIEF]`, `[REVIEW]` | Full depth, diagrams when useful |
| 2 - Hybrid | Default | Concise analysis, clear final output |
| 3 - Caveman | `[CMD]`, `[GIT]`, `[PKG]`, `[QUICK]`, `$`, `!fast` | Terse operational output |

## Overrides

- `!verbose` -> Force Zone 1
- `!code` -> Force Zone 0
- `!fast` -> Force Zone 3

## Anti-Corruption

Caveman grammar never appears in code files, comments, docstrings, READMEs, CHANGELOGs, ADRs, client-facing docs, or production error messages.
