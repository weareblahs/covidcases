_(Please note that if you see this on https://weareblahs.github.io/covidcases, that means that the website isn't ready yet. Refresh in a minute.)_

<details>
<summary>See the screenshot of the website by expanding this</summary>
<br>
<img src="https://user-images.githubusercontent.com/37889443/154798834-3b757275-75bf-448c-b547-be6897bf988e.png"></img>
<h1><center>Yes. This is how the website looks like. Nothing more, nothing less. Just the numbers.</center></h1>
</details>

# What's This?

This is a no-nonsense, straight-to-the-point page which shows only the new cases of COVID-19 in Malaysia.

## Data included

- COVID-19 Cases

- COVID-19 Deaths
  
  ## Technical specs?
  
  Uses GitHub actions for all the processing with the batch scripts, which replaces the `No data` string (and date string) in the HTML file to the latest cases.
  
  # Other projects / stuffs used in this project

- [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) ([API](https://covid-19.samsam123.name.my/api/cases?date=latest) / [API documentation](https://covid-19.samsam123.name.my/api.html)) (Main source for data)
  
  - Data source based on MoH-Malaysia/covid19-public

- [jq](https://github.com/stedolan/jq) (used to parse JSON data)

- sed (used to find and replace placeholders)

- ImageMagick (used to generate images)

- Helvetica Neue (used to generate images / website default font) ([Version used](https://github.com/ifvictr/helvetica-neue))

- [add-to-homescreen](https://github.com/cubiq/add-to-homescreen) (used for PWA "add to home screen" bottom pop-up when visiting website)

# App icon / Favicon

Credits to [clipartpng.com](https://clipartpng.com/?3346,blue-face-mask-clipart-png-image) for the original icon. Modified to mask the icon.

# Website versions

There are 2 versions of this website:

- Static version. This version contains a HTML file that auto-updates through GitHub Actions every hour. Visit it [here](https://weareblahs.github.io/covidcases). (Available for both nationwide and states)

- Realtime version. Your browser will contact the API every visit and use it to update the status. Refresh it to get new information. Visit it [here](https://weareblahs.github.io/covidcases/dynamic). (Nationwide only)

## Data types

- Nationwide

- States
  
  - A list of states can be triggered by clicking / tapping the "More statistics" page.

### Data availability

| Data type  | Cases | Deaths |
| ---------- | ----- | ------ |
| Nationwide | Yes   | Yes    |
| State      | Yes   | No     |

### Data sources

| Data type  | Source                                                                                                                                                                           |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Nationwide | [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) (hosted by @samleong123, [documentation](https://covid-19.samsam123.name.my/api.html)) |
| States     | [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) (hosted by @samleong123, [documentation](https://covid-19.samsam123.name.my/api.html)) |

# Save as image

After generating HTML pages, it will generate images with the current cases / deaths numbers through ImageMagick, which are also used for social media integration. To save it, go to the website, then click / tap on "Save as image".

## Social Media Integration

An image of cases should be popped up if you share this website on Facebook or Twitter when you put this URL (`https://weareblahs.github.io/covidcases` ).

- Same thing as the Deaths one, but only when you put `https://weareblahs.github.io/covidcases/deaths`  as URL.

### JSON Data / API

**_Please note that before you use this API, there's a more easy-to-use ones if you plan to integrate into webpages - which is the current API that I use for this website. See [here](https://covid-19.samsam123.name.my/api.html) for documentation._**

NOTE: this API is for more advanced users only who plans to use this JSON data for research purposes. This can also be used as a GitHub mirror of the API if you plan to develop webapps that grabs data if you encountered a problem with the API shown above.



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
sudo apt-get install jq imagemagick fonts-roboto
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

- More Data in different pages (example: Active Cases, Death Cases, etc.)

# Incorrect data or "No Data"?

Create an issue describing your problem.
