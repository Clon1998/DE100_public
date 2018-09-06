/*
	File:	fn_taxi_answer.sqf
	Date:   2016-07-29 19:57:29
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_mode", "", [""]]
];

private _display = findDisplay 13525;
private _customersListBox = _display displayCtrl 13526;
private _customer = objectFromNetId (_customersListBox lbData (lbCurSel _customersListBox));

if(isNil "_customer") exitWith {};
if(isNull _customer) exitWith {};

[_mode,player call life_fnc_name] remoteExecCall ["life_fnc_inform_customer",_customer];


closeDialog 0;