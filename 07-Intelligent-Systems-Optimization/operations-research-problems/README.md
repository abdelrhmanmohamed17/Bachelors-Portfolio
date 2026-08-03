# Operations Research Problem Sets

> Constrained optimization and resource allocation — the mathematics underneath scheduling,
> logistics, and planning.

![Optimization](https://img.shields.io/badge/Linear_Programming-2E7D32?style=flat-square)

---

## Overview

Worked problem sets covering the core operations research toolkit. These are analytical solutions
rather than code, included because the formulation skill — turning a described situation into
variables, an objective, and constraints — transfers directly to any optimization work.

## Topics Covered

### Linear Programming
- Formulating decision variables, objective functions, and constraint sets from problem statements
- Graphical solution for two-variable problems
- Simplex method for the general case
- Feasible region analysis and identifying unbounded or infeasible formulations

### Duality
- Constructing the dual of a primal problem
- Interpreting dual variables as shadow prices — the marginal value of relaxing a constraint

### Transportation & Assignment Problems
- Supply/demand balancing
- Initial feasible solutions (northwest corner, least cost)
- Optimality testing and improvement
- Hungarian method for assignment

### Sensitivity Analysis
- How far a coefficient can move before the optimal basis changes
- Constraint-relaxation impact on the objective value

## Contents

```
operations-research-problems/
├── README.md
└── docs/
    ├── assignment-1.pdf
    ├── assignment-2.pdf
    └── worked-solutions.pdf
```

## Key Skills Demonstrated

- Translating verbal problem descriptions into formal mathematical programs
- Simplex algorithm execution and tableau interpretation
- Duality theory and economic interpretation of dual variables
- Transportation and assignment algorithm application
- Sensitivity analysis and robustness assessment of an optimal solution

## What I Learned

**Formulation is the hard part.** Once a problem is correctly expressed as variables, an objective,
and constraints, solving it is mechanical — a solver will do it. Deciding what the variables *are*
is where the judgement lives, and it's the skill that carries over to ML problems as much as to
logistics.

**Shadow prices are the most useful output.** The optimal value answers "what should I do." The
dual variables answer "what would it be worth to change the situation" — which is usually the more
actionable question.

**LP formulation generalises further than expected.** Recognising a problem as a transportation or
assignment problem, once you've seen a few, applies to scheduling, matching, and resource
allocation situations that look nothing alike on the surface.

---

*Course: Operations Research*

[← Back to Intelligent Systems](../README.md)
