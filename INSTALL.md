# FinOps Token Optimization - Installation Guide

This guide installs the instruction files and aligned ignore boundaries used by the Zone-Based Execution Model.

The install scripts write files into the target project root. After the files land, Antigravity, Codex, Cursor, and Claude Code can use the rules in that workspace if they honor their workspace instruction files.

This is not a global installer, runtime hook, proxy, token counter, or benchmark runner.

---

## Quick One-Line Installation

Run the appropriate command in your project root.

### macOS, Linux, or WSL (Bash)

```bash
curl -fsSL https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

---

## Manual Installation

### Step 1: Initialize Workspace Boundaries

Create these files in the project root:

- `.geminiignore`
- `.cursorignore`
- `.claudeignore`
- `.codexignore`
- `.openaiignore`

Copy the contents of [ignore.template](skills/finops-zones/templates/ignore.template) into each file. The automatic scripts do this for you.

### Step 2: Add Workspace Guides

Copy these guide files into the project root:

- [HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)
- [AGENTS.md](AGENTS.md)
- [CLAUDE.md](CLAUDE.md)
- [GEMINI.md](GEMINI.md)
- [.cursorrules](.cursorrules)

These files guide supported agents; they do not enforce behavior outside the agent's normal instruction-following mechanism.

---

## Verification

1. Confirm all five ignore files exist and have identical content.
2. Confirm `AGENTS.md`, `GEMINI.md`, `CLAUDE.md`, and `.cursorrules` exist.
3. Ask `[GIT] status`; expected response is terse.
4. Ask a general explanation question; expected response is concise but clear.
5. Ask `[PLAN] Design a multi-tenant user authentication workflow`; expected response is detailed and structured.

---

## Detailed Guides

- Windows users: see [docs/install-windows.md](docs/install-windows.md).
