# Sentiment Analysis with Learned Embeddings

> Training word vectors on review text, then looking at them.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Classify short product and service reviews as positive or negative, and — more interestingly —
inspect what the model's embedding layer actually learned about the vocabulary.

Sentiment accuracy is a well-worn benchmark. The part worth the effort is exporting the learned
vectors and confirming visually that the model organised its vocabulary along a
positive/negative axis without ever being told that such an axis exists.

## Approach

**Data**

Combined labelled-sentence corpora from three sources, deliberately chosen for domain variety:

| Source | Domain |
|---|---|
| Amazon | Product reviews |
| IMDb | Film reviews |
| Yelp | Restaurant and business reviews |

Merging them tests whether sentiment signal generalises across domains or whether the model latches
onto domain-specific vocabulary.

**Pipeline**
- Text tokenization and sequence padding
- Embedding layer trained from scratch on this corpus
- Classification head over the pooled embeddings
- Held-out evaluation

**Embedding inspection**
- Learned vectors exported to `vecs.tsv`
- Corresponding vocabulary exported to `meta.tsv`
- Both loaded into the [TensorFlow Embedding Projector](https://projector.tensorflow.org/) for
  interactive dimensionality-reduced visualisation

## Key Features

- Multi-domain corpus combination to test cross-domain generalisation
- Embeddings learned on-corpus rather than imported pretrained
- Vector and metadata export in Embedding Projector TSV format
- Visual verification of positive/negative term clustering
- Nearest-neighbour inspection of individual sentiment-bearing words

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Architecture | Embedding → pooling → Dense |
| Visualization | TensorFlow Embedding Projector |
| Data | pandas, NumPy |

## Datasets

`data/sentiment_labelled_sentences/` — the UCI Sentiment Labelled Sentences dataset (Amazon, IMDb,
Yelp), included with its original `readme.txt` attribution.

## How to Run

```bash
pip install tensorflow pandas numpy
jupyter notebook notebooks/sentiment-analysis.ipynb
```

**To view the embeddings:**
1. Open [projector.tensorflow.org](https://projector.tensorflow.org/)
2. Click **Load**
3. Upload `outputs/vecs.tsv` as vectors and `outputs/meta.tsv` as metadata

## What I Learned

**The embedding space separates sentiment without supervision on the vocabulary.** The model was
only ever told whether a *sentence* was positive. It arranged individual *words* into positive and
negative regions on its own — the clearest demonstration I've seen of a network learning structure
nobody specified.

**Visualising embeddings is a debugging tool, not a demo.** Words sitting in the wrong cluster
pointed directly at preprocessing bugs — negation handling in particular, since "not good" is a
problem that unigram embeddings simply cannot represent.

**Combining domains dilutes domain-specific signal.** Terms that are strongly positive in
restaurant reviews are neutral in film reviews. The merged model is more robust and less sharp than
any single-domain model would be — a trade-off worth making consciously rather than by accident.

---

*Course: AI Platforms & Frameworks · Assignment series*

[← Back to Machine Learning](../README.md)
