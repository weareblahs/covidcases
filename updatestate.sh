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
# Format: (code)c/d
# c = Cases, d = Deaths
# For code on how to get deaths data, see section "Get deaths data"
# Code list (states):
# aa = Johor
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
aaca=$( jq '.[] | select (.state=="Johor") | .cases_new' cases_by_state.json )
aca=$( jq '.[] | select (.state=="Kedah") | .cases_new' cases_by_state.json )
ada=$( jq '.[] | select (.state=="Kedah") | .cases_new' cases_by_state.json )
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
aac=$( echo "$aaca" | sed -e 's/^"//' -e 's/"$//' )
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

# Get deaths data
curl -X GET -o deaths_by_state.json https://covid-19.samsam123.name.my/api/death_state?date=latest -H "User-Agent: weareblahs-covidcases/1.0.0" -H "Referer: https://github.com/weareblahs/covidcases"
aada=$( jq '.[] | select (.state=="Johor") | .deaths_new' deaths_by_state.json )
ada=$( jq '.[] | select (.state=="Kedah") | .deaths_new' deaths_by_state.json )
ada=$( jq '.[] | select (.state=="Kedah") | .deaths_new' deaths_by_state.json )
bda=$( jq '.[] | select (.state=="Kelantan") | .deaths_new' deaths_by_state.json )
cda=$( jq '.[] | select (.state=="Melaka") | .deaths_new' deaths_by_state.json )
dda=$( jq '.[] | select (.state=="Negeri Sembilan") | .deaths_new' deaths_by_state.json )
eda=$( jq '.[] | select (.state=="Pahang") | .deaths_new' deaths_by_state.json )
fda=$( jq '.[] | select (.state=="Perak") | .deaths_new' deaths_by_state.json )
gda=$( jq '.[] | select (.state=="Perlis") | .deaths_new' deaths_by_state.json )
hda=$( jq '.[] | select (.state=="Pulau Pinang") | .deaths_new' deaths_by_state.json )
ida=$( jq '.[] | select (.state=="Sabah") | .deaths_new' deaths_by_state.json )
jda=$( jq '.[] | select (.state=="Sarawak") | .deaths_new' deaths_by_state.json )
kda=$( jq '.[] | select (.state=="Selangor") | .deaths_new' deaths_by_state.json )
lda=$( jq '.[] | select (.state=="Terengganu") | .deaths_new' deaths_by_state.json )
mda=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .deaths_new' deaths_by_state.json )
nda=$( jq '.[] | select (.state=="W.P. Labuan") | .deaths_new' deaths_by_state.json )
oda=$( jq '.[] | select (.state=="W.P. Putrajaya") | .deaths_new' deaths_by_state.json )

aad=$( echo "$aada" | sed -e 's/^"//' -e 's/"$//' )
ad=$( echo "$ada" | sed -e 's/^"//' -e 's/"$//' )
bd=$( echo "$bda" | sed -e 's/^"//' -e 's/"$//' )
cd=$( echo "$cda" | sed -e 's/^"//' -e 's/"$//' )
dd=$( echo "$dda" | sed -e 's/^"//' -e 's/"$//' )
ed=$( echo "$eda" | sed -e 's/^"//' -e 's/"$//' )
fd=$( echo "$fda" | sed -e 's/^"//' -e 's/"$//' )
gd=$( echo "$gda" | sed -e 's/^"//' -e 's/"$//' )
hd=$( echo "$hda" | sed -e 's/^"//' -e 's/"$//' )
id=$( echo "$ida" | sed -e 's/^"//' -e 's/"$//' )
jd=$( echo "$jda" | sed -e 's/^"//' -e 's/"$//' )
kd=$( echo "$kda" | sed -e 's/^"//' -e 's/"$//' )
ld=$( echo "$lda" | sed -e 's/^"//' -e 's/"$//' )
md=$( echo "$mda" | sed -e 's/^"//' -e 's/"$//' )
nd=$( echo "$nda" | sed -e 's/^"//' -e 's/"$//' )
od=$( echo "$oda" | sed -e 's/^"//' -e 's/"$//' )

# Set case / death date. All dates are the same so there is only 1 variable taken.
originaldatea=$( jq '.[] | select (.state=="Kedah") | .date' cases_by_state.json )
originaldate=$( echo "$originaldatea" | sed -e 's/^"//' -e 's/"$//' )
replaceddate=$( date -d "$originaldate" +"%d %B %Y")
dldate=$( date +"%d_%B_%Y_%H_%M_%S" )

statename="Johor"
statesmall=johor
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$aac/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$aac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$ad/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$aad" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Kedah"
statesmall=kedah
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$ac/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$bd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ad" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Kelantan"
statesmall=kelantan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$bc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
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

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$bd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Melaka"
statesmall=melaka
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$cc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$cc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$cd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$cd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Negeri Sembilan"
statesmall=sembilan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$dc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$dc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$dd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$dd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Pahang"
statesmall=pahang
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$ec/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ec" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$ed/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ed" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Perak"
statesmall=perak
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/No data/$fc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$fc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$fd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$fd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Perlis"
statesmall=perlis
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$gc/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$gc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$gd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$gd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Pulau Pinang"
statesmall=penang
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$hc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$hc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$hd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$hd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Sabah"
statesmall=sabah
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$ic/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ic" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$id/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$id" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Sarawak"
statesmall=sarawak
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$jc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$jc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$jd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$jd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Selangor"
statesmall=selangor
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/No data/$kc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$kc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$kd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$kd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Terengganu"
statesmall=terengganu
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$lc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$lc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$ld/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ld" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Kuala Lumpur"
statesmall=kl
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$mc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$mc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$md/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$md" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Labuan"
statesmall=labuan
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/No data/$nc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$nc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$nd/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$nd" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

statename="Putrajaya"
statesmall=putrajaya
echo Generating $statename page...
cp state_template $statesmall.html
sed -i "s/STATENAME/$statename/g" $statesmall.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$oc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$oc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"

echo Generating $statename deaths page...
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$od/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/cases/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$od" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

echo Removing temp files...
rm cases_by_state.json
rm deaths_by_state.json