chmod +x ./jq

rm cases
rm index.html
cp index_temp.html index.html

echo Grabbing the latest cases...
wget -O cases "https://api.samsam123.name.my/covid-19/cases.php?date=latest"
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


