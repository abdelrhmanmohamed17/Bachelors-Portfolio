# Page Replacement Algorithms

> Which page to evict when memory is full — and the frame-count sweep that reveals Bélády's
> anomaly.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

When a process references a page not resident in physical memory, the OS must evict something to
make room. The eviction policy determines the page-fault rate, and page faults are orders of
magnitude more expensive than any other operation in the path.

This project implements the classic replacement policies and counts faults across varying frame
allocations.

## Algorithms Implemented

### FIFO
Evict the page that arrived first.

- Trivial to implement — a queue
- Ignores usage entirely: a heavily-used page still gets evicted on schedule
- **Exhibits Bélády's anomaly** — more frames can produce *more* faults

### Optimal (OPT / Bélády's)
Evict the page whose next use is furthest in the future.

- Provably minimal fault count
- **Unimplementable** — requires knowledge of the future reference string
- Serves as the theoretical lower bound every real policy is measured against

### LRU (Least Recently Used)
Evict the page unused for the longest time.

- Approximates OPT using recency as a proxy for future use
- Stack algorithm — immune to Bélády's anomaly
- Expensive in hardware: exact LRU needs a timestamp or update on every reference

## Metrics Computed

- Total page faults per algorithm
- Fault rate as a proportion of references
- Frame contents traced at each step
- Fault count as a function of frame allocation

## Key Features

- Multiple policies over an identical reference string
- **Frame-count sweep** — the experiment that exposes Bélády's anomaly in FIFO
- Step-by-step frame-content tracing showing exactly what was evicted and why
- Comparison against the OPT lower bound to quantify how much each practical policy leaves on the
  table

## Technologies

Pure Python 3 — standard library only.

## How to Run

```bash
jupyter notebook notebooks/page-replacement.ipynb
```

Set the reference string and frame count at the top. The sweep cell varies frame count
automatically and plots fault count against it.

## What I Learned

**Bélády's anomaly is genuinely counterintuitive until you watch it happen.** Adding memory making
performance *worse* sounds impossible. Seeing the specific reference string where FIFO's eviction
order shifts just enough to lose a page it's about to need made it click in a way the proof didn't.

**OPT's value is as a measuring stick.** You can't run it, but knowing the theoretical minimum
turns "LRU got 40 faults" into "LRU got 40 against a floor of 31" — which is the number that
actually tells you whether the policy is good.

**LRU is expensive for reasons the pseudocode hides.** The Python implementation is a few lines.
Doing it in hardware means updating metadata on *every single memory reference*, which is why real
systems use clock and second-chance approximations instead.

---

*Course: Operating Systems*

[← Back to Operating Systems](../README.md)
