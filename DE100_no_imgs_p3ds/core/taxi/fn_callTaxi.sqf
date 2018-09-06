/*
	File:	fn_callTaxi.sqf
	Date:   2016-07-29 18:05:48
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_customer", objNull, [objNull]]
];

if (life_taxi_customers find [_customer, _customer call life_fnc_name] < 0) then {
	life_taxi_customers pushBack [_customer, _customer call life_fnc_name];
	[format ["%1 benötigt ein Taxi", _customer call life_fnc_name],false,"slow"] call life_fnc_notification_system;
};

