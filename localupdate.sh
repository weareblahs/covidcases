chmod +x ./jq

rm cases
rm index.html
cp index_temp.html index.html

echo Grabbing the latest cases...
content=$(curl -o cases 'https://covid-19.samsam123.name.my/api/cases?date=latest')
cases=$( ./jq -r ".cases_new" cases ) 
echo Replacing cases...
sed -i "s/No data/$cases/g" index.html
echo Setting date and time as string...
dateandtime=$( date ) 
sed -i "s/INSERT_DATE_HERE/$dateandtime/g" index.html
echo Removing quotes...
sed -i 's/\"//g' index.html

echo Removing temporary files...
rm cases
echo
echo
echo Please run:
echo "postlocalupdate_win.cmd" for Windows
echo "chmod +x postlocalupdate.sh && ./postlocalupdate.sh" for UNIX-based systems
echo to push latest results to weareblahs/covidcases repository (or forked repository)