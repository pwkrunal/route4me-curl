#!/bin/bash

url=https://www.route4me.com/api/vehicles/view_vehicles.php
apikey=11111111111111111111111111111111

# The example refers to the process of getting a list of the vehicles.

curl -o file1.txt -g -X GET -k "$url?api_key=$apikey"

echo "Finished..."

sleep 15
