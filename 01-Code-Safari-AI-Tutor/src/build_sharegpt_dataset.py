import json

# System message for the assistant
SYSTEM_MESSAGE = "You are an AI tutor that creates multiple-choice questions (MCQs) to teach Python programming concepts to children aged 10 to 13. Your questions should be clear, engaging, and age-appropriate."

# Function to read JSONL data from a file
def read_jsonl(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            return [json.loads(line) for line in file]
    except FileNotFoundError:
        print(f"Error: The file '{file_path}' does not exist.")
        return None
    except Exception as e:
        print(f"An error occurred while reading the file: {e}")
        return None

# Function to convert JSONL data to the new JSON format
def convert_jsonl_to_json(jsonl_data):
    conversation = []
    
    for entry in jsonl_data:
        question = entry.get("prompt", "").strip()
        completion = entry.get("completion", "").strip()
        
        conversation.append([
            {"content": SYSTEM_MESSAGE, "role": "system"},
            {"content": question, "role": "user"},
            {"content": completion, "role": "assistant"}
        ])
    
    return conversation

# Function to save the converted data to a JSON file
def save_to_json(data, output_file_path):
    try:
        with open(output_file_path, 'w', encoding='utf-8') as json_file:
            json.dump(data, json_file, ensure_ascii=False, indent=4)
        print(f"Converted data has been saved to '{output_file_path}'.")
    except Exception as e:
        print(f"An error occurred while writing the JSON file: {e}")

if __name__ == "__main__":
    # Specify the input JSONL file and the output JSON file
    input_file_path = 'mcq_dataset(3).jsonl'  # Change this to your actual input file path
    output_file_path = 'output.json'  # Output JSON file

    # Read JSONL data from the file
    jsonl_data = read_jsonl(input_file_path)

    if jsonl_data:
        # Convert the data to the desired JSON format
        converted_data = convert_jsonl_to_json(jsonl_data)
        
        if converted_data:
            # Save the converted data to a JSON file
            save_to_json(converted_data, output_file_path)

