/*
	File:	fn_fs_sliderPosChange.sqf
	Date:   2017-07-01 23:06:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_s", controlNull, [controlNull]],
	["_p", 0, [0]]
];
_s sliderSetPosition round _p;
private _oGrp = ctrlParentControlsGroup _s;
private _d = ctrlParent _oGrp;
private _iT = _oGrp controlsGroupCtrl 1;
private _pS = _oGrp controlsGroupCtrl 2;
private _bS = _oGrp controlsGroupCtrl 3;
private _veh = _d getVariable ["vehicle",""];
_iT ctrlSetStructuredText parseText format ["<t size='1'>Spieler: </t>%1<br/><t size='1'>Kisten: </t>%2/%3<br/><t size='1'>Item: </t>%4<br/><t size='1'>Fahrzeug: </t>%5<br/><t size='1.2'>Schritte: </t>",sliderPosition _pS,sliderPosition _bS,getNumber(missionConfigFile >> "lifeVehicles" >> _veh >> "maxTrunkUpdate"),localize getText(missionConfigFile >> "VirtualItems" >> getText(missionConfigFile >> "ItemProcessing" >> (_d getVariable ["item",""]) >> "newItem") >> "displayName"),getText(configFile >> "CfgVehicles" >> _veh >> "displayName")];
private _p = ctrlPosition _iT;
_iT ctrlSetPosition [_p select 0,_p select 1,_p select 2,ctrlTextHeight _iT];
_iT ctrlCommit 0;
[_d,_d getVariable ["item",""]] call life_fnc_fs_calcValue;