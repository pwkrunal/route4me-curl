@ECHO OFF

:: You should insert real test data and your API key for accurate testing

SET url=https://www.route4me.com/api/get_activities.php
SET apikey=11111111111111111111111111111111
SET routeid=DD376C7148E7FEE36CFABE2BD9978BDD
SET act_type=mark-destination-visited

ECHO ON
curl -o file1.txt -g -k -X GET "%url%?api_key=%apikey%&route_id=%routeid%&activity_type=%act_type%"

timeout /t 30