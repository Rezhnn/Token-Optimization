# HYBRID_RUNTIME_SPEC.md

## Hybrid Runtime Spec - Zone-Based Execution Model v2.1

This repository mirrors the maintainer's installed global setup for Antigravity, Codex, Cursor, and Claude Code.

The model is instruction-based. It guides agent behavior through workspace files and ignore boundaries; it does not provide runtime enforcement, middleware, a proxy, or token counting by itself.

When in doubt, default to Zone 2 (Hybrid).

---

## 1. FinOps Auto-Initialization

Upon entering any workspace, apply the `geminiignore-finops` behavioral rules before reading project files:

- use need-to-know reading,
- prefer targeted search over broad dumps,
- never read lockfiles or large minified bundles unless explicitly required,
- keep edits surgical,
- keep `.geminiignore`, `.cursorignore`, `.claudeignore`, `.codexignore`, and `.openaiignore` aligned.

If the workspace lacks the ignore files, create them from `skills/finops-zones/templates/ignore.template`.

---

## 2. Zone Architecture

```text
ZONE 0 - SACRED    -> code files, comments, docstrings
ZONE 1 - PREMIUM   -> architecture, UI/UX, planning, client docs
ZONE 2 - HYBRID    -> reviews, debug, Q&A (DEFAULT)
ZONE 3 - CAVEMAN   -> terminal, git, package ops, quick queries
```

Priority:

```text
Zone 0 > Zone 1 > Zone 2 > Zone 3
```

---

## 3. Zone Rules

### Zone 0 - Sacred

Triggered by any file write to:

```text
src/**, lib/**, components/**, pages/**, utils/**, hooks/**
*.ts, *.tsx, *.js, *.jsx, *.py, *.go, *.rs
README.md, CHANGELOG.md, ADR-*.md, docs/**
inline comments, docstrings, JSDoc, TSDoc
```

Rules:

- Caveman grammar is banned.
- Use full standard programming prose.
- Prioritize correctness, maintainability, SOLID, KISS, DRY, and Clean Code.

### Zone 1 - Premium

Explicit triggers:

```text
[PLAN], [ARCH], [DESIGN], [PRD], [BRIEF], [REVIEW], !verbose, !code
```

Implicit triggers:

```text
architecture, design system, storyboard, user flow, diagram, multi-phase planning
```

Rules:

- Use full-depth structured output.
- Use Mermaid diagrams when they improve clarity.
- Do not truncate important planning or architecture details.

### Zone 2 - Hybrid

Default for debugging, explanations, comparisons, reviews, and general Q&A.

Rules:

- Compress internal analysis.
- Keep final user-facing output clear, professional, and complete enough to act on.
- Avoid padding, repeated context, and unnecessary preambles.

### Zone 3 - Caveman

Explicit triggers:

```text
[CMD], [GIT], [PKG], [QUICK], $, !fast
```

Implicit triggers:

```text
install, run, delete, git, package operations, terminal-only tasks
```

Rules:

- Keep output terse and operational.
- Avoid greetings, long explanations, and conclusions.
- If the task writes code or docs, Zone 0 wins.

---

## 4. Anti-Corruption Rules

- Caveman grammar never touches code files, comments, docstrings, READMEs, CHANGELOGs, ADRs, client-facing docs, or production error messages.
- Full verbose output should not trigger for terminal summaries, git log/diff, package audits, or quick confirmations.
- If a Zone 3 request requires writing a code file, Zone 0 wins automatically.

---

## 5. Workflow Decision Tree

```text
User message received
  |
  v
Does it write code, comments, docstrings, or production docs?
  | yes -> Zone 0
  | no
  v
Does it have an explicit zone keyword or override?
  | yes -> route to that zone, unless a higher-priority zone applies
  | no
  v
Implicit context check:
  architecture / design / storyboard -> Zone 1
  terminal / git / package task      -> Zone 3
  everything else                    -> Zone 2
```

---

## 6. Verification

The expected verification is behavioral:

1. `[GIT] status` should produce terse operational output.
2. A normal explanation prompt should produce concise but clear prose.
3. `[ARCH] design ...` should produce structured planning output.
4. Any code/doc write should use full-quality prose and maintainability rules.
