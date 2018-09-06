/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
params[
	["_radar", objNull, [objNull]]
];
if (isNull _radar) exitWith {closeDialog 0;};

createDialog "radarfalle";

disableSerialization;
private _display = findDisplay 1000;
private _name = _display displayCtrl 1001;
private _limit = _display displayCtrl 1002;
private _Btn1 = _display displayCtrl 1003;
private _Btn2 = _display displayCtrl 1004;
private _Btn3 = _display displayCtrl 1005;

private _manager = _radar getVariable ["manager", ""];
_name ctrlSetStructuredText parseText format["<t align='center'>%1</t></t>",_manager];

private _setLimit = _radar getVariable ["limit", 50];
_limit ctrlSetText format ["%1",_setLimit];

if(_radar getVariable ["enabled", true]) then {
	_Btn1 ctrlSetText format["Deaktivieren"];
	_Btn1 buttonSetAction format["closeDialog 0;objectFromNetId '%1' setVariable ['enabled',false,true];['Deaktiviert',false,'fast'] call life_fnc_notification_system;",netId _radar];
}else{
	_Btn1 ctrlSetText format["Aktivieren"];
	_Btn1 buttonSetAction format["closeDialog 0;objectFromNetId '%1' setVariable ['enabled',true,true];['Aktiviert',false,'fast'] call life_fnc_notification_system;",netId _radar];
};
_Btn2 ctrlSetText format["Geschwindigkeit setzen"];
_Btn2 buttonSetAction format["objectFromNetId '%1' setVariable['limit',parseNumber (ctrlText 1002) max 10,true];['Geschwindigkeit gesetzt',false,'fast'] call life_fnc_notification_system;closeDialog 0;",netId _radar];

_Btn3 ctrlSetText format["Abbauen"];
_Btn3 buttonSetAction format["closeDialog 0;[objectFromNetId '%1'] spawn life_fnc_radarRemove;",netId _radar];