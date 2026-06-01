# Windows Installation Guide - FinOps Token Optimization

Installing the Zone-Based Execution Model on Windows writes workspace instruction files and aligned ignore boundaries into the current project root.

It does not install a global service. It becomes usable when Antigravity, Codex, Cursor, or Claude Code reads the workspace files.

---

## One-Line PowerShell Installation

Open PowerShell, move to your project root, and run:

```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

## Execution Policy Troubleshooting

If PowerShell reports that scripts are disabled, temporarily bypass the policy for the current session:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

Or run the command with a bypass argument:

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex"
```

---

## Manual Installation on Windows

If direct script downloads are blocked:

1. Clone the repository:

   ```cmd
   git clone https://github.com/Rezhnn/Token-Optimization.git
   ```

2. Copy these guide files into your active project's root folder:

   - `HYBRID_RUNTIME_SPEC.md`
   - `AGENTS.md`
   - `CLAUDE.md`
   - `GEMINI.md`
   - `.cursorrules`

3. Copy the shared ignore template into all five boundary files:

   - `.geminiignore`
   - `.cursorignore`
   - `.claudeignore`
   - `.codexignore`
   - `.openaiignore`

---

## Verification

In the configured workspace, ask:

```powershell
[CMD] echo Active
```

Expected behavior: the agent response should be terse and operational.
