@echo off
# Pre-update stuffs
del cases
del index.html
copy index_temp.html index.html

# Start download data
curl -o cases "https://covid-19.samsam123.name.my/api/cases?date=latest"

# Import cases
for /f "delims=" %%i in ('backend\jsonextractor cases cases_new') do set cases_new=%%i >nul

# Replace data?
fart index.html "No data" %cases_new%