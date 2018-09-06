/*
	File:	fn_storeHouseInitLocal.sqf
	Date:   2016-10-16 01:13:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_storeHouse", objNull, [objNull,[]]],
	"_marker"
];

if (_storeHouse isEqualType []) then {
	{
		if !(_x in life_vehicles) then {
			life_vehicles pushBackUnique _x;

			_marker = createMarkerLocal [format["house_%1",netId _x],getPosATL _x];
			_marker setMarkerTextLocal "Gang-Lagerhaus";
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "loc_Lighthouse";
		};
	} forEach _storeHouse;
} else {
	if !(_storeHouse in life_vehicles) then {
		life_vehicles pushBackUnique _storeHouse;

		_marker = createMarkerLocal [format["house_%1",netId _storeHouse],getPosATL _storeHouse];
		_marker setMarkerTextLocal "Gang-Lagerhaus";
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
	};
};