# What's This?
This is a no-nonsense, straight-to-the-point page which only showing the new cases of COVID-19 in Malaysia.
## Technical specs?
Uses GitHub actions for all the processing with the batch scripts, which replaces the `No data` string in the HTML file to the latest cases.
# Other projects used in this project
 - [samleong123/COVID-19-Malaysia-API](https://github.com/samleong123/COVID-19-Malaysia-API) ([API](https://covid-19.samsam123.name.my/api/cases?date=latest) / [API documentation](https://covid-19.samsam123.name.my/api.html)) (Main source for data)
   - Data source based on MoH-Malaysia/covid19-public
 - [jq](https://github.com/stedolan/jq) (used to parse JSON data)
 - sed (used to find and replace placeholders)
# How to visit
https://weareblahs.github.io/covidcases

# Note
This repository will be updated automatically once the issue with CloudFlare was fixed with the API itself. This repository will update by itself at these times everyday when fixed:
 - 12:00am
 - 10:00am
 - 3:00pm
 - 7:00pm
 - 10:00pm

The repository will update through GitHub actions.

# Future plans
 - Dark Mode
 - More Data (example: Active Cases, Death Cases, etc.)
 - Color-themed website (Red for death, Green if less than 10k, etc.)
