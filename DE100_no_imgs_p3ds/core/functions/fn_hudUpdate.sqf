/*
	File:	fn_hudUpdate.sqf
	Date:   2016-08-30 18:00:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
private _hud = uiNameSpace getVariable ["playerHUD",displayNull];
private _sBar = uiNamespace getVariable ["statusBar",displayNull];
if (isNull _hud || isNull _sBar) then {
	call life_fnc_hudSetup;
	_hud = uiNameSpace getVariable ["playerHUD",displayNull];
	_sBar = uiNamespace getVariable ["statusBar",displayNull];
};
private _sBar = _sBar displayCtrl 1000;

private _mBG = _hud displayCtrl 4451;
private _sBG = _hud displayCtrl 4466;

private _tFood = _hud displayCtrl 4452;
private _tThirst = _hud displayCtrl 4453;
private _tHealt = _hud displayCtrl 4454;
private _tFat = _hud displayCtrl 4455;
private _tWeight = _hud displayCtrl 4456;
private _tTime = _hud displayCtrl 4457;
private _tDate = _hud displayCtrl 4458;

private _pFood = _hud displayCtrl 4459;
private _pThirst = _hud displayCtrl 4460;
private _pHealt = _hud displayCtrl 4461;
private _pFat = _hud displayCtrl 4462;
private _pWeight = _hud displayCtrl 4463;

private _vTime = _hud displayCtrl 4464;
private _vDate = _hud displayCtrl 4465;

private _iDxp = _hud displayCtrl 4468;
private _iEar = _hud displayCtrl 4469;
private _vDateTime = _hud displayCtrl 4470;

private _timeData = [2] call life_fnc_timeToStr;

if (((uiNamespace getVariable ["hudPos",0]) < 2) && (player getVariable ["isAlive",true])) then {
	_vTime ctrlSetStructuredText parseText format["%1", _timeData select 0];
	_vDate ctrlSetStructuredText parseText format["%1", _timeData select 1];
} else {
	_vDateTime ctrlSetText format["%1 | %2", _timeData select 0,_timeData select 1];
};

//Update food
_pFood progressSetPosition (1 / (100 / life_hunger));
_tFood ctrlSetText format["%1%2", life_hunger,"%"];

//Update thirst
_pThirst progressSetPosition (1 / (100 / life_thirst));
_tThirst ctrlSetText format["%1%2", life_thirst,"%"];

//Update Health
_pHealt progressSetPosition (1 - (damage player));
_tHealt ctrlSetText format["%1%2", round((1 - (damage player)) * 100),"%"];

//Update Fat
_pFat progressSetPosition (1 - (life_stamina_bar));
_tFat ctrlSetText format["%1%2", round((1 - (life_stamina_bar)) * 100),"%"];

//Update Backpack
_pWeight progressSetPosition ((1/ life_maxWeight)  * life_carryWeight);
_tWeight ctrlSetText format["%1/%2", life_carryWeight, life_maxWeight];

//StatusBar
_sBar ctrlSetText format["DE100-Altis.life | FPS: %1 | Polizisten: %2 | Zivs: %3 | THR: %4 | Bargeld: %5 | Bank: %6", round diag_fps, west countSide allPlayers, civilian countSide allPlayers, independent countSide allPlayers,[de100_luciandjuli_mula] call life_fnc_numberText,[de100_luciandjuli_bc] call life_fnc_numberText];

if (missionNamespace getVariable ["life_ear_in",false]) then {
	if (!ctrlShown _iEar && !(_hud getVariable ["hidden",false])) then {
		_iEar ctrlShow true;
	};
} else {
	if (ctrlShown _iEar) then {
		_iEar ctrlShow false;
	};
};

if ((missionNamespace getVariable ["life_real_date",""]) in (call (missionNamespace getVariable ["de100_Dxp_days",{[]}])) || (missionNamespace getVariable ["life_admin_moreXp",false])) then {
	if !(ctrlShown _iDxp && !(_hud getVariable ["hidden",false])) then {
		_iDxp ctrlShow true;
	};
} else {
	if (ctrlShown _iDxp) then {
		_iDxp ctrlShow false;
	};
};
