@ECHO OFF

:: You should insert real test data and your API key for accurate testing

:: This example requires clarification. The response contains only one delete activity, not all

SET url=https://www.route4me.com/api/get_activities.php
SET apikey=11111111111111111111111111111111
SET act_type=delete-destination

ECHO ON
curl -o file1.txt -g -k -X GET "%URL%?api_key=%apikey%&activity_type=%act_type%"

timeout /t 30