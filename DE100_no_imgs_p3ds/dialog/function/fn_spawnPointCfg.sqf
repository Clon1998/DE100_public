/*
	File:   fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/

private["_side","_return","_uid","_posi","_marker"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_uid = (format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]);
		_return = [];
		if (bank_obj getvariable [_uid,""] isEqualType []) exitWith {
			_posi = bank_obj getvariable _uid;
			_marker = createMarkerLocal [format["%_marker",_uid],_posi];
			_marker setMarkerAlphaLocal 0;
			_return pushBack [format["%_marker",_uid],"Letzte Position","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
			_return;
		};
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\Diary\signal_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\Diary\signal_ca.paa"],
			["cop_spawn_4","Polizei Flughafen","\a3\ui_f\data\map\Diary\signal_ca.paa"],
			["cop_spawn_5","Polizei Außenposten","\a3\ui_f\data\map\Diary\signal_ca.paa"]
		];
		if((call life_coplevel) >= 8) then {
			_return pushBack ["cop_spawn_2","SEK HQ","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		};
	};
	
	case civilian:
	{
		
		// #5
		_uid = (format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]);
		_return = [];
		if (bank_obj getvariable [_uid,""] isEqualType []) exitWith {
			_posi = bank_obj getvariable _uid;
			_marker = createMarkerLocal [format["%_marker",_uid],_posi];
			_marker setMarkerAlphaLocal 0;
			_return pushBack [format["%_marker",_uid],"Letzte Position","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];

			if(call(life_nobody)>0)then{
				_return pushBack["nobody_spawn","Nobody Stützpunkt","\a3\ui_f\data\map\Diary\signal_ca.paa"];
			};

			_return;
		};
	
		_return pushBack ["civ_spawn_1","Kavala","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		_return pushBack ["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		_return pushBack ["civ_spawn_3","Athira","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		_return pushBack ["civ_spawn_4","Sofia","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		if (([0,"rebel"] call life_fnc_handleLicense) || ([0,"blackmarket"] call life_fnc_handleLicense)) then {
			_return pushBack ["Rebelop","Rebellenlager Nord","\a3\ui_f\data\map\Diary\signal_ca.paa"];
			_return pushBack ["Rebell_spawn","Rebellenlager West","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		};

		if(call(life_nobody)>0)then{
			_return pushBack["nobody_spawn","Nobody Stützpunkt","\a3\ui_f\data\map\Diary\signal_ca.paa"];
		};
		if(count life_houses > 0) then {
			{
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_return pushBack [format["house_%1",netId _x],_houseName,"\a3\ui_f\data\map\Diary\signal_ca.paa"];
			} foreach life_houses;
		};
		if (count ((group player) getVariable ["gang_HOUSES",[]]) > 0 && ((group player) getVariable ["gang_LEVEL",0]) >= 4) then {
			{
				_return pushBack [format["house_%1",netId _x],"Lagerhaus","\a3\ui_f\data\map\Diary\signal_ca.paa"];
			} forEach ((group player) getVariable ["gang_HOUSES",[]]);
		};
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Flughafen Außenposten","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Sofia Außenposten","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;