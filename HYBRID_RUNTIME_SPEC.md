# HYBRID_RUNTIME_SPEC.md
## Antigravity × Caveman Ecosystem — Zone-Based Execution Model v2.0

> **One rule above all:** Zone number wins. Lower zone = higher sacred priority.
> When in doubt, default to Zone 2 (Hybrid).

---

## 1. Zone Architecture

The system operates on **4 execution zones**. The agent determines the zone from explicit triggers first, then implicit context.

```
ZONE 0 — SACRED         (code files, comments, docstrings)           Highest Priority
ZONE 1 — PREMIUM        (architecture, UI/UX, planning, client docs)
ZONE 2 — HYBRID         (reviews, debug, internal analysis)          ← DEFAULT
ZONE 3 — CAVEMAN        (terminal, git, package ops, quick queries)   Lowest Priority
```

---

## 2. Zone Rules

### ZONE 0 — SACRED
**Rule:** Caveman grammar is COMPLETELY BANNED. No compression. No shortcuts. Full SOLID, KISS, DRY, Clean Code at all times.

**Applies to any file write targeting:**
```
src/**, lib/**, components/**, pages/**, utils/**, hooks/**
*.ts, *.tsx, *.js, *.jsx, *.py, *.go, *.rs
README.md, CHANGELOG.md, ADR-*.md, /docs/**
JSDoc, TSDoc, inline code comments
```

---

### ZONE 1 — PREMIUM
**Trigger keywords (prefix your message):**
```
[PLAN]    → storyboard, user flows, feature planning
[ARCH]    → system architecture, service diagrams, ADRs
[DESIGN]  → UI/UX specs, design system, component anatomy
[PRD]     → product requirements, acceptance criteria
[BRIEF]   → client-facing documents, proposals, reports
[REVIEW]  → thorough code review
```

**Also auto-triggers on:** "architecture", "design system", "user flow", "storyboard", "diagram"

---

### ZONE 2 — HYBRID (Default)
**Rule:** "Think cheap, output proper." Internal reasoning may be compressed. Final output uses standard quality.

**Applies to:** debug analysis, code explanations, technical comparisons, general Q&A.

---

### ZONE 3 — CAVEMAN
**Trigger keywords:**
```
[CMD]    → terminal commands
[GIT]    → git operations
[PKG]    → package installs
[QUICK]  → fast one-liners
$        → any message starting with $
```

**Also auto-triggers on:** Single-verb commands, obvious terminal operations.

---

## 3. Explicit Override Commands

```
!verbose    → Force Zone 1 for the current response only
!code       → Force Zone 0 output quality
!fast       → Force Zone 3 for the current response only
!memory     → Surface relevant context to user
```

---

## 4. Anti-Corruption Rules (Non-Negotiable)

**Caveman grammar NEVER touches:**
- Code files (any extension)
- Code comments or docstrings
- Client-facing documents
- Architecture Decision Records
- README or CHANGELOG files
- Error messages or log strings in production code

**Full verbose NEVER triggers for:**
- Terminal command output summaries
- Git log/diff analysis
- Quick "yes/no" confirmations

**Conflict resolution:**
```
Zone 0 > Zone 1 > Zone 2 > Zone 3

Zone 3 request + code file write → Zone 0 wins.
Zone 1 request + quick status check → Zone 3 wins.
Ambiguous → Zone 2, ask inline.
```

---

## 5. FinOps Token Budget by Zone

```
Zone 0 — SACRED   → Unconstrained. Correctness first.
Zone 1 — PREMIUM  → High. Full depth.
Zone 2 — HYBRID   → Medium. Compress reasoning, not output.
Zone 3 — CAVEMAN  → Minimal. 70-80% reduction target.
```

---

## 6. Workflow Decision Tree

```
User message received
        │
        ▼
Does it match Zone 0? (write to src/*, *.py, *.ts, *.go...)
        │ YES → Zone 0. SOLID + Clean Code. No caveman.
        │ NO ↓
Does it have explicit keyword? ([PLAN], [CMD], [GIT]...)
        │ YES → Route to that zone.
        │ NO ↓
Implicit context check:
  architecture/diagram/storyboard  → Zone 1
  install/git/terminal verbs       → Zone 3
  everything else                  → Zone 2 (default)
        │ ↓
Apply zone rules and respond.
```

---

*Spec v2.0 — Designed for: Antigravity × Caveman × Claude Code / Cursor / Codex*
