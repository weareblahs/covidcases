chmod +x ./jq

rm cases
rm index.html
cp index_temp.html index.html
cp deaths/index_temp.html deaths/index.html

echo Grabbing the latest cases...
wget -O cases "https://api.samsam123.name.my/covid-19/cases.php?date=latest"
cases=$( ./jq -r ".cases_new" cases ) 
echo Replacing cases...
sed -i "s/No data/$cases/g" index.html

echo Grabbing latest deaths data...
wget -O deathsdata "https://api.samsam123.name.my/covid-19/death.php?date=latest"
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
echo
echo
echo Please run:
echo "postlocalupdate_win.cmd" for Windows
echo "chmod +x postlocalupdate.sh && ./postlocalupdate.sh" for UNIX-based systems
echo to push latest results to weareblahs/covidcases repository (or forked repository)