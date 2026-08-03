# Arabic News Category Classification — Bidirectional LSTM

> End-to-end Arabic text classification, including the preprocessing pipeline that English-first
> NLP libraries don't give you.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![NLTK](https://img.shields.io/badge/NLTK-154F5B?style=flat-square)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Classify Arabic news articles into their subject categories (politics, sports, economy, and so on).

The modelling half of this is standard sequence classification. The hard half is that Arabic needs
preprocessing that no off-the-shelf pipeline provides:

- **Diacritics** (تَشْكِيل) are optional in written Arabic, so the same word appears in multiple
  orthographic forms that a tokenizer treats as distinct vocabulary entries
- **Stop words** aren't in most default NLTK corpora with usable coverage
- **Emoji and punctuation** mixed into news text inflate the vocabulary with noise
- Arabic is morphologically rich — a single root generates many surface forms

Without handling these, the vocabulary fragments and the embedding layer learns almost nothing
useful.

## Approach

```
Raw Arabic articles
        │
        ▼
┌───────────────────────────┐
│  Custom cleaning pipeline │
│  · strip diacritics (regex)│
│  · remove punctuation      │
│  · filter emoji            │
│  · remove Arabic stop words│
└───────────┬───────────────┘
            ▼
      Tokenization  (Keras Tokenizer, capped vocabulary)
            ▼
      Sequence padding  (uniform length)
            ▼
┌───────────────────────────┐
│  Embedding layer          │  learned Arabic word vectors
│         ↓                 │
│  Bidirectional LSTM       │  context from both directions
│         ↓                 │
│  Dense + softmax          │  one unit per category
└───────────┬───────────────┘
            ▼
      Predicted category → mapped back to Arabic label
```

Bidirectional was the right call here: in Arabic news headlines the disambiguating term often
appears *after* the ambiguous one, so a forward-only LSTM sees the ambiguity without the
resolution.

## Key Features

- **Custom Arabic normalisation** — regex-based diacritic stripping, punctuation and emoji
  filtering, Arabic stop-word removal
- **Bidirectional LSTM** capturing context from both directions of the sequence
- **Learned embeddings** trained on the corpus rather than imported from an English-centric
  pretrained set
- **Label encoding round-trip** — `LabelEncoder` for training, plus an inverse mapping dictionary
  so predictions come back as readable Arabic category names
- **Interactive inference** — a prediction function accepting free-text Arabic input

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Architecture | Embedding → Bidirectional LSTM → Dense (softmax) |
| Text processing | NLTK, Python `re`, `string` |
| Encoding | `LabelEncoder`, `Tokenizer`, `pad_sequences` |
| Data | pandas, NumPy |

## How to Run

```bash
pip install tensorflow nltk pandas numpy
python -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"
jupyter notebook notebooks/arabic-news-category.ipynb
```

Update the dataset path in the loading cell. Run cells sequentially; the final cell prompts for
Arabic news text and prints the predicted category.

## What I Learned

**Preprocessing was the whole project.** The model architecture is textbook — an embedding, a
BiLSTM, a softmax. Every hour that actually mattered went into the cleaning function. Before
diacritic stripping, the tokenizer was producing multiple vocabulary entries for the same word and
the embedding layer had no chance.

**Most NLP tooling assumes English.** NLTK's stop-word support for Arabic is thin, tokenizers
assume left-to-right whitespace-delimited words, and almost every tutorial's preprocessing steps
are subtly wrong for Arabic. Working in a non-English language forces you to understand what each
step is actually for rather than copying it.

**Bidirectional context earns its cost on short text.** Headlines and ledes are short enough that
the extra parameters don't overfit, and the disambiguating word is frequently at the end. On longer
documents the trade-off would likely go the other way.

---

*Course: Natural Language Processing · Project*

[← Back to NLP](../README.md)
