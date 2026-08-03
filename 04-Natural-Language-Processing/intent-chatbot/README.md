# Intent-Based Conversational Agent

> An LSTM intent classifier with a Tkinter chat interface — built after a Naive Bayes baseline
> proved the neural version was worth it.

![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white)
![NLTK](https://img.shields.io/badge/NLTK-154F5B?style=flat-square)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)

---

## Problem Statement

Build a conversational agent that maps free-text user input to a predefined intent and returns an
appropriate response.

The design question was whether a sequence model is justified. Intent classification over short
utterances is a task where bag-of-words often does fine — so this project builds the simple version
first and only escalates once there's evidence.

## Approach

**Phase 1 — Naive Bayes baseline**
- JSON intent corpus loaded and flattened into (pattern, intent) pairs
- `CountVectorizer` + `MultinomialNB`
- `LabelEncoder` for intent targets
- Established the accuracy floor any neural model had to beat

**Phase 2 — LSTM classifier**

```
User utterance
      │
      ▼  lemmatization (WordNetLemmatizer)
      ▼  tokenization + sequence padding
      ▼
┌──────────────────────────┐
│  Embedding               │
│  LSTM                    │
│  LayerNormalization      │
│  Dropout                 │
│  Dense → softmax         │
└──────────┬───────────────┘
           ▼
    Predicted intent
           ▼
    Random sample from that intent's response pool
```

Trained with `EarlyStopping` on validation loss so the epoch count didn't need guessing.

**Phase 3 — Interface**
- Tkinter window with `scrolledtext` conversation history
- Enter-to-send, auto-scroll, visually distinguished user and bot turns

## Key Features

- Baseline-first methodology — simple model built and measured before the complex one
- JSON-driven intent corpus, so new intents need no code changes
- Lemmatization rather than stemming, preserving real words for a smaller, cleaner vocabulary
- `LayerNormalization` and dropout for training stability
- `EarlyStopping` to prevent overfitting on a small corpus
- Response sampling — multiple responses per intent so the bot doesn't repeat itself verbatim
- Scrolling Tkinter chat GUI

## Technologies

| Layer | Tools |
|---|---|
| Framework | TensorFlow, Keras |
| Architecture | Embedding → LSTM → LayerNorm → Dropout → Dense |
| Text processing | NLTK (`WordNetLemmatizer`), Keras `Tokenizer` |
| Baseline | scikit-learn (`MultinomialNB`, `CountVectorizer`) |
| Interface | Tkinter (`scrolledtext`) |
| Data | JSON intent corpus, pandas |

## How to Run

```bash
pip install tensorflow nltk scikit-learn pandas numpy
python -c "import nltk; nltk.download('wordnet'); nltk.download('punkt')"
jupyter notebook notebooks/chatbot.ipynb
```

Place your `intents.json` in `data/` and update the path in the loading cell. The final cell opens
the chat window.

### Intent corpus format

```json
{
  "intents": [
    {
      "tag": "greeting",
      "patterns": ["Hi", "Hello", "Hey there"],
      "responses": ["Hello!", "Hi, how can I help?"]
    }
  ]
}
```

## What I Learned

**The baseline was closer than expected.** Naive Bayes on a small intent corpus performs
respectably, because intent patterns are short and keyword-driven — exactly the regime where
bag-of-words is sufficient. The LSTM's advantage only appears with longer, more varied phrasings
than the corpus contained. Building the baseline first is what made that visible, instead of
assuming the neural model was earning its complexity.

**Early stopping is essential on small corpora.** With a few hundred training patterns, the LSTM
memorised the training set within a handful of epochs. `EarlyStopping` on validation loss was the
difference between a working bot and one that only recognised exact input matches.

**Response sampling matters more than accuracy for perceived quality.** Pulling a random response
from the matched intent's pool made the bot feel dramatically less robotic — a UX change, not a
modelling one, and it improved the demo more than any accuracy gain did.

---

*Course: Natural Language Processing*

[← Back to NLP](../README.md)
