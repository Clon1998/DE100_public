/*
	File:	fn_weaponShopMenu.sqf
	Date:   15.07.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

[_this,{
	if (!isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"fast"] call life_fnc_notification_system;};
	_startFrame = diag_tickTime;
	private _cEntry = param [3,"",[""]];
	private _data =+ [_cEntry,missionNamespace getVariable ["de100_Shops",[]]] call life_fnc_dataFromKey;
	if (_data isEqualTo false) exitWith {["Der Shop ist noch nicht bereit, bitte versuche es später noch einmal.", false, "fast"] call life_fnc_notification_system;};
	private _lic = ["license",_data] call life_fnc_dataFromKey;
	private _aS = ["allowedSides",_data] call life_fnc_dataFromKey;
	private _pS = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
	if (player getVariable["nobody",false]) then {_pS = "nobody";};
	if (!(_pS in _aS)) exitWith {["Du kannst dir nichts in diesem Laden kaufen",false,"fast"] call life_fnc_notification_system;};
	if (!([0,_lic] call life_fnc_handleLicense) && _lic != "") exitWith {["Du besitzt die benötigte Lizenz nicht!",false,"fast"] call life_fnc_notification_system;};

	private _cP = {
		params[
			["_t", "", [""]],
			["_v", "", [""]],
			["_w", ""]//VALUE WERT
		];
		if ("" in [_t,_v,_w]) exitWith {true;};
		call {
			if (_t isEqualTo "scalar") exitWith {
				(if ((missionNamespace getVariable [_v,0]) isEqualType {}) then {call (missionNamespace getVariable [_v,0]);} else {missionNamespace getVariable [_v,0];}) >= _w;
			};
		
			if (_t isEqualTo "array") exitWith {
				(if ((missionNamespace getVariable [_v,""]) isEqualType {}) then {call (missionNamespace getVariable [_v,""]);} else {missionNamespace getVariable [_v,""];}) in _w;
			};

			if (_t isEqualTo "equalInt") exitWith {
				(if ((missionNamespace getVariable [_v,0]) isEqualType {}) then {call (missionNamespace getVariable [_v,0]);} else {missionNamespace getVariable [_v,0];}) == _w;
			};
		};
	};

	private _r = ["rifles",_data] call life_fnc_dataFromKey;
	private _p = ["pistols",_data] call life_fnc_dataFromKey;
	private _a = ["ammunition",_data] call life_fnc_dataFromKey;
	private _ac = ["accessoires",_data] call life_fnc_dataFromKey;
	private _m = ["misc",_data] call life_fnc_dataFromKey;

	_r = if (_r isEqualTo false) then {[];} else {_r select {(_x select 3) call _cP};};
	_p = if (_p isEqualTo false) then {[];} else {_p select {(_x select 3) call _cP};};
	_a = if (_a isEqualTo false) then {[];} else {_a select {(_x select 3) call _cP};};
	_ac = if (_ac isEqualTo false) then {[];} else {_ac select {(_x select 3) call _cP};};
	_m = if (_m isEqualTo false) then {[];} else {_m select {(_x select 3) call _cP};};
	
	if (_r isEqualTo [] && _p isEqualTo [] && _a isEqualTo [] && _ac isEqualTo [] && _m isEqualTo []) exitWith {["Du kannst dir nichts in diesem Laden kaufen",false,"fast"] call life_fnc_notification_system;};
	
	private _wh = [];
	private _whC = (_a + _ac);
	{
		_c = (toLower (_x select 0));
		_wh pushBack _c;
		_x set [0, _c];
		nil;
	} count _whC;

	{
		private _iD = [_x select 0] call life_fnc_fetchCfgDetails;
		_dA = (_iD select 11) + (_iD select 12) + (_iD select 16) + (_iD select 10) + (_iD select 7);
		_x pushBack (_dA select {(toLower _x) in _wh});
		nil;
	} count (_r + _p);
	if (!isNil "DE100_Diagnostic") then {
		systemChat format["PreInit time: %1",diag_tickTime - _startFrame];
    };
	disableSerialization;
	createDialog "life_weapon_shop";
	setMousePosition [0.5, 0.5];
	private _d = findDisplay 3400;
	private _tv = _d displayCtrl 3401;
	(_d displayCtrl 3400) ctrlSetText (["title",_data] call life_fnc_dataFromKey);
	(_d displayCtrl 3404) ctrlSetText "Kaufen";
	_tv ctrlShow false;

	{
		private _arr = _x select 2;
		if !(_arr isEqualTo []) then {
			private _pI = _tv tvAdd [[], _x select 0];
			_tv tvSetPicture [[_pI], _x select 1];
			_tv tvSetData [[_pI],"error"];
			_tv tvSetValue [[_pI],-1];
			{
				private _c = toLower(_x select 0);
				private _cN = _x select 1;
				private _pr = _x select 2;
			    _iD = [_c] call life_fnc_fetchCfgDetails;

		    	_cI = _tv tvAdd [[_pI],if (_cN != "") then {_cN;} else {_iD select 1;}];
		    	_tv tvSetData [[_pI,_cI], _c];
		    	_tv tvSetValue [[_pI,_cI], _pr];
		    	_tv tvSetPicture [[_pI,_cI], _iD select 2];
		    	if (count _x == 5) then {
			    	{
			    		_c = toLower _x;
			    		_iD = [_c] call life_fnc_fetchCfgDetails;

						_cN=((_a + _ac) param[([toLower _x,_whC]call life_fnc_index),[],[]])param[1,"",[""]];
						_pr=((_a + _ac) param[([toLower _x,_whC]call life_fnc_index),[],[]])param[2,0,[0]];

			    		_gci = _tv tvAdd [[_pI,_cI],if(_cN=="")then{_iD select 1}else{_cN}];
			    		_tv tvSetData [[_pI,_cI,_gci], _c];
			    		_tv tvSetValue [[_pI,_cI,_gci], _pr];
			    		_tv tvSetPicture [[_pI,_cI,_gci], _iD select 2];
			    		nil;
			    	} count (_x select 4);
		    	};
		    	nil;
			} count _arr;
		};
		nil;
	} count [["Gewehre","a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa",_r],["Pistolen","a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\handgun_ca.paa",_p],["Munition","a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoMag_ca.paa",_a],["Zubehör","a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\itemOptic_ca.paa",_ac],["Sonstiges","a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\map_ca.paa",_m]];
	_tv ctrlShow true;
	if (!isNil "DE100_Diagnostic") then {
		systemChat format["Execution time: %1",diag_tickTime - _startFrame];
    };
}]execFSM'core\fsm\call.fsm';