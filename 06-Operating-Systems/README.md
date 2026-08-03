# 05 — Operating Systems

Implementations of the scheduling and memory-management algorithms that sit underneath every
program, plus a technical study of a real operating system written entirely in assembly.

Each algorithm suite is instrumented rather than just implemented — the point isn't that FCFS
works, it's that you can see exactly where it starves long-waiting processes compared to Round
Robin on the same input.

---

## Projects

### [CPU Scheduling Algorithms](cpu-scheduling-algorithms/)
First Come First Served, Shortest Job First, and Round Robin, each computing waiting time,
turnaround time, and throughput. Run against identical process sets to make the fairness/efficiency
trade-off concrete.

`Python`

### [Disk Scheduling Algorithms](disk-scheduling-algorithms/)
SCAN, C-SCAN, F-SCAN, and N-SCAN head-movement algorithms with total seek-distance accounting.

`Python`

### [Page Replacement Algorithms](page-replacement-algorithms/)
Page-replacement strategies with fault counting across varying frame allocations — including the
frame-count sweep that reveals Bélády's anomaly where it occurs.

`Python`

### [MenuetOS Architecture Analysis](menuetos-architecture-analysis/)
A four-part technical study of MenuetOS, an operating system written entirely in x86 assembly that
fits on a single floppy disk. Covers memory management, deadlock handling, file-system design, and
the system-call interface.

`Technical writing` `x86 Assembly` `OS internals`

---

## Skills Demonstrated

- Scheduling algorithm implementation and performance instrumentation
- Comparative analysis under identical workloads
- Memory management: paging, frame allocation, replacement policy
- Disk I/O optimisation and seek-time modelling
- Reading and documenting a real OS codebase
- Technical writing for a systems audience

---

[← Back to portfolio root](../README.md)
