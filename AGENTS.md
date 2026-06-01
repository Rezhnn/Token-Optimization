# AGENTS.md - Master Workspace Protocol

This workspace uses the Zone-Based Execution Model.

Full spec: [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)

Default zone: Zone 2 (Hybrid).

## FinOps Auto-Initialization

Before reading project files, apply the `geminiignore-finops` rules:

- use targeted, need-to-know reading,
- never read lockfiles or large minified bundles unless required,
- prefer exact paths and search results over tree-wide dumps,
- keep edits surgical,
- keep `.geminiignore`, `.cursorignore`, `.claudeignore`, `.codexignore`, and `.openaiignore` aligned.

## Zone Quick Reference

```text
ZONE 0 - SACRED   -> code/docs writes      -> full quality, no compression
ZONE 1 - PREMIUM  -> planning/architecture -> full depth, diagrams when useful
ZONE 2 - HYBRID   -> default Q&A/debug     -> concise analysis, clear output
ZONE 3 - CAVEMAN  -> terminal/git/package  -> terse operational output
```

## Anti-Corruption

Rules in `HYBRID_RUNTIME_SPEC.md` are active for this workspace. If a Zone 3 request requires writing source code, comments, docstrings, or production docs, Zone 0 wins.
