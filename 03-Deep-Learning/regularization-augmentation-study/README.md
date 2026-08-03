# Regularization & Data Augmentation Ablation Study

> Four overfitting remedies, one base network, one variable at a time.

![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Every deep learning course lists the same fixes for overfitting: L1, L2, dropout, more data. What
none of them say is which one to reach for first, or how much each actually buys you on a given
problem.

This study holds the network, data, and training budget constant and varies only the regularization
technique, measuring each one's effect on the train/validation gap.

## Approach

**Data pipeline**
- Images loaded from raw PNG files with `imageio`, indexed by a CSV label file
- Random sampling for visual inspection before training
- `train_test_split` for the validation holdout

**Base network**
- Sequential Keras model with dense layers
- Fixed architecture, fixed epoch budget, fixed optimiser across all conditions

**Conditions tested**

| Condition | Mechanism |
|---|---|
| Baseline | No regularization — establishes the overfitting reference |
| L1 | Weight penalty via `keras.regularizers`, drives sparsity |
| L2 | Weight penalty, shrinks weights smoothly |
| Dropout | Random unit deactivation during training |
| Data augmentation | Synthetic training variation |

Each condition's training and validation curves were recorded and compared against the baseline
gap.

## Key Features

- Genuine ablation design — one variable changed per run
- Custom image-loading pipeline from PNG files and a CSV index
- Reproducibility controls (fixed random seed) so runs are comparable
- Train/validation gap tracked explicitly as the outcome metric, not just final accuracy

## Technologies

| Layer | Tools |
|---|---|
| Framework | Keras, TensorFlow |
| Data handling | pandas, NumPy, imageio |
| Splitting & metrics | scikit-learn |
| Visualization | Matplotlib |

## How to Run

```bash
pip install tensorflow scikit-learn pandas numpy imageio matplotlib
jupyter notebook notebooks/regularization-study.ipynb
```

Point `DATA_DIR` at your image folder and `LABELS_CSV` at the label index before running.

## What I Learned

**Data augmentation beat every weight penalty.** Adding variation to the input distribution
addressed the actual problem — not enough diverse examples — while L1 and L2 only constrained the
model's response to the examples it had. When you can augment, augment first.

**Dropout and L2 overlap more than they stack.** Applying both didn't compound the way I expected;
past a point they were fighting for the same reduction in effective capacity.

**Ablations need seeds.** My first few comparison runs were dominated by initialisation noise, and
I nearly drew a conclusion from it. Fixing the random seed turned a set of suggestive-looking
curves into an actual result.

---

*Course: Deep Learning · Section work*

[← Back to Deep Learning](../README.md)
