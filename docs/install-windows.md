# Windows Installation Guide — FinOps Token Optimization

Installing the Zone-Based Execution Model on Windows can be done with a single PowerShell command. This guide outlines how to handle execution policies, configure environment parameters, and manually set up system paths if needed.

---

## 🚀 One-Line PowerShell Installation

Open your PowerShell terminal (run as Administrator if needed to modify execution policies), navigate to your project root, and execute:

```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

### 🛑 Troubleshooting "Execution Policy" Errors
If PowerShell displays an error regarding execution policies (e.g., `Scripts are disabled on this system`), you can temporarily bypass this constraint for the current session:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

Or run the script with a bypass argument:
```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex"
```

---

## 🛠️ Manual Installation on Windows

If your corporate environment or firewall blocks direct script downloads:

1. **Download the Repository:** Clone the repository locally:
   ```cmd
   git clone https://github.com/Rezhnn/Token-Optimization.git
   ```
2. **Copy the Configuration Files:** Copy all the `.ignore` files and core markdown guides from the cloned repository into your active project's root folder:
   - `HYBRID_RUNTIME_SPEC.md`
   - `AGENTS.md`
   - `CLAUDE.md`
   - `GEMINI.md`
   - `.cursorrules`
   - `.geminiignore` / `.cursorignore` / `.claudeignore` / `.codexignore` / `.openaiignore`

---

## 🔍 Verification

Validate that everything is configured properly by initiating an agent request:
```powershell
[CMD] Echo "Active"
```
*Expected output: The agent should run the command and output in a minimal format (Zone 3).*
