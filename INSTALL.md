# FinOps Token Optimization — Installation Guide

This document provides a comprehensive installation guide for the **Zone-Based Execution Model** across various operating systems and development environments.

---

## ⚡ Quick One-Line Installation

Select the appropriate command for your platform and execute it within your project's root directory:

### macOS, Linux, or WSL (Bash)
```bash
curl -fsSL https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

---

## 🛠️ Step-by-Step Manual Installation

If you prefer to install the components manually or want to selectively apply the rules:

### Step 1: Initialize Workspace Boundaries
Create the following boundary files in the root of your project:
- `.geminiignore`
- `.cursorignore`
- `.claudeignore`
- `.codexignore`
- `.openaiignore`

Copy the contents of the official [ignore.template](skills/finops-zones/templates/ignore.template) into each of these files. These boundaries exclude lockfiles, build folders, minified bundles, and heavy media assets from being ingested by your coding agents, cutting standard context bloat by **up to 70%**.

### Step 2: Establish Agent System Guidelines
Download or create the following workspace guides to ensure your developer agents enforce zone rules:

- **[HYBRID_RUNTIME_SPEC.md](HYBRID_RUNTIME_SPEC.md)**: The core standard document establishing rules, keywords, and anti-corruption policies.
- **[AGENTS.md](AGENTS.md)**: The master agent protocol.
- **[CLAUDE.md](CLAUDE.md)**: Enforces zone routing policies for Claude Code.
- **[GEMINI.md](GEMINI.md)**: Enforces zone routing policies for Antigravity.
- **[.cursorrules](.cursorrules)**: Enforces zone routing policies for Cursor IDE.

---

## 🔍 Verification

To verify that your installation has succeeded, run a few simple checks in your terminal with your agent:

1. **Verify Zone 3 (Caveman):**
   ```bash
   [GIT] status
   ```
   *Expected: The response should be extremely terse (1-3 lines).*

2. **Verify Zone 2 (Hybrid):**
   Ask the agent a general question:
   > "Explain what the open-closed principle means in SOLID."
   *Expected: A clear, concise, professional explanation without unnecessary preambles.*

3. **Verify Zone 1 (Premium):**
   ```bash
   [PLAN] Design a multi-tenant user authentication workflow
   ```
   *Expected: Full detailed storyboard structure including user actions, database states, and visual changes.*

---

## 📖 Detailed Guides
- Windows users: See the detailed [Windows Installation Guide](docs/install-windows.md) for execution policies and environment configuration.
