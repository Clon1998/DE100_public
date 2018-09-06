/*
	File: fn_Nobody.sqf
	Author: Anton

	Description:
	Verwaltet die serverseitigen Verwaltungen der Nobody-Fraktion
*/
params[
	["_uid", '', ['']],
	["_cid", '', ['']],
	["_mode", '', ['']],
	"_unit",
	"_query",
	"_queryResult",
	"_gear"
];


if !([_uid,_cid]call AH_fnc_verify) exitWith {};
_unit = _uid call life_fnc_unitFromUid;

call {
	if (_mode isEqualTo 'getNobodyGear') exitWith {
		_query = format["SELECT nobody_gear FROM players WHERE playerid='%1'",_uid];
		_queryResult = [_query,2] call DB_fnc_asyncCall;
		_queryResult = _queryResult select 0;

		_gear=if(typeName _queryResult=="ARRAY")then{_queryResult}else{_queryResult call DB_fnc_toArray};
		_gear=if(isNil'_gear')then{[]}else{_gear};

		[missionNamespace,["life_gear",_gear]]remoteExec["setVariable",_unit];
		[]remoteExec["life_fnc_loadGear",_unit];
	};

	if (_mode isEqualTo 'saveNobodyGear') exitWith {
		_gear=param[3,[],[[]]];

		_query = format["UPDATE players SET nobody_gear='%1' WHERE playerid='%2'",_gear,_uid];
		_queryResult = [_query,2] call DB_fnc_asyncCall;
	};
};	