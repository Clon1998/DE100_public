/*
	File:	fn_gangUpdatePartial.sqf
	Date:   2016-10-15 02:05:34
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_mode", "", [""]],
	["_gangID", 0, [0]],
	["_arguments", [], [[]]],
	"_query"
];

call {
	if (_mode isEqualTo "Level") exitWith {
		_arguments params[
			["_gangLevel", 0, [0]],
			["_gangBank", 0, [0]]
		];

		_gangBank = [_gangBank] call life_fnc_number;
		_query = format["UPDATE gang_system SET level='%1', bank='%2' WHERE id='%3'",_gangLevel,_gangBank,_gangID];
	};

	if (_mode isEqualTo "Permission") exitWith {
		_arguments params[
			["_gangMember", [], [[]]]
		];

		_gangMember = [_gangMember] call DB_fnc_mres;
		_query = format["UPDATE gang_system SET members='%1' WHERE id='%2'",_gangMember,_gangID];
	};

	if (_mode isEqualTo "Bank") exitWith {
		_arguments params[
			["_gangBank", 0, [0]]
		];

		_gangBank = [_gangBank] call life_fnc_number;
		_query = format["UPDATE gang_system SET bank='%1' WHERE id='%2'",_gangBank,_gangID];
	};

	if (_mode isEqualTo "Terminate") exitWith {
		_arguments params[
			["_gang", grpNull, [grpNull]]
		];
		_query = format["DELETE FROM storehouses WHERE gid='%1'",_gangID];
		[_query,1] call DB_fnc_asyncCall;
		_query = format["UPDATE gang_system SET active='0' WHERE id='%1'",_gangID];
		["terminate",_gang] remoteExec ["life_fnc_leaveGang",units _gang];
	};

	if (_mode isEqualTo "StorehouseLevel") exitWith {
		_arguments params[
			["_gangBank", 0, [0]],
			["_storehouseID", 0, [0]],
			["_storehouseLevel", 0, [0]]
		];
		_gangBank = [_gangBank] call life_fnc_number;
		_query = format["UPDATE storehouses SET level='%1' WHERE id='%2'",_storehouseLevel,_storehouseID];
		[_query,1] call DB_fnc_asyncCall;
		_query = format["UPDATE gang_system SET bank='%1' WHERE id='%2'",_gangBank,_gangID];
	};
};	

[_query,1] call DB_fnc_asyncCall;