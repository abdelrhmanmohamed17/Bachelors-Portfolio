# Regression & Classification Portfolio

> Linear regression forecasting and clinical classification, with exploratory analysis driving
> every modelling decision.

![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-150458?style=flat-square&logo=pandas&logoColor=white)
![Seaborn](https://img.shields.io/badge/Seaborn-4C72B0?style=flat-square)

---

## Problem Statement

Three connected problems covering the two fundamental supervised learning tasks:

1. **Regression** — forecast shampoo sales from historical time-series data
2. **Classification** — predict heart disease presence from clinical measurements
3. **Model selection** — compare logistic regression against Naive Bayes on the same
   classification task and justify the choice with evidence

## Approach

### Part 1 — Sales Forecasting (Regression)

- Exploratory analysis of the time series: trend, seasonality, outliers
- Train/test split respecting temporal ordering
- `LinearRegression` fitted on the training window
- **Mean Squared Error** evaluation on the held-out period
- Predicted-vs-actual plotted to inspect *where* the model fails, not just how much

### Part 2 — Heart Disease Classification

- Exploratory data analysis over clinical tabular features
- Correlation heatmap (Seaborn) to identify redundant and predictive features before modelling
- Distribution inspection per feature, split by target class
- Train/test split with classification metrics on the holdout

### Part 3 — Model Comparison

- Logistic regression and Naive Bayes trained on identical splits
- Accuracy compared, with the independence assumption examined against the observed feature
  correlations

## Key Features

- EDA before modelling, not after — correlation structure informed feature selection
- Temporally-aware splitting for the time-series task
- Appropriate metrics per task type (MSE for regression, accuracy for classification)
- Head-to-head model comparison rather than a single default choice
- Residual and predicted-vs-actual visualisation

## Technologies

| Layer | Tools |
|---|---|
| ML | scikit-learn (`LinearRegression`, `LogisticRegression`, `GaussianNB`, `metrics`) |
| Data | pandas, NumPy |
| Visualization | Matplotlib, Seaborn |

## Datasets

- `data/shampoo_sales.csv` — monthly shampoo sales time series
- `data/Heart.csv` — clinical heart disease dataset

Both are small enough to be committed and are included for reproducibility.

## How to Run

```bash
pip install scikit-learn pandas numpy matplotlib seaborn
jupyter notebook notebooks/
```

Three notebooks, one per question, runnable independently.

## What I Learned

**The correlation heatmap did the feature selection.** Two clinical features were strongly
correlated with each other and only one added predictive value — visible in thirty seconds of
looking at a heatmap, and invisible from accuracy numbers alone.

**MSE hides where the error lives.** A single MSE value gave no indication that the model was
accurate mid-series and badly off at the trend endpoints. Plotting predicted against actual made
the failure mode obvious immediately.

**Naive Bayes' independence assumption is checkable.** Rather than accepting or dismissing it, the
correlation matrix from the EDA showed exactly which features violated it and by how much — turning
a textbook caveat into a measurable property of this dataset.

---

*Course: Machine Learning · Project*

[← Back to Machine Learning](../README.md)
