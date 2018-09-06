/*
	File:	fn_inform_customer.sqf
	Date:   2016-07-29 20:02:48
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_mode", "", [""]],
	["_taxiDriver", "", [""]]
];

if (_mode isEqualTo "accept") then {
	["TextMessage",[format["Ein Taxifahrer (%1) ist auf dem Weg",_taxiDriver]]] call bis_fnc_showNotification;
	player setVariable ["inTaxi",true,true];
	player setVariable ["TaxiDriver",_taxiDriver,true];
} else {
	["TextMessage",[format["%1 hat die Fahrt zu ihnen abgebrochen!",_taxiDriver]]] call bis_fnc_showNotification;
	player setVariable ["inTaxi",false,true];
	player setVariable ["TaxiDriver",nil,true];
};