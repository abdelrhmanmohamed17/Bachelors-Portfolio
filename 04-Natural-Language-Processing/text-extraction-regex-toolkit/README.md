# Text Extraction & Pattern Matching Toolkit

> Regular expressions for extracting and validating structured entities from unstructured text.

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Regex](https://img.shields.io/badge/Regex-000000?style=flat-square)

---

## Problem Statement

Before any statistical NLP happens, text usually needs structure pulled out of it: addresses,
identifiers, reference numbers, dates. Regular expressions remain the right tool for entity classes
with a well-defined grammar — and knowing where that stops being true is half the skill.

This coursework series covers Python fundamentals and then applies them to pattern-based extraction
over text files.

## Approach

**Entity extraction targets**
- **Email addresses** — local part, `@`, domain, TLD validation
- **Payment card numbers** — digit grouping and separator tolerance across formats
- **Credential strings** — composition-rule validation (length, character classes)

**File processing**
- Line-by-line streaming rather than reading whole files into memory, so the approach scales to
  large inputs
- Match accumulation with per-line reporting

**Python fundamentals covered alongside**
- Tuples — immutability, packing/unpacking, use as dictionary keys
- Dictionaries — construction, iteration, nesting, comprehensions
- Sets — membership testing, deduplication, set algebra

## Key Features

- Regular expressions for three distinct entity classes with different grammars
- Memory-efficient line-by-line file streaming
- Validation logic layered on top of extraction — matching a pattern and being *valid* are
  different questions
- Worked examples with explanation for each Python data structure

## Technologies

| Layer | Tools |
|---|---|
| Language | Python 3 |
| Libraries | `re` (standard library only) |

## How to Run

```bash
jupyter notebook notebooks/text-extraction.ipynb
```

No dependencies beyond the standard library. Sample data files are in `data/`.

## About the Sample Data

`data/` contains three small synthetic text files used purely as regex targets:

- `sample_emails.txt` — generated email-address strings
- `sample_cards.txt` — **synthetic, non-functional** card-format digit strings
- `sample_password_patterns.txt` — a generated wordlist of common password *shapes*
  (`Month + Year + symbol`), used to test composition-rule validation

None of it is real data. None of it is associated with any real person or account. The password
file is a pattern-shape list for testing a validator, not a credential dump.

## What I Learned

**Regex complexity grows faster than the problem.** A "correct" email regex per RFC 5322 is
notoriously enormous, and building toward it teaches you where to stop — a pragmatic pattern that
catches 99% of real addresses beats a complete one nobody can maintain.

**Extraction and validation are separate steps.** A string can match the shape of a card number and
still fail a Luhn check. Conflating "looks like" with "is" is the standard regex trap.

**Streaming should be the default.** Reading a file line by line costs nothing extra to write and
means the same code works on a 10KB file and a 10GB one.

---

*Course: Natural Language Processing · Assignments 1–2*

[← Back to NLP](../README.md)
