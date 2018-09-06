/*
	File:	fn_changeRank.sqf
	Date:   2016-11-01 21:12:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _display = findDisplay 4000;
private _listBox = _display displayCtrl 4001;
private _dropBox = _display displayCtrl 4002;

_uid = if (isNull (objectFromNetId (_listBox lbData (lbCurSel _listBox)))) then {
	private _unit = parseSimpleArray format["%1",_listBox lbData (lbCurSel _listBox)];
	_unit set [2,format["%1",lbCurSel _dropBox]];
	_listBox lbSetData [lbCurSel _listBox,str _unit];
	_unit select 0;
} else {
	private _unit = objectFromNetId (_listBox lbData (lbCurSel _listBox));
	getPlayerUID _unit;
};

if (life_HC_isActive) then {
	[_uid,lbCurSel _dropBox,_display getVariable ["type",0]] remoteExec ["HC_fnc_updateRank",HC_Life];
} else {
	[_uid,lbCurSel _dropBox,_display getVariable ["type",0]] remoteExec ["TON_fnc_updateRank",2];
};


[_listBox,lbCurSel _listBox] call life_fnc_staffManagerLbChange;