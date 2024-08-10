import requests

url = "https://courses.wscubetech.com"

res = requests.get(url)

print(f"Your request to {url} came back with status code {res.status_code}")

print("Getting the text of response", res.text)

