# CIFAR-10 & CIFAR-100 Convolutional Classifiers

> The same architecture on both benchmarks — measuring what happens when label granularity
> increases tenfold.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=flat-square&logo=opencv&logoColor=white)

---

## Problem Statement

CIFAR-10 and CIFAR-100 contain the same 60,000 images at the same 32×32 resolution. The only
difference is that CIFAR-100 splits them into 100 classes instead of 10 — roughly 500 training
examples per class instead of 5,000.

Running one architecture across both isolates a single variable: how much does a classifier
degrade when each class has a tenth of the data and the decision boundaries get ten times finer?

## Approach

**Shared pipeline**
- Dataset loading via `tensorflow.keras.datasets`
- OpenCV-based preprocessing and normalisation
- Identical convolutional architecture for both tasks, differing only in output layer size

**Architecture**
- Convolutional layers for hierarchical feature extraction
- Flatten transition to the classification head
- Fully connected layers → softmax over the class count (10 or 100)
- Compiled with categorical cross-entropy and accuracy tracking

**Evaluation**
- Held-out test-set evaluation for both variants
- Training and validation curves compared across the two tasks

## Key Features

- Single architecture applied to two benchmarks for controlled comparison
- OpenCV preprocessing integrated into a Keras training pipeline
- Explicit separation of feature-extraction and classification stages
- Test-set evaluation reported independently of validation

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Preprocessing | OpenCV, NumPy |
| Datasets | CIFAR-10, CIFAR-100 |

## How to Run

```bash
pip install tensorflow opencv-python numpy matplotlib
jupyter notebook notebooks/cifar-classifiers.ipynb
```

Both datasets download automatically on first run via `keras.datasets` — no manual setup.

## What I Learned

**Class count and data-per-class move together, and they compound.** CIFAR-100 isn't "ten times
harder" — it's harder because the boundaries are finer *and* because there's a tenth of the
evidence for each one. Separating those two effects would need a controlled subsample of CIFAR-10,
which is the experiment I'd run next.

**A fixed architecture doesn't scale across task difficulty.** The network that comfortably fits
CIFAR-10 is underpowered for CIFAR-100 — the same capacity has to carve out ten times as many
regions. Capacity should scale with the task, not be inherited from the last project.

**OpenCV and Keras compose better than expected.** Doing preprocessing in OpenCV and training in
Keras kept each stage readable, at the cost of having to be careful about channel ordering
(OpenCV's BGR vs. Keras's RGB assumption) — a bug worth encountering once.

---

*Course: Deep Learning · Assignment 2*

[← Back to Deep Learning](../README.md)
