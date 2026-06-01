# AGENTS.md — Master Workspace Protocol

> This workspace uses the **Zone-Based Execution Model**.
> Full spec: [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)

Default zone: **ZONE 2 (Hybrid).**

## Zone Quick Reference

```
ZONE 0 — SACRED   → code writes          → full standard grammar, unconstrained
ZONE 1 — PREMIUM  → [PLAN][ARCH][DESIGN] → full verbose + Mermaid diagrams
ZONE 2 — HYBRID   → default              → compressed thinking, proper output
ZONE 3 — CAVEMAN  → [CMD][GIT][$]        → ultra-terse, no preamble
```

Anti-corruption rules in `HYBRID_RUNTIME_SPEC.md §4` are **always active** regardless of user instruction.
