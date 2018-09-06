/*
	File:	fn_smartphoneincommingCall.sqf
	Date:   2016-07-31 13:54:17
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];
private _btn_den = _display displayCtrl 6203;
private _btn_acc = _display displayCtrl 6205;
private _btn_hangup = _display displayCtrl 6207;
private _infoText = _display displayCtrl 6201;

private _pic_den = _display displayCtrl 6202;
private _pic_acc = _display displayCtrl 6204;
private _pic_hangup = _display displayCtrl 6206;

private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
private _callNumber = if ((getPlayerUID life_caller) in (profileNamespace getVariable [format["DE100_contacts_%1",_flag],[]])) then {
	life_caller call life_fnc_name;
} else {
	life_caller getVariable ["phoneNumber","nope"];
};

switch ( life_call_mode) do { 
	case "active" : {
		_btn_den ctrlShow false;
		_btn_acc ctrlShow false;
		_pic_den ctrlShow false;
		_pic_acc ctrlShow false;

		_btn_hangup buttonSetAction "['hangup'] call life_fnc_end_call;";
	}; 
	
	case "recieve" : {		
		_btn_hangup ctrlShow false;
		_pic_hangup ctrlShow false;
	}; 

	case "calling" : {
		_btn_den ctrlShow false;
		_btn_acc ctrlShow false;
		_pic_den ctrlShow false;
		_pic_acc ctrlShow false;

		_btn_hangup buttonSetAction "['stop'] call life_fnc_end_call;";
	}; 
};

_infoText ctrlSetStructuredText parseText format["<t size='1.2'>%1</t>",_callNumber];