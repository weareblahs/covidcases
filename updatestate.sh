cd state
echo Removing old files...
rm cases_by_state.json
echo Removing old HTML files...
rm *.html
echo Removing old images...
rm ../img/cases_*.jpg
rm ../img/cases_*.png
rm ../img/deaths_*.jpg
rm ../img/deaths_*.png
echo Downloading new data...
curl -X GET -o cases_by_state.json https://covid-19.samsam123.name.my/api/state?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"

# Assign variables to states for sed usage
# Format: (code)c
# c = Cases
# Code list (states):
#  a = Kedah
#  b = Kelantan
#  c = Melaka
#  d = Negeri Sembilan
#  e = Pahang
#  f = Perak
#  g = Perlis
#  h = Pulau Pinang
#  i = Sabah
#  j = Sarawak
#  k = Selangor
#  l = Terengganu
# Code list (Federal territories):
#  m = Kuala Lumpur
#  n = Labuan
#  o = Putrajaya
aca=$( jq '.[] | select (.state=="Kedah") | .cases_new' cases_by_state.json )
ada=$( jq '.[] | select (.state=="Kedah") | .deaths_new' cases_by_state.json )
bca=$( jq '.[] | select (.state=="Kelantan") | .cases_new' cases_by_state.json )
cca=$( jq '.[] | select (.state=="Melaka") | .cases_new' cases_by_state.json )
dca=$( jq '.[] | select (.state=="Negeri Sembilan") | .cases_new' cases_by_state.json )
eca=$( jq '.[] | select (.state=="Pahang") | .cases_new' cases_by_state.json )
fca=$( jq '.[] | select (.state=="Perak") | .cases_new' cases_by_state.json )
gca=$( jq '.[] | select (.state=="Perlis") | .cases_new' cases_by_state.json )
hca=$( jq '.[] | select (.state=="Pulau Pinang") | .cases_new' cases_by_state.json )
ica=$( jq '.[] | select (.state=="Sabah") | .cases_new' cases_by_state.json )
jca=$( jq '.[] | select (.state=="Sarawak") | .cases_new' cases_by_state.json )
kca=$( jq '.[] | select (.state=="Selangor") | .cases_new' cases_by_state.json )
lca=$( jq '.[] | select (.state=="Terengganu") | .cases_new' cases_by_state.json )
mca=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .cases_new' cases_by_state.json )
nca=$( jq '.[] | select (.state=="W.P. Labuan") | .cases_new' cases_by_state.json )
oca=$( jq '.[] | select (.state=="W.P. Putrajaya") | .cases_new' cases_by_state.json )

# Remove quotes from cases / deaths
ac=$( echo "$aca" | sed -e 's/^"//' -e 's/"$//' )
bc=$( echo "$bca" | sed -e 's/^"//' -e 's/"$//' )
cc=$( echo "$cca" | sed -e 's/^"//' -e 's/"$//' )
dc=$( echo "$dca" | sed -e 's/^"//' -e 's/"$//' )
ec=$( echo "$eca" | sed -e 's/^"//' -e 's/"$//' )
fc=$( echo "$fca" | sed -e 's/^"//' -e 's/"$//' )
gc=$( echo "$gca" | sed -e 's/^"//' -e 's/"$//' )
hc=$( echo "$hca" | sed -e 's/^"//' -e 's/"$//' )
ic=$( echo "$ica" | sed -e 's/^"//' -e 's/"$//' )
jc=$( echo "$jca" | sed -e 's/^"//' -e 's/"$//' )
kc=$( echo "$kca" | sed -e 's/^"//' -e 's/"$//' )
lc=$( echo "$lca" | sed -e 's/^"//' -e 's/"$//' )
mc=$( echo "$mca" | sed -e 's/^"//' -e 's/"$//' )
nc=$( echo "$nca" | sed -e 's/^"//' -e 's/"$//' )
oc=$( echo "$oca" | sed -e 's/^"//' -e 's/"$//' )

# Set case / death date. All dates are the same so there is only 1 variable taken.
originaldatea=$( jq '.[] | select (.state=="Kedah") | .date' cases_by_state.json )
originaldate=$( echo "$originaldatea" | sed -e 's/^"//' -e 's/"$//' )
replaceddate=$( date -d "$originaldate" +"%d %B %Y")
dldate=$( date +"%d_%B_%Y_%H_%M_%S" )

statename="Kedah"
statesmall=kedah
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html

sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Kelantan"
statesmall=kelantan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Melaka"
statesmall=melaka
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Negeri Sembilan"
statesmall=sembilan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Pahang"
statesmall=pahang
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Perak"
statesmall=perak
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Perlis"
statesmall=perlis
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Pulau Pinang"
statesmall=penang
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Sabah"
statesmall=sabah
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Sarawak"
statesmall=sarawak
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Selangor"
statesmall=selangor
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Terengganu"
statesmall=terengganu
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Kuala Lumpur"
statesmall=kl
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Labuan"
statesmall=labuan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

statename="Putrajaya"
statesmall=putrajaya
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Removing temp files...
rm cases_by_state.json