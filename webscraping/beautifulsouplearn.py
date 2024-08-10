import requests
from bs4 import BeautifulSoup

# url = "https://google.com"
url = "https://webscraper.io/test-sites/e-commerce/allinone/computers/tablets"

res = requests.get(url)

soup = BeautifulSoup(res.text, "lxml")

# print(soup)

# To get the info using tags
print(soup.div)

# To get the info using tag attributes
tag = soup.div
print(tag.attrs)


# To get inner text as a string
innertext = soup.div.p.string
print(innertext)

# Getting the info using find method



info = soup.find("h4", {"class": "price float-end card-title pull-right"}, recursive=True)
print(info.string)

# Getting the info using find_all method

info2 = soup.find_all("h4", class_="price float-end card-title pull-right")

print([i.text for i in info2])

info3 = soup.find_all(string="Galaxy Tab 3")
