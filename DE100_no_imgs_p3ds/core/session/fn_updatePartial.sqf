/*
	File:	fn_updatePartial.sqf
	Date:   15.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
if (!life_session_completed) exitWith {};

params[
	["_mode", "", ["",[]]],
	["_return", false],
	"_data",
	"_flag"
];
private _pack = [];
if (_mode isEqualType "") then {
	_mode = [_mode];
};

{
	call {
		if (_x isEqualTo "CASH") exitWith {
			_data = (missionNamespace getVariable ["Archi_Money",[0,0]] ) select 0;
			_data = de100_luciandjuli_bc - _data;
			if (_data > 0) then {
				["Money",_data] spawn life_fnc_addAchievExp;
			};
			_pack pushBack [_x,[de100_luciandjuli_bc,de100_luciandjuli_mula]];
		};

		if (_x isEqualTo "GEAR") exitWith {
			_data = [player] call life_fnc_saveGear;
			_pack pushBack [_x,_data];
		};

		if (_x isEqualTo "ADVENT") exitWith {
			_pack pushBack [_x,life_advent];
		};

		if (_x isEqualTo "LICENSE") exitWith {
			_flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
			_data = [];
			{
				_data pushBack [configName _x,[[0,configName _x] call life_fnc_handleLicense] call life_fnc_clientBool];
				nil;
			} count (format["getText(_x >> 'side') isEqualTo '%1' && !(getText(_x >> 'displayName') isEqualTo 'STR_Default')",_flag] configClasses (missionConfigFile >> "Licenses"));
			_pack pushBack [_x,_data];
		};

		if (_x isEqualTo "JAILED") exitWith {
			_data = [life_is_arrested] call life_fnc_clientBool;
			_pack pushBack [_x,_data];
		};

		if (_x isEqualTo "NEWBEE") exitWith {
			_pack pushBack [_x,1];
		};

		if (_x isEqualTo "PROF") exitWith {
			_flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};	
			_data = [];
			{	
				_data pushBack [(getText(_x >> 'variable')),(missionNamespace getVariable [(getText(_x >> 'variable')),[0,0]]) select 0,(missionNamespace getVariable [(getText(_x >> 'variable')),[0,0]]) select 1];
				nil;
			} count (format["getText(_x >> 'flag') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "ProfSys"));
			_pack pushBack [_x,_data];
		};

		if (_x isEqualTo "ACHIV") exitWith {
			_data = [];
			{
				_data pushBack [(getText (_x >> "variable")),(missionNamespace getVariable [(getText (_x >> "variable")),[0,0]]) select 0,(missionNamespace getVariable [(getText (_x >> "variable")),[0,0]]) select 1];
				nil;
			} count ( "!(getText(_x >> 'titel') isEqualTo '')" configClasses (missionConfigFile >> "Achievements"));
			_pack pushBack [_x,_data];
		};

		if (_x isEqualTo "IDCARD") exitWith {
			_data = player getVariable ["idCard",[]];
			_pack pushBack [_x,[profileName,_data]];
		};
	};
	nil
} count _mode;

if (_return) exitwith {
	[getPlayerUID player,call life_clientId select 0,playerSide,player getVariable ["nobody",false],_pack];
};

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,playerSide,player getVariable ["nobody",false],_pack] remoteExecCall ["PL_fnc_updateP",HC_Life];
} else {
    [getPlayerUID player,call life_clientId select 0,playerSide,player getVariable ["nobody",false],_pack] remoteExecCall ["PL_fnc_updateP",2];
};