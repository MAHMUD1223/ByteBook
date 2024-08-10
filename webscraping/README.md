# Web Scraping
Web scraping is the process of extracting data from websites. It involves fetching the HTML content of a web page and then parsing and extracting the desired information from it. This extracted data can be used for various purposes such as data analysis, research, or building applications.
<br>

Web scraping typically involves using programming languages like Python or JavaScript to automate the process of fetching and parsing web pages. These programming languages provide libraries and frameworks that make it easier to interact with web pages, send HTTP requests, and extract data.
<br>
Some popular libraries for web scraping in Python include BeautifulSoup and Scrapy, while in JavaScript, you can use libraries like Cheerio and Puppeteer.
<br>
When performing web scraping, it's important to be mindful of the website's terms of service and to respect the website's policies regarding data extraction. Additionally, it's a good practice to add delays between requests to avoid overwhelming the server and to handle any potential errors or exceptions that may occur during the scraping process.

## Setup
For this we will use BeautifulSoup
### Installing dependencies
Paste it in terminal :
```bash
pip install requests beautifulsoup4 lxml
```
> [!NOTE]
> Here `lxml` is used because it is faster and well balanced. But there is other options as well. Like `html.parser` is the default parser and `html5lib` is best when you need good debug. But if you want to use `html5lib` you need to install it via pip
> ```bash
> pip install html5lib
> ```


and continuing on files.....