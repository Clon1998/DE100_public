/*
	File : fn_taxiAction.sqf
	Date:   24.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

_type = [_this,3] call BIS_fnc_Param;

if(_type == 1) then 
{
	taxijobbeansprucht=false;
		
	[4,taxifahrerUID] remoteExec ["TON_fnc_handlealleTaxis",2];
	if(de100_luciandjuli_mula > taxikosten) exitWith{
		[1,getPlayerUID player,taxikosten,player] remoteExec ["life_fnc_taxijobAktivTaxifahrer",taxifahrerUID];
		de100_luciandjuli_mula = de100_luciandjuli_mula - taxikosten;
		hint format ["Du hast %1€ für die Fahrt bezahlt",taxikosten];
	};	
	if(de100_luciandjuli_bc > taxikosten) exitWith{
		[1,getPlayerUID player,taxikosten,player] remoteExec ["life_fnc_taxijobAktivTaxifahrer",taxifahrerUID];
		de100_luciandjuli_bc = de100_luciandjuli_bc - taxikosten;
		hint format ["Du hast %1€ für die Fahrt bezahlt",taxikosten];
	};
	if(de100_luciandjuli_mula < taxikosten) exitWith {
		hint "Du hattest nicht genuegend Geld um das Taxi zu bezahlen, der Taxifahrer darf dich nun verklagen";
		[0,getPlayerUID player,taxikosten,player call life_fnc_name] remoteExec ["life_fnc_taxijobAktivTaxifahrer",taxifahrerUID];
	};	
	
	hint format["Du hast die Taxifahrt beendet.Die Fahrt hat %1 € gekostet.",taxikosten];
	taxikosten = 0;
}else{
	[4,getPlayerUID player] remoteExec ["TON_fnc_handlealleTaxis",2];
			
	0 remoteExec ["life_fnc_taxijobAktivKunde",kundenid];			
	hint "Du hast nun die Fahrt beendet, du hast dadurch nichts verdient.";
	taxiused=false;
	[taxikunde] call life_fnc_deleteTaxi;

};
