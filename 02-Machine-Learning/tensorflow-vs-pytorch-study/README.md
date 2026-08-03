# TensorFlow vs. PyTorch — Comparative Framework Study

> The same two applications, built natively in both frameworks. Not a blog-post comparison — a
> working-code one.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=flat-square&logo=pytorch&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Framework comparisons are usually written from secondary sources, and they age badly. The only way
to say something reliable about the difference between TensorFlow and PyTorch is to build the same
thing twice.

Two applications were chosen to cover different architectural territory:

1. **Shakespeare character-level text generator** — a sequence model with a custom training loop,
   stateful generation, and sampling
2. **Movie recommender** — an embedding-based model over sparse user/item interaction data

## Approach

Four implementations, structured for direct comparison:

| Application | TensorFlow | PyTorch |
|---|---|---|
| Shakespeare text generation | `shakespeareTensorFlow.ipynb` | `ShakesparePytorch.ipynb` |
| Movie recommender | `movieTensorFlow.ipynb` | `moviesPytorch.ipynb` |

Each pair uses the same data, the same architecture, and the same hyperparameters — so the only
difference on show is the framework's API.

**Dimensions compared**
- Training loop verbosity — Keras `fit()` vs. an explicit PyTorch loop
- Model definition style — declarative `Sequential` vs. imperative `nn.Module`
- Debugging experience — graph execution vs. eager execution
- GPU utilisation and device placement ergonomics
- Data pipeline construction — `tf.data` vs. `Dataset`/`DataLoader`

## Key Features

- Four complete, independently runnable implementations
- Controlled comparison: same data, architecture, and hyperparameters across frameworks
- Two problem types (sequence generation, recommendation) to avoid conclusions that only hold for
  one architecture class
- GPU verification and device-placement handling in both frameworks
- Written analysis grounded in the code rather than in documentation claims

## Technologies

| Framework | Components used |
|---|---|
| TensorFlow | Keras Sequential/Functional API, `tf.data`, `model.fit()`, callbacks |
| PyTorch | `nn.Module`, `DataLoader`, manual training loop, `optim`, `.to(device)` |

## How to Run

```bash
pip install tensorflow torch numpy pandas matplotlib
jupyter notebook notebooks/
```

Each of the four notebooks runs independently. GPU strongly recommended for the text generation
pair.

## What I Learned

**PyTorch's explicit training loop is a feature, not friction.** Writing `zero_grad()`,
`backward()`, `step()` by hand every time feels verbose until something goes wrong — at which point
you can put a breakpoint in the middle of it. Keras `fit()` is faster to write and harder to see
inside.

**The frameworks have converged more than the discourse suggests.** With eager execution as
TensorFlow's default and Keras available as a high-level PyTorch-adjacent option, the "static vs.
dynamic graph" distinction that defined the comparison a few years ago barely applies. Building
both is what showed that; reading about it would not have.

**Recommenders are where the data pipeline matters more than the model.** Both implementations
spent most of their complexity budget on sparse interaction handling, not on the network — and
`tf.data` and `DataLoader` solve that problem in noticeably different styles.

---

*Course: AI Platforms & Frameworks · Final Project*

[← Back to Machine Learning](../README.md)
