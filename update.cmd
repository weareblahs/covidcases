@echo off

del cases
del index.html
copy index_temp.html index.html

curl -o cases "https://covid-19.samsam123.name.my/api/cases?date=latest"

for /f "delims=" %%i in ('backend\jsonextractor cases cases_new') do set cases_new=%%i >nul

fart index.html "No data" %cases_new%