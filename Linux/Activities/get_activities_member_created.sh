#!/bin/bash

# You should insert real test data and your API key for accurate testing

url=https://www.route4me.com/api/get_activities.php
apikey=11111111111111111111111111111111
act_type=member-created

curl -o file1.txt -g -k -X GET "$url?api_key=$apikey&activity_type=$act_type"

echo "Finished..."

sleep 15
