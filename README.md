<div align="center">

# Abdelrahman Hodib

### AI / LLM Engineer · M.Sc. Artificial Intelligence @ FAU Erlangen-Nürnberg

[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](#)
[![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white)](#)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)](#)
[![Hugging Face](https://img.shields.io/badge/🤗_Transformers-FFD21E?style=for-the-badge)](#)
[![ChromaDB](https://img.shields.io/badge/ChromaDB-FF6B35?style=for-the-badge)](#)
[![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)](#)
[![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)](#)
[![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white)](#)
[![Keras](https://img.shields.io/badge/Keras-D00000?style=for-the-badge&logo=keras&logoColor=white)](#)
[![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)](#)
[![pandas](https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)](#)

</div>

---

## About

I'm an AI engineer based in Erlangen, Germany, currently doing an **M.Sc. in Artificial
Intelligence at FAU Erlangen-Nürnberg**. I finished my Computer Science degree at Alexandria
University with a grade of **1.2 (German scale)**.

This repository is the engineering work from that degree — **25+ projects** across large language
models, deep learning, natural language processing, computer vision, speech recognition, operating
systems, and systems analysis.

The thread running through most of it is comparison. Rather than train one model and report its
accuracy, most projects here benchmark several approaches against each other — custom CNN vs.
VGG16 vs. ResNet, TensorFlow vs. PyTorch, Naive Bayes vs. LSTM, fine-tuning vs. retrieval — because
the interesting result is usually the gap between them, not the number itself.

📄 **[Full CV](CV.md)** · 📧 abdelrahman.hodib@fau.de · 🔗 [LinkedIn](https://www.linkedin.com/in/abdelrahman-h-363905128/)

---

## Credentials

| | | |
|---|---|---|
| **B.Sc. Computer Science** — grade 1.2 (German scale) | Alexandria University | — |
| **IELTS Academic 7.0** (C1) | British Council | —  |
| **Mathematics for Machine Learning** Specialization | Coursera · Aug 2023 | [✓ verify](https://www.coursera.org/account/accomplishments/specialization/BWET366VK6V4) |
| **Getting Started with Git and GitHub** | Coursera · Jul 2023 | [✓ verify](https://www.coursera.org/account/accomplishments/verify/86H6NWTNJDFL) |
| **Take The Lead** — Leadership Program | eCornell | [📄 certificate](https://drive.google.com/file/d/1mNGuvnCSPUdmq8l-cAxRVno96PrpTMAt/view?usp=sharing) |
| **SAS Visual Analytics 1 & 2** for SAS Viya | SAS · Dec 2023 | — |

---

## ⭐ Featured — Code Safari

**[Code Safari — An AI-Powered Programming Tutor for Children](01-Code-Safari-AI-Tutor/)**

My graduation project, and the most complete system here. A **fine-tuned LLaMA 3.2** that teaches
Python to 10–13 year olds, grounded by a **ChromaDB retrieval layer** and served through
**FastAPI**.

| | |
|---|---|
| **Fine-tuning** | LLaMA 3.2 1B/3B · LoRA adapters · 4-bit quantized base · TRL `SFTTrainer` · response-only loss masking |
| **Data** | 4.6 MB corpus transformed into ShareGPT conversational format with an audience-specific system message |
| **Retrieval** | ChromaDB + `all-MiniLM-L6-v2` embeddings · top-3 chunks returned alongside each answer |
| **Serving** | FastAPI · Jinja2 chat UI · Pydantic response models |
| **Export** | GGUF (f16, Q8_0, q4_k_m) for llama.cpp · float16 for vLLM · Hugging Face Hub |

Fine-tuning taught the model *how to speak* to a child. Retrieval stopped it inventing Python
semantics. The project needed both — they solve different problems.

---

## Other Highlights

| Project | What it does | Stack | Result |
|---|---|---|---|
| **[Multi-Output CNN](03-Deep-Learning/multi-output-cnn-animal-color/)** | One network, two heads — animal *and* colour in a single forward pass | TensorFlow, Keras | **98.85%** colour · **79.22%** animal |
| **[Arabic News Classifier](04-Natural-Language-Processing/arabic-news-category-classification/)** | BiLSTM over Arabic text, with a diacritic/emoji/stop-word pipeline built from scratch | TensorFlow, NLTK | End-to-end Arabic NLP |
| **[CNN Architecture Comparison](03-Deep-Learning/cnn-architecture-comparison/)** | Custom CNN vs. transfer-learned VGG16 vs. ResNet on identical data | TensorFlow, Keras | 3 trained architectures |
| **[Spam Email Classifier](04-Natural-Language-Processing/spam-email-classifier/)** | Naive Bayes over a hand-built preprocessing chain, in a desktop GUI | scikit-learn, NLTK | **97.2%** accuracy |
| **[Arabic Speech Recognition](05-Computer-Vision-Speech/arabic-speech-recognition/)** | Corpus pipeline → training → evaluation → FastAPI serving | TensorFlow, FastAPI | Deployed behind HTTP |

---

## Repository Structure

```
Bachelors-Portfolio/
├── README.md
├── CV.md  ·  CV.txt                      ← full CV, markdown + ATS-plain-text
│
├── 01-Code-Safari-AI-Tutor/              ← ⭐ graduation project
├── 02-Machine-Learning/
├── 03-Deep-Learning/
├── 04-Natural-Language-Processing/
├── 05-Computer-Vision-Speech/
├── 06-Operating-Systems/
├── 07-Intelligent-Systems-Optimization/
├── 08-Software-Engineering-Analysis/
├── 09-Embedded-Control-Systems/
└── 10-Coursework-Assignments/
```

Every category has a `README.md` indexing its projects. Every project has a `README.md` covering
the objective, stack, approach, key features, how to run it, and what I took away from it.

---

## Table of Contents

### [01 — Code Safari](01-Code-Safari-AI-Tutor/) ⭐
LLM fine-tuning, RAG, and deployment. Graduation project.

### [02 — Machine Learning](02-Machine-Learning/)
- [Regression & Classification Portfolio](02-Machine-Learning/regression-classification-portfolio/)
- [TensorFlow vs. PyTorch Study](02-Machine-Learning/tensorflow-vs-pytorch-study/)
- [Sentiment Analysis with Embeddings](02-Machine-Learning/sentiment-analysis-embeddings/)

### [03 — Deep Learning](03-Deep-Learning/)
- [CNN Architecture Comparison](03-Deep-Learning/cnn-architecture-comparison/) — custom vs. VGG16 vs. ResNet
- [Multi-Output CNN](03-Deep-Learning/multi-output-cnn-animal-color/) — joint animal + colour prediction
- [MNIST from First Principles](03-Deep-Learning/mnist-neural-network-from-scratch/) — manual backpropagation
- [CIFAR-10 & CIFAR-100 Classifiers](03-Deep-Learning/cifar-cnn-classifiers/)
- [Regularization & Augmentation Ablation](03-Deep-Learning/regularization-augmentation-study/)

### [04 — Natural Language Processing](04-Natural-Language-Processing/)
- [Arabic News Category Classification](04-Natural-Language-Processing/arabic-news-category-classification/)
- [Spam Email Classifier](04-Natural-Language-Processing/spam-email-classifier/)
- [Intent-Based Chatbot](04-Natural-Language-Processing/intent-chatbot/)
- [Disease Prediction Tool](04-Natural-Language-Processing/disease-prediction-naive-bayes/)
- [Text Extraction Toolkit](04-Natural-Language-Processing/text-extraction-regex-toolkit/)

### [05 — Computer Vision & Speech](05-Computer-Vision-Speech/)
- [OpenCV Image Processing Toolkit](05-Computer-Vision-Speech/opencv-image-processing/)
- [Real-Time Webcam Classifier](05-Computer-Vision-Speech/realtime-webcam-classifier/)
- [Arabic Speech Recognition](05-Computer-Vision-Speech/arabic-speech-recognition/)

### [06 — Operating Systems](06-Operating-Systems/)
- [CPU Scheduling Algorithms](06-Operating-Systems/cpu-scheduling-algorithms/)
- [Disk Scheduling Algorithms](06-Operating-Systems/disk-scheduling-algorithms/)
- [Page Replacement Algorithms](06-Operating-Systems/page-replacement-algorithms/)
- [MenuetOS Architecture Analysis](06-Operating-Systems/menuetos-architecture-analysis/)

### [07 — Intelligent Systems & Optimization](07-Intelligent-Systems-Optimization/)
- [Genetic Algorithm Optimizer](07-Intelligent-Systems-Optimization/genetic-algorithm-optimizer/)
- [Cellular Automata Simulation](07-Intelligent-Systems-Optimization/cellular-automata-simulation/)
- [Operations Research Problem Sets](07-Intelligent-Systems-Optimization/operations-research-problems/)

### [08 — Software Engineering & Systems Analysis](08-Software-Engineering-Analysis/)
- [Order & Inventory System Analysis](08-Software-Engineering-Analysis/order-inventory-system-analysis/)

### [09 — Embedded & Control Systems](09-Embedded-Control-Systems/)
- [Critical Distance Detection](09-Embedded-Control-Systems/critical-distance-detection/) — Arduino + ultrasonic
- [Control Systems Labs](09-Embedded-Control-Systems/matlab-control-systems-labs/) — MATLAB, ball-and-beam

### [10 — Coursework & Assignments](10-Coursework-Assignments/)

---

## Tech Stack

**LLMs** — LLaMA 3.2 · Mistral · Unsloth · LoRA/PEFT · TRL · GGUF · vLLM · Hugging Face

**RAG** — ChromaDB · sentence-transformers · semantic retrieval

**Deep Learning** — PyTorch · TensorFlow · Keras · CNNs · LSTM/BiLSTM · transfer learning

**NLP** — Transformers · NLTK · Arabic normalization · embeddings · regex

**Vision & Speech** — OpenCV · augmentation · real-time inference · audio pipelines

**Data** — NumPy · pandas · scikit-learn · Matplotlib · Seaborn · SAS

**Engineering** — FastAPI · Pydantic · Git · Jupyter · Colab · Kaggle · MATLAB · Arduino

---

## Running Anything Here

```bash
git clone https://github.com/abdelrhmanmohamed17/Bachelors-Portfolio.git
cd Bachelors-Portfolio
python -m venv .venv && source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
jupyter notebook
```

Notebooks render directly on GitHub, so you can read the code and its outputs without cloning.
Individual projects list their own minimal dependencies in their READMEs.

---

## Notes on This Repository

**Team projects are labelled.** Where a project was team work, its README says so. I've
deliberately not claimed specific individual contributions on those — describing what the project
did is honest; carving up credit after the fact isn't.

**No secrets, no third-party material.** API keys found in the original coursework have been
replaced with environment-variable lookups and the underlying keys revoked. Course lecture slides,
textbooks, and research papers I didn't write aren't redistributed here — they're cited instead.

**Large artifacts are excluded.** Trained model weights, vector databases, and bulk image datasets
aren't committed. Every project README says how to regenerate them.

---

## Contact

- 📧 **Email** — abdelrahman.hodib@fau.de
- 💼 **LinkedIn** — [abdelrahman-h-363905128](https://www.linkedin.com/in/abdelrahman-h-363905128/)
- 💻 **GitHub** — [abdelrhmanmohamed17](https://github.com/abdelrhmanmohamed17)
- 📍 Erlangen, Germany

---

<div align="center">
<sub>B.Sc. Computer Science, Alexandria University (1.2) · M.Sc. Artificial Intelligence, FAU Erlangen-Nürnberg</sub>
</div>
