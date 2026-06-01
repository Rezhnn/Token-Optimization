---
name: finops-zones
version: 2.0.0
description: "Zone-Based Execution Model for AI agents — cuts 60-90% of API token usage by dynamically routing tasks to the right verbosity level. Sacred code quality is NEVER sacrificed."
category: token-optimization
risk: safe
source: https://github.com/Rezhnn/Token-Optimization
author: Rezhnn
contributors:
  - JuliusBrussee (base caveman grammar concept)
  - Anthropic / OpenAI (verbosity constraint research)
tags:
  - finops
  - token-optimization
  - zone-routing
  - context-management
  - cost-reduction
  - antigravity
  - claude-code
  - cursor
  - codex
tools:
  - antigravity
  - claude-code
  - cursor
  - codex
  - windsurf
  - roo-code
  - cline
  - aider
---

# FinOps Zone-Based Execution Model

## What This Skill Does

This skill installs a **4-zone dynamic routing system** into your AI coding agent. Instead of the agent responding with the same verbosity level for *every* type of request, it intelligently shifts its behaviour based on what kind of task is being performed.

The result is a **60–90% reduction in API token usage** for operational tasks (git, installs, terminal ops) while maintaining **100% full quality** for architecture, planning, and production code.

---

## The Four Zones

### 🟢 ZONE 0 — SACRED
**"Correctness is the only currency."**

- **Triggered by:** Any file write to source code (`*.py`, `*.ts`, `*.js`, `*.rs`, `*.go`, `src/**`, `lib/**`, etc.) or documentation (`README.md`, `CHANGELOG.md`, `ADR-*.md`, docstrings, inline comments).
- **Output style:** Full standard programming prose. SOLID, KISS, DRY, Clean Code enforced at all times. Zero abbreviations, zero compression. Every comment is a complete sentence. Every function is named with intent.
- **Token budget:** Unconstrained. Correctness is the only metric.
- **Anti-corruption:** If a Zone 3 request (e.g. `[CMD]`) triggers a file write, **Zone 0 wins immediately.**

---

### 🔵 ZONE 1 — PREMIUM
**"Full depth, full vision, full output."**

- **Triggered by explicit keywords:** `[PLAN]`, `[ARCH]`, `[DESIGN]`, `[PRD]`, `[BRIEF]`, `[REVIEW]`
- **Triggered by implicit context:** Messages containing "architecture", "design system", "storyboard", "user flow", "diagram", or multi-phase planning discussions.
- **Triggered by overrides:** `!verbose`, `!code`
- **Output style:** Full verbose markdown with Mermaid diagrams, structured hierarchy, complete storyboards (What user does → How they enter → Fill-in → Button → After → Landing → Guidance → DB state → Visual changes). No truncation ever.
- **Token budget:** High. Depth and completeness are the metrics.

---

### 🟡 ZONE 2 — HYBRID *(Default)*
**"Think cheap, output proper."**

- **Triggered by:** Anything that doesn't match Zone 0, 1, or 3. This is the default state.
- **Output style:** The agent's *internal reasoning* may be compressed and terse (chain-of-thought, intermediate analysis), but the *final output to the user* is always well-structured, polite, professional prose.
- **Applies to:** Debug analysis ("why is this broken?"), code explanations ("what does this function do?"), technical comparisons ("Redis vs Memcached?"), general Q&A.
- **Token budget:** Medium. Compress reasoning, not answers.

---

### 🔴 ZONE 3 — CAVEMAN
**"Few words. Maximum function. Go."**

- **Triggered by explicit keywords:** `[CMD]`, `[GIT]`, `[PKG]`, `[QUICK]`, `$` (any message starting with `$`)
- **Triggered by explicit overrides:** `!fast`
- **Triggered by implicit context:** Single-verb commands ("install X", "run Y", "delete Z"), obvious terminal operations, git ops, package installs.
- **Output style:** Ultra-terse, compressed "caveman grammar." Preambles are stripped. Output is raw, functional, and minimal.
- **Token budget:** Minimal. Target 70–80% compression vs Zone 2 baseline.
- **Anti-corruption:** Caveman grammar NEVER leaks into code files, comments, READMEs, or any client-facing output.

---

## Zone Conflict Resolution

```
Priority: ZONE 0 > ZONE 1 > ZONE 2 > ZONE 3

Rule 1: Zone 3 request + file write = Zone 0 wins.
Rule 2: Zone 1 request + quick status check = Zone 3 wins.
Rule 3: Genuinely ambiguous = Zone 2, ask inline for clarification.
```

---

## Explicit Override Commands

| Command    | Effect                                          |
|------------|-------------------------------------------------|
| `!verbose` | Force Zone 1 for this response only             |
| `!code`    | Force Zone 0 output quality for this response   |
| `!fast`    | Force Zone 3 for this response only             |
| `!memory`  | Surface relevant cavemem context to user        |

---

## Anti-Corruption Hard Stops

Caveman grammar (`Zone 3`) is **permanently banned** from touching:
- Any source code file (any extension)
- Inline code comments or docstrings
- Client-facing documents or proposals
- Architecture Decision Records
- `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`
- Error messages or log strings in production code
- UI component names or prop descriptions

Full verbose (`Zone 1`) is **permanently banned** from triggering for:
- Terminal command output summaries
- Git log/diff analysis
- `package.json` or lockfile audits
- Simple yes/no confirmations
- Inline debug print statements

---

## FinOps Ignore Boundaries

All ignore files (`.geminiignore`, `.cursorignore`, `.claudeignore`, `.codexignore`, `.openaiignore`) must exclude the following categories from the agent's context window:

- **Dependency trees:** `node_modules/`, `vendor/`, `packages/*/node_modules/`
- **Lockfiles:** `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`, `Cargo.lock`, `poetry.lock`, `go.sum`
- **Build artifacts:** `dist/`, `build/`, `.next/`, `.nuxt/`, `target/`, `bin/`, `obj/`
- **Python environments:** `.venv/`, `venv/`, `env/`, `site-packages/`, `*.egg-info/`, `*.pyd`
- **Caches:** `.cache/`, `.vite/`, `.turbo/`, `.pytest_cache/`, `.mypy_cache/`
- **Logs & databases:** `*.log`, `*.sqlite`, `*.db`, `*.sql.gz`
- **Binary media:** `*.png`, `*.jpg`, `*.mp4`, `*.mp3`, `*.pdf`, `*.woff`, `*.woff2`
- **Minified bundles:** `*.min.js`, `*.min.css`, `*.map`, `*.chunk.js`

---

## Token Budget by Zone

| Zone | Name    | Budget Level | Typical Savings vs Baseline |
|:----:|---------|:------------:|:---------------------------:|
| 0    | Sacred  | Unconstrained | 0% (correctness first)     |
| 1    | Premium | High          | 0% (depth first)           |
| 2    | Hybrid  | Medium        | ~40–50%                    |
| 3    | Caveman | Minimal       | ~70–90%                    |

---

## Verification

To verify this skill is active, observe the agent's behaviour:
1. Run `git status` — response should be terse, 1–3 lines max (`Zone 3`).
2. Ask "explain what useEffect does" — response should be clear prose but not padded (`Zone 2`).
3. Ask `[ARCH] design a microservices auth system` — response must include Mermaid diagram and full spec (`Zone 1`).
4. Edit a `.ts` file — output must use full clean-code standards, zero abbreviation (`Zone 0`).
