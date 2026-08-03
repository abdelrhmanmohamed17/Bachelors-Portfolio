# Order & Inventory Management System — Full Systems Analysis

> The complete structured-analysis package for a system: requirements, process models, data models,
> project plan, and interface design.

![Visio](https://img.shields.io/badge/Microsoft_Visio-3955A3?style=flat-square&logo=microsoft&logoColor=white)
![Project](https://img.shields.io/badge/Microsoft_Project-31752F?style=flat-square&logo=microsoft&logoColor=white)
![Adobe XD](https://img.shields.io/badge/Adobe_XD-FF61F6?style=flat-square&logo=adobexd&logoColor=white)

> **Team project.** See [Contribution](#contribution).

---

## Problem Statement

Analyse and specify an order and inventory management system covering purchasing, product
catalogue, order processing, and transaction tracking — producing the full documentation set a
development team would need before writing any code.

No implementation. That's the point: this is the discipline of understanding a problem completely
before solving it, which is where most software projects actually fail.

## Deliverables

### 1. Requirements
- **Project charter** — scope, objectives, stakeholders, success criteria
- **Requirements questionnaire** — the structured instrument used to elicit needs from stakeholders
- **Scope diagram** — explicit system boundary

### 2. Process Modelling (Data Flow Diagrams)
- **Context diagram** — the system as a single process with external entities
- **Zero-level DFD** — decomposition into major processes
- **Child diagrams** — further decomposition of purchasing management and transaction tracking

Built in Microsoft Visio, maintaining balance between levels — every flow entering a parent process
appears in its child.

### 3. Data Modelling
- **ER diagram — product database** — entities, relationships, cardinalities
- **ER diagram — order database**
- Built in Visio with an Adobe XD companion for the interface layer

### 4. Data Dictionaries
Formal definitions for every element in the DFDs:
- Data flow dictionary — composition of each flow
- Data store dictionary — structure of each store
- Three data-flow definitions and data-store specifications, fully documented

### 5. Project Planning (Microsoft Project)
- **Work breakdown structure** — hierarchical task decomposition
- **Gantt chart** — schedule with dependencies and durations
- **PERT network** — two diagrams, with critical path identified
- **Re-baselined schedule** — task identification and Gantt chart shown both before and after the
  analysis phase was added, quantifying the schedule impact of a scope change

### 6. Interface Design
UI screens designed in Adobe XD (three screens plus the source `.xd` file).

### 7. Communication
- Two stakeholder presentations
- Final consolidated report

## Team Project

This was a team deliverable. Everything here is the shared output of the group — the analysis
package we produced together — rather than any individual's portion separated out afterwards.

## Repository Contents

```
order-inventory-system-analysis/
├── README.md
├── docs/
│   ├── project-charter.pdf
│   ├── final-report.pdf
│   ├── data-flow-dictionaries.pdf
│   ├── presentation-1.pdf
│   └── presentation-2.pdf
├── diagrams/
│   ├── context-diagram.jpg
│   ├── zero-level-diagram.jpg
│   ├── child-diagram.jpg
│   ├── managing-purchasing.jpg
│   ├── tracking-transactions.png
│   ├── er-product-database.png
│   ├── er-order-database.png
│   ├── work-breakdown-structure.jpg
│   ├── gantt-chart.png
│   ├── pert-diagram-1.png
│   ├── pert-diagram-2.png
│   └── source/                  ← .vsdx, .vsd, .mpp, .xd originals
└── screens/
    ├── screen-1.png
    ├── screen-2.png
    └── screen-3.png
```

## Key Skills Demonstrated

- Structured systems analysis across all DFD levels with maintained balancing
- Entity-relationship modelling with correct cardinality
- Formal data dictionary construction
- Requirements elicitation instrument design
- WBS decomposition, Gantt scheduling, PERT critical-path analysis
- Schedule re-baselining and change-impact quantification
- UI prototyping
- Stakeholder communication

## What I Learned

**The data dictionary is where hand-waving dies.** A DFD can look complete while its flows mean
nothing precise. Being forced to define the exact composition of every flow and store surfaced
several places where our diagram had a label and no actual agreement behind it.

**Re-baselining makes scope creep measurable.** Producing the Gantt chart before and after adding
the analysis phase turned "this will take a bit longer" into a specific number of days on the
critical path. That's the artifact that makes a schedule conversation with a stakeholder possible.

**Analysis without implementation is uncomfortable and valuable.** The instinct is to start
building. Spending the whole project on understanding instead made it obvious how much of what we'd
have built in week one would have been wrong.

---

*Course: System Analysis & Design · Term project · Team project*

[← Back to Software Engineering](../README.md)
