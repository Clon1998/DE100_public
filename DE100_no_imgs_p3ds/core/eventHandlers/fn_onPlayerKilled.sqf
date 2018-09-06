/*
	File:	fn_onPlayerKilled.sqf
	Date:   2016-08-15 02:47:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]],
	["_instigator", objNull, [objNull]],
	"_handle"
];

if (isNull _instigator) then {
	_instigator = _killer;
};

_unit setVariable["realname",profileName,true];
_unit setVariable["steam64id",getPlayerUID player,true];
//Setup our camera view

showCinemaBorder true;
createDialog "Respawn_Screen";
setMousePosition [0.5, 0.5];

if (!isNull _instigator) then {
	if(_instigator != _unit && side _instigator != west) then {
		if(vehicle _instigator isKindOf "LandVehicle" && driver (vehicle _instigator) isEqualTo _instigator) then {
			[_instigator,"murderVehicle",_unit] call life_fnc_addCrime;
			[2] remoteExecCall ["life_fnc_removeLicenses",_instigator];
		} else {
			[_instigator,"murder",_unit] call life_fnc_addCrime;
			[3] remoteExecCall ["life_fnc_removeLicenses",_instigator];
		};
	};
	
	if (_instigator != _unit && side _instigator isEqualTo civilian && vehicle _instigator isEqualTo _instigator) then {
		["Kill",1] remoteExec ["life_fnc_addAchievExp",_instigator];
	};

	if (side _instigator isEqualTo west && playerSide != west) then {
		life_copRecieve = _instigator;
		life_removeWanted = true;
	};
};

private _msg = call {
	if (isNull _instigator) exitWith {
		format ["EXPLOSION | %1 (MapGrid:%2) wurde eventuell durch eine Explosion getötet.",_unit call life_fnc_nameUID,mapGridPosition _unit];
	};

	if (_instigator isEqualTo _unit) exitWith {
		format ["Suizid | %1 (MapGrid:%2) hat Suizid begangen",_unit call life_fnc_nameUID,mapGridPosition _unit];
	};

	if (!isNull objectParent _instigator && driver (objectParent _instigator) isEqualTo _instigator) exitWith {
		[
			format ["FAHRZEUG | %1 (MapGrid:%4) wurde von %2(MapGrid:%5) mit einem %3 getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID,getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _instigator)) >> "displayName"),mapGridPosition _unit, mapGridPosition _instigator],
			[_instigator getVariable ["steam64id",getPlayerUID _instigator],7,format ["FAHRZEUG | %2 (MapGrid:%5) hat %1 (MapGrid:%4) mit einem %3 getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID,getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _instigator)) >> "displayName"),mapGridPosition _unit,mapGridPosition _instigator]]
		];
	};

	if !((currentWeapon _instigator) isEqualTo "") exitWith {
		[
			format ["WAFFE | %1 (MapGrid:%4) wurde von %2 (MapGrid:%5) mit einer %3 getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID,getText(configFile >> "cfgWeapons" >> (currentWeapon _instigator) >> "displayName"),mapGridPosition _unit,mapGridPosition _instigator],
			[_instigator getVariable ["steam64id",getPlayerUID _instigator],7,format ["WAFFE | %2 (MapGrid:%5) hat %1 (MapGrid:%4) mit einem %3 getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID,getText(configFile >> "cfgWeapons" >> (currentWeapon _instigator) >> "displayName"),mapGridPosition _unit,mapGridPosition _instigator]]
		];
	};
	[
		format ["UNBEKANNT | %1 (MapGrid:%3) wurde von %2 (MapGrid:%4) getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID, mapGridPosition _unit, mapGridPosition _instigator],
		[_instigator getVariable ["steam64id",getPlayerUID _instigator],7,format ["UNBEKANNT | %2 (MapGrid:%4) hat %1 (MapGrid:%3) getötet",_unit call life_fnc_nameUID,_instigator call life_fnc_nameUID, mapGridPosition _unit, mapGridPosition _instigator]]
	];
};

if (life_HC_isActive) then {
	[_unit getVariable ["steam64id",getPlayerUid _unit],call life_clientId select 0,[
		["MSC_fnc_log",false,[_unit getVariable ["steam64id",getPlayerUid _unit], 6, _msg]],
		["MSC_fnc_deathTracker",false,[_instigator getVariable ["steam64id",getPlayerUID _instigator],_unit getVariable ["steam64id",getPlayerUid _unit],getPos _unit]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[_unit getVariable ["steam64id",getPlayerUid _unit],call life_clientId select 0,[
		["MSC_fnc_log",false,[_unit getVariable ["steam64id",getPlayerUid _unit], 6, _msg]],
		["MSC_fnc_deathTracker",false,[_instigator getVariable ["steam64id",getPlayerUID _instigator],_unit getVariable ["steam64id",getPlayerUid _unit],getPos _unit]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

[0,call {
	if (isNull _instigator) exitWith {
		format["%1 wurde getötet", _unit call life_fnc_name];
	};
	if (_instigator isEqualTo _unit || _instigator isEqualTo (missionNamespace getVariable ["life_corpse",objNull])) exitWith {
		format["%1 nahm den schnellsten Weg in den Himmel", _unit call life_fnc_name];
	};
	if (!isNull objectParent _instigator && driver (objectParent _instigator) isEqualTo _instigator) exitWith {
		format["%1 wurde von %2 überfahren", _unit call life_fnc_name, _instigator call life_fnc_name];
	};
	format["%1 wurde von %2 getötet", _unit call life_fnc_name,  _instigator call life_fnc_name];
}] remoteExecCall ["life_fnc_broadcast",-2];
player setVariable ["vhcPro",str getUnitLoadout player];
0 call life_fnc_hudHide;