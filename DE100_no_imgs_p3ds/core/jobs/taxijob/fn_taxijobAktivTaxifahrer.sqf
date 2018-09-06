/*
	File : fn_taxijobAktivTaxifahrer.sqf
	Date:   24.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_type","_kundenID","_taxikosten"];

_type = [_this,0] call BIS_fnc_Param;
kundenid = [_this,1] call BIS_fnc_Param;
_taxikosten = [_this,2] call BIS_fnc_Param;
_kundenname = [_this,3] call BIS_fnc_Param;
taxikunde = [_this,4] call BIS_fnc_Param;



switch(_type) do 
{
	case 2: 
	{
		life_taxiMarker = [[taxikunde,_kundenname]];	
	};
	case 1:	
	{
		de100_luciandjuli_mula = de100_luciandjuli_mula + _taxikosten;
		hint format["Der Kunde ist zufrieden und hat fuer die Fahrt %1 bezahlt",_taxikosten];
		taxiused=false;
		[] call life_fnc_deleteTaxi;
	};
	case 0:
	{
		hint format ["Der Kunde hatte nicht genuegend dabei und schuldet dir nun %1 Dollar. Du darfst %2 verklagen.",_taxikosten,_kundenname];
		taxiused=false;
		[] call life_fnc_deleteTaxi;
	};
};