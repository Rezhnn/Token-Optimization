# geminiignore-finops Skill README

This folder retains the historical `finops-zones` path so existing install URLs remain stable. The skill capability itself follows the maintainer's installed global `geminiignore-finops` setup.

## What It Does

The skill defines two instruction layers:

- FinOps ignore boundaries for `.geminiignore`, `.cursorignore`, `.claudeignore`, `.codexignore`, and `.openaiignore`.
- A hybrid four-zone routing model for agent output discipline.

It is instruction-based. It becomes usable when the active agent reads the workspace files written by the installer. It does not install a runtime hook, proxy, token counter, or enforcement daemon.

## Primary Supported Tools

- Antigravity
- Codex
- Cursor
- Claude Code

## Verification

After installation, verify behavior in the target workspace:

1. Confirm all five ignore files exist and have identical content.
2. Confirm `AGENTS.md`, `GEMINI.md`, `CLAUDE.md`, and `.cursorrules` exist.
3. Ask a Zone 3 prompt such as `[GIT] status`; the response should be terse.
4. Ask a Zone 1 prompt such as `[PLAN] design an auth flow`; the response should be detailed.
