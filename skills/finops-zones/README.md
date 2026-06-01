# finops-zones — Skill README

**Version:** 2.0.0 | **Author:** [Rezhnn](https://github.com/Rezhnn) | **Category:** Token Optimization

---

## What It Does

Installs the Zone-Based Execution Model into your AI coding agent, routing every request to one of four verbosity zones based on task type. The agent stays sharp on code, stays terse on git ops, and stays full-depth on architecture — automatically.

**Typical savings: 60–90% on operational tasks.**

---

## Zone Summary

| Zone | Name    | Trigger                              | Grammar Style     | Token Budget   |
|:----:|---------|--------------------------------------|-------------------|:------------:|
| 0    | Sacred  | Any code file write                  | Full standard     | Unconstrained |
| 1    | Premium | `[PLAN]`, `[ARCH]`, architecture kw  | Full verbose      | High          |
| 2    | Hybrid  | Default (no trigger)                 | Compressed think, proper output | Medium |
| 3    | Caveman | `[CMD]`, `[GIT]`, `$`, `!fast`       | Ultra-terse       | Minimal       |

---

## Usage

Once installed, just prefix your messages:
```
[PLAN] design the user auth flow for my SaaS
[GIT] commit all changes with a good message
[ARCH] draw the microservices architecture
$ npm install
[QUICK] what does useEffect do?
```

Or use force overrides at any point:
```
!verbose   → forces full Zone 1 depth this response
!fast      → forces Zone 3 compression this response
!code      → forces Zone 0 code quality this response
```

---

## Installation

See the [main INSTALL.md](../../INSTALL.md) for full OS-specific guides.

Quick install (macOS/Linux/WSL):
```bash
curl -fsSL https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.sh | bash
```

Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```
