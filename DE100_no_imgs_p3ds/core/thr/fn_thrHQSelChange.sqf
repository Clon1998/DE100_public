/*
	File:	fn_thrHQSelChange.sqf
	Date:   2016-12-27 23:57:35
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_list", controlNull, [controlNull]],
	["_selected", [], [[]]],
	"_text",
	"_clerk"
];
private _unit = (objectFromNetId (_list tvData _selected));
if (!isNull _unit) then {
	[((findDisplay 3000) displayCtrl 3),0.5,0.01,getPos _unit] call life_fnc_setMapPosition;

	_clerk = (_unit getVariable ["thrClerk",objNull]);
	_text = if (!isNull _clerk) then {
		if (_clerk isEqualTo player) then {
			((findDisplay 3000) displayCtrl 8) ctrlEnable true;
			((findDisplay 3000) displayCtrl 8) ctrlSetText "Abbrechen";
			((findDisplay 3000) displayCtrl 8) buttonSetAction "[3] call life_fnc_thrAccept;";
		} else {
			((findDisplay 3000) displayCtrl 8) ctrlSetText "Annehmen";
			((findDisplay 3000) displayCtrl 8) ctrlEnable false;
			((findDisplay 3000) displayCtrl 8) buttonSetAction "[2] call life_fnc_thrAccept;";
		};
		_clerk call life_fnc_name;
	} else {
		((findDisplay 3000) displayCtrl 8) ctrlSetText "Annehmen";
		((findDisplay 3000) displayCtrl 8) ctrlEnable true;
		((findDisplay 3000) displayCtrl 8) buttonSetAction "[2] call life_fnc_thrAccept;";
		"Nein";
	};

	if (_selected select 0 == 0) then {
		((findDisplay 3000) displayCtrl 7) ctrlSetStructuredText parseText format["Name:<br/>%1<br/>THR auf dem weg:<br/>%2",_unit call life_fnc_name,_text];
	} else {
		((findDisplay 3000) displayCtrl 7) ctrlSetStructuredText parseText format["Name: %1<br/>THR auf dem weg: %2<br/>Fahrzeug: %3",_unit call life_fnc_name,_text,([typeOf (_unit getVariable ["requestveh",objNull])] call life_fnc_fetchVehInfo) select 3];
	};
} else {
	((findDisplay 3000) displayCtrl 8) ctrlSetText "Annehmen";
	((findDisplay 3000) displayCtrl 8) ctrlEnable false;
};