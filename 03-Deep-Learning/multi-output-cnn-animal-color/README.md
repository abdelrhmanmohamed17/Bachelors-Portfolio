# Multi-Output CNN — Simultaneous Animal & Colour Classification

> A single convolutional network with two output heads that predicts animal class **and** coat
> colour from one forward pass.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=flat-square&logo=opencv&logoColor=white)

---

## Problem Statement

Most image classifiers answer one question. Real applications usually need several answers about
the same image, and running a separate network per question wastes the fact that they share almost
all their visual features — edges, textures, and shapes are useful for identifying *what* an
animal is and *what colour* it is.

The objective was to build one shared convolutional encoder feeding two independent classification
heads, and to measure what that sharing costs each task compared to what it saves in compute.

## Approach

```
Input image
     │
     ▼
┌─────────────────────┐
│  Shared conv stack  │   Conv2D → MaxPool → BatchNorm → Dropout
│  (feature encoder)  │   ×N blocks
└─────────┬───────────┘
          │
    ┌─────┴──────┐
    ▼            ▼
┌────────┐  ┌─────────┐
│dog_cat │  │  color  │   two independent dense heads
│  head  │  │  head   │   with separate losses
└────────┘  └─────────┘
```

Both heads are trained jointly against a combined loss, so gradients from the colour task also
shape the shared encoder — which turns out to help one task and not the other.

## Results

| Task | Test Accuracy | Test Loss | Converged by |
|---|---|---|---|
| **Colour classification** | **98.85%** | 0.094 | Epoch 3 |
| **Dog/cat classification** | **79.22%** | 1.099 | Epoch 10 (still improving) |

Trained for 10 epochs over ~6,656 training images (208 batches) with a held-out validation split
and a separate test set (60 batches).

### What the gap tells us

Colour is a low-level feature — it survives in the earliest convolutional layers and needs almost
no depth to separate. The network had it solved by epoch 3 at 95.5% and spent the remaining seven
epochs polishing.

Animal identity is a high-level semantic feature. It sat near chance (54%) for the first four
epochs while the shared encoder was still being pulled toward colour-discriminative filters, then
climbed steadily to 88% training accuracy once the colour loss flattened and stopped dominating
the gradient.

The training curves show the two losses trading off directly — `color_loss` dropping from 1.85 to
0.03 while `dog_cat_loss` barely moves from 5.03 to 0.31. That's the multi-task cost, made visible.

## Key Features

- Shared convolutional feature extractor with batch normalization and dropout
- Two independent dense classification heads with separate named losses and metrics
- Per-task loss and accuracy tracking throughout training
- Combined loss weighting across tasks
- Training/validation curve plotting for both heads on the same axes
- Held-out test-set evaluation reported per task

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Architecture | Conv2D, MaxPooling2D, BatchNormalization, Dropout, Dense |
| Preprocessing | OpenCV, ImageDataGenerator |
| Analysis | NumPy, Matplotlib |

## How to Run

```bash
pip install tensorflow opencv-python numpy matplotlib
jupyter notebook deep-project.ipynb
```

Run cells top to bottom. Training takes roughly 3 minutes on a GPU (13s/epoch) or considerably
longer on CPU. Update the dataset path in the loading cell before running.

## What I Learned

**Multi-task learning isn't free.** The intuition that "the tasks share features so they'll help
each other" only holds when the tasks need features at a similar level of abstraction. Here the
easy task actively slowed the hard one down by dominating the shared encoder's gradient early in
training.

**Loss weighting matters more than architecture.** The obvious fix — down-weighting `color_loss`
once it converges, or using uncertainty-based task weighting — would likely have closed most of
the dog/cat gap without touching the network. That's the change I'd make first if I revisited this.

**Per-task instrumentation is non-negotiable.** A single combined accuracy number would have shown
a respectable ~89% average and hidden the fact that one head was barely working. Naming each loss
and metric separately in Keras is a one-line change that made the whole diagnosis possible.

---

*Course: Deep Learning · Year 3 · Team project — see [Team Task Sheet](docs/) for contribution
breakdown*

[← Back to Deep Learning](../README.md)
