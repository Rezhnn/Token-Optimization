# FinOps Token Optimization (Zone-Based Execution Model)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Supported Tools](https://img.shields.io/badge/Agents-Antigravity%20%7C%20Claude%20Code%20%7C%20Cursor%20%7C%20Codex-blueviolet)](INSTALL.md)

An instruction-first FinOps setup for AI coding workspaces. It installs aligned ignore boundaries and workspace routing rules so agents avoid unnecessary context, keep terminal work terse, and preserve full quality for code and planning work.

This repository mirrors the global setup installed on the maintainer's device for four primary tools: Antigravity, Codex, Cursor, and Claude Code. It does not modify model pricing, model behavior internally, or provider quota systems. The benefit comes from reducing avoidable context ingestion and from making agent output rules explicit.

---

## Quick Install

Run the appropriate command in the root of the project you want to equip:

### macOS / Linux / WSL (Bash)
```bash
curl -fsSL https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.ps1 | iex
```

The scripts write workspace files into the current project. The rules are usable immediately by tools that read those workspace instruction files. They are not a global installer and do not install a background service.

For step-by-step manual setup, see [INSTALL.md](INSTALL.md).

---

## Installed Capability Model

The public repo follows the same capability shape as the installed global setup:

| Tool | Installed workspace surface | Purpose |
| --- | --- | --- |
| Antigravity | `GEMINI.md`, `.geminiignore` | Gemini/Antigravity instructions and shared ignore boundary |
| Codex | `AGENTS.md`, `.codexignore`, `.openaiignore` | Codex workspace instructions and OpenAI/Codex ignore boundaries |
| Cursor | `.cursorrules`, `.cursorignore` | Cursor rules and ignore boundary |
| Claude Code | `CLAUDE.md`, `.claudeignore` | Claude Code instructions and ignore boundary |

All five ignore files use the same template:

- `.geminiignore`
- `.cursorignore`
- `.claudeignore`
- `.codexignore`
- `.openaiignore`

---

## The Four-Zone Model

The zone system is an instruction contract. It relies on the active agent reading and following the workspace rules.

![Hybrid Runtime Zone Routing Flowchart](assets/hybrid_zone_routing_flow.svg)

| Zone | Label | Main Purpose | Style / Grammar | Token Budget |
|:---:|:---:|---|---|:---:|
| **0** | **Sacred** | Source files, comments, docstrings, and docs writes. | Full standard programming prose. Clean Code, SOLID, KISS, DRY. | **Unconstrained** |
| **1** | **Premium** | Architecture, UI/UX, planning, PRDs, reviews, and client-facing docs. | Full depth, structured markdown, Mermaid when useful. | **High** |
| **2** | **Hybrid** | Reviews, debugging, explanations, comparisons, and general Q&A. | Compress internal analysis; keep final output professional. | **Medium** |
| **3** | **Caveman** | Terminal, git, package operations, and quick queries. | Terse operational output with minimal preamble. | **Minimal** |

Priority order:

```text
Zone 0 > Zone 1 > Zone 2 > Zone 3
```

Explicit tags such as `[PLAN]`, `[ARCH]`, `[CMD]`, `[GIT]`, `[PKG]`, `[QUICK]`, and overrides such as `!verbose`, `!code`, and `!fast` guide routing before default logic runs.

---

## Benchmark Status

This repo does not currently include an automated benchmark runner. The files under `benchmarks/` are sample prompts and a placeholder result record for future measurement work.

Do not cite the benchmark numbers as verified production results until a runner exists that:

- executes the sample prompts,
- records model and date metadata,
- counts baseline and routed token usage,
- writes reproducible output to `benchmarks/results/results.json`.

See [benchmarks/README.md](benchmarks/README.md) for the current benchmark status.

---

## Supported Agentic Tools

Primary supported tools:

- Antigravity
- Codex
- Cursor
- Claude Code

The setup is portable to other tools that honor workspace instruction files and ignore boundaries, but this repo only claims direct support for the four tools above.

---

## Key Contributors & Sources

This project is built upon the following works and local setup references:

1. [JuliusBrussee](https://github.com/JuliusBrussee): original [caveman](https://github.com/JuliusBrussee/caveman) concept and terse syntax inspiration.
2. Maintainer's global `geminiignore-finops` skill and hybrid runtime rules installed for Antigravity, Codex, Cursor, and Claude Code.
3. Public agent documentation patterns for workspace instruction files and ignore boundaries.

---

## Star History

Track the community growth and engagement of this repository:

[![Star History Chart](https://api.star-history.com/svg?repos=Rezhnn/Token-Optimization&type=Date)](https://star-history.com/#Rezhnn/Token-Optimization&Date)

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
