---
name: geminiignore-finops
version: 2.1.0
description: "Instruction-based FinOps boundaries and hybrid zone routing for Antigravity, Codex, Cursor, and Claude Code."
category: context-optimization
risk: safe
source: https://github.com/Rezhnn/Token-Optimization
author: Rezhnn
contributors:
  - JuliusBrussee (base caveman grammar concept)
tags:
  - finops
  - context-management
  - token-optimization
  - zone-routing
  - antigravity
  - claude-code
  - cursor
  - codex
tools:
  - antigravity
  - gemini
  - claude-code
  - cursor
  - codex
---

# GeminiIgnore FinOps and Hybrid Runtime Rules

## What This Skill Does

This skill mirrors the maintainer's installed global setup. It gives supported agents two instruction layers:

1. A shared ignore boundary for `.geminiignore`, `.cursorignore`, `.claudeignore`, `.codexignore`, and `.openaiignore`.
2. A four-zone routing model for output discipline.

This is an instruction-based setup. It does not provide runtime enforcement, token counting, or a benchmark runner by itself. The rules are effective when the active tool reads and follows the workspace instruction files.

## FinOps Behavioral Rules

1. Never read lockfiles or large minified bundles unless explicitly required.
2. Prefer exact paths, manifests, and targeted search over broad tree-wide reads.
3. Keep edits surgical and avoid rewriting whole files for small changes.
4. Keep all AI ignore files aligned when creating or updating them.

## Universal Ignore Files

The installer writes the same template to:

- `.geminiignore`
- `.cursorignore`
- `.claudeignore`
- `.codexignore`
- `.openaiignore`

The canonical template is [templates/ignore.template](templates/ignore.template).

## Zone-Based Execution Model

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

### Zone 0 - Sacred

Use for any file write to source code, comments, docstrings, and production-facing docs. Caveman grammar is banned. Correctness and maintainability take priority over token reduction.

### Zone 1 - Premium

Use for `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]`, `[BRIEF]`, `[REVIEW]`, architecture, design systems, storyboards, user flows, and diagrams.

### Zone 2 - Hybrid

Use by default for debugging, explanations, comparisons, and general Q&A. Internal analysis may be compressed; final user-facing output remains professional and clear.

### Zone 3 - Caveman

Use for `[CMD]`, `[GIT]`, `[PKG]`, `[QUICK]`, `$` prompts, terminal tasks, package operations, and quick status checks. Keep output terse and operational.

## Anti-Corruption Rules

- Caveman grammar never touches code files, comments, docstrings, READMEs, CHANGELOGs, ADRs, client-facing docs, or production error messages.
- Full verbose output should not be used for terminal summaries, git log/diff, package audits, or quick confirmations.
- If a Zone 3 request requires writing a code file, Zone 0 wins automatically.

## Verification

To verify installation in a workspace:

1. Confirm all five ignore files exist and match the canonical template.
2. Confirm `AGENTS.md`, `GEMINI.md`, `CLAUDE.md`, and `.cursorrules` exist.
3. Run `[GIT] status`; the agent response should be terse.
4. Ask `[ARCH] design a microservices auth system`; the agent response should be detailed and structured.
