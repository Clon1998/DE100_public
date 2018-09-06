/*
	File:	fn_create.sqf
	Date:   2017-09-03 13:04:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
params[
	["_uid", "", [""]],
	["_cid", "", [""]],
	["_class", "", [""]],
	["_amnt", 0, [0]],
	["_type", "", [""]],
	["_bet", 0, [0]],
	["_buyNow", 0, [0]],
	["_desc", "", [""]],
	["_time", 0, [0]],
	["_dbId", 0, [0]],
	["_data", [], [[]]],
	"_queryResult"
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;
if (isNull _unit) exitWith {};
private _token = round random 999999;
private _name = [_unit call life_fnc_name] call DB_fnc_mres;

if (_type in ["houses","storehouses"]) then {
	[format["UPDATE `%1` SET `forSale`='1' WHERE `id`='%2'",_type,_dbId],1] call DB_fnc_asyncCall;
};

if (_type in ["car","air","ship"]) then {
	[format["UPDATE `vehicles` SET `forSale`='1' WHERE `id`='%1'",_dbId],1] call DB_fnc_asyncCall;
};

[format["INSERT INTO `auctions` (`pid`,`name`,`classname`,`amnt`,`type`,`buyNow`,`description`,`createDate`,`expireDate`,`token`,`dbId`,`data`) VALUES ('%1','%2','%3','%4','%5','%6','%7',NOW(),TIMESTAMPADD(SECOND,%8,now()),'%9','%10','%11');",_uid,_name,_class,[_amnt] call life_fnc_number,_type,[_buyNow] call life_fnc_number,[_desc] call DB_fnc_mres,[_time] call life_fnc_number,_token,_dbId,[_data] call DB_fnc_mres],1] call DB_fnc_asyncCall;

for "_i" from 0 to 1 step 0 do {
	uiSleep 0.1;
	_queryResult = [format["SELECT `id`, `expireDate`, `createDate` FROM `auctions` WHERE `pid`='%1' AND `classname`='%2' AND `token`='%3' ORDER BY `id` DESC",_uid,_class,_token],2] call DB_fnc_asyncCall;
	if (count _queryResult > 0) exitWith {};
};
private _aid = _queryResult select 0;

[format["INSERT INTO `auction_bids` (`pid`,`name`,`aid`,`amnt`,`timestamp`) VALUES ('%1','%2','%3','%4',NOW());",_uid,_name,[_aid] call life_fnc_number,[_bet] call life_fnc_number],1] call DB_fnc_asyncCall;

for "_i" from 0 to 1 step 0 do {
	if !(de100_ac_storage getVariable ["auc_edit",false]) exitWith {};
	uiSleep 0.2;
};
de100_ac_storage setVariable ["auc_edit",true,true];
private _aArr = de100_ac_storage getVariable ["active_auctions",[]];
private _aData = [_uid,_type,_class,_name,_amnt,_queryResult select 1,_bet,_buyNow,_desc,_dbId,_data,false,0];
private _bData = [[_uid,_name,_bet,_queryResult select 2]];
_aArr pushBackUnique [_aid, _aData];
de100_ac_storage setVariable ["active_auctions",_aArr];
de100_ac_storage setVariable [format["%1_auction_history",_aid],_bData];
private _aIds = de100_ac_storage getVariable ["all_auc_Ids",[]];
_aIds pushBackUnique _aid;
de100_ac_storage setVariable ["all_auc_Ids",_aIds];
de100_ac_storage setVariable ["auc_edit",false,true];

[_uid, 36, format ["%1 hat die Auktion #%2 erstellt",_unit call life_fnc_nameUid,_aid]] call MSC_fnc_log;
["Deine Auktion ist nun gelistet", false, "fast"] remoteExecCall ["life_fnc_notification_system",_unit];

private _trgs = allPlayers select {_x getVariable ["auction_open",false]};
if !(_trgs isEqualTo []) then {
	[_aid,_aData,_bData,"active_auctions"] remoteExecCall ["life_fnc_refreshAuction",_trgs];
};