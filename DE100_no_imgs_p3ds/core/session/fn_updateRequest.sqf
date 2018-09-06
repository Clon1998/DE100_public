/*
	File:	fn_updateRequest.sqf
	Date:   2016-08-15 02:47:26
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if (!life_session_completed) exitWith {};
private _pack = [getPlayerUID player,call life_clientId select 0,profileName,playerSide,de100_luciandjuli_mula,de100_luciandjuli_bc];
private _tmpArray = [];
private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

{
	_tmpArray pushBack [configName _x,[[0,configName _x] call life_fnc_handleLicense] call life_fnc_clientBool];
} forEach (format["getText(_x >> 'side') isEqualTo '%1' && !(getText(_x >> 'displayName') isEqualTo 'STR_Default')",_flag] configClasses (missionConfigFile >> "Licenses"));
_pack pushBack _tmpArray;

_pack pushBack ([player] call life_fnc_saveGear);

_tmpArray = [];
{	
	_tmpArray pushBack [(getText(_x >> 'variable')),(missionNamespace getVariable [(getText(_x >> 'variable')),[0,0]]) select 0,(missionNamespace getVariable [(getText(_x >> 'variable')),[0,0]]) select 1];
} foreach (format["getText(_x >> 'flag') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "ProfSys"));
_pack pushBack _tmpArray;

_tmpArray = [];
{
	_tmpArray pushBack [(getText (_x >> "variable")),(missionNamespace getVariable [(getText (_x >> "variable")),[0,0]]) select 0,(missionNamespace getVariable [(getText (_x >> "variable")),[0,0]]) select 1];
} foreach( "!(getText(_x >> 'titel') isEqualTo '')" configClasses (missionConfigFile >> "Achievements"));
_pack pushBack _tmpArray;

_pack pushBack ([life_is_arrested] call life_fnc_clientBool);
_pack pushBack life_civjob;
_pack pushBack (player getVariable["nobody",false]);

if (life_HC_isActive) then {
	_pack remoteExecCall ["PL_fnc_updateC",HC_Life];
} else {
    _pack remoteExecCall ["PL_fnc_updateC",2];
};