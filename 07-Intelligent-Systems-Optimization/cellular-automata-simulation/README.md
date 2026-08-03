# Cellular Automata Simulation

> Complex global behaviour from purely local rules.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=flat-square)

---

## Problem Statement

A cellular automaton is a grid of cells, each in one of a small number of states, updated
simultaneously according to a rule that looks *only* at a cell's immediate neighbours.

There is no global coordination, no central controller, and no memory beyond the current state. And
yet the patterns that emerge — gliders, oscillators, structures that persist and travel — are
nowhere in the rule. That gap between local simplicity and global complexity is the entire point.

## Approach

**Grid representation**
- 2D NumPy array holding cell states
- Configurable dimensions and initial configuration (random seeding or hand-placed patterns)

**Update rule**
- Neighbourhood counting per cell
- State transition applied from the rule table
- **Simultaneous update** — the next generation computed entirely from the current one, never
  in place. Updating cells one at a time gives a different and wrong automaton.

**Visualization**
- Generation-by-generation state rendering with Matplotlib
- Evolution over time made visible as a sequence

## Key Features

- Vectorised neighbour counting via NumPy rather than nested loops
- Correct simultaneous-update semantics using a separate next-state buffer
- Configurable grid size, initial density, and generation count
- Per-generation visualization of the evolving state

## Technologies

Python 3, NumPy, Matplotlib.

## How to Run

```bash
pip install numpy matplotlib
jupyter notebook "Cellular Automata.ipynb"
```

Set grid dimensions and initial configuration in the setup cell, then run the evolution loop.

## What I Learned

**Simultaneous update is a correctness requirement, not a style choice.** My first implementation
updated the grid in place, so cells later in the iteration saw their neighbours' *new* states. It
produced plausible-looking output for a completely different automaton — the most instructive bug
in the project, because nothing crashed.

**Emergence is real and slightly unsettling.** Nothing in a three-line neighbour rule mentions
gliders, and gliders appear anyway. It's the clearest small-scale demonstration of why complex
systems resist reduction to their components.

**Vectorisation transforms what's explorable.** Nested Python loops over the grid made anything
beyond a small board unusably slow. NumPy's shifted-array neighbour counting made large grids over
many generations interactive — and being able to iterate quickly is what makes exploration
possible at all.

---

*Course: Smart Systems*

[← Back to Intelligent Systems](../README.md)
