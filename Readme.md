# `NeuroEvoBench` Analysis & Experiment Configs 🐢

This repository contains visualization results, Evolutionary Optimization (EO) configurations and logs for testing the performance of evolutionary strategies in [`evosax`](https://github.com/RobertTLange/evosax/) and [`EvoJAX`](https://github.com/google/evojax).

## Downloading experiment data (lcurves & search history)

All of the search histories, multi-seed re-evaluations and grid sweeps are stored in a Google Cloud Storage bucket. If you would like to benchmark against the 10 EO methods, please download the data here:

```
gsutil -m -q cp -r gs://neuroevobench/ experiments/
```

Afterwards, there should be a new directory in your working directory `experiments` with the following task-specific subdirectories.

You are now ready to recreate the paper figures by following the notebooks listed below.

## Figure notebook overview

- [`analysis/01_agg_rliable.ipynb`](analysis/01_agg_rliable.ipynb): Aggregated performance plot - figure 1.
- [`analysis/02_lcurves.ipynb`](analysis/02_lcurves.ipynb): Detailed learning curves for all problems - figure 2.
- [`analysis/03_tuning.ipynb`](analysis/03_tuning.ipynb): Hyperparameter sensitivity across tuning budgets - figure 3.
- [`analysis/04_noise_resource.ipynb`](analysis/04_noise_resource.ipynb): Resource allocation (Population versus MC rollouts) - figure 4.
- [`analysis/05_opt_decay_trafo.ipynb`](analysis/05_opt_decay_trafo.ipynb): Grid sweep GD optimizer, mean decay, fitness trafo - figure 5.
- [`analysis/06_scaling.ipynb`](analysis/06_scaling.ipynb): Population vs model size scaling - figure 6.
- [`analysis/07_best_config.ipynb`](analysis/07_best_config.ipynb): Extract best configuration from search results.

## Running the experiment sweeps

In `configs` we provide configurations (task-specific) for all sweep experiments using the `mle-infrastructure` in order to orchestrate parameter sweeps and multi-seed evaluations. In general, each task requires you to sequentially run the random search tuning and then the tuned multi-seed evaluation. E.g. for the `fetch` task you can do as follows:

```
mle run configs/fetch/search.yaml -p Random Search Fetch
mle run configs/fetch/eval.yaml -p Evaluation Fetch
```

Additionally, the grid sweeps can be executed using their specific configs, e.g.:

```
mle run configs/fetch/eval_scaling -p Population v model Fetch
```