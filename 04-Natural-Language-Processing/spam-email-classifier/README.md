# Spam Email Classifier — 97.2% Accuracy

> A hand-built preprocessing chain feeding a Naive Bayes classifier, wrapped in a desktop GUI.

![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)
![NLTK](https://img.shields.io/badge/NLTK-154F5B?style=flat-square)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Classify email messages as spam or legitimate. Spam detection is the canonical Naive Bayes
application — the "naive" independence assumption between words is obviously false, and the
classifier works extremely well anyway, which makes it a good place to learn why that happens.

The additional objective was to build the preprocessing chain by hand rather than calling a single
vectoriser, so each transformation's contribution is visible.

## Results

**97.24% classification accuracy** on the held-out test set.

## Approach

```
Raw email text
      │
      ▼  regex cleaning        strip non-alphabetic characters, normalise case
      ▼  tokenization          NLTK word_tokenize
      ▼  stop-word removal     drop high-frequency, low-signal terms
      ▼  Porter stemming       collapse "winning"/"wins"/"win" → "win"
      ▼  CountVectorizer       bag-of-words feature matrix
      ▼
Multinomial Naive Bayes → spam / not spam
```

Each stage was added incrementally and its effect on accuracy measured, rather than applying the
whole chain at once.

## Key Features

- Full preprocessing chain built stage by stage: regex → tokenize → stop words → stemming
- Bag-of-words vectorization with `CountVectorizer`
- Multinomial Naive Bayes — the appropriate variant for count-based features
- Stratified train/test split with held-out accuracy evaluation
- **Tkinter desktop GUI** for scoring arbitrary messages live, with a message box verdict

## Technologies

| Layer | Tools |
|---|---|
| ML | scikit-learn (`MultinomialNB`, `CountVectorizer`, `train_test_split`) |
| Text processing | NLTK (`word_tokenize`, `stopwords`, `PorterStemmer`), Python `re` |
| Data | pandas |
| Interface | Tkinter |

## How to Run

```bash
pip install scikit-learn nltk pandas
python -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"
jupyter notebook notebooks/spam-classifier.ipynb
```

Run all cells; the final cell launches the Tkinter window. Type or paste a message and click
**Classify**.

## What I Learned

**Stemming did more than stop-word removal.** Collapsing morphological variants onto a shared stem
consolidated the evidence for genuinely spam-indicative terms across their surface forms. Stop-word
removal mostly just shrank the feature matrix.

**Naive Bayes' wrong assumption doesn't matter here.** Words in an email are obviously not
independent. The classifier still hits 97% because for a *decision boundary* you only need the
relative ordering of class probabilities to be right, not their absolute values. That distinction
between calibration and classification stuck with me.

**A GUI changes how you evaluate a model.** Typing my own test messages into the Tkinter window
surfaced failure modes — short messages, unusual formatting — that the test-set accuracy number had
completely hidden.

---

*Course: Natural Language Processing*

[← Back to NLP](../README.md)
