import requests

api_key = '<api-key-here>'
openai_endpoint = "https://api.openai.com/v1/responses"

headers = {
  "Content-Type": "application/json",
  "Authorization": f"Bearer {api_key}"
}

json = {
  "model": "gpt-4o",
  "input": "Write a short bedtime story about a unicorn."
}

response = requests.post(openai_endpoint, json=json, headers=headers)

print(response.json())

print(response.json()['output'][0]['content'][0]['text'])