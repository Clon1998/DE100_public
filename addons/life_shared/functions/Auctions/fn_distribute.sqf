/*
	File:	fn_distribute.sqf
	Date:   2017-09-11 22:58:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid", ""],
	["_cid", ""],
	["_aId", ""],
	["_data",[],[[]]]
];
private _ah = if (isRemoteExecuted) then {
	[_uid,_cid]call AH_fnc_verify
} else {
	true
};
if (!_ah) exitWith {};
//Wont work since it might not be iun active_auctions
private _aData = [_aId,de100_ac_storage getVariable ["past_auctions",[]]] call life_fnc_dataFromKey;
private _betData = de100_ac_storage getVariable [format["%1_auction_history",_aId],[]];
_betData = _betData select (count _betData -1);
private _update = [];
{
	_x params[
		["_t", "",[""]],
		["_d", ""]
	];
	call {
		if (_t isEqualTo "distribute") exitWith {
			_aData set [12,[_aData select 12,_d] call BIS_fnc_bitflagsSet];
		};

		if (_t isEqualTo "winner") exitWith {
			private _type = _aData select 1;
			private _bit = if ((_aData select 0) isEqualTo _d) then {
				3;
			} else {
				2;
			};
			_aData set [12,[_aData select 12,_bit] call BIS_fnc_bitflagsSet];
			private _num = 0;
			if (_bit == 2) then {
				_num = if ((_betData select 2) < 0) then {_aData select 7;} else {_aData select 6;};
				[format["UPDATE `players` SET `bankacc`=`bankacc`-'%1' WHERE `playerid`='%2';",_num call life_fnc_number,_d],1] call DB_fnc_asyncCall;
			};
			call {
				if (_type isEqualTo "houses") exitWith {
					private _b = nearestBuilding (_aData select 10);
					_b setVariable ["house_spawned",false,true];
					[format["UPDATE `houses` SET `pid`='%1', `forSale`='0' WHERE `id`='%2';",_d,(_aData select 9) call life_fnc_number],1] call DB_fnc_asyncCall;
				};
				if (_type in ["car","air","ship"]) exitWith {
					[format["UPDATE `vehicles` SET `pid`='%1', `forSale`='0' WHERE `id`='%2';",_d,(_aData select 9) call life_fnc_number],1] call DB_fnc_asyncCall;
				};
				if (_type isEqualTo "zitems") exitWith {
					private _class = _aData select 2;
					private _queryResult = [format["SELECT `id`,`inventory` FROM `lockers` WHERE `pid`='%1' AND `side`='0';",_d],2] call DB_fnc_asyncCall;
					private _tmpArr = [_queryResult select 1] call DB_fnc_toArray;
					private _tmpInv = _tmpArr select 0;
					private _iWeight = [_class] call life_fnc_itemWeight;
					private _weight = _iWeight * (_aData select 4);
					private _index = [_class,_tmpInv] call life_fnc_index;
					if (_index >= 0) then {
						_tmpInv set [_index,[_class,(_tmpInv select _index select 1)+(_aData select 4)]];
					} else {
						_tmpInv pushBackUnique [_class,_aData select 4];
					};
					_tmpArr = [_tmpInv, (_tmpArr select 1)+_iWeight];
					lockers_obj setVariable [format["%1_%2_locker_spawned", _d, civilian],false,true];
					[format["UPDATE `lockers` SET `inventory`='%1' WHERE `id`='%2';",[_tmpArr] call DB_fnc_mres,_queryResult select 0],1] call DB_fnc_asyncCall;
				};
				private _queryResult = [format["SELECT `id`,`space_data` FROM `lockers` WHERE `pid`='%1' AND `side`='0';",_d],2] call DB_fnc_asyncCall;
				private _tmpArr = [_queryResult select 1] call DB_fnc_toArray;
				private _class = _aData select 2;
				private _tmp = _class call life_fnc_getItemType;
				private _key = _tmp select 1;
				private _tI = ["weapon_space","clothing_space","other_space"] find (_tmp select 0);
				_sData = _tmpArr select _tI;
				private _kData = [_key,_sData] call life_fnc_dataFromKey;
				if (_kData isEqualTo false) then {
					_kData = [];
				};
				private _i = [_class,_kData] call life_fnc_index;
				private _amnt = _aData select 4;
				if (_i >= 0) then {
					_kData set [_i,[_class,_amnt+((_kData select _i) select 1)]];
				} else {
					_kData pushBackUnique [_class,_amnt];
				};
				[_key,_sData,_kData] call life_fnc_setDataAtKey;
				_tmpArr set [_tI,_sData];
				lockers_obj setVariable [format["%1_%2_locker_spawned", _d, civilian],false,true];
				[format["UPDATE `lockers` SET `space_data`='%1' WHERE `id`='%2';",[_tmpArr] call DB_fnc_mres,_queryResult select 0],1] call DB_fnc_asyncCall;
			};
			if (_bit == 2) then {
				[_d, 39, format ["Gewinner %1 hat €%5 offline gezahlt und  %4x %3 von der Auktion #%2 offline erhalten.",_d,_aId,_aData select 2, _aData select 4,[_num] call life_fnc_numberText]] call MSC_fnc_log;
			} else {
				[_d, 39, format ["Ersteller %1 hat %4x %3 von der Auktion #%2 offline erhalten, da diese keinen Käufer gefunden hat.",_d,_aId,_aData select 2, _aData select 4]] call MSC_fnc_log;
			};
		};
		if (_t isEqualTo "creater") exitWith {
			private _type = _aData select 1;
			private _num = round(if ((_betData select 2) < 0) then {_aData select 7;} else {_aData select 6;})*.95;
			_aData set [12,[_aData select 12,1] call BIS_fnc_bitflagsSet];
			[format["UPDATE `players` SET `bankacc`=`bankacc`+'%1' WHERE `playerid`='%2';",_num call life_fnc_number,_d],1] call DB_fnc_asyncCall;
			[_d, 40, format ["Ersteller %1 hat €%3 für die Auktion #%2 offline erhalten.",_d,_aId,[_num] call life_fnc_numberText]] call MSC_fnc_log;
		};
		if (_t isEqualTo "houses") exitWith {
			diag_log _x;
			[format["UPDATE `houses` SET `pid`='%1', `forSale`='0' WHERE `id`='%2';",_d,(_aData select 9) call life_fnc_number],1] call DB_fnc_asyncCall;
		};
		if (_t isEqualTo "vehicle") exitWith {
			diag_log _x;
			[format["UPDATE `vehicles` SET `pid`='%1', `forSale`='0' WHERE `id`='%2';",_d,(_aData select 9) call life_fnc_number],1] call DB_fnc_asyncCall;
		};
	};
	nil;
} count _data;

//Wont work since it might not be iun active_auctions
private _pArr = de100_ac_storage getVariable ["past_auctions",[]];
[_aId,_pArr,_aData] call life_fnc_setDataAtKey;
de100_ac_storage setVariable ["past_auctions",_pArr];
[format["UPDATE `auctions` SET `distribute`='%1' WHERE `id` = '%2';",_aData select 12,_aId],1] call DB_fnc_asyncCall;