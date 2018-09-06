/*
	File:	fn_searchVehAction.sqf
	Date:   2016-07-24 03:35:21
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _vehicle = cursorObject;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship") || (_vehicle isKindOf "Pod_Heli_Transport_04_base_F")) then {
	private _keyHolders = _vehicle getVariable ["key_owners",[]];
	private _owner = _vehicle getVariable ["owner",[]];
	private _oldPos = visiblePosition player;
	if (_owner isEqualTo []) exitWith {[localize "STR_NOTF_VehCheat",true,"fast"] call life_fnc_notification_system; deleteVehicle _vehicle};
	life_action_inUse = true;
	[localize "STR_NOTF_Searching",false,"fast"] call life_fnc_notification_system;
	sleep 3;
	life_action_inUse = false;
	if ((visiblePosition player) distance _oldPos > 2 || !alive player || !alive _vehicle || !isNull objectParent player) exitWith {[localize "STR_NOTF_SearchVehFail",true,"fast"] call life_fnc_notification_system;};
	

	private _hText = "";
	{
		_hText = format["%1%2<br/>",_hText,_x select 1];
	} forEach _keyHolders;
	
	if(_hText isEqualTo "") then {
		_hText = "Keine Schlüsselinhaber<br/>";
	};

	hint parseText format["<t color='#FF0000'><t size='2'>Fahrzeuginfo</t></t><br/><t color='#FFD700'><t size='1.5'>Besitzer</t></t><br/>%1<br/><t size='1.2'>Schlüsselinhaber</t></t><br/>%2",_owner select 1,_hText];
};