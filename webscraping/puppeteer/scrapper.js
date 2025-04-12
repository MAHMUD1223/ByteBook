import fs from "node:fs"
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

        // data.split("\n").forEach(fix => {
        //     if (fix) {
        //         // console.log(fix)
        //         page.waitForSelector(searchBar)
        //         page.click(searchBar)
        //         page.type(searchBar, fix, { delay: 100 })


        //         const elements = page.$$('#bsv_tbll');


        //         // Extracting and logging the text content of each element
        //         for (const element of elements) {
        //             const elementText = page.evaluate(element => element.textContent, element);
        //             console.log('Extracted element:', elementText);
        //         }
        //     }
        // })

        data = ["IKGU", "ADMIL"]

        for (const fix of data) {
            await page.waitForSelector(searchBar)
            await page.click(searchBar)
            await page.type(searchBar, fix, { delay: 100 })


            const elements = await page.$$('#bsv_tbll');


            // Extracting and logging the text content of each element
            for (const element of elements) {
                const elementText = await page.evaluate(element => element.textContent, element);
                console.log(fix, elementText);
            }
        }

        await browser.close()

    })()





