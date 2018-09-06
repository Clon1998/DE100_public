/*
	File:	fn_openMenu.sqf
	Date:   2016-10-05 21:00:49
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Opens the Interaction-Menu after fn_addAction added all actions to a very cool array.
	Need to write this shit now.
*/

disableSerialization;
params[
	["_object", objNull, [objNull]],
	["_actions", [], [[]]],
	["_titel", "", [""]],
	"_ctrl"
];

if (count _actions == 0) exitwith {
	["Keine Interaktion möglich",true,"fast"] call life_fnc_notification_system;
};
_actions sort false;

if(!dialog) then {
	createDialog "pInteraction_Menu";
	setMousePosition [0.5, 0.5];
};

((findDisplay 37400) displayCtrl 37401) ctrlSetText _titel;

for "_i" from 37450 to 37460 do {
	_ctrl = (findDisplay 37400) displayCtrl _i;
	_ctrl ctrlSetText "";
	_ctrl buttonSetAction "";
	_ctrl ctrlShow false;
};

private _startIDC = 37450;
{
	_ctrl = (findDisplay 37400) displayCtrl _startIDC;

	_ctrl ctrlSetText (_x select 1);
	_ctrl ctrlShow true;
	_ctrl buttonSetAction format ["%1",_x select 2];

	_startIDC = _startIDC + 1;
} forEach _actions;