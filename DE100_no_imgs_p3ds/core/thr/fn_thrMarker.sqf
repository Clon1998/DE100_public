/*
	File:	fn_thrMarker.sqf
	Date:   2016-12-27 00:59:08
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

	Description:
	Take a look for yourself.
*/
private _markers = [];

{
	if (side _x == independent && isNull(_x getVariable ["requestveh",objNull])) then {
		_marker = createMarkerLocal [format["%1_marker",netID _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGUER";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x call life_fnc_name];
		_markers pushBack [_marker,_x];
	};
	if (!isNull(_x getVariable ["requestveh",objNull]) && _x getVariable ["isAlive",true]) then {
		_marker = createMarkerLocal [format["%1_veh",netID _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTypeLocal "c_car";
		_marker setMarkerTextLocal format["%1 mit %2", _x call life_fnc_name,([typeOf (_x getVariable ["requestveh",objNull])] call life_fnc_fetchVehInfo) select 3];
		_markers pushBack [_marker,_x];
	};
	nil;
} count allPlayers;

{
	if (!(_x getVariable ["isAlive",true]) && !isObjectHidden _x) then {
		_marker = createMarkerLocal [format["%1_dead_marker",netID _x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x call life_fnc_name)];
		_markers pushBack [_marker,_x];
	};
	nil;
} count (allPlayers select {!(_x getVariable ["isAlive",true])});

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

while {visibleMap || !isNull (findDisplay 3000) || life_refresh_map} do
{
	{
		_x params[
			["_marker", "", [""]],
			["_unit", objNull,[objNull]]
		];
		if(!isNull _unit) then
		{
			_marker setMarkerPosLocal (visiblePosition _unit);
			if (markerType _marker in ["c_car","loc_Hospital"] && !isNull (_unit getVariable ["thrClerk",objNull])) then {
				_marker setMarkerColorLocal "ColorGreen";
			};
		};
		if(!visibleMap && isNull (findDisplay 3000) || life_refresh_map) exitWith {};
		nil;
	} count _markers;
	if(!visibleMap && isNull (findDisplay 3000) || life_refresh_map) exitWith {};
};
life_refresh_map = false;
{deleteMarkerLocal (_x select 0);nil;} count _markers;
