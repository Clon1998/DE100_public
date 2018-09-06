/*
	File: fn_invisible.sqf
	Author: Anton
	
	Description:
	Macht Admins sichtbar, oder auch unsichtbar.
*/

params[
	["_pass",'',['']],
	["_unit",objNull,[objNull]]
];

if(_pass!=AH_ADMIN_KEY)exitWith{};

if(isObjectHidden _unit)then{
	_unit hideObjectGlobal false;
	[format["Du bist ab sofort wieder sichtbar."],true,"fast"]remoteExecCall["life_fnc_notification_system",_unit];	
}else{
	_unit hideObjectGlobal true;
	[format["Du bist ab sofort unsichtbar."],false,"fast"]remoteExecCall["life_fnc_notification_system",_unit];
};