_(Please note that if you see this on https://weareblahs.github.io/covidcases, that means that the website isn't ready yet. Refresh in a minute.)_

<details>
<summary>See the screenshot of the website by expanding this</summary>
<br>
<img src="https://user-images.githubusercontent.com/37889443/154798834-3b757275-75bf-448c-b547-be6897bf988e.png"></img>
<h1 style="text-align: center;">Yes. This is how the website looks like. Nothing more, nothing less. Just the numbers.</h1>
</details>

# What's This?

This is a no-nonsense, straight-to-the-point page which shows only the new cases of COVID-19 in Malaysia.

## Data included

- COVID-19 Cases
- COVID-19 Deaths
  
  ## Technical specs?
  
  Uses GitHub actions for all the processing with the batch scripts, which replaces the `No data` string (and date string) in the HTML file to the latest cases.
  
  # Other projects used in this project
- [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) ([API](https://covid-19.samsam123.name.my/api/cases?date=latest) / [API documentation](https://covid-19.samsam123.name.my/api.html)) (Main source for data)
  - Data source based on MoH-Malaysia/covid19-public
- [jq](https://github.com/stedolan/jq) (used to parse JSON data)
- sed (used to find and replace placeholders)

# Website versions

There are 2 versions of this website:

- Static version. This version contains a HTML file that auto-updates through GitHub Actions every hour. Visit it [here](https://weareblahs.github.io/covidcases)

- Realtime version. Your computer will contact the API and use it to update the status. Refresh it to get new information. Visit it [here](https://weareblahs.github.io/covidcases/dynamic)

# Social Media Integration

Real-time data updated every hour showing on shared links as image when you share `https://weareblahs.github.io/covidcases` as a website on Facebook and Twitter. Coming soon!

# Dark mode

If you enabled dark theme on systemwide settings, then you should get dark mode when visiting this page on your device. Should be working on most modern browsers (Tested browsers including Chronium-based ones and Safari).

# Automation (updating cases)

 This page will update every hour.

## Run with GitHub Actions under your own repository

Fork it, then run the "Update cases" workflow under Actions.

### Run locally (for Linux-based computers)

#### Before you run

Make sure you have the presiqutes installed.

```bash
sudo apt-get install jq imagemagick
```

```bash
chmod +x update.sh
./update.sh
```

This will update all the HTML files by getting the data through cURL and replacing it in the HTML files.  
To push, use:

```bash
chmod +x postlocalupdate.sh
./postlocalupdate.sh
```

or for Windows:

```cmd
postlocalupdate_win
```

# Future plans

- Cases by state + Dropdown
- More Data in different pages (example: Active Cases, Death Cases, etc.)

# Incorrect data or "No Data"?

Create an issue describing your problem.
