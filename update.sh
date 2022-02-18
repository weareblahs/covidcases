rm cases
rm index.html
cp index_temp.html index.html

content=$(curl -o cases https://covid-19.samsam123.name.my/api/cases?date=latest) 
cases=$( ./jq ".cases_new" cases ) 

sed -i "s/No data/$cases/g" index.html
sed -i 's/\"//g' index.html

rm cases