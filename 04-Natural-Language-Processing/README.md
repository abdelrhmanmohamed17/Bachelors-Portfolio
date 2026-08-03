# 03 — Natural Language Processing

Text classification, Arabic-language NLP, and conversational agents — with an emphasis on the
preprocessing work that usually determines whether a text model succeeds.

The Arabic projects here are the ones I'd point at first. Arabic needs handling that English
pipelines skip entirely: diacritic stripping, right-to-left tokenization concerns, and a stop-word
list that isn't bundled with most libraries by default.

---

## Projects

### [Arabic News Category Classification](arabic-news-category-classification/)
Embedding → Bidirectional LSTM → softmax over tokenized Arabic news articles, with a custom
cleaning pipeline handling diacritics, punctuation, emoji, and Arabic stop words. Ships an
inference function mapping predictions back to Arabic category labels.

`TensorFlow` `Keras` `NLTK` `BiLSTM`

### [Spam Email Classifier](spam-email-classifier/)
**97.2% accuracy** separating spam from legitimate mail, using a hand-built preprocessing chain
(regex cleaning → tokenization → stop-word removal → Porter stemming → bag-of-words) feeding a
Multinomial Naive Bayes classifier, wrapped in a Tkinter GUI.

`scikit-learn` `NLTK` `Tkinter`

### [Intent-Based Chatbot](intent-chatbot/)
An LSTM intent classifier over a JSON intent corpus, with lemmatization, layer normalization,
dropout, and early stopping — plus a scrolling Tkinter chat interface. A Naive Bayes baseline was
built first to establish a floor before committing to the neural approach.

`TensorFlow` `Keras` `LSTM` `NLTK` `Tkinter`

### [Disease Prediction Tool](disease-prediction-naive-bayes/)
A symptom-based classifier over categorical clinical data with explicit missing-value handling,
delivered as a desktop GUI.

`scikit-learn` `Gaussian Naive Bayes` `Tkinter`

### [Text Extraction & Regex Toolkit](text-extraction-regex-toolkit/)
Regular expressions for extracting and validating structured entities — email addresses, payment
card numbers, credential strings — from unstructured text, including line-by-line streaming for
large files.

`Python` `re`

---

## Skills Demonstrated

- Text preprocessing: tokenization, stemming, lemmatization, stop-word removal, normalization
- Arabic-specific handling: diacritic removal, punctuation and emoji filtering, Arabic stop words
- Feature extraction: `CountVectorizer`, TF-IDF, learned embeddings, sequence padding
- Sequence models: LSTM, Bidirectional LSTM, embedding layers
- Baseline-first methodology (Naive Bayes before neural)
- Regular expression design for entity extraction and validation
- Desktop GUI delivery with Tkinter

---

[← Back to portfolio root](../README.md)
