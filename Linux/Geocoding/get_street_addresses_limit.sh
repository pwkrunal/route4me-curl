#!/bin/bash

url=https://rapid.route4me.com/street_data
apikey=11111111111111111111111111111111
offset=0
limit=20

# get street data with limit and offset --- Attention, this doesn't work, needs clarification

curl -o file1.txt -g -X GET -k "$url/$offset/$limit/?api_key=$apikey"

echo "Finished..."

sleep 15