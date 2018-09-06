private ["_antwort","_taxifahrerUID","_startposition","_anfahrtskosten","_taxiposition","_distanz"];

_antwort = [_this,0] call BIS_fnc_Param;
_taxifahrerUID = [_this,1] call BIS_fnc_Param;
_taxiposition = [_this,2] call BIS_fnc_param;
_taxifahrername = [_this,3] call BIS_fnc_param;
_startposition = position player;
_distanz = _taxiposition distance player;
_anfahrtskosten =( _distanz * 10 ) + 1000;
if(_antwort) then
{	
	taxijobbeansprucht=true;
	hint format[ "Der Taxifahrer (%1) hat akzeptiert und macht sich nun auf den Weg",_taxifahrername];
	[1,_taxifahrerUID,_anfahrtskosten,_startposition] call life_fnc_taxijobAktivKunde;
}
else
{	
	hint "Taxifahrer hat abgelehnt, nächster Taxifahrer wird gefragt...";
	life_taxi_request = false;
	[false] call life_fnc_taxirufen;
};