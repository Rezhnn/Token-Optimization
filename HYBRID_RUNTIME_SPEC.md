# HYBRID RUNTIME SPEC
## Antigravity × Caveman Ecosystem — Zone-Based Execution Model

> **One rule above all:** Zone number wins. Lower zone = higher sacred priority.  
> When in doubt, default to Zone 1.

---

## 1. Zone Architecture

The system operates on **4 execution zones**. The agent determines the zone from explicit triggers first, implicit context second.

```
ZONE 0 — SACRED         (code files, comments, docstrings)
ZONE 1 — PREMIUM        (architecture, UI/UX, planning, client docs)
ZONE 2 — HYBRID         (reviews, debug, internal analysis)     ← DEFAULT
ZONE 3 — CAVEMAN        (terminal, git, package ops, quick queries)
```

---

## 2. Zone System Rules

### ZONE 0 — SACRED
**Rule:** caveman grammar is COMPLETELY BANNED here. No compression. No shortcuts. Full SOLID, KISS, DRY, Clean Code at all times.

**Applies to any file write operation targeting:**
```
src/**, lib/**, components/**, pages/**, utils/**, hooks/**
*.ts, *.tsx, *.js, *.jsx, *.py, *.go, *.rs
*.md in /docs/**, README.md, CHANGELOG.md, ADR-*.md
JSDoc, TSDoc, inline code comments
```

**Enforcement:** If the agent is writing to any file matching the above patterns, it MUST switch to Zone 0 regardless of what the user said before. Code correctness > everything.

---

### ZONE 1 — PREMIUM
**Rule:** Full verbose, full quality, full visual. This is where Antigravity runs at 100%. cavemem can be queried for context but caveman grammar output is banned.

**Trigger keywords (prefix your message with these):**
```
[PLAN]    → storyboard, user flows, feature planning
[ARCH]    → system architecture, service diagrams, ADRs
[DESIGN]  → UI/UX specs, design system, component anatomy
[PRD]     → product requirements, acceptance criteria
[BRIEF]   → client-facing documents, proposals, reports
[REVIEW]  → thorough code review (not quick glance)
```

**Also auto-triggers on:**
- Requests containing: "architecture", "design system", "user flow", "storyboard", "diagram"
- Any output that will be shown to a client or stakeholder
- Multi-phase planning sessions

**Output quality standard:**
- Full Mermaid diagrams or SVG visuals where applicable
- Structured markdown with proper hierarchy
- Storyboard sections: What user does → How they enter → Fill-in → Button → After → Landing → Guidance → DB state → Visual changes
- No truncation. Complete outputs only.

---

### ZONE 2 — HYBRID (Default)
**Rule:** caveman grammar is allowed for the agent's REASONING PROCESS (internal chain-of-thought, quick analysis summaries). But the FINAL OUTPUT to the user follows standard quality. Think of it as: "think cheap, output proper."

**This is the default zone when no explicit trigger is present.**

**Applies to:**
- Debug analysis ("why is this broken?")
- Code explanations ("what does this do?")
- Technical comparisons ("X vs Y?")
- General Q&A without file write operations

**Output format:**
- Analysis/reasoning: compressed is fine internally
- Final answer to user: well-structured prose or code block, no caveman grammar leaking through
- cavemem: ALWAYS query here for relevant past context before responding

---

### ZONE 3 — CAVEMAN
**Rule:** Maximum compression. Terse. Functional. No fluff. caveman grammar is fully active.

**Trigger keywords:**
```
[CMD]    → terminal commands, shell operations
[GIT]    → git operations, branch management, PRs
[PKG]    → npm/pip/cargo installs, lockfile operations
[QUICK]  → fast one-liner answers, no elaboration needed
$        → any message starting with $ is treated as terminal context
```

**Also auto-triggers on:**
- Single-verb commands: "install X", "run Y", "delete Z"
- Obvious terminal operations with no design implications
- cavemem: still query, but use compressed retrieval format

---

## 3. Explicit Override Commands

These override zone detection and force a specific mode:

```
!verbose    → Force Zone 1 for the current response only
!code       → Force Zone 0 output quality for the current response
!fast       → Force Zone 3 for the current response only
!memory     → Trigger cavemem lookup and surface relevant context to user
!snapshot   → Export current cavemem state to JSON (see Section 4)
```

---

## 4. Anti-Corruption Rules

These are hard stops. Non-negotiable.

### caveman grammar NEVER touches:
```
✗ Code files (any extension)
✗ Code comments or docstrings
✗ Client-facing documents
✗ Architecture Decision Records
✗ README or CHANGELOG files
✗ Error messages or log strings in production code
✗ UI component names or prop descriptions
```

### Full verbose NEVER triggers for:
```
✗ Terminal command output summaries
✗ Git log/diff analysis
✗ Package.json audits
✗ Quick "yes/no" confirmations
✗ Inline debug print statements
```

### Conflict resolution priority:
```
Zone 0 > Zone 1 > Zone 2 > Zone 3

If a message triggers Zone 3 but requires writing a code file → Zone 0 wins.
If a message triggers Zone 1 but is just a quick status check → Zone 3 wins.
When genuinely ambiguous → default Zone 2, ask for clarification inline.
```

---

## 5. cavemem Sync Strategy (Fix for SQLite Silo Problem)

### Local-first with Git-tracked snapshot:

```bash
# Add to your daily cron / pre-commit hook / post-session script:
cavemem export --format json --output .cavemem/snapshot.json
git add .cavemem/snapshot.json
git commit -m "chore: cavemem sync $(date +%Y-%m-%d)"
```

### On new machine bootstrap:
```bash
git pull
cavemem import .cavemem/snapshot.json
```

### `.gitignore` entry (keep the binary, track the export):
```
.cavemem/db.sqlite        # never commit the binary
.cavemem/snapshot.json    # DO commit this — it's your memory backup
```

### cavemem tagging convention for Zone 1 outputs:
When the agent produces a Zone 1 output (architecture, PRD, design), it should auto-log with rich metadata:

```
cavemem store --tags "arch,projectName,YYYY-MM" --body "Decision: [summary]"
```

This ensures high-value decisions are retrievable across sessions and machines.

---

## 6. FinOps Token Budget by Zone

```
Zone 0 — SACRED   → No token budget constraint. Correctness first.
Zone 1 — PREMIUM  → Budget: high. Accept full input/output for critical outputs.
Zone 2 — HYBRID   → Budget: medium. Compress reasoning, not output.
Zone 3 — CAVEMAN  → Budget: minimal. Target 70-80% reduction vs baseline.
```

### Ignored Assets (FinOps baseline, always active in ignore files):
See `.geminiignore` / `.cursorignore` / `.claudeignore` for the complete exclusion list, which ignores:
- `node_modules/`, `vendor/`, virtual envs (`venv/`, `.venv/`)
- All Lockfiles (`package-lock.json`, `Cargo.lock`, etc.)
- Build directories (`dist/`, `build/`, `.next/`)
- Media, binaries, minified code, and large database/test outputs.

---

## 7. Dual-Engine Workflow in Practice

```
User message received
        │
        ▼
Does it match Zone 0 trigger? (file write to src/*)
        │ YES → Zone 0. SOLID + Clean Code. No caveman anywhere.
        │ NO
        ▼
Does it have explicit Zone keyword? ([PLAN], [ARCH], [CMD], etc.)
        │ YES → Route to that zone
        │ NO
        ▼
Implicit context check:
  - Contains "architecture/design/diagram/flow/storyboard" → Zone 1
  - Contains terminal/git/install verbs → Zone 3
  - Everything else → Zone 2 (default)
        │
        ▼
Apply zone rules, query cavemem for context,
        │
        ▼
Zone 1 output? → Auto-log key decisions to cavemem with metadata tags
```

---

## 8. What You Actually Preserved vs. Antigravity Alone

| Capability | Antigravity Alone | This Hybrid |
|---|---|---|
| Architecture diagrams | ✅ Full quality | ✅ Full quality (Zone 1) |
| UI/UX design specs | ✅ Full quality | ✅ Full quality (Zone 1) |
| Planning storyboards | ✅ Full quality | ✅ Full quality (Zone 1) |
| Production code quality | ✅ Full quality | ✅ Full quality (Zone 0) |
| Terminal/git ops | ❌ Verbose overhead | ✅ Caveman (Zone 3) |
| Cross-session memory | ❌ Raw transcript scan | ✅ cavemem SQLite (Zone 2) |
| API token cost | ❌ High baseline | ✅ 60-70% reduction |
| Cross-machine memory | N/A | ✅ Git-tracked JSON snapshot |
| Dual-mode maintenance | N/A | ✅ Automated via keyword routing |

---

*Last updated: Hybrid Runtime Spec v1.0*  
*Designed for: Antigravity × Caveman × Claude Code / Cursor / Codex*
