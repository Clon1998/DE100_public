/*
	File:	fn_distributeArticle.sqf
	Date:   2017-09-11 19:58:28
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	COPS DÜRFEN DAS AUKTION HAUS AUCH ALS CIVS NICHT NUTZEN SONST.
	BZW. SOLANGE WIE EINE AUKTION AUSLÄUFT MÜSSEN SIE ZIVS SEIN SONST MACHT ES BOOOOM!!!

*/

params[
	["_aId", 0, [0]],
	["_aData", [], [[]]],
	["_bData", [], [[]]],
	["_wasSend", false, [false]]
];
if (missionNamespace getVariable [format["%1_distribute",_aId],false]) exitWith {};
missionNamespace setVariable [format["%1_distribute",_aId],true];
waitUntil {(missionNamespace getVariable ["life_session_completed",false]) && (missionNamespace getVariable ["life_gang_init",false]) && !((missionNamespace getVariable ["de100_ac_storage",objNull]) getVariable ["auc_edit",false]) && !(uiNamespace getVariable ["De100_SSys",false])};
private _uid = getPlayerUID player;
private _class = _aData select 2;
private _type = _aData select 1;
private _dName = if ((_aData select 1) isEqualTo "zitems") then {
	localize getText(missionConfigFile >> "VirtualItems" >> _class >> "displayName");
} else {
	getText(configFile >> (call {if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {"CfgWeapons";};if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith {"CfgMagazines";};if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith {"CfgVehicles";};"CfgGlasses";}) >> _class >> "displayName");
};

