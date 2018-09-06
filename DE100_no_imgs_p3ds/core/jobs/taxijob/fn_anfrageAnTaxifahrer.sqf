/*
	File:	fn_anfrageAnTaxifahrer.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_kundepos","_kundenname","_kundendistanz","_kundenuid"];
_kundenuid = [_this,0] call BIS_fnc_Param;
_kundenpos = [_this,1] call BIS_fnc_Param;
_kundenname = [_this,2] call BIS_fnc_Param;
if(taxionduty == 0) exitWith {};
if(taxiused) exitWith {};
kundenuid = _kundenuid;
createDialog "life_taxianfrage";
disableSerialization;
sleep 1;
_kundendistanz = player distance _kundenpos;
ctrlSetText [3752, format["%1",_kundenname]];
ctrlSetText [3753, format["%1",_kundendistanz]];



