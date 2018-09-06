/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_markers1","_cops","_heli","_pilot"];
_markers = [];
_markers1 = [];
_cops = [];
_heli = [];
_safeZones = ["civ_spawn_1","civ_spawn_2","civ_spawn_3","civ_spawn_4"];

{
	if (side _x == west && !(_x getVariable["restrained",false]) && alive _x) then {
		_cops pushBack _x;
	};
	nil;
} count playableUnits; //Fetch list of cops / blufor

{
	if(_x isKindOf "air" && (count crew _x) > 0) then {
		if(_x distance (getMarkerPos "civ_spawn_1") < 500 || _x distance (getMarkerPos "civ_spawn_2") < 500 || _x distance (getMarkerPos "civ_spawn_3") < 500 || _x distance (getMarkerPos "civ_spawn_4") < 500) then {
			_heli pushBack _x;
		};
	};
	nil;
} count vehicles;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["%1", _x call life_fnc_name];

	_markers pushBack [_marker,_x];
	nil;
} count _cops;

{
	_pilot = driver vehicle _x;
	_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "waypoint";
	_marker setMarkerTextLocal format["%1 Pilot :%2",getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"),_pilot call life_fnc_name];

	_markers1 pushBack [_marker,_x];
	nil;
} count _heli;

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
		};
		nil;
	} count _markers;

	{
		private["_marker","_unit"];
		_marker = _x select 0;
		_unit = _x select 1;
		if(!isNil "_unit") then {
			if(!isNull _unit) then {
				{if(_unit distance (getMarkerPos _x) < 500) exitWith {_marker setMarkerPosLocal (getPos _unit);};nil;} count _safeZones;
			};
		};
		nil;
	} count _markers1;
	if(!visibleMap) exitWith {};
};

{deleteMarkerLocal (_x select 0);nil;} count _markers;
_markers = [];
{deleteMarkerLocal (_x select 0);nil;} count _markers1;
_markers1 = [];
_cops = [];
