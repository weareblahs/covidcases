chmod +x ./jq

rm cases
rm index.html
cp index_temp.html index.html

echo Grabbing the latest cases...
content=$(curl -o cases 'https://covid-19.samsam123.name.my/api/cases?date=latest' -H 'authority: covid-19.samsam123.name.my' -H 'cache-control: max-age=0' -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"' -H 'sec-ch-ua-mobile: ?1' -H 'sec-ch-ua-platform: "Android"' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'sec-fetch-site: none' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'sec-fetch-dest: document' 'accept-language: en-US,en-MY;q=0.9,en;q=0.8,zh-TW;q=0.7,zh;q=0.6,ru;q=0.5' -H 'cookie: __cf_bm=gW83f26nz2MUhbdBHGyQmibrXZ51f04nzFs_QzpaBac-1645203194-0-AVWJF1w1ckzl6jCZ3tzGgrqqO6xN6StE83QV5KXle/4OMYkPfzmYrOHkbuTG1vdZHmBucGqY2aDr5L/+Fzh5Je9sPTONTW4Lp04q9D57oNJKm2LJYWDSwhCyytIBYhI1/w==' --compressed)
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

echo Pushing to GitHub...
git config --global user.email "tanyuxuan2005@gmail.com"
git config --global user.name "covidcases Update Bot"
git fetch
git add .
git commit -m "Updated on $date"
git push
