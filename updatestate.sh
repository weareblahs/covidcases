cd state
echo Removing old files...
rm tempcsvdata
rm cases_by_state.json
echo Removing old HTML files...
rm *.html
echo Removing old images...
rm ../img/cases_*.jpg
rm ../img/cases_*.png
rm ../img/deaths_*.jpg
rm ../img/deaths_*.png
echo Downloading new data...
curl -L -o tempcsvdata https://github.com/MoH-Malaysia/covid19-public/raw/main/epidemic/cases_state.csv

# Create JSON file from CSV
jsondata=$( tail -n 16 tempcsvdata| \
jq --slurp --raw-input --raw-output \
    'split("\n") | .[1:] | map(split(",")) |
        map({"date": .[0],
             "state": .[1],
             "cases_new": .[2],
             "deaths_new": .[3]})' )

# Export raw data to JSON file
echo $jsondata >> cases_by_state.json

# Assign variables to states for sed usage
# Format: (code)c/d
# c = Cases, d = Deaths
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
bda=$( jq '.[] | select (.state=="Kelantan") | .deaths_new' cases_by_state.json )
cca=$( jq '.[] | select (.state=="Melaka") | .cases_new' cases_by_state.json )
cda=$( jq '.[] | select (.state=="Melaka") | .deaths_new' cases_by_state.json )
dca=$( jq '.[] | select (.state=="Negeri Sembilan") | .cases_new' cases_by_state.json )
dda=$( jq '.[] | select (.state=="Negeri Sembilan") | .deaths_new' cases_by_state.json )
eca=$( jq '.[] | select (.state=="Pahang") | .cases_new' cases_by_state.json )
eda=$( jq '.[] | select (.state=="Pahang") | .deaths_new' cases_by_state.json )
fca=$( jq '.[] | select (.state=="Perak") | .cases_new' cases_by_state.json )
fda=$( jq '.[] | select (.state=="Perak") | .deaths_new' cases_by_state.json )
gca=$( jq '.[] | select (.state=="Perlis") | .cases_new' cases_by_state.json )
gda=$( jq '.[] | select (.state=="Perlis") | .deaths_new' cases_by_state.json )
hca=$( jq '.[] | select (.state=="Pulau Pinang") | .cases_new' cases_by_state.json )
hda=$( jq '.[] | select (.state=="Pulau Pinang") | .deaths_new' cases_by_state.json )
ica=$( jq '.[] | select (.state=="Sabah") | .cases_new' cases_by_state.json )
ida=$( jq '.[] | select (.state=="Sabah") | .deaths_new' cases_by_state.json )
jca=$( jq '.[] | select (.state=="Sarawak") | .cases_new' cases_by_state.json )
jda=$( jq '.[] | select (.state=="Sarawak") | .deaths_new' cases_by_state.json )
kca=$( jq '.[] | select (.state=="Selangor") | .cases_new' cases_by_state.json )
kda=$( jq '.[] | select (.state=="Selangor") | .deaths_new' cases_by_state.json )
lca=$( jq '.[] | select (.state=="Terengganu") | .cases_new' cases_by_state.json )
lda=$( jq '.[] | select (.state=="Terengganu") | .deaths_new' cases_by_state.json )
mca=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .cases_new' cases_by_state.json )
mda=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .deaths_new' cases_by_state.json )
nca=$( jq '.[] | select (.state=="W.P. Labuan") | .cases_new' cases_by_state.json )
nda=$( jq '.[] | select (.state=="W.P. Labuan") | .deaths_new' cases_by_state.json )
oca=$( jq '.[] | select (.state=="W.P. Putrajaya") | .cases_new' cases_by_state.json )
oda=$( jq '.[] | select (.state=="W.P. Putrajaya") | .deaths_new' cases_by_state.json )

# Remove quotes from cases / deaths
ac=$( sed -e 's/^"//' -e 's/"$//' <<<"$aca" )
ad=$( sed -e 's/^"//' -e 's/"$//' <<<"$ada" )
bc=$( sed -e 's/^"//' -e 's/"$//' <<<"$bca" )
bd=$( sed -e 's/^"//' -e 's/"$//' <<<"$bda" )
cc=$( sed -e 's/^"//' -e 's/"$//' <<<"$cca" )
cd=$( sed -e 's/^"//' -e 's/"$//' <<<"$cda" )
dc=$( sed -e 's/^"//' -e 's/"$//' <<<"$dca" )
dd=$( sed -e 's/^"//' -e 's/"$//' <<<"$dda" )
ec=$( sed -e 's/^"//' -e 's/"$//' <<<"$eca" )
ed=$( sed -e 's/^"//' -e 's/"$//' <<<"$eda" )
fc=$( sed -e 's/^"//' -e 's/"$//' <<<"$fca" )
fd=$( sed -e 's/^"//' -e 's/"$//' <<<"$fda" )
gc=$( sed -e 's/^"//' -e 's/"$//' <<<"$gca" )
gd=$( sed -e 's/^"//' -e 's/"$//' <<<"$gda" )
hc=$( sed -e 's/^"//' -e 's/"$//' <<<"$hca" )
hd=$( sed -e 's/^"//' -e 's/"$//' <<<"$hda" )
ic=$( sed -e 's/^"//' -e 's/"$//' <<<"$ica" )
id=$( sed -e 's/^"//' -e 's/"$//' <<<"$ida" )
jc=$( sed -e 's/^"//' -e 's/"$//' <<<"$jca" )
jd=$( sed -e 's/^"//' -e 's/"$//' <<<"$jda" )
kc=$( sed -e 's/^"//' -e 's/"$//' <<<"$kca" )
kd=$( sed -e 's/^"//' -e 's/"$//' <<<"$kda" )
lc=$( sed -e 's/^"//' -e 's/"$//' <<<"$lca" )
ld=$( sed -e 's/^"//' -e 's/"$//' <<<"$lda" )
mc=$( sed -e 's/^"//' -e 's/"$//' <<<"$mca" )
md=$( sed -e 's/^"//' -e 's/"$//' <<<"$mda" )
nc=$( sed -e 's/^"//' -e 's/"$//' <<<"$nca" )
nd=$( sed -e 's/^"//' -e 's/"$//' <<<"$nda" )
oc=$( sed -e 's/^"//' -e 's/"$//' <<<"$oca" )
od=$( sed -e 's/^"//' -e 's/"$//' <<<"$oda" )

# Set case / death date. All dates are the same so there is only 1 variable taken.
originaldatea=$( jq '.[] | select (.state=="Kedah") | .date' cases_by_state.json )
originaldate=$( sed -e 's/^"//' -e 's/"$//' <<<"$originaldatea" )
replaceddate=$( date -d "$originaldate" +"%d %B %Y")
dldate=$( date +"%d_%B_%Y_%H_%M_%S" )

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
cp state_template $statesmall-d.html
sed -i "s/STATENAME/$statename/g" $statesmall-d.html
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall-d.html
sed -i "s/No data/$ad/g" $statesmall-d.html
sed -i "s/TYPE/deaths/g" $statesmall-d.html
sed -i "s/RURL/$statesmall/g" $statesmall-d.html
sed -i "s/REV/deaths/g" $statesmall-d.html
sed -i "s/TYPE2/cases/g" $statesmall-d.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall-d.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall-d.html
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$bc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$cc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$dc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ec" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/No data/$fc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$fc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$gc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$hc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$hc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ic" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$jc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/No data/$kc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$kc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
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
sed -i "s/INSERT_DATE_HERE/$replaceddate/g" $statesmall.html
sed -i "s/No data/$lc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$lc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of" \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+80 "$replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$mc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/No data/$nc/g" $statesmall.html
sed -i "s/TYPE/cases/g" $statesmall.html
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$nc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
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
sed -i "s/RURL/$statesmall-d/g" $statesmall.html
sed -i "s/REV/deaths/g" $statesmall.html
sed -i "s/DOWNLOAD_DATE/$dldate/g" $statesmall.html
dateandtime=$( date +"%d %B %Y on %H:%M:%S (MYT)" ) 
sed -i "s/INSERT_GENERATE_DATE_HERE/$dateandtime/g" $statesmall.html
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
echo Generating $statename cases image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$oc" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/cases_$statename.png"
convert "../img/cases_$statename.png" -quality 100 "../img/cases_$statename.jpg"
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 deaths in $statename as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$od" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
"../img/deaths_$statename.png"
convert "../img/deaths_$statename.png" -quality 100 "../img/deaths_$statename.jpg"

echo Removing temp files...
rm tempcsvdata
rm cases_by_state.json