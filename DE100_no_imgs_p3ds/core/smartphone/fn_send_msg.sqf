/*
	File:	fn_send_msg.sqf
	Date:   2016-08-01 23:01:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
private _display = findDisplay 7100;
private _header = _display displayCtrl 7100;
private _playerList = _display displayCtrl 7101;
private _ctrlGrp = _display displayCtrl 7102;
private _edit = _display displayCtrl 7103;

private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
private _msgArray = profileNamespace getVariable[format["DE100_%1_%2",_flag,getPlayerUID life_smartphoneTarget],[]];
private _msg = call{private['_c','_n'];_c=format["%1",ctrlText _edit];_n=_c;for'_i'from 1 to 55 do{if(_c find format[':%1:',_i]>-1)then{_n=[_n,format[':%1:',_i],format["<img size='1.2'image='images\icons\emoji\%1.paa'/>",_i]]call STR_fnc_replace}};_n};

_edit ctrlSetText "";

if (isNull life_smartphoneTarget) exitWith  {
	["Keine Person ausgwählt!",true,"fast"] call life_fnc_notification_system;
};

if (count _msg == 0) exitWith  {
	["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
};
private _timeData = [2] call life_fnc_timeToStr;
_msgArray = [["send",format["%1",_msg],format["%1 %2",_timeData select 0,_timeData select 1]]] + _msgArray;
if (count _msgArray > 15) then {
	_msgArray resize 15;
};
profileNamespace setVariable [format["DE100_%1_%2",_flag,getPlayerUID life_smartphoneTarget],_msgArray];
[_msg,player call life_fnc_name,0,getPlayerUID player] remoteExecCall ["life_fnc_clientMessage",life_smartphoneTarget];
['write'] spawn life_fnc_smartphoneMsgView;