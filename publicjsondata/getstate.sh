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
ac=$( echo "$aca" | sed -e 's/^"//' -e 's/"$//' )
ad=$( echo "$ada" | sed -e 's/^"//' -e 's/"$//' )
bc=$( echo "$bca" | sed -e 's/^"//' -e 's/"$//' )
bd=$( echo "$bda" | sed -e 's/^"//' -e 's/"$//' )
cc=$( echo "$cca" | sed -e 's/^"//' -e 's/"$//' )
cd=$( echo "$cda" | sed -e 's/^"//' -e 's/"$//' )
dc=$( echo "$dca" | sed -e 's/^"//' -e 's/"$//' )
dd=$( echo "$dda" | sed -e 's/^"//' -e 's/"$//' )
ec=$( echo "$eca" | sed -e 's/^"//' -e 's/"$//' )
ed=$( echo "$eda" | sed -e 's/^"//' -e 's/"$//' )
fc=$( echo "$fca" | sed -e 's/^"//' -e 's/"$//' )
fd=$( echo "$fda" | sed -e 's/^"//' -e 's/"$//' )
gc=$( echo "$gca" | sed -e 's/^"//' -e 's/"$//' )
gd=$( echo "$gda" | sed -e 's/^"//' -e 's/"$//' )
hc=$( echo "$hca" | sed -e 's/^"//' -e 's/"$//' )
hd=$( echo "$hda" | sed -e 's/^"//' -e 's/"$//' )
ic=$( echo "$ica" | sed -e 's/^"//' -e 's/"$//' )
id=$( echo "$ida" | sed -e 's/^"//' -e 's/"$//' )
jc=$( echo "$jca" | sed -e 's/^"//' -e 's/"$//' )
jd=$( echo "$jda" | sed -e 's/^"//' -e 's/"$//' )
kc=$( echo "$kca" | sed -e 's/^"//' -e 's/"$//' )
kd=$( echo "$kda" | sed -e 's/^"//' -e 's/"$//' )
lc=$( echo "$lca" | sed -e 's/^"//' -e 's/"$//' )
ld=$( echo "$lda" | sed -e 's/^"//' -e 's/"$//' )
mc=$( echo "$mca" | sed -e 's/^"//' -e 's/"$//' )
md=$( echo "$mda" | sed -e 's/^"//' -e 's/"$//' )
nc=$( echo "$nca" | sed -e 's/^"//' -e 's/"$//' )
nd=$( echo "$nda" | sed -e 's/^"//' -e 's/"$//' )
oc=$( echo "$oca" | sed -e 's/^"//' -e 's/"$//' )
od=$( echo "$oda" | sed -e 's/^"//' -e 's/"$//' )