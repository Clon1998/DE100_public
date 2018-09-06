/*
	File:	fn_hudShow.sqf
	Date:   2017-05-11 21:06:42
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
if !(_hud getVariable ["hidden",false]) exitwith {};
_hud setVariable ["hidden",false];
for "_i" from 4451 to 4466 do {
	private _ctrl = _hud displayCtrl _i;
	if (!isNull _ctrl) then {
		_ctrl ctrlShow true;
	};
};
(_sBar displayCtrl 1000) ctrlShow true;
if (missionNamespace getVariable ["life_ear_in",false]) then {
	(_hud displayCtrl 4469) ctrlShow true;
};
if ((missionNamespace getVariable ["life_real_date",""]) in (call (missionNamespace getVariable ["de100_Dxp_days",{[]}])) || (missionNamespace getVariable ["life_admin_moreXp",false])) then {
	(_hud displayCtrl 4468) ctrlShow true;
};

if ((uiNamespace getVariable ["hudPos",0]) >= 2) then {
	private _ctrl = _hud displayCtrl 4470;
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 0;
};