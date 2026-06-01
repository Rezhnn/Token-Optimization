# Token Optimization Benchmarks

This directory contains benchmark fixtures for future testing of token savings under different verbosity zones.

## Current Status

No automated benchmark runner is included yet. The prompt set in [prompts.json](prompts.json) is real, but the repository does not currently execute those prompts, count tokens, or regenerate [results/results.json](results/results.json).

The current result file is therefore a placeholder record, not measured proof. Do not cite it as validated savings.

## Required Benchmark Methodology

A production-grade benchmark runner should:

- run each prompt with and without the zone-routing instructions,
- record provider, model, date, and prompt version,
- count input, output, and total tokens,
- write machine-readable results to `results/results.json`,
- keep raw outputs or summaries in a reproducible audit folder.

## Prompt Fixtures

The current prompt set covers:

- Git operations
- Package installs
- System design
- General Q&A
- Code edits

These are useful fixtures, but they are not a benchmark by themselves.
