@ECHO OFF

SET url=https://www.route4me.com/api.v4/optimization_problem.php
SET apikey=bd48828717021141485a701453273458

ECHO ON

:: The example refers to the process of creating new route.

curl -o file1.txt -g -k -X POST -H "Content-Type: application/json" -d "@create_drone_route_data.json" "%url%?api_key=%apikey%"

timeout /t 30