# `NeuroEvoBench` Analysis & Experiment Configs 🐢

This repository contains visualization results, EO configurations and logs for testing the performance of evolutionary strategies in [`evosax`](https://github.com/RobertTLange/evosax/) and [`EvoJAX`](https://github.com/google/evojax).

## Notebook Overview

- `analysis/01_agg_rliable.ipynb`: Aggregated performance plot - figure 1.
- `analysis/02_lcurves.ipynb`: Detailed learning curves for all problems.
- `analysis/03_tuning.ipynb`: Hyperparameter sensitivity across tuning budgets.

## Configuration Overview

In `configs` we provide configurations (task-specific) for all sweep experiments using the `mle-infrastructure` in order to orchestrate parameter sweeps and multi-seed evaluations.