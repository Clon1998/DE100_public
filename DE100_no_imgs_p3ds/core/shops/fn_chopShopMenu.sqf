/*
	File:	fn_chopShopMenu.sqf
	Date:   01.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define SELL 0
	#define LOAD 1
	#define BUY 2
*/
//ChopShop

disableSerialization;

params[
	["_mode", 0, [0,objNull,[]]],
	"_index",
	"_vehInfo"
];
if (_mode isEqualType objNull) then {
	_mode = 0;
};
private _data = [];
if (_mode isEqualType []) then {
	_data = _mode;
	_mode = 2;
};

if (!dialog) then {
	createDialog "life_chop_Shop";
};

private _display = findDisplay 2000;
private _infoText = _display displayCtrl 2001;
private _listBox = _display displayCtrl 2002;
private _modeBtn = _display displayCtrl 2003;
private _actionBtn = _display displayCtrl 2004;
private _nearVehicles = (nearestObjects [getpos player,["Car","Truck","Air"],10]) select {alive _x && count crew _x isEqualTo 0};
_modeBtn ctrlEnable true;
_infoText ctrlSetStructuredText parseText format [""];
lbClear _listBox;

switch (_mode) do { 
	case 0 : {
		if (count _nearVehicles isEqualTo 0) exitwith {
			["Du kannst kein Fahrzeug verkaufen.",true,"fast"] call life_fnc_notification_system;
			[1] call life_fnc_chopShopMenu;
		};
		{
			_vehInfo = [typeOf _x] call life_fnc_fetchVehInfo;
			_index = _listBox lbAdd (_vehInfo select 3);
			_listBox lbSetData [_index,netId _x];
			_listBox lbSetPicture [_index,_vehInfo select 2];
		} forEach _nearVehicles;
		_actionBtn ctrlSetText "Verkaufen";
		_actionBtn buttonSetAction "[] call life_fnc_chopShopSell";

		_modeBtn ctrlSetText "Zurückkauf-Menü";
		_modeBtn buttonSetAction "[1] call life_fnc_chopShopMenu";

		_display setVariable ["type",0];
	};

	case 1 : {
		_listBox lbSetData [_listBox lbAdd "Lade Daten...","exit"];

		_actionBtn ctrlSetText "Warte";
		_actionBtn buttonSetAction "";

		_modeBtn ctrlSetText "Verkauf-Menü";
		_modeBtn buttonSetAction "[0] call life_fnc_chopShopMenu";

		if (count _nearVehicles isEqualTo 0) then {
			_modeBtn ctrlEnable false;
		};
		_display setVariable ["type",1];
		if (life_HC_isActive) then {
			[getPlayerUID player,call life_clientId select 0] remoteExecCall ["CS_fnc_get",HC_Life];
		} else {
			[getPlayerUID player,call life_clientId select 0] remoteExecCall ["CS_fnc_get",2];
		};
	}; 

	case 2 : {
		if (_data isEqualTo []) exitwith {
			closeDialog 0;
			["Du kannst kein Fahrzeug zurückkaufen.",true,"fast"] call life_fnc_notification_system;
		};
		["Daten empfangen",true,"fast"] call life_fnc_notification_system;

		{
			_vehInfo = [_x select 1] call life_fnc_fetchVehInfo;
			_index = _listBox lbAdd (_vehInfo select 3);
			_listBox lbSetData [_index,_x select 1];
			_listBox lbSetValue [_index,_x select 0];
			_listBox lbSetPicture [_index,_vehInfo select 2];
		} forEach _data;

		_actionBtn ctrlSetText "Zurückkaufen";
		_actionBtn buttonSetAction "[] call life_fnc_chopShopBuyBack";

		_modeBtn ctrlSetText "Verkauf-Menü";
		_modeBtn buttonSetAction "[0] call life_fnc_chopShopMenu";
		if (count _nearVehicles isEqualTo 0) then {
			_modeBtn ctrlEnable false;
		};
		_display setVariable ["type",2];
	}; 
};