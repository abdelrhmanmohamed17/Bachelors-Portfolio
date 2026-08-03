# Code Safari — An AI-Powered Programming Tutor for Children

> A fine-tuned LLaMA 3.2 that teaches Python to 10–13 year olds, served over a RAG pipeline.
> **Bachelor's graduation project.**

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=flat-square&logo=pytorch&logoColor=white)
![Hugging Face](https://img.shields.io/badge/🤗_Transformers-FFD21E?style=flat-square)
![Unsloth](https://img.shields.io/badge/Unsloth-00C853?style=flat-square)
![ChromaDB](https://img.shields.io/badge/ChromaDB-FF6B35?style=flat-square)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat-square&logo=fastapi&logoColor=white)

---

## Problem Statement

Teaching programming to children is not the same problem as teaching it to adults. A ten-year-old
needs shorter explanations, concrete analogies, and immediate feedback — and a general-purpose LLM
defaults to none of those. Ask a stock model to explain a `for` loop and you get something aimed at
a computer science undergraduate.

Code Safari addresses this in two ways: **fine-tune** a small model so age-appropriate phrasing
becomes its default rather than something coaxed out by prompting, and **ground** its answers in a
retrieved curriculum so it doesn't invent Python semantics.

Small models matter here. A 1B–3B parameter model quantized to 4-bit runs on modest hardware,
which is the difference between something a school could actually deploy and something that needs
a GPU budget.

## Architecture

```
                    ┌──────────────────────────────┐
   Child's          │      FastAPI + Jinja2        │
   question  ──────▶│         web interface        │
                    └──────────────┬───────────────┘
                                   │
                    ┌──────────────▼───────────────┐
                    │   ChromaDB vector store      │
                    │   all-MiniLM-L6-v2 embeddings│
                    │   top-3 chunk retrieval      │
                    └──────────────┬───────────────┘
                                   │ retrieved context
                    ┌──────────────▼───────────────┐
                    │   Language model             │
                    │   · fine-tuned LLaMA 3.2     │
                    │   · Mistral-small (hosted)   │
                    └──────────────┬───────────────┘
                                   │
                    Age-appropriate answer + MCQ
```

## Two Halves of the Work

### 1. Fine-tuning — `notebooks/llama-3.2-finetuning.ipynb`

Supervised fine-tuning of **LLaMA 3.2 (1B and 3B)** using [Unsloth](https://github.com/unslothai/unsloth)
for memory-efficient training.

| Aspect | Choice |
|---|---|
| Method | LoRA adapters — trains a small fraction of parameters |
| Quantization | 4-bit pre-quantized base for faster download and lower VRAM |
| Trainer | `SFTTrainer` (TRL) with `DataCollatorForSeq2Seq` |
| Chat format | ShareGPT template via `standardize_sharegpt` |
| Loss masking | `train_on_responses_only` — gradients only on assistant turns, not on the prompt |
| Precision | bfloat16 where supported |

**Export targets** — the notebook covers merging and exporting to:
- 16-bit merged weights, and LoRA adapters alone
- **GGUF** at f16, Q8_0, and q4_k_m for `llama.cpp` / local CPU inference
- float16 for **vLLM** serving
- Hugging Face Hub push

`train_on_responses_only` is the detail that matters most. Without it the model spends capacity
learning to reproduce children's questions instead of learning to answer them.

### 2. Dataset construction — `src/build_sharegpt_dataset.py`

Converts a raw prompt/completion JSONL corpus into the ShareGPT conversational format the trainer
expects, injecting a fixed system message on every example:

> *"You are an AI tutor that creates multiple-choice questions (MCQs) to teach Python programming
> concepts to children aged 10 to 13. Your questions should be clear, engaging, and
> age-appropriate."*

Each row becomes a three-turn conversation — `system` → `user` → `assistant`. Baking the audience
into the system message on every training example is what makes the age-appropriate register the
model's default rather than something the prompt has to ask for each time.

`data/mcq_dataset.jsonl` (4.6 MB) is the source corpus. The generated `QA.json` (~13 MB) is
reproducible by running the script and is not committed.

### 3. Retrieval & serving — `src/chatbot_interface/`

`fastapi_chatbot.py` implements the RAG layer:

- **ChromaDB** persistent client over a curriculum corpus
- **`all-MiniLM-L6-v2`** sentence-transformer embeddings — small, fast, good enough for short
  educational text
- Top-3 chunk retrieval per question, with retrieved context returned alongside the answer so the
  source is inspectable
- FastAPI endpoints with Jinja2 templates and a styled chat UI (`templates/index.html`, `style.css`)
- Pydantic response models with explicit error fields

### Earlier baseline — `src/distilbert_squad_baseline.py`

Before the LLaMA work, an extractive QA baseline: **DistilBERT** fine-tuned on **SQuAD v2** via the
HuggingFace `Trainer` (3 epochs, lr 3e-5, batch 16, weight decay 0.01).

Kept because it documents why the project moved to a generative model. Extractive QA can only
return spans that already exist in a source document — it cannot *explain* a concept or *generate*
a new multiple-choice question, which is the entire point of a tutor.

> **Note:** the sibling files in the original `QA_Project/` folder (`app.py`, `model.py`,
> `preprocess.py`) were empty placeholders and are not included. Only `train.py` had content.

## Key Features

- Supervised fine-tuning of a small open-weight LLM for a specific audience and task
- LoRA + 4-bit quantization for training on accessible hardware
- Response-only loss masking
- Multi-format export (GGUF, vLLM, HF Hub) for different deployment paths
- Dataset transformation pipeline into ShareGPT conversational format
- RAG grounding with a persistent vector store and inspectable retrieved context
- Working web interface, not just a notebook
- User research survey and project schedule as part of the deliverable

## Technologies

| Layer | Tools |
|---|---|
| Model | LLaMA 3.2 1B / 3B, Mistral-small, DistilBERT |
| Fine-tuning | Unsloth, TRL `SFTTrainer`, LoRA, HuggingFace Transformers |
| Retrieval | ChromaDB, sentence-transformers (`all-MiniLM-L6-v2`) |
| Serving | FastAPI, Uvicorn, Jinja2, Pydantic |
| Data | `datasets`, JSON/JSONL pipelines |
| Export | GGUF / llama.cpp, vLLM, Hugging Face Hub |

## How to Run

**Fine-tuning** (GPU required — Colab or Kaggle works):

```bash
pip install unsloth trl transformers datasets torch
jupyter notebook notebooks/llama-3.2-finetuning.ipynb
```

**Build the training dataset:**

```bash
python src/build_sharegpt_dataset.py    # mcq_dataset.jsonl -> ShareGPT QA.json
```

**Run the chatbot:**

```bash
pip install fastapi uvicorn chromadb sentence-transformers pydantic jinja2
export MISTRAL_API_KEY="your-key-here"      # Windows: setx MISTRAL_API_KEY "your-key"
python src/chatbot_interface/fastapi_chatbot.py
# -> http://127.0.0.1:8000
```

> The API key is read from the environment. It is **not** in the source — see [Security](#security).
> You'll also need a populated ChromaDB store at the `persist_dir` path; the vector database itself
> is not committed (it's large and regenerable).

## Documentation

| File | Contents |
|---|---|
| `docs/graduation-project-documentation.pdf` | Full project documentation |
| `docs/programming-tutor-for-kids.pdf` | Concept and pedagogical approach |
| `docs/user-research-survey.pdf` | Survey instrument used to gather requirements |
| `docs/gantt-chart.pdf` | Project schedule |

Three third-party research papers on gamification in childhood education informed the design. They
aren't redistributed here — they're cited in the documentation.

## Security

A Mistral API key was hardcoded in `fastapi_chatbot.py` in the original source. It has been
replaced with an environment variable lookup in this repository, and **the original key has been
revoked**.

If you fork this: never commit API keys. Use environment variables or a `.env` file that's in
`.gitignore` — as this repository's `.gitignore` already does.

## What I Learned

**Fine-tuning changes the default; prompting only changes the instance.** You can prompt a
general-purpose model into explaining loops to a child, and it will drift back toward its usual
register within a few turns. Training on examples where every response is already in the target
register makes it the baseline behaviour instead of something you have to keep asking for.

**Response-only loss masking was the single highest-leverage setting.** Training on the full
sequence means the model spends capacity learning to generate children's *questions*. Masking the
prompt so gradients flow only through assistant turns focuses the entire training budget on the
behaviour that's actually wanted.

**RAG and fine-tuning solve different problems, and the project needed both.** Fine-tuning taught
the model *how to speak* to a ten-year-old. It did nothing to stop it inventing Python semantics.
Retrieval grounds the factual content; fine-tuning shapes the delivery. Treating them as
alternatives — which is how they're often framed — would have produced a worse system either way.

**Export format is a deployment decision made at training time.** GGUF at q4_k_m runs on a laptop
CPU; vLLM float16 needs a GPU but serves concurrent users. Choosing badly means retraining, so
it's worth deciding who runs the model before you start.

---

*Bachelor's Graduation Project · Faculty of Computers and Data Science, Alexandria University · 2025*

[← Back to portfolio root](../README.md)
