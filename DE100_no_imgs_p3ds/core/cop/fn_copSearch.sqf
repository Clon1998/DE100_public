/*
	File:	fn_copSearch.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_civ", objNull, [objNull]],
	["_invs", [], [[]]],
	["_weapons", [], [[]]]
];
if(isNull _civ) exitWith {};
_illegal = 0;
_illegalwp = 0;
_inv = "";
if((count _invs) + (count _weapons) > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,localize (getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName"))];
		_index = [_x select 0,DYN_Price_array] call life_fnc_index;
		if(_index >= 0) then {
			_illegal = _illegal + ((_x select 1) * ((DYN_Price_array select _index) select 1));
		} else {
			_illegal = _illegal + (_x select 1) * (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "sellPrice"));
		};
	} forEach _invs;
	
	{
		_inv = _inv + format["Waffe: %1<br/>", ([_x] call life_fnc_fetchCfgDetails) select 1]; 
		
		_illegalwp = _illegalwp + 5000; //Pauschaler Betrag
	} forEach _weapons;
	
	_illegal = _illegal + _illegalwp;	
	
	[0,"STR_Cop_Contraband",true,[(_civ call life_fnc_name),[_illegal] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
} else {
	_inv = localize "STR_Cop_NoIllegal";
};
if(!alive _civ || player distance _civ > 5) exitWith {[format[localize "STR_Cop_CouldntSearch",_civ call life_fnc_name],true,"fast"] call life_fnc_notification_system;};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Gegenstände</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'></t>"
,(_civ call life_fnc_name),_inv];
