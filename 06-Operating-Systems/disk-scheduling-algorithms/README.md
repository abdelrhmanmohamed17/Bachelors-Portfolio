# Disk Scheduling Algorithms

> SCAN, C-SCAN, F-SCAN, and N-SCAN — minimising head movement across a request queue.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

On a mechanical disk, seek time dominates I/O latency, and seek time is a function of how far the
head physically travels. The scheduling algorithm choosing the service order for pending requests
therefore directly determines throughput.

This project implements four elevator-family algorithms and accounts for total head movement in
each.

## Algorithms Implemented

### SCAN (Elevator)
The head sweeps toward one end servicing everything in its path, then reverses.

- Bounded worst-case wait — no request waits more than two sweeps
- **Non-uniform wait times**: cylinders just behind the head wait almost a full round trip

### C-SCAN (Circular SCAN)
Sweeps in one direction only, then jumps back to the start without servicing on the return.

- **Uniform wait times** — every cylinder is treated identically
- Costs one full-disk seek per cycle to buy that uniformity

### F-SCAN (Frozen SCAN)
Uses two queues: one being serviced (frozen), one accumulating new arrivals.

- **Prevents arm stickiness** — a stream of requests near the head can't indefinitely delay distant
  ones
- Requests arriving mid-sweep wait for the next sweep by construction

### N-SCAN (N-step SCAN)
Services requests in batches of N, with arrivals during a batch deferred to the following one.

- Bounds worst-case wait by the batch size
- N is a direct throughput-vs-fairness dial

## Metrics Computed

- Total head movement (cylinders traversed)
- Service order trace
- Per-request wait, measured in head movements

## Key Features

- Four algorithms over an identical request queue and starting head position
- Total seek-distance accounting for direct comparison
- Service order printed so the sweep pattern is visible
- Configurable start position and direction

## Technologies

Pure Python 3 — standard library only.

## How to Run

```bash
jupyter notebook notebooks/disk-scheduling.ipynb
```

Set the request queue, initial head position, and disk size at the top. All four algorithms run
against the same configuration.

## What I Learned

**C-SCAN pays real seeks for fairness.** The return jump is pure overhead in total-distance terms
and C-SCAN still wins in practice, because predictable latency is worth more than raw throughput to
most workloads. Optimising the obvious metric would have picked the wrong algorithm.

**F-SCAN and N-SCAN exist because SCAN has a starvation hole.** A steady stream of requests near
the current head position can keep the arm local indefinitely. Freezing the queue is a strikingly
simple fix for it.

**These algorithms are historical on SSDs.** With no moving head, seek distance is meaningless and
NVMe queuing replaces the whole model. Worth knowing both that the elevator algorithms exist and
that they solve a problem modern hardware doesn't have.

---

*Course: Operating Systems*

[← Back to Operating Systems](../README.md)
