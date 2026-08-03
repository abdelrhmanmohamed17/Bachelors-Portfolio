# CPU Scheduling Algorithms

> FCFS, SJF, and Round Robin — implemented, instrumented, and run against identical process sets.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

A CPU scheduler decides which of several ready processes runs next. Every choice trades something
away — throughput against fairness, average wait against worst-case wait — and the trade-off is
much easier to see in numbers than in prose.

This project implements three classic schedulers and measures all of them on the same input.

## Algorithms Implemented

### First Come First Served (FCFS)
Non-preemptive, processes served in arrival order.

- **Simple** — a FIFO queue, nothing more
- **Convoy effect** — one long process at the front delays everything behind it
- Average waiting time is highly sensitive to arrival order

### Shortest Job First (SJF)
Non-preemptive, shortest burst time selected next.

- **Provably optimal** for minimum average waiting time
- **Starvation** — long processes may never run if short ones keep arriving
- Requires burst time to be known in advance, which in practice it isn't

### Round Robin (RR)
Preemptive, each process gets a fixed time quantum.

- **Fair** — every process makes progress, bounded response time
- **Quantum-sensitive** — too large degenerates to FCFS, too small drowns in context-switch overhead
- The only one of the three suitable for interactive systems

## Metrics Computed

For every algorithm, per process and averaged:

| Metric | Definition |
|---|---|
| Waiting time | Time spent in the ready queue |
| Turnaround time | Completion time − arrival time |
| Response time | First CPU allocation − arrival time |
| Throughput | Processes completed per unit time |

## Key Features

- Three algorithms sharing an identical process-set input, so results are directly comparable
- Per-process and aggregate metric reporting
- Configurable time quantum for Round Robin, enabling a sensitivity sweep
- Execution-order output making the convoy effect and starvation visible in the trace itself

## Technologies

Pure Python 3 — standard library only.

## How to Run

```bash
jupyter notebook notebooks/
```

Three notebooks (`fcfs.ipynb`, `sjf.ipynb`, `round-robin.ipynb`). Define your process set as
`(process_id, arrival_time, burst_time)` tuples at the top of each.

## What I Learned

**SJF's optimality is real but useless alone.** It genuinely minimises average waiting time — and
it needs burst times you can't know in advance, and it starves long processes. Optimal on one
metric while unusable in practice is a pattern that shows up constantly.

**The Round Robin quantum is the whole algorithm.** Sweeping it from very small to very large walks
continuously from "pure overhead" to "this is just FCFS." Nothing made the design space clearer
than watching that transition in the numbers.

**Averages hide starvation.** SJF posts the best average waiting time while individual long
processes wait indefinitely. Reporting only the mean would have made the worst algorithm for
interactive use look like the best one.

---

*Course: Operating Systems*

[← Back to Operating Systems](../README.md)
