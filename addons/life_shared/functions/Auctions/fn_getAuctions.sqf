/*
   File:    fn_getAuctions.sqf
   Date:    2018-1-2 15:39:10
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_uid", "", [""]],
	["_cid", "", [""]],
    ["_isRefresh", false, [false]],
    ["_lid", 0, [0]],
    ["_ndis", [], [[]]],
	"_queryResult"
];

private _start = diag_tickTime;
if !([_uid,_cid]call AH_fnc_verify) exitWith {};

private _aHis = [];
{
    if (_x > _lid || _x in _ndis) then {
        _aHis pushBackUnique [_x, de100_ac_storage getVariable [format["%1_auction_history",_x],[]]];
    };
    nil;
} count (de100_ac_storage getVariable ["all_auc_Ids",[]]);

private _aArr = de100_ac_storage getVariable ["active_auctions",[]];
private _pArr = (de100_ac_storage getVariable ["past_auctions",[]]) select {(_x select 0) > _lid || (_x select 0) in _ndis};
private _lenAa = count _aArr;
private _lenPa = count _pArr;
private _lenHis = count _aHis;

diag_log format["AA:%1 | PA:%2 | His:%3",_lenAa,_lenPa,_lenHis];

private _len = _lenPa max _lenAa;
private _packages = [];
private _steps = de100_ac_storage getVariable ["auc_max_packages",300];
private _getRange = {
    params["_j","_arr","_len"];
    if (_j > _len) then {
        [];
    } else {
        _arr select [_j, _steps];
    };
};
for "_i" from 0 to (_len - 1) step _steps do {
    _packages pushBack [[_i, _aArr, _lenAa] call _getRange, [_i, _pArr,_lenPa] call _getRange, [_i, _aHis,_lenHis] call _getRange];
};
private _sign = str diag_tickTime;
private _len = count _packages;
if (_len == 0) then {
    [1,[_sign,1,0,[[],[],[]]],_isRefresh] remoteExecCall ["life_fnc_loadAucData",remoteExecutedOwner];
} else {
    {
        [2,[_sign,_len,_forEachIndex,_x],_isRefresh] remoteExecCall ["life_fnc_loadAucData",remoteExecutedOwner];
    } forEach _packages;
};

diag_log format["%1 time needed",diag_tickTime-_start];

/*{
	_aHis pushBackUnique [_x, de100_ac_storage getVariable [format["%1_auction_history",_x],[]]];
	nil;
} count (de100_ac_storage getVariable ["all_auc_Ids",[]]);
*/
