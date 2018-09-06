#include "\life_shared\script_macros.hpp"
/*
	File:	fn_loadAuctions.sqf
	Date:   2017-08-10 12:02:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	flag 
		1 = ceator
		2 = winner
		3 = winner&ceator

*/
if (profileNamespace getVariable ["de100_auc_disable",false]) exitWith {
	
};
de100_ac_storage setVariable ["auc_edit",true,true];
life_ac_ready = false;
publicVariable "life_ac_ready";
private _s = diag_tickTime;
private _qR = ["SELECT `id`, `classname`, `amnt`, `pid`, `name`, `buyNow`, `description`, `expireDate`, `type`, `sold`, `dbId`, `data`, `distribute` FROM `auctions`;",2,true] call DB_fnc_asyncCall;

private _aA = [];
private _pA = [];
private _aIds = [];

{
	_sqR = [format["SELECT `pid`, `name`, `amnt`, `timestamp` FROM `auction_bids` WHERE `aid`='%1' ORDER BY `id` ASC;",_x select 0],2,true] call DB_fnc_asyncCall;
	de100_ac_storage setVariable [format["%1_auction_history",_x select 0],_sqR];
	_aIds pushBack (_x select 0);
	_sqR = _sqR select (count _sqR -1);
	([_aA,_pA] select (_x select 9)) pushBackUnique [_x select 0,[_x select 3, _x select 8, _x select 1, _x select 4, _x select 2, _x select 7,_sqR select 2, _x select 5, _x select 6,_x select 10,[_x select 11] call DB_fnc_toArray,(_x select 9) call life_fnc_clientBool,_x select 12,_sqR select 0]];
	nil;
} count _qR;
de100_ac_storage setVariable ["active_auctions",_aA];
de100_ac_storage setVariable ["past_auctions",_pA];
de100_ac_storage setVariable ["all_auc_Ids",_aIds];

life_ac_ready = true;
publicVariable "life_ac_ready";
de100_ac_storage setVariable ["auc_edit",false,true];
diag_log format ["Auc was rdy after %1 Sek",diag_tickTime - _s];