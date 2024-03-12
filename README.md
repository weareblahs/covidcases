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

- [tweepy](https://github.com/tweepy/tweepy) (used for Twitter bot updating)

# App icon / Favicon

Credits to [clipartpng.com](https://clipartpng.com/?3346,blue-face-mask-clipart-png-image) for the original icon. Modified to mask the icon.

# Website versions

There are 2 versions of this website:

- Static version. This version contains a HTML file that auto-updates through GitHub Actions every 12 hours. Visit it [here](https://weareblahs.github.io/covidcases). (Available for both nationwide and states)

- Realtime version. Your browser will contact the API every visit and use it to update the status. Refresh it to get new information. Visit it [here](https://weareblahs.github.io/covidcases/dynamic). (Available for both nationwide and states)

## Additional versions

- Twitter version, which is available on [@MYCovidCasesBot](https://twitter.com/MYCOVIDCasesBot). Tweets the latest cases, along with images as a thread. Runs everyday 10am (MYT).

- Mastodon version, which is available on [@myccbot](https://botsin.space/@myccbot) via botsin.space. Posts the latest cases, along with images as posts. Runs everyday 10am (MYT).

## Data types

- Nationwide

- States
  
  - A list of states can be triggered by clicking / tapping the "More statistics" page.

### Data availability

| Data type  | Cases | Deaths |
| ---------- | ----- | ------ |
| Nationwide | Yes   | Yes    |
| State      | Yes   | Yes    |

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

# Dark mode

If you enabled dark theme on systemwide settings, then you should get dark mode when visiting this page on your device. Should be working on most modern browsers (Tested browsers including Chronium-based ones and Safari).

# Automation (updating cases)

 This page will update every hour.

## Run with GitHub Actions under your own repository

Fork it, then run the "Update cases" workflow under Actions.

### Run locally (for Linux-based computers)
First, **make a copy or clone the repository** if you haven't did that yet.

#### Before you run
Make sure you have the presiqutes installed.

```bash
sudo apt-get install jq imagemagick
```
#### Start updating
First, update the cases:
```bash
chmod +x update.sh
./update.sh
```
Then, update the state cases:
```bash
chmod +x updatestate.sh
./updatestate.sh
```

#### After you run?
Please note that if you want to host this in your web server, do note that the root directory of this repository is the root directory of the website itself. If you want to visit locally, you can just directly open `index.html`.

# Future plans

(currently no plans)

# Incorrect data or "No Data"?

Create an issue describing your problem.
