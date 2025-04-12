import puppeteer from "puppeteer";

(async () => {
    // Launches Puppeteer with default Chrome browser
    const browser = await puppeteer.launch({ headless: true, browser: "chrome", args: ['--no-sandbox', '--disable-setuid-sandbox'] });


    // Creates a page instance
    const page = await browser.newPage();


    // Navigates to the website
    await page.goto('https://skyvector.com/');

    // Logs the page title
    console.log(await page.title());

    const searchBar = ".sv_search"

    await page.waitForSelector(searchBar);
    await page.click(searchBar);
    await page.type(searchBar, "VANTU", { delay: 100 });
    await page.click(".sv_searchbtn");

    console.log("input done!")
    const elements = await page.$$('#bsv_tbll');


    // Extracting and logging the text content of each element
    for (const element of elements) {
        const elementText = await page.evaluate(element => element.textContent, element);
        console.log('Extracted element:', elementText);
    }

    // const elementText = await page.evaluate(element => element.textContent, element);
    // console.log('Extracted element:', elementText);




    await page.evaluate(() => {
        const latlon = document.querySelector("#bsv_tbll");
        console.log(latlon);
        console.log("search done")
    })



    // Closes the browser
    await browser.close();
})();