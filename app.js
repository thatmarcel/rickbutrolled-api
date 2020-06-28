const puppeteer = require("puppeteer");
const app = require("express")();

app.use(async (req, res) => {
    let url = req.query.url;
    
    if (!url) {
        res.status(400).send("Bad Request - missing url");
        return;
    }

    if (!url.startsWith("http://") && !url.startsWith("https://")) {
        url = "https://" + url;
    }

    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setJavaScriptEnabled(true);
    await page.goto(url);
    const finalURL = page.url();
    const isRickroll = finalURL.toLowerCase().includes("youtube.") &&
                       finalURL.toLowerCase().includes("v=") &&
                       finalURL.includes("=dQw4w9WgXcQ");
    browser.close();

    res.status(200).send(isRickroll);
});

app.listen(process.env.PORT || 4000);
