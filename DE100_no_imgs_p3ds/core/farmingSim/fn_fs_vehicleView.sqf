/*
	File:	fnc_fs_vehicleView.sqf
	Date:   2017-07-01 23:05:37
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_d", displayNull, [displayNull,controlNull]]
];
if (_d isEqualType controlNull) then {
	_d = ctrlParent _d;
};

private _lb = _d displayCtrl 1;
private _dGrp = _d displayCtrl 2;
private _nG = _d displayCtrl 3;
private _sT = _d displayCtrl 4;
private _pG = _d displayCtrl 5;
private _oGrp = _d displayCtrl 8;
_sT ctrlSetText "Fahrzeuge";
_pG ctrlShow true;
_oGrp ctrlShow true;
(_pG controlsGroupCtrl 0) ctrlSetEventHandler ["ButtonClick","_this call life_fnc_fs_itemView;"];
_nG ctrlShow false;
_dGrp ctrlShow false;

{
	if (!isNull _x) then {
		ctrlDelete _x;
	};
	nil;
} count (_dGrp getVariable ["ctrls",[]]);

private _sI = _d getVariable ["item",""];
_sI = getText(missionConfigFile >> "ItemProcessing" >> _sI >> "newItem");
private _con = call {
	if (getNumber(missionConfigFile >> "VirtualItems" >> _sI >> "needFuelTruck") isEqualTo 1) exitWith {"getNumber(_x >> 'vItemSpace') > 0 && getNumber(_x >> 'showInFAQ') isEqualTo 1 && getNumber(_x >> 'fuelVeh') isEqualTo 1";};
	if (getNumber(missionConfigFile >> "VirtualItems" >> _sI >> "needGasTruck") isEqualTo 1) exitWith {"getNumber(_x >> 'vItemSpace') > 0 && getNumber(_x >> 'showInFAQ') isEqualTo 1 && getNumber(_x >> 'gasVeh') isEqualTo 1";};
 	"getNumber(_x >> 'vItemSpace') > 0 && getNumber(_x >> 'showInFAQ') isEqualTo 1 && getNumber(_x >> 'fuelVeh') isEqualTo 0 && getNumber(_x >> 'gasVeh') isEqualTo 0";
};
lbClear _lb;
{
	private _i = _lb lbAdd getText(configFile >> "CfgVehicles" >> (configName _x) >> "displayName");
	_lb lbSetTooltip [_i,getText(configFile >> "CfgVehicles" >> (configName _x) >> "displayName")];
	_lb lbSetData [_i,configName _x];
	private _ico = getText(configFile >> "CfgVehicles" >> (configName _x) >> "picture");
	_lb lbSetPicture [_i,if (_ico isEqualTo "iconObject_1x2") then {"\a3\ui_f\data\map\vehicleicons\iconobject_1x2_ca.paa"} else {_ico}];
	nil;
} count (_con configClasses (missionConfigFile >> "lifeVehicles"));
lbSort _lb;
_d setVariable ["lbState",1];
_lb lbSetCurSel 0;