import requests
import pandas as pd
from bs4 import BeautifulSoup

url = "https://webscraper.io/test-sites/e-commerce/allinone/computers/tablets"

res = requests.get(url)

soup = BeautifulSoup(res.text, "lxml")

product_name = [i.text for i in soup.find_all("a", class_ = "title")]

prices_list = [i.text for i in soup.find_all("h4", class_ = "price float-end card-title pull-right")]

desc_list = [i.text for i in soup.find_all("p", class_ = "description card-text")]

reviews_list = [i.text for i in soup.find_all("p", class_ = "review-count float-end")]

# print(product_name, prices_list, desc_list, reviews_list)

# pandas works

df = pd.DataFrame({"Product Name": product_name, "Price": prices_list, "Description": desc_list, "number of reviews": reviews_list})

# print(df)

df.to_csv("product_details.csv", index=False)
