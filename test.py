import openai
import sqlite3
import os
from dotenv import load_dotenv


load_dotenv()

def load_chat_role(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        ####################################################################################################
        print("ROLE CONTENT:\n", content)  # This will print the role content
        return content
        ####################################################################################################


def send_to_chatgpt(user_question, role_file_path='chat_role.txt', model='gpt-4o'):
    # Hardcode the API key directly in the script

    openai.api_key = os.getenv("OPENAI_API_KEY")

    # Load the role file content
    role_content = load_chat_role(role_file_path)
    print("\n ROLE CONTENT: ", role_content)
    # Prepare the messages for ChatGPT
    messages = [
        {"role": "system", "content": role_content},
        {"role": "user", "content": user_question}
    ]

    # Send the message to the API
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages
    )
    
    # Extract and return the assistant's reply
    return response['choices'][0]['message']['content']


def load_file_content(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        print(f"Loaded content from {file_path}:\n", content)
        return content

def execute_query(sql_query, db_path="your_database.db"):
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        cursor.execute(sql_query)
        rows = cursor.fetchall()
        column_names = [description[0] for description in cursor.description]
        conn.close()
        return column_names, rows
    except Exception as e:
        return [], [f"Query Execution Failed: {e}"]

def send_to_chatgpt(messages, model='gpt-4o'):
    openai.api_key = "sk-proj-..."  # Your actual key
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages
    )
    return response['choices'][0]['message']['content']






if __name__ == "__main__":
    user_question = input("Enter your question: ")

    # Step 1: Get SQL query from first GPT role
    initial_role = load_file_content("chat_role.txt")
    initial_messages = [
        {"role": "system", "content": initial_role},
        {"role": "user", "content": user_question}
    ]
    try:
        sql_query = send_to_chatgpt(initial_messages)
        print("\nGenerated SQL Query:\n", sql_query)

        # Step 2: Execute the query
        col_names, results = execute_query(sql_query)
        formatted_result = f"Columns: {col_names}\nResults:\n" + "\n".join(str(row) for row in results)

        # Step 3: Prepare second GPT message
        role2_content = load_file_content("/Users/sydnewright/Documents/cs452/NaturalLanguage/chat_role2.txt")
        second_messages = [
            {"role": "system", "content": role2_content},
            {"role": "user", "content": f"Original question: {user_question}\n\nQuery run:\n{sql_query}\n\nResults:\n{formatted_result}"}
        ]
        final_response = send_to_chatgpt(second_messages)
        print("\nChatGPT Response:\n", final_response)

    except Exception as e:
        print("Error:", e)
