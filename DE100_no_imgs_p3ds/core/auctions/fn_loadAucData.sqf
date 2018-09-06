/*
   File:    fn_loadAucData.sqf
   Date:    2018-1-2 15:35:23
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   0 - Send Req for listed elements
   1 - Recevive Data Packages
*/

params[
	["_type", 0, [0]],
	["_data", [], [[]]],
	["_isRefresh",false]
];

call {
	if (_type == 0) exitWith {
		closeDialog 0;
		uiNamespace setVariable ["codeStart",diag_tickTime];
		missionNamespace setVariable ["auc_isLoading", true];
		if (!_isRefresh) then {
			["Auktionshaus-Daten werden vom Server abgefragt.", false, "slow"] call life_fnc_notification_system;
		};
		if (life_HC_isActive) then {
			[getPlayerUID player,call life_clientId select 0,_isRefresh,profileNamespace getVariable["DE100_AUC_LID", 0],profileNamespace getVariable["DE100_AUC_NDIS", []]]  remoteExecCall ["AC_fnc_getAuctions",HC_Life];
		} else {
			[getPlayerUID player,call life_clientId select 0,_isRefresh,profileNamespace getVariable["DE100_AUC_LID", 0],profileNamespace getVariable["DE100_AUC_NDIS", []]]  remoteExecCall ["AC_fnc_getAuctions",2];
		};
	};
	if (_type == 1) exitWith {
		_data params[
			"_sign",
			"_len",
			"_ind",
			"_packData"
		];
		private _saved = uiNamespace getVariable [_sign,[]];
		_saved set [_ind,_packData];
		if (_len == ({!isNil "_x"} count _saved)) then {
			if (!isNil "DE100_Diagnostic") then {
				systemChat _sign;
				systemChat format["%1 since req was send to server",diag_tickTime - (uiNamespace getVariable["codeStart",0])];
			};
			private _aArr = [];
			private _pArr = [];
			//Pseudo Caching ...
			private _aHis = profileNamespace getVariable ["DE100_AUC_AHIS",[]];
			private _nDis = [];
			{
				_aArr append (_x select 0);
				{
					// Make sure we can Update the Cache of the not distributed ones!
					if (_x select 1 select 12 != 3) then {
						_nDis pushBackUnique (_x select 0);
					};
					[_x select 0,_pArr,_x select 1] call life_fnc_setDataAtKey;
					nil;
				} count (_x select 1);
				// For the historyArray we need to handle it like taskHint
				// since in here are the ahis of the past and active ones...
				{
					[_x select 0,_aHis,_x select 1] call life_fnc_setDataAtKey;
					nil;
				} count (_x select 2);
				nil;
			} count _saved;
			// get the new LastId
			private _lid = profileNamespace getVariable["DE100_AUC_LID", 0];
			{
				if (_x select 0 > _lid) then {
					_lid = _x select 0;
				};
				nil;
			} count _pArr;

			_pArr = (profileNamespace getVariable ["DE100_AUC_PA",[]])+_pArr;
			de100_ac_storage setVariable ["active_auctions", _aArr];
			de100_ac_storage setVariable ["past_auctions", _pArr];

			profileNamespace setVariable ["DE100_AUC_PA", _pArr];
			profileNamespace setVariable ["DE100_AUC_AHIS",_aHis];
			profileNamespace setVariable ["DE100_AUC_LID",_lid];
			profileNamespace setVariable ["DE100_AUC_NDIS",_nDis];
			
			{
				de100_ac_storage setVariable [format["%1_auction_history",_x select 0],_x select 1];
				nil;
			} count _aHis;

			uiNamespace setVariable [_sign,nil];
			missionNamespace setVariable ["auc_isLoading", false];
			if (!_isRefresh) then {
				createDialog "auctions";
			};
		} else {
			uiNamespace setVariable [_sign,_saved];
		};
	};
};