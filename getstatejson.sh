cd state
echo Removing old files...
rm tempcsvdata
rm cases_by_state.json
rm *.html
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
ac=$( jq '.[] | select (.state=="Kedah") | .cases_new' cases_by_state.json )
ad=$( jq '.[] | select (.state=="Kedah") | .deaths_new' cases_by_state.json )
bc=$( jq '.[] | select (.state=="Kelantan") | .cases_new' cases_by_state.json )
bd=$( jq '.[] | select (.state=="Kelantan") | .deaths_new' cases_by_state.json )
cc=$( jq '.[] | select (.state=="Melaka") | .cases_new' cases_by_state.json )
cd=$( jq '.[] | select (.state=="Melaka") | .deaths_new' cases_by_state.json )
dc=$( jq '.[] | select (.state=="Negeri Sembilan") | .cases_new' cases_by_state.json )
dd=$( jq '.[] | select (.state=="Negeri Sembilan") | .deaths_new' cases_by_state.json )
ec=$( jq '.[] | select (.state=="Pahang") | .cases_new' cases_by_state.json )
ed=$( jq '.[] | select (.state=="Pahang") | .deaths_new' cases_by_state.json )
fc=$( jq '.[] | select (.state=="Perak") | .cases_new' cases_by_state.json )
fd=$( jq '.[] | select (.state=="Perak") | .deaths_new' cases_by_state.json )
gc=$( jq '.[] | select (.state=="Perlis") | .cases_new' cases_by_state.json )
gd=$( jq '.[] | select (.state=="Perlis") | .deaths_new' cases_by_state.json )
hc=$( jq '.[] | select (.state=="Pulau Pinang") | .cases_new' cases_by_state.json )
hd=$( jq '.[] | select (.state=="Pulau Pinang") | .deaths_new' cases_by_state.json )
ic=$( jq '.[] | select (.state=="Sabah") | .cases_new' cases_by_state.json )
id=$( jq '.[] | select (.state=="Sabah") | .deaths_new' cases_by_state.json )
jc=$( jq '.[] | select (.state=="Sarawak") | .cases_new' cases_by_state.json )
jd=$( jq '.[] | select (.state=="Sarawak") | .deaths_new' cases_by_state.json )
kc=$( jq '.[] | select (.state=="Selangor") | .cases_new' cases_by_state.json )
kd=$( jq '.[] | select (.state=="Selangor") | .deaths_new' cases_by_state.json )
lc=$( jq '.[] | select (.state=="Terengganu") | .cases_new' cases_by_state.json )
ld=$( jq '.[] | select (.state=="Terengganu") | .deaths_new' cases_by_state.json )
mc=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .cases_new' cases_by_state.json )
md=$( jq '.[] | select (.state=="W.P. Kuala Lumpur") | .deaths_new' cases_by_state.json )
nc=$( jq '.[] | select (.state=="W.P. Labuan") | .cases_new' cases_by_state.json )
nd=$( jq '.[] | select (.state=="W.P. Labuan") | .deaths_new' cases_by_state.json )
oc=$( jq '.[] | select (.state=="W.P. Putrajaya") | .cases_new' cases_by_state.json )
od=$( jq '.[] | select (.state=="W.P. Putrajaya") | .deaths_new' cases_by_state.json )

# Remove quotes from cases / deaths
ac=$( sed -e 's/^"//' -e 's/"$//' <<<"$ac" )
ad=$( sed -e 's/^"//' -e 's/"$//' <<<"$ad" )
bc=$( sed -e 's/^"//' -e 's/"$//' <<<"$bc" )
bd=$( sed -e 's/^"//' -e 's/"$//' <<<"$bd" )
cc=$( sed -e 's/^"//' -e 's/"$//' <<<"$cc" )
cd=$( sed -e 's/^"//' -e 's/"$//' <<<"$cd" )
dc=$( sed -e 's/^"//' -e 's/"$//' <<<"$dc" )
dd=$( sed -e 's/^"//' -e 's/"$//' <<<"$dd" )
ec=$( sed -e 's/^"//' -e 's/"$//' <<<"$ec" )
ed=$( sed -e 's/^"//' -e 's/"$//' <<<"$ed" )
fc=$( sed -e 's/^"//' -e 's/"$//' <<<"$fc" )
fd=$( sed -e 's/^"//' -e 's/"$//' <<<"$fd" )
gc=$( sed -e 's/^"//' -e 's/"$//' <<<"$gc" )
gd=$( sed -e 's/^"//' -e 's/"$//' <<<"$gd" )
hc=$( sed -e 's/^"//' -e 's/"$//' <<<"$hc" )
hd=$( sed -e 's/^"//' -e 's/"$//' <<<"$hd" )
ic=$( sed -e 's/^"//' -e 's/"$//' <<<"$ic" )
id=$( sed -e 's/^"//' -e 's/"$//' <<<"$id" )
jc=$( sed -e 's/^"//' -e 's/"$//' <<<"$jc" )
jd=$( sed -e 's/^"//' -e 's/"$//' <<<"$jd" )
kc=$( sed -e 's/^"//' -e 's/"$//' <<<"$kc" )
kd=$( sed -e 's/^"//' -e 's/"$//' <<<"$kd" )
lc=$( sed -e 's/^"//' -e 's/"$//' <<<"$lc" )
ld=$( sed -e 's/^"//' -e 's/"$//' <<<"$ld" )
mc=$( sed -e 's/^"//' -e 's/"$//' <<<"$mc" )
md=$( sed -e 's/^"//' -e 's/"$//' <<<"$md" )
nc=$( sed -e 's/^"//' -e 's/"$//' <<<"$nc" )
nd=$( sed -e 's/^"//' -e 's/"$//' <<<"$nd" )
oc=$( sed -e 's/^"//' -e 's/"$//' <<<"$oc" )
od=$( sed -e 's/^"//' -e 's/"$//' <<<"$od" )

# Set case / death date. All dates are the same so there is only 1 variable taken.
originaldate=$( jq '.[] | select (.state=="Kedah") | .date' cases_by_state.json )
originaldate=$( sed -e 's/^"//' -e 's/"$//' <<<"$originaldate" )
replaceddate=$( date -d "$originaldate" +"%d %B %Y")
dldate=$( date +"%d_%B_%Y_%H_%M_%S" )

statename=Kedah
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
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/cases_$statesmall.png
convert ../img/cases_$statesmall.png -quality 100 ../img/cases_$statesmall.jpg
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/deaths_$statesmall.png
convert ../img/deaths_$statesmall.png -quality 100 ../img/deaths_$statesmall.jpg

statename=Kelantan
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
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/cases_$statesmall.png
convert ../img/cases_$statesmall.png -quality 100 ../img/cases_$statesmall.jpg
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/deaths_$statesmall.png
convert ../img/deaths_$statesmall.png -quality 100 ../img/deaths_$statesmall.jpg

statename=Melaka
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
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/cases_$statesmall.png
convert ../img/cases_$statesmall.png -quality 100 ../img/cases_$statesmall.jpg
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/deaths_$statesmall.png
convert ../img/deaths_$statesmall.png -quality 100 ../img/deaths_$statesmall.jpg

statename="Negeri Sembilan"
statesmall=sembilan
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
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/cases_$statesmall.png
convert ../img/cases_$statesmall.png -quality 100 ../img/cases_$statesmall.jpg
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/deaths_$statesmall.png
convert ../img/deaths_$statesmall.png -quality 100 ../img/deaths_$statesmall.jpg

statename=Pahang
statesmall=pahang
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
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/cases_$statesmall.png
convert ../img/cases_$statesmall.png -quality 100 ../img/cases_$statesmall.jpg
echo Generating $statename deaths image...
convert ../img/blankimage.png \
-font ../img/HelveticaNeue-Medium.otf -gravity North -fill white -pointsize 30 -annotate +0+40 "COVID-19 cases in $state as of $replaceddate" \
-font ../img/HelveticaNeue-Bold.otf -gravity Center -fill white -pointsize 180 -annotate +0+16 "$ac" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southeast -fill white -pointsize 15 -annotate +0+0 "Generated at $dateandtime" \
-font ../img/HelveticaNeue-Medium.otf -gravity Southwest -fill white -pointsize 15 -annotate +0+0 "https://weareblahs.github.io/covidcases" \
../img/deaths_$statesmall.png
convert ../img/deaths_$statesmall.png -quality 100 ../img/deaths_$statesmall.jpg

echo Removing temp files...
rm tempcsvdata
rm cases_by_state.json