import torch
from transformers import AutoTokenizer, AutoModelForQuestionAnswering, Trainer, TrainingArguments
from datasets import load_dataset
from preprocess import preprocess_function  # Assuming this function is in preprocess.py

# Load dataset
datasets = load_dataset('squad_v2')

# Tokenize dataset
tokenizer = AutoTokenizer.from_pretrained('distilbert-base-uncased')
tokenized_datasets = datasets.map(preprocess_function, batched=True)

# Load model
model = AutoModelForQuestionAnswering.from_pretrained('distilbert-base-uncased')

# Training arguments
training_args = TrainingArguments(
    output_dir="./results",
    evaluation_strategy="epoch",
    learning_rate=3e-5,
    per_device_train_batch_size=16,
    per_device_eval_batch_size=16,
    num_train_epochs=3,
    weight_decay=0.01
)

# Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_datasets["train"],
    eval_dataset=tokenized_datasets["validation"],
    tokenizer=tokenizer
)

# Train model
trainer.train()

# Save model
trainer.save_model('./qa_model')
tokenizer.save_pretrained('./qa_model')
