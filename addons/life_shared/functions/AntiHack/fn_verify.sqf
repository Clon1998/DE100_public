#include "\life_shared\script_macros.hpp"
/*
	File:	fn_verify.sqf
	Date:   2017-03-22 23:22:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", '', ['']],
	["_cid", '', ['']]
];

private _i = [_uid,AH_PLAYER_CIDS] call life_fnc_index;
private _valid = if (_i >= 0) then {
	((AH_PLAYER_CIDS select _i) select 1 == _cid);
} else {
	false;
};

if (!_valid) then {
	if (life_HC_isActive) then {
		[_uid, 57, format["AH-Ban: %1 hatte nich die richtige CID %2 (CalledFnc: %3)",_uid,_cid,_fnc_scriptNameParent]] remoteExecCall ["MSC_fnc_log",HC_Life];
	} else {
		[_uid, 57, format["AH-Ban: %1 hatte nich die richtige CID %2 (CalledFnc: %3)",_uid,_cid,_fnc_scriptNameParent]] call MSC_fnc_log;
	};

	[[],["life_fnc_dummy",2]] remoteExec ["remoteExec",remoteExecutedOwner];
	[0,[format["%1 hatte nich die richtige CID %2 (CalledFnc: %3)",_uid,_cid,_fnc_scriptNameParent],"PLAIN DOWN"]]remoteExec ["cutText",allPlayers select {_x getVariable["isAdmin",0] > 0}];
};

_valid