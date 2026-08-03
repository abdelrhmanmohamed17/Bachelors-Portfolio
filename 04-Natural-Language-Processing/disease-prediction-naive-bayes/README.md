# Symptom-Based Disease Prediction Tool

> A Gaussian Naive Bayes classifier over categorical symptom data, delivered as a desktop
> application.

![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## ⚠️ Disclaimer

This is a coursework project built to practise classification over categorical medical data. It is
**not** a diagnostic tool, has not been clinically validated, and must not be used for any real
medical decision. Consult a qualified healthcare professional.

---

## Problem Statement

Given a set of reported symptoms, predict the most likely associated condition from a labelled
dataset.

The technical interest is in the data rather than the model: symptom datasets are almost entirely
categorical, frequently incomplete, and imbalanced across conditions — which makes preprocessing
the substance of the work.

## Approach

**Data preparation**
- Categorical symptom columns mapped to numeric encodings
- Missing values handled explicitly rather than dropped, preserving rows with partial symptom
  reports
- Feature/target separation with the condition label as target
- `train_test_split` for held-out evaluation

**Model**
- Gaussian Naive Bayes over the encoded feature space
- Class-conditional independence assumption evaluated against the observed symptom correlations

**Interface**
- Tkinter form with symptom input fields
- Prediction returned via a message box

## Key Features

- Explicit categorical encoding with a documented mapping
- Missing-value strategy that retains partial records
- Held-out evaluation rather than training accuracy
- Tkinter desktop GUI for interactive use

## Technologies

| Layer | Tools |
|---|---|
| ML | scikit-learn (`GaussianNB`, `train_test_split`) |
| Data | pandas |
| Interface | Tkinter |

## How to Run

```bash
pip install scikit-learn pandas
jupyter notebook notebooks/disease-prediction.ipynb
```

Update the dataset path in the loading cell. The final cell launches the GUI.

## What I Learned

**Gaussian Naive Bayes is the wrong variant for this data.** `GaussianNB` assumes continuous,
normally distributed features — but encoded categorical symptoms are neither. `CategoricalNB` or
`BernoulliNB` would be the correct choice, and revisiting this is the first change I'd make. It's a
good example of a model that runs, produces plausible numbers, and is still built on a violated
assumption.

**Missing values carry information in medical data.** An unreported symptom isn't necessarily an
absent one. Dropping incomplete rows would have discarded a meaningful fraction of the dataset and
biased it toward thoroughly documented cases.

**Accuracy is the wrong headline metric for imbalanced clinical data.** With uneven condition
frequencies, a classifier can score well while failing entirely on rare conditions — which are
usually the ones that matter. Per-class recall would be the metric to report.

---

*Course: Natural Language Processing / Machine Learning*

[← Back to NLP](../README.md)
