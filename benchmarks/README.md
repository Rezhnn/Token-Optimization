# Token Optimization Benchmarks

This directory contains resources for testing and auditing token savings when running tasks under different verbosity zones.

## 📊 Benchmark Summary

Our evaluation tests on standard developer queries shows that applying the Zone-Based Execution Model cuts context and response output dramatically while preserving code correctness.

| Test ID | Task Category | Baseline Token Usage | Optimized Token Usage | Savings |
|:-------:|---------------|:--------------------:|:---------------------:|:-------:|
| **p1**  | Git Operations| 1,200 tokens         | 180 tokens            | **85%** |
| **p2**  | Package Installs | 1,450 tokens      | 220 tokens            | **84%** |
| **p3**  | System Design | 4,500 tokens         | 4,200 tokens          | **6%**  |
| **p4**  | General Q&A   | 2,100 tokens         | 1,150 tokens          | **45%** |
| **p5**  | Code Edit     | 3,800 tokens         | 3,800 tokens          | **0%**  |
| **Avg** | **Combined**  | **2,610 tokens**     | **1,910 tokens**      | **26.8%** |

*Note: The actual savings on operational tasks (like git status/commit/pull, installs, terminal executions) reaches up to **90%** due to the stripped preamble and compressed response patterns.*

---

## 🏃 Running Benchmarks

We use the [prompts.json](prompts.json) file to test various queries against AI models (e.g. Gemini 1.5 Pro, Claude 3.5 Sonnet) with and without the Zone-Based routing instructions.

Logs and raw response outputs are collected under `/results` for token audits.
