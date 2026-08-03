# Control Systems Laboratory Series

> Modelling physical plants as transfer functions, then designing controllers that keep them
> stable.

![MATLAB](https://img.shields.io/badge/MATLAB-0076A8?style=flat-square&logo=mathworks&logoColor=white)

---

## Problem Statement

Control theory answers a question machine learning mostly doesn't: given a physical system with
dynamics, how do you drive it to a desired state *and guarantee* it won't oscillate or diverge?

This lab series covers the modelling and analysis pipeline — from physical plant to transfer
function to stability assessment to digital implementation.

## Labs

### Lab 1 — Transfer Function Modelling
- Deriving transfer functions from differential equations describing the physical system
- Pole and zero computation and their physical interpretation
- Step and impulse response characterisation

### Lab 2 — Stability & Root Locus
- Root locus construction as gain varies
- Stability boundaries — where poles cross into the right half-plane
- Gain selection for a target damping ratio and settling time

### Ball & Beam System
The canonical unstable-plant example: a ball rolling on a beam whose angle is the control input.

- Plant model derivation from the system dynamics
- Open-loop instability demonstrated — the ball rolls off without active control
- Closed-loop controller design and response analysis

### Discretization — Zero-Order Hold
- Continuous-to-discrete conversion for digital implementation
- Sampling rate selection and its effect on stability margins
- The gap between the continuous design and what a digital controller actually delivers

## Repository Contents

```
matlab-control-systems-labs/
├── README.md
└── src/
    ├── lab1-assignment.m
    ├── lab2-assignment.m
    ├── ball-and-beam.m
    ├── roots.m
    └── zoh.m
```

## Key Skills Demonstrated

- Transfer function derivation from physical models
- Pole/zero analysis and stability assessment
- Root locus construction and gain selection
- Time-domain response characterisation (rise time, overshoot, settling time)
- Continuous-to-discrete conversion and sampling rate selection
- MATLAB Control System Toolbox

## How to Run

```matlab
% MATLAB with Control System Toolbox
run('src/lab1-assignment.m')
```

Each script is self-contained and generates its own plots.

## What I Learned

**An unstable plant is a genuinely different problem.** The ball-and-beam system doesn't drift away
from setpoint — it actively diverges without control. Feedback isn't improving performance there;
it's the only thing making the system function at all.

**Root locus makes gain selection visual.** Watching poles trace paths across the complex plane as
gain increases, and seeing exactly where they cross into instability, converts a set of algebraic
conditions into something you can point at.

**Discretization is not free.** A controller that's stable in continuous time can be unstable once
sampled at too low a rate. The zero-order hold introduces phase lag that eats stability margin —
which is why the sampling rate is a control design decision, not an implementation detail.

---

*Course: Modern Control · Lab series*

[← Back to Embedded & Control Systems](../README.md)
