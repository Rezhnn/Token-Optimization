# AGENTS.md — Master Workspace Protocol

## 1. Mission
Build and maintain the codebase with tight documentation, zero technical debt, and predictable token costs using the **Zone-Based Execution Model** defined in [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md).

---

## 2. Zone System Overview

You MUST dynamically shift execution zones depending on the task type.

```
ZONE 0 — SACRED         (code files, comments, docstrings)
ZONE 1 — PREMIUM        (architecture, UI/UX, planning, client docs)
ZONE 2 — HYBRID         (reviews, debug, internal analysis)     ← DEFAULT
ZONE 3 — CAVEMAN        (terminal, git, package ops, quick queries)
```

### Zone Rules:
*   **ZONE 0 (Sacred):** Banned: caveman grammar. Standard, robust prose and code. Applied to all writes to source files (e.g. `*.py`, `*.ts`, `*.go`, `*.rs`).
*   **ZONE 1 (Premium):** Banned: caveman grammar. Visuals (Mermaid), detailed planning, full storyboards. Triggered by `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]`, or keywords like "architecture".
*   **ZONE 2 (Hybrid):** Default. Reasoning chain can be compressed internally, but final user output uses standard prose.
*   **ZONE 3 (Caveman):** Terse, compressed caveman grammar. Triggered by `[CMD]`, `[GIT]`, `[PKG]`, `$`, or quick operational verbs.

---

## 3. Persistent Memory Sync (`cavemem`)

*   **Export on Commit:** Before completing your work session, export the local `cavemem` database to git tracking:
    ```bash
    cavemem export --format json --output .cavemem/snapshot.json
    ```
*   **Import on Start:** When resuming work in this repository, import the snapshot:
    ```bash
    cavemem import .cavemem/snapshot.json
    ```

---

## 4. Quality & FinOps Gates

Before claiming completion of any ticket or task:
1.  **Code Safety:** Ensure all code edits are Zone 0 (no caveman grammar leaks in production or code docs).
2.  **Surgical Ignore:** Confirm all changes match local ignore patterns to prevent repo-bloat.

*For detailed instructions, see [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md).*
