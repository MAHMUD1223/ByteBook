import requests
from bs4 import BeautifulSoup
import re

url = "https://webscraper.io/test-sites/e-commerce/allinone/computers/tablets"

res = requests.get(url)

soup = BeautifulSoup(res.text, "lxml")

# info = soup.find_all(string="Galaxy")
# This will return one result but there is more than one that contains Galaxy and we want them

info = soup.find_all(string= re.compile("Galaxy"))

print(info)