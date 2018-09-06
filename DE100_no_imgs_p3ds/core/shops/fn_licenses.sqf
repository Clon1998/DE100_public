/*
	File:	fn_licenses.sqf
	Date:   06.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


_buyables = _this select 3;
 
 
if(!dialog) then
{
	if(!(createDialog "LicenseShop")) exitWith {};
};

disableSerialization;
 
_display = findDisplay 5546;
if(isNull _display) exitWith {};
_listbox = _display displayCtrl 55126;
_mylic = _display displayCtrl 55131;
 
{
	_displayName = localize(getText(missionConfigFile >> "Licenses" >> _x >> "displayName"));
	_price = getNumber(missionConfigFile >> "Licenses" >> _x >> "price");

	if ([0,_x] call life_fnc_handleLicense) then {
		_mylic lbAdd format["%1", _displayName];
		_mylic lbSetData [(lbSize _mylic) - 1, _x];
	} else {
		_listbox lbAdd format["%1 (€%2)", _displayName, [_price] call life_fnc_numberText];
		_listbox lbSetData [(lbSize _listbox) - 1, _x];
	};
} foreach _buyables;