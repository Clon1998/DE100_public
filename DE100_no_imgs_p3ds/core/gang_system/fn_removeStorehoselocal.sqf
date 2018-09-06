/*
	File:	fn_removeStorehoselocal.sqf
	Date:   2016-10-16 17:33:28
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_storehouse", objNull, [[],objNull]]
];

if (_storeHouse isEqualType []) then {
	{
		deleteMarkerLocal format["house_%1",netId _x];
		life_vehicles deleteAt (life_vehicles find _x);
	} forEach _storeHouse;
} else {
	deleteMarkerLocal format["house_%1",netId _storehouse];
	life_vehicles deleteAt (life_vehicles find _storehouse);
};


if (!isNull (findDisplay 4000)) then { 
	(findDisplay 4000) closeDisplay 2;
};
if (!isNull (findDisplay 37400)) then { 
	(findDisplay 37400) closeDisplay 2;
};