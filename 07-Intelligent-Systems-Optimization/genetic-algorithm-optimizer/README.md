# Genetic Algorithm Optimizer

> Evolutionary search for problems where you can't compute a gradient.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)

---

## Problem Statement

Gradient descent needs a differentiable objective. Plenty of real optimization problems aren't —
discrete search spaces, combinatorial constraints, black-box simulators, or objectives with no
closed form at all.

Genetic algorithms sidestep this entirely: they only need to be able to *score* a candidate
solution, never to differentiate it.

## Approach

```
Initialise random population
        │
        ▼  ┌──────── generation loop ────────┐
   evaluate fitness                          │
        ▼                                    │
   selection      pick parents, weighted     │
                  by fitness                 │
        ▼                                    │
   crossover      recombine parent genomes   │
        ▼                                    │
   mutation       random perturbation to     │
                  maintain diversity         │
        ▼                                    │
   new population                            │
        │                                    │
        └──── converged / max gens? ── no ───┘
                    │ yes
                    ▼
             Best individual
```

## Components Implemented

### Representation
Candidate solutions encoded as chromosomes suitable for the problem's search space.

### Fitness Function
Scores each individual. This is the only place the problem enters the algorithm — everything else
is domain-independent, which is what makes GAs so reusable.

### Selection
Parent choice weighted by fitness. The tuning knob here is *selection pressure*: too strong and the
population converges prematurely on a local optimum, too weak and it never converges at all.

### Crossover
Recombines two parents into offspring, on the premise that good partial solutions can be usefully
combined.

### Mutation
Random perturbation. The mutation rate is the exploration/exploitation dial — the mechanism that
lets the population escape a local optimum.

## Key Features

- All genetic operators implemented from scratch
- Configurable population size, mutation rate, and generation count
- Best-fitness-per-generation tracking to visualise convergence
- Elitism option to preserve the best individual across generations

## Technologies

Python 3, NumPy.

## How to Run

```bash
pip install numpy matplotlib
python "genetic-algorithm.py"
```

Edit the fitness function and encoding at the top of the file to apply it to a different problem.

## What I Learned

**Mutation rate is the whole algorithm's temperament.** Too low and the population converges early
onto whatever local optimum it stumbled into. Too high and it's a random search with extra steps.
The useful band is narrower than expected and problem-specific.

**Selection pressure and diversity are in direct tension.** Aggressively favouring the fittest
individuals accelerates convergence and destroys the genetic variety needed to keep improving.
Watching population diversity collapse over generations made the trade-off concrete.

**GAs are slow and that's often fine.** Orders of magnitude more function evaluations than a
gradient method — irrelevant when the alternative is that no gradient exists. Knowing when a method
is *the only option* matters as much as knowing when it's the best one.

---

*Course: Smart Systems · Assignment 1*

[← Back to Intelligent Systems](../README.md)
