/*
	File:	fn_setupCategory.sqf
	Date:   2017-04-30 21:54:34
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define WEA 0
	#define CLO 1
	#define VITEMS 2
	#define OTHER 3
*/

disableSerialization;
params[
	["_button", controlNull, [controlNull]],
	["_type", 0, [0]]
];
private _display = ctrlParent _button;
private _lastCategory = _display getVariable ["lastCategory",controlNull];


if (!isNull _lastCategory) then {
	_lastCategory ctrlSetBackgroundColor [0,0,0,0.8];
};
_button ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
_display setVariable ["lastCategory",_button];

switch (_type) do { 
	case 0 : {
		(_display displayCtrl 1101) ctrlSetText "Nehmen";
		(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1103) ctrlSetText "Ausrüsten";
		(_display displayCtrl 1103) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1,'Equip'] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1201) ctrlSetText "Lagern";
		(_display displayCtrl 1201) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1203) ctrlSetText "Alles";
		(_display displayCtrl 1203) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0,'All'] call life_fnc_handleTransfer;"];
		_display setVariable ["current_Namespace","weapon_space"];
	}; 
	case 1 : {
		(_display displayCtrl 1101) ctrlSetText "Nehmen";
		(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1103) ctrlSetText "Ausrüsten";
		(_display displayCtrl 1103) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1,'Equip'] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1201) ctrlSetText "Lagern";
		(_display displayCtrl 1201) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1203) ctrlSetText "Alles";
		(_display displayCtrl 1203) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0,'All'] call life_fnc_handleTransfer;"];
		_display setVariable ["current_Namespace","clothing_space"];
	};
	case 2 : {
		(_display displayCtrl 1101) ctrlSetText "Nehmen";
		(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick","[] call life_fnc_vehTakeItem;"];

		(_display displayCtrl 1103) ctrlSetText "Alles";
		(_display displayCtrl 1103) ctrlSetEventHandler ["ButtonClick","['All'] call life_fnc_vehTakeItem;"];

		(_display displayCtrl 1201) ctrlSetText "Lagern";
		(_display displayCtrl 1201) ctrlSetEventHandler ["ButtonClick","[] call life_fnc_vehStoreItem;"];

		(_display displayCtrl 1203) ctrlSetText "Alles";
		(_display displayCtrl 1203) ctrlSetEventHandler ["ButtonClick","['All'] call life_fnc_vehStoreItem;"];
	};
	case 3 : {
		(_display displayCtrl 1101) ctrlSetText "Nehmen";
		(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1103) ctrlSetText "Alles";
		(_display displayCtrl 1103) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,1,'Equip'] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1201) ctrlSetText "Lagern";
		(_display displayCtrl 1201) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0] call life_fnc_handleTransfer;"];

		(_display displayCtrl 1203) ctrlSetText "Alles";
		(_display displayCtrl 1203) ctrlSetEventHandler ["ButtonClick","(_this select 0) ctrlEnable false; [_this select 0,0,'All'] call life_fnc_handleTransfer;"];
		_display setVariable ["current_Namespace","other_space"];
	};
};
[_display,_type] call life_fnc_setupSection;