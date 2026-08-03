# Arabic Speech Recognition System

> A multi-phase speech project taken from raw audio collection through to an HTTP-served model.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat-square&logo=fastapi&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

> **Team project.** My contribution is described in [Contribution](#contribution) below; the full
> breakdown is in `docs/Team-Task-Sheet`.

---

## Problem Statement

Build an Arabic speech recognition system end to end — not just a model, but the data pipeline
feeding it and the service exposing it.

Arabic speech carries the same difficulties as Arabic text plus the acoustic ones: significant
dialectal variation, phonemes with no English equivalent, and far less available labelled training
data than English enjoys.

## Project Phases

### Phase 1 — Data Collection & Preparation
- Arabic speech and text-to-speech corpus assembly from raw sources
- Transcript alignment and cleaning
- Output: a structured, model-ready dataset (`final_tts_arabic_data.csv`)

### Phase 2 — Model Development
- Audio feature extraction and preprocessing
- Neural architecture design and training

### Phase 3 — Evaluation
- Held-out evaluation with per-epoch timing instrumentation
- Error analysis over the recognition output

### Phase 4 — Deployment
- FastAPI service wrapping the trained model
- Endpoint testing so the model is reachable over HTTP rather than only from a notebook

## Key Features

- Complete pipeline from raw audio to served endpoint
- Arabic-specific transcript handling and normalisation
- Structured, documented dataset output as a reusable artifact
- Training-time instrumentation (per-epoch timing) alongside accuracy
- FastAPI deployment layer with tested endpoints
- Full written report and stakeholder presentation

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Audio | Audio preprocessing and feature extraction |
| Serving | FastAPI |
| Data | pandas, NumPy |
| Docs | Report, presentation, team task sheet |

## Team Project

This was built by a team. The work shown here is the shared team output — the deliverables we
produced together — rather than any one person's contribution carved out after the fact.

Teammates' individually-submitted notebooks have been excluded from this repository. The per-phase
breakdown of who did what is recorded in `docs/team-task-sheet.docx`.

## How to Run

**Training / evaluation**

```bash
pip install tensorflow pandas numpy librosa
jupyter notebook notebooks/
```

**Serving**

```bash
pip install fastapi uvicorn
uvicorn app:app --reload
# → http://127.0.0.1:8000/docs
```

## What I Learned

**Data preparation was the majority of the project.** Assembling and aligning an Arabic speech
corpus took substantially longer than training anything on it. For lower-resource languages, the
dataset *is* the contribution — the modelling is comparatively standard.

**A model behind an API is a different artifact than a model in a notebook.** Serving forces
decisions a notebook lets you defer: input validation, error responses, what happens on malformed
audio, how the model gets loaded once instead of per request. That gap between "it works in the
notebook" and "it works as a service" was the most useful thing this project taught me.

**Timing instrumentation belongs next to accuracy.** Recording per-epoch duration alongside loss
made the cost of each architectural change visible immediately, instead of discovering three days
in that a change had tripled training time for a marginal gain.

---

*Course: Speech Recognition · Final Project · Team project*

[← Back to Computer Vision & Speech](../README.md)