if ((_bData select 0) isEqualTo _uid) exitWith {
	private _pack = [["distribute",2]];
	private _logMsg = "";
	if ((_aData select 0) isEqualTo _uid) then {
		if ((_bData select 2) < 0) then {
			[format["Deine Auktion #%1 (%2x %3) wurde zurückgezogen. Die Artikel %2x %3 sind nun für dich verfügbar.",_aId, _aData select 4,_dName], false, "slow"] call life_fnc_notification_system;
		} else {
			[format["Deine Auktion #%1 (%2x %3) konnte keinen Käufer finden. Die Artikel %2x %3 sind nun für dich verfügbar.",_aId, _aData select 4,_dName], true, "slow"] call life_fnc_notification_system;
		};
		_logMsg = format ["Ersteller %1 hat %4x %3 von der Auktion #%2 online erhalten, da diese keinen Käufer gefunden hat.",player call life_fnc_nameUid,_aId,_dName, _aData select 4];
		_wasSend = true;
		_pack = [["distribute",3]];
	} else {
		private _num = if ((_bData select 2) < 0) then {_aData select 7;} else {_aData select 6;};
		if ((_bData select 2) < 0) then {
			[format["Du hast für die Artikel %2x %3 aus der Auktion #%1 %4€ gezahlt. Die Artikel %2x %3 sind nun für dich verfügbar.",_aId, _aData select 4,_dName,[_num] call life_fnc_numberText], false, "slow"] call life_fnc_notification_system;
		} else {
			[format["Du hast die Auktion #%1 (%2x %3) mit dem Höchstgebot von %4€ gewonnen. Die Artikel %2x %3 sind nun für dich verfügbar.",_aId, _aData select 4,_dName,[_num] call life_fnc_numberText], false, "slow"] call life_fnc_notification_system;
		};
		de100_mSpace setVariable ["cT",diag_tickTime];
		de100_luciandjuli_bc = de100_luciandjuli_bc - _num;
		de100_mSpace setVariable ["cV",de100_luciandjuli_bc+de100_luciandjuli_mula];
		_logMsg = format ["Gewinner %1 hat %5€ online gezahlt und  %4x %3 von der Auktion #%2 online erhalten.",player call life_fnc_nameUid,_aId,_dName, _aData select 4,[_num] call life_fnc_numberText];
	};
	call {
		if (_type in ["car","air","ship"]) exitWith {
			_pack pushBackUnique ["vehicle",_uid]
		};
		if (_type isEqualTo "houses") exitWith {
			private _b = nearestBuilding (_aData select 10);
			_b setVariable ["house_owner",[getPlayerUID player,player call life_fnc_name],true];
			_b setVariable ["forSale",false,true];
			_marker = createMarkerLocal [format["house_%1",netId _b],getPosATL _b];
			_marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> _class >> "displayName"));
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "loc_Lighthouse";
			life_houses pushBackUnique _b;
			_pack pushBackUnique ["houses",_uid];
		};
		if (_type isEqualTo "zitems") exitWith {
			private _trunkInfo = lockers_obj getVariable [format["%1_%2_locker_Trunk",getPlayerUID player,civilian],[[],0]];
			private _tmpInv = _trunkInfo select 0;
			private _iWeight = [_class] call life_fnc_itemWeight;
			private _weight = _iWeight * (_aData select 4);
			private _index = [_class,_tmpInv] call life_fnc_index;
			if (_index >= 0) then {
				_tmpInv set [_index,[_class,(_tmpInv select _index select 1)+(_aData select 4)]];
			} else {
				_tmpInv pushBackUnique [_class,_aData select 4];
			};
			lockers_obj setVariable [format["%1_%2_locker_Trunk",getPlayerUID player,civilian],[_tmpInv,(_trunkInfo select 1) + _weight],true];
			[lockers_obj] call life_fnc_updateHouseContainer;
		};
		private _tmp = _class call life_fnc_getItemType;
		private _namespace = format["%1_%3_locker_%2",getPlayerUID player,_tmp select 0,civilian];
		private _key = _tmp select 1;
		private _data = lockers_obj getVariable [_namespace,[]];
		private _kData = [_key,_data] call life_fnc_dataFromKey; // Key Data
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
		[_key,_data,_kData] call life_fnc_setDataAtKey;
		lockers_obj setVariable [_namespace,_data,true];
		[lockers_obj] call life_fnc_updateHouseContainer;
	};
	if (!_wasSend) then {
		private _creater = (_aData select 0) call life_fnc_unitFromUid;
		if (!isNull _creater) then {
			[_aId,_aData,_bData,true] remoteExec ["life_fnc_distributeArticle",_creater];
		} else {
			_pack pushBackUnique ["creater",_aData select 0];
		};
	};
	if (life_HC_isActive) then {
		[_uid,call life_clientId select 0,[
			["AC_fnc_distribute",false,[_uid,call life_clientId select 0,_aId,_pack]],
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["MSC_fnc_log",false,[getPlayerUID player,41,_logMsg]]
		]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
	} else {
		[_uid,call life_clientId select 0,[
			["AC_fnc_distribute",false,[_uid,call life_clientId select 0,_aId,_pack]],
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["MSC_fnc_log",false,[getPlayerUID player,41,_logMsg]]
		]] remoteExecCall ["MSC_fnc_execStack",2];
	};
};
private _num = if ((_bData select 2) < 0) then {_aData select 7;} else {_aData select 6;};
if (_bData select 2 < 0) then {
	[format["Deine Auktion #%1 (%2x %3) wurde an %4 für %5€ verkauft und nach Steuerabgaben hast du %6€ erhalten.",_aId, _aData select 4,_dName,_bData select 1,[_num] call life_fnc_numberText,[round(_num*0.95)] call life_fnc_numberText], false, "slow"] call life_fnc_notification_system;
} else {
	[format["Deine Auktion #%1 (%2x %3) wurde an den Höchstbietenden %4 für %5€ versteigert und nach Steuerabgaben hast du %6€ erhalten.",_aId, _aData select 4,_dName,_bData select 1,[_num] call life_fnc_numberText,[round(_num*0.95)] call life_fnc_numberText], false, "slow"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc + round(_num*0.95);
de100_mSpace setVariable ["cV",de100_luciandjuli_bc+de100_luciandjuli_mula];
private _logMsg = format["Ersteller %1 hat %3€ für die Auktion #%2 online erhalten.",player call life_fnc_nameUid,_aId,[round (_num*.95)] call life_fnc_numberText];
call {
	if (_type isEqualTo "houses") exitWith {
		private _b = nearestBuilding (_aData select 10);
		life_houses deleteAt (life_houses find _b);
	};
};
private _pack = [["distribute",1]];
if (!_wasSend) then {
	private _winner = (_bData select 0) call life_fnc_unitFromUid;
	if (!isNull _winner) then {
		[_aId,_aData,_bData,true] remoteExec ["life_fnc_distributeArticle",_winner];
	} else {
		_pack pushBackUnique ["winner",_bData select 0];
	};
};
if (life_HC_isActive) then {
	[_uid,call life_clientId select 0,[
		["AC_fnc_distribute",false,[_uid,call life_clientId select 0,_aId,_pack]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["MSC_fnc_log",false,[getPlayerUID player,42,_logMsg]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[_uid,call life_clientId select 0,[
		["AC_fnc_distribute",false,[_uid,call life_clientId select 0,_aId,_pack]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["MSC_fnc_log",false,[getPlayerUID player,42,_logMsg]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};