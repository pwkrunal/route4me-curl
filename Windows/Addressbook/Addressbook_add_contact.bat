@ECHO OFF
SET url=http://www.route4me.com/api.v4/address_book.php
SET apikey=11111111111111111111111111111111

:: The example refers to the process of creating new location in an address book belonged to an user.

ECHO ON

curl -o file1.txt -g -X POST -H "Content-Type: application/json" -d "@new_address_data.json" "%url%?api_key=%apikey%"

timeout /t 30