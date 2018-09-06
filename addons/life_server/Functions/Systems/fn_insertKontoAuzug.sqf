/*
	File : fn_insertKontoAuzug.sqf
	Date:   19.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

//Types 1=Abheben, 2=Einzahlen, 3=Transfer
params[
	["_sender", "", [""]],
	["_receiver", "", [""]],
	["_sender_name", "", [""]],
	["_receiver_name", "", [""]],
	["_type", -1, [0]],
	["_val", -1, [0]],
	["_ver", "", [""]],
	"_query"
];
_ver = [
	_ver,
	"Auszahlung",
	"Einzahlung",
	"Gang-Einzahlung",
	"Gang-Auszahlung"
] select _type;
_val = [_val] call life_fnc_number;
_query = format["INSERT INTO bank (sender, receiver, sender_name, receiver_name, type, menge, verwendungszweck, zeitpunkt) VALUES('%1', '%2', '%3','%4','%5', '%6','""%7""', DATE_FORMAT(SYSDATE(), '%8d-%8m-%8Y %8H:%8i:%8s') )",
_sender,
_receiver,
[_sender_name] call DB_fnc_mres,
[_receiver_name] call DB_fnc_mres,
_type,
_val,
_ver,
"%"
];
//diag_log format["Query: %1",_query];

[_query,1] call DB_fnc_asyncCall;
