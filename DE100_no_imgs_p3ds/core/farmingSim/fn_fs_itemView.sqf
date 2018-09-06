/*
	File:	fn_fs_itemView.sqf
	Date:   2017-07-01 23:05:11
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_d", displayNull, [displayNull,controlNull]],
	["_oI",""]
];
if (_d isEqualType controlNull) then {
	_d = ctrlParent _d;
};
if (_oI isEqualTo "") then {
	_oI = _d getVariable ["item",""];
};
private _lb = _d displayCtrl 1;
private _dGrp = _d displayCtrl 2;
private _nG = _d displayCtrl 3;
private _sT = _d displayCtrl 4;
private _pG = _d displayCtrl 5;
private _oGrp = _d displayCtrl 8;
_sT ctrlSetText "Items";
_nG ctrlShow true;
_dGrp ctrlShow true;
(_nG controlsGroupCtrl 0) ctrlSetEventHandler ["ButtonClick","_this call life_fnc_fs_vehicleView;"];
_pG ctrlShow false;
_oGrp ctrlShow false;
lbClear _lb;
{
	private _i = _lb lbAdd localize (getText(missionConfigFile >> "VirtualItems" >> getText(_x >> "newItem") >> "displayName"));
	_lb lbSetData [_i,configName _x];
	_lb lbSetPicture [_i,(getText(missionConfigFile >> "VirtualItems" >> getText(_x >> "newItem") >> "icon"))];
	nil;
} count ("!(configName _x isEqualTo 'blueprint')" configClasses (missionConfigFile >> "ItemProcessing"));
lbSort _lb;
_d setVariable ["lbState",0];
[_d,_oI] spawn life_fnc_fs_setItem;