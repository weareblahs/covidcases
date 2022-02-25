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
echo $jsondata >>> state_latest_simplified