/*
	File:	fn_civMarker.sqf
	Date:   26.10.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

if ((player getVariable ["restrained",false])) exitWith {};

private ["_markers","_cops","_grpmembers","_name","_text","_fuel"];
_markers = [];
_cops = [player];
_grpmembers = units (group player);

{
	if (!(_x getVariable ["restrained",false]) && alive _x) then {
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorCivilian";
		_marker setMarkerTypeLocal "mil_triangle";
		_marker setMarkerTextLocal format["%1", _x call life_fnc_name];
		_markers pushBack [_marker,_x];
	};
	nil;
} count _grpmembers;

if (life_civjob == 1) then {
	if !(life_created_tank_marker) then {
		{
			_pos = _x select 2;
			_name = format["tank_%1",_x select 0];
			_marker = createMarkerLocal [_name, _pos]; 
			_marker setMarkerTypeLocal "mil_dot";	
		} forEach tankstellen;
		life_created_tank_marker = true;
	};

   	{
		_name = format["tank_%1",_x select 0];
		_text = format["Tankstand: %1L",_x select 1];
		_fuel = _x select 1;
		if(_fuel > 40000)then{
			_name setMarkerColorLocal "ColorGreen";
		};
		if(_fuel < 40000)then{
			_name setMarkerColorLocal "ColorYellow";
		};
		if(_fuel < 10000)then{
			_name setMarkerColorLocal "ColorRed";
		};
		_name setMarkerTextLocal _text;
		
	} forEach tankstellen;
} else {
	if (life_created_tank_marker) then {
		life_created_tank_marker = false;
		{
			_name = format["tank_%1",_x select 0];
			deleteMarkerLocal _name;
		} foreach tankstellen;
	};
};

{
	if (!isNil "_x") then {
		if (!isNull _x && alive _x) then {
			_marker = createMarkerLocal [format["%_gpsTracker",netId _x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerTextLocal format["GPS-Signal: %1", getText(configFile>>'CfgVehicles'>>(typeOf _x)>>'displayName')];
			_markers pushBack [_marker,_x];
		};
	};
	nil;
} count life_gps_tracking;

while {visibleMap;} do
{
	{
		_x params[
			["_marker", "", [""]],
			["_unit", objNull,[objNull]]
		];

		if (!isNull _unit) then {
			_marker setMarkerPosLocal (visiblePosition _unit);
			_marker setMarkerDirLocal (getDir _unit);
		};
		nil;
	} count _markers;
	if(!visibleMap) exitWith {};
};

{deleteMarkerLocal (_x select 0);nil;} count _markers;