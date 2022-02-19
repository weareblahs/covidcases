_(Please note that if you see this on https://weareblahs.github.io/covidcases, that means that the website isn't ready yet. Refresh in a minute.)_
<details>
<summary>See the screenshot of the website here</summary>
<br>
<img src="https://user-images.githubusercontent.com/37889443/154784214-d9cf58b3-ee59-4555-a28a-20ec26e04e9a.png"</img>
<h1 style="text-align: center;">Yes. This is how the website looks like. Nothing more, nothing less. Just the numbers.</h1>
</details>

# What's This?
This is a no-nonsense, straight-to-the-point page which shows only the new cases of COVID-19 in Malaysia.
## Data included
 - COVID-19 Cases
 - COVID-19 Deaths
## Technical specs?
Uses GitHub actions for all the processing with the batch scripts, which replaces the `No data` string in the HTML file to the latest cases.
# Other projects used in this project
 - [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) ([API](https://covid-19.samsam123.name.my/api/cases?date=latest) / [API documentation](https://covid-19.samsam123.name.my/api.html)) (Main source for data)
   - Data source based on MoH-Malaysia/covid19-public
 - [jq](https://github.com/stedolan/jq) (used to parse JSON data)
 - sed (used to find and replace placeholders)

# Where's the website?
https://weareblahs.github.io/covidcases

# Dark mode
This only works on computers which enables dark mode on Google Chrome / Mozilla Firefox. Dark mode won't be enabled on Android devices using Google Chrome, Safari untested.

# Automation (updating cases)
 This page will update everyday at these times. Reasons included.:
  - 12:00am (1 minute after COVIDNOW update time)
  - 10:00am (_"The daily case count will not be announced in the afternoon but will be released along with other data on Saturday at 10am."_  ([src](https://www.theedgemarkets.com/article/daily-covid19-numbers-wont-be-announced-separately-anymore-says-khairy)))
  - 3:00pm (Original reveal time according to MKN socials)
  - 7:00pm (Check if there's new data or not)
  - 10:00pm (Check if there's new data or not)

## Run with GitHub Actions under your own repository
Fork it, then run the "Update cases" workflow under Actions.
### Run locally (for Linux-based computers)
```bash
chmod +x localupdate.sh
./localupdate.sh
```
This will update all the HTML files by getting the data through cURL and replacing it in the HTML files.

The repository will update through GitHub Actions.

# Future plans
 - More Data in different pages (example: Active Cases, Death Cases, etc.)
