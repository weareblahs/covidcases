chmod +x ./jq

rm cases
rm index.html
cp index_temp.html index.html
cp deaths/index_temp.html deaths/index.html

echo Grabbing the latest cases...
curl -X GET -o cases https://covid-19.samsam123.name.my/api/cases?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"
cases=$( ./jq -r ".cases_new" cases ) 
echo Replacing cases...
sed -i "s/No data/$cases/g" index.html

echo Grabbing latest deaths data...
curl -X GET -o deathsdata https://covid-19.samsam123.name.my/api/death?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"
deaths=$( ./jq -r ".deaths_new" deathsdata ) 
echo Replacing deaths...
cd deaths
sed -i "s/No data/$deaths/g" index.html
cd ../

echo Setting date and time as string and removing quotes...
dateandtime=$( date ) 
sed -i "s/INSERT_DATE_HERE/$dateandtime/g" index.html
sed -i 's/\"//g' index.html
cd deaths
sed -i "s/INSERT_DATE_HERE/$dateandtime/g" index.html
sed -i 's/\"//g' index.html
cd ../

echo Removing temporary files...
rm cases
rm deathsdata

echo Pushing to GitHub...
git config --global user.email "tanyuxuan2005@gmail.com"
git config --global user.name "weareblahs/covidcases auto update bot"
git add .
git commit -m "Update cases and deaths"
git push
