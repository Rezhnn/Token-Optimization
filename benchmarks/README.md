# Token Optimization Benchmarks

This directory contains resources for testing and auditing token savings when running tasks under different verbosity zones.

## Benchmark Summary

The current snapshot in `results/results.json` reports 26.8% average savings and 84.5% operational savings on the sample fixture set. When you refresh the harness, use the current official model families referenced in the main README: GPT-5.5 or GPT-5.4, and Gemini 3 Flash or Gemini 3 Pro preview.

| Test ID | Task Category | Baseline Token Usage | Optimized Token Usage | Savings |
|:-------:|---------------|:--------------------:|:---------------------:|:-------:|
| **p1**  | Git Operations | 1,200 tokens | 180 tokens | **85%** |
| **p2**  | Package Installs | 1,450 tokens | 220 tokens | **84%** |
| **p3**  | System Design | 4,500 tokens | 4,200 tokens | **6%** |
| **p4**  | General Q&A | 2,100 tokens | 1,150 tokens | **45%** |
| **p5**  | Code Edit | 3,800 tokens | 3,800 tokens | **0%** |
| **Avg** | **Combined** | **2,610 tokens** | **1,910 tokens** | **26.8%** |

*Operational tasks still tend to show the strongest savings because the routing rules strip preambles and compress terminal responses.*

## Running Benchmarks

Use the [prompts.json](prompts.json) file to test the standard query set against the current model families and compare results with and without the zone routing instructions.

Logs and raw response outputs are collected under `/results` for token audits.
