/*
	File:	fn_thrHandleRequest.sqf
	Date:   2016-12-28 01:45:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define MED 0
	#define CAR 1
	#define ACC 2
	#define DEC 3
*/


params[
	["_type", 0, [0]],
	["_unit", objNull, [objNull]]
];

switch (_type) do { 
	case 0 : {
		["ThrRequestMed",[format["%1 benötigt medizinische Hilfe",_unit call life_fnc_name]]] call BIS_fnc_showNotification;
	}; 
	case 1 : {
		["ThrRequestCar",[format["%1 benötigt technische Hilfe",_unit call life_fnc_name]]] call BIS_fnc_showNotification;
	};
	case 2 : {
		["TextMessage",["Ein THR-Mitglied ist auf dem Weg zu dir!"]] call BIS_fnc_showNotification;
	}; 
	case 3 : {
		["TextMessage",["Ein THR-Mitglied hat die Fahrt zu dir abgebrochen"]] call BIS_fnc_showNotification;
	};
};