/*
	File:	fn_radarRemove.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


params[
	["_radar", objNull, [objNull]]
];

private _radars = bank_obj getVariable ["radars",[]];
private _index = _radars find _radar;
if (_index >= 0) then {
	_radars deleteAt _index;	 
	bank_obj setVariable ["radars",_radars,true];
};

deleteVehicle _radar;
[true,"speedtrap",1] call life_fnc_handleInv;