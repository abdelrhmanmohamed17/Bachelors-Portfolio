# MNIST Digit Recognition — Neural Network from First Principles

> Forward and backward propagation implemented by hand. No `model.fit()`.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=flat-square&logo=pytorch&logoColor=white)

---

## Problem Statement

Frameworks make it possible to train a network without understanding what happens between
`compile()` and `fit()`. This project deliberately removes that abstraction: build an MNIST
handwritten-digit classifier where every gradient is computed explicitly.

The secondary objective was a systematic sweep — vary activation function, hidden-layer width, and
learning rate, and document how each combination converges.

## Approach

**Data**
- MNIST handwritten digit dataset (60,000 training images, 28×28 grayscale)
- Loaded from CSV, normalised to `[0, 1]`, reshaped to flat input vectors

**Network**
- Fully connected feedforward architecture
- Manual weight and bias initialisation
- Forward pass computed layer by layer
- Loss computed explicitly
- Backward pass deriving gradients through the chain rule by hand
- Parameter updates via gradient descent

**Experimental sweep**

| Variable | Values explored |
|---|---|
| Activation function | Sigmoid, ReLU, tanh |
| Hidden layer size | Multiple widths |
| Learning rate | Multiple magnitudes |

Each configuration was trained under identical conditions and its convergence curve recorded.

## Key Features

- Complete manual implementation of forward and backward propagation
- Explicit gradient derivation — no autodiff
- Systematic hyperparameter sweep across three dimensions
- Learning curves plotted for every configuration
- Step-by-step documented reasoning for each stage of the pipeline
- A PyTorch implementation alongside for comparison against the manual version

## Technologies

| Layer | Tools |
|---|---|
| Core implementation | NumPy |
| Comparison implementation | PyTorch |
| Data | MNIST (CSV format) |
| Analysis | Matplotlib |

## How to Run

```bash
pip install numpy matplotlib torch pandas
jupyter notebook notebooks/mnist-from-scratch.ipynb
```

The MNIST CSV is not committed (size). Download `mnist_train.csv` from
[Kaggle](https://www.kaggle.com/datasets/oddrationale/mnist-in-csv) and place it in `data/`.

## What I Learned

**Backpropagation is just the chain rule, applied carefully.** Deriving it by hand once removed
the mystery permanently. Every framework's autodiff is doing exactly this, and knowing that makes
debugging a broken training run much less superstitious.

**Learning rate dominates everything else.** Across the whole sweep, the difference between a good
and a bad learning rate was larger than the difference between any two activation functions. That
reordered my priorities for every project since.

**Sigmoid saturates and you can see it.** With sigmoid activations and deeper configurations, the
learning curves visibly flatten — gradients vanishing in real time. Reading about vanishing
gradients and watching a loss curve go horizontal are different kinds of understanding.

---

*Course: Neural Networks · Project 1*

[← Back to Deep Learning](../README.md)
