/*
   File:    fn_delete.sqf
   Date:    2017-9-17 17:12:22
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_aId", 0, [0]]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
private _name = _unit call life_fnc_name;
private _aArr = de100_ac_storage getVariable ["active_auctions",[]];
private _aData = [_aId,_aArr] call life_fnc_dataFromKey;
if (_aData isEqualTo false) exitWith {
	["Die Auktion wurde bereits beendet!", true, "fast"] remoteExecCall ["life_fnc_notification_system",_unit];
};
if (([_aData select 5] call life_fnc_timeUnix) < ([life_real_time] call life_fnc_timeUnix) || (_aData select 11)) exitWith {
	["Die Auktion wurde bereits beendet", true, "fast"] remoteExecCall ["life_fnc_notification_system",_unit];
};

private _pArr = de100_ac_storage getVariable ["past_auctions",[]];
_aData set [6,-1];
_aData set [11,true];
_aData set [5,life_real_time];
_pArr pushBackUnique [_aId,_aData];
[_aId,_aArr] call life_fnc_setDataAtKey;
de100_ac_storage setVariable ["active_auctions",_aArr];
de100_ac_storage setVariable ["past_auctions",_pArr];
[format["UPDATE `auctions` SET `sold`='1', `expireDate`='%2' WHERE `id`='%1';",_aId,[1] call life_fnc_timeToStr],1] call DB_fnc_asyncCall;
[format["INSERT INTO `auction_bids` (`pid`,`name`,`aid`,`amnt`,`timestamp`) VALUES ('%1','%2','%3','-1','%4');",_uid,_name,[_aId] call life_fnc_number,[1] call life_fnc_timeToStr],1] call DB_fnc_asyncCall;

private _bHis = de100_ac_storage getVariable [format["%1_auction_history",_aId],[]];
_bHis pushBackUnique [_uid,_name,-1,life_real_time];
de100_ac_storage setVariable [format["%1_auction_history",_aId],_bHis];
["Auktion wurde zurückgezogen. Die Artikel sollten dir in den nächsten 5 Minuten zugestellt werden.", false, "slow"] remoteExecCall ["life_fnc_notification_system",_unit];
private _trgs = allPlayers select {_x getVariable ["auction_open",false]};
if (count _trgs > 0) then {
	[_aid,_aData,_bHis,"past_auctions"] remoteExecCall ["life_fnc_refreshAuction",_trgs];
};