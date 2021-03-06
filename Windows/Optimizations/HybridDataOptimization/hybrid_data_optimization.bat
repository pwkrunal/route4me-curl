@ECHO OFF

SET apikey=11111111111111111111111111111111

ECHO ON

:: The example demonstrates process of creating a Hybrid Optimization using scheduling addresses and orders.
:: Useful links:
:: http://support.route4me.com/route-planning-help.php?id=manual11:tutorial2:chapter7
:: http://support.route4me.com/route-planning-help.php?id=manual11:tutorial3:chapter12

:: ===== Add scheduled address book locations==========================================
SET url=http://www.route4me.com/api.v4/address_book.php

curl -o "output/add_scheduled_addressbook_contact_RESPONSE_1.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_1.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_scheduled_addressbook_contact_RESPONSE_2.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_2.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_scheduled_addressbook_contact_RESPONSE_3.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_3.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_scheduled_addressbook_contact_RESPONSE_4.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_4.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_scheduled_addressbook_contact_RESPONSE_5.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_5.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_scheduled_addressbook_contact_RESPONSE_6.json" -g -X POST -H "Content-Type: application/json" -d "@input/add_scheduled_addressbook_contact_data_6.json" "%url%?api_key=%apikey%"
:: ====================================================================================

:: ===== Add scheduled orders =========================================================
SET url=https://www.route4me.com/api.v4/order.php

START /WAIT curl -o "output/add_order_RESPONSE_1.json" -k -g -X POST -H "Content-Type: application/json" -d "@input/add_order_data_1.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_order_RESPONSE_2.json" -k -g -X POST -H "Content-Type: application/json" -d "@input/add_order_data_2.json" "%url%?api_key=%apikey%"

START /WAIT curl -o "output/add_order_RESPONSE_3.json" -k -g -X POST -H "Content-Type: application/json" -d "@input/add_order_data_3.json" "%url%?api_key=%apikey%"
:: ====================================================================================

:: ===== Get Hybrid Optimization ======================================================
SET url=https://www.route4me.com/api.v4/hybrid_date_optimization.php

SET "scheduled_data=2017-02-24"
SET tz_minutes=480
SET "houtput=output/get_hybrid_route_24_02_17_RESPONSE.json"

START /WAIT curl -o %houtput% -g -k -X GET "%url%?route_id=%routeid%&api_key=%apikey%&target_date_string=%scheduled_data%&timezone_offset_minutes=%tz_minutes%"

timeout /t 10
:: ====================================================================================

:: ===== Reoptimization ======================================================

:: jq-win64 is a JSON parser for batch scripts.  Manual: https://stedolan.github.io/jq/manual/

type "%houtput%" | jq-win64 ".optimization_problem_id" >"input/optimization_problem_id.txt"

set /p opt_id=<"input/optimization_problem_id.txt"

echo %opt_id%

SET url=https://www.route4me.com/api.v4/optimization_problem.php

START /WAIT curl -o "output/reoptimization_RESPONSE.json" -g -X PUT -k "%url%?api_key=%apikey%&optimization_problem_id=%opt_id%&reoptimize=1"

timeout /t 30
