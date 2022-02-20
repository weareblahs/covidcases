rm cases
rm index.html
cp index_temp.html index.html
cp deaths/index_temp.html deaths/index.html

echo Getting date...
echo Grabbing the latest cases...
curl -X GET -o cases https://covid-19.samsam123.name.my/api/cases?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"
cases=$( jq -r ".cases_new" cases )
echo Getting date...
originalcasedate=$( jq -r ".date" cases )
replacedcasesdate=$( date -d "$originalcasedate" +"%d %B %Y")
echo Replacing cases...
sed -i "s/No data/$cases/g" index.html
sed -i "s/INSERT_DATE_HERE/$replacedcasesdate/g" index.html

echo Grabbing latest deaths data...
curl -X GET -o deathsdata https://covid-19.samsam123.name.my/api/death?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"
deaths=$( jq -r ".deaths_new" deathsdata )
echo Getting date...
originaldeathsdate=$( jq -r ".date" deathsdata )
replaceddeathsdate=$( date -d "$originaldeathsdate" +"%d %B %Y")
echo Replacing deaths...
cd deaths
sed -i "s/No data/$deaths/g" index.html
sed -i "s/INSERT_DATE_HERE/$replaceddeathsdate/g" index.html
cd ../

echo Setting date and time as string and removing quotes...
dateandtime=$( date ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" index.html
sed -i 's/\"//g' index.html
cd deaths
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" index.html
sed -i 's/\"//g' index.html
cd ../

echo Removing temporary files...
rm cases
rm deathsdata
