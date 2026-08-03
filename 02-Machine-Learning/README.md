# 01 — Machine Learning

Classical machine learning: regression, classification, model selection, and the evaluation
methodology that decides which model actually wins.

The common theme in this category is *comparison over commitment*. Each project sets up at least
two candidate approaches on the same data and lets the metrics decide, rather than reaching for a
default model.

---

## Projects

### [Regression & Classification Portfolio](regression-classification-portfolio/)
Linear regression forecasting on time-series sales data, plus a heart-disease classifier over
clinical tabular data — with exploratory analysis and correlation visualization driving feature
selection.

`scikit-learn` `pandas` `Seaborn` `Matplotlib`

### [TensorFlow vs. PyTorch Study](tensorflow-vs-pytorch-study/)
The same two applications — a Shakespeare character-level text generator and a movie recommender —
implemented natively in both frameworks, then compared on API ergonomics, training-loop verbosity,
and GPU utilisation.

`TensorFlow` `PyTorch`

### [Sentiment Analysis with Learned Embeddings](sentiment-analysis-embeddings/)
Sentiment classifiers over combined Amazon, IMDb, and Yelp labelled-sentence corpora, with learned
word vectors exported to the TensorFlow Embedding Projector for visual inspection of
positive/negative clustering.

`TensorFlow` `Embedding Projector`

---

## Skills Demonstrated

- Supervised learning: linear regression, logistic regression, Naive Bayes
- Exploratory data analysis and correlation-driven feature selection
- Train/test splitting and holdout evaluation design
- Metrics: MSE for regression, accuracy/precision/recall for classification
- Word embedding training and dimensionality visualization
- Cross-framework implementation and comparative benchmarking

---

[← Back to portfolio root](../README.md)
