#include "\life_server\script_macros.hpp"
/*
	File:	fn_createID.sqf
	Date:   2016-08-15 02:47:24
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid",'',['']],
	["_oID",0,[0]]
];

if (isNil 'AH_PLAYER_CIDS') then {
	AH_PLAYER_CIDS=[];
};
private _i = [_uid,AH_PLAYER_CIDS] call life_fnc_index;
if (_i >= 0) exitwith {
	(compile format['life_clientId=compileFinal"[""%1""]";[[],%2]execFSM"core\fsm\call.fsm";',AH_PLAYER_CIDS select _i select 1,TON_fnc_deCryptFiles]) remoteExecCall ['call',_oID];
};

[_uid,_oID] spawn {
	params[
		["_uid",'',['']],
		["_oID",0,[0]]
	];

	for "_i" from 0 to 1 step 0 do {
		private _key = "battleye\CREATE_ID" callExtension "32";
		if (([_key,AH_PLAYER_CIDS] call life_fnc_index) == -1) exitwith {
			AH_PLAYER_CIDS pushBack [_uid,_key];
			(compile format['life_clientId=compileFinal"[""%1""]"; [[],%2]execFSM"core\fsm\call.fsm";',_key,TON_fnc_deCryptFiles]) remoteExecCall ['call',_oID];
			if (life_HC_isActive) then {
				(HC_Life) publicVariableClient "AH_PLAYER_CIDS";
				[format["%1 hat eine CID %2 angefordert",_uid,_key],"AH_CIDS"] remoteExecCall ["A3Log",HC_Life];
			} else {
				[format["%1 hat eine CID %2 angefordert",_uid,_key],"AH_CIDS"] call A3Log;
			};
		};
	};
};