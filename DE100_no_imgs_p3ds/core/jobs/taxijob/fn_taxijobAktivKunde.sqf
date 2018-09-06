private["_type","_taxifahrerUID","_taxikosten","_startposition","_anfahrtskosten","_distanz"];

_type = [_this,0] call BIS_fnc_Param;
if(_type == 1) then 
{
	taxifahrerUID = [_this,1] call BIS_fnc_Param;
	_anfahrtskosten = [_this,2] call BIS_fnc_Param;
	_startposition = [_this,3] call BIS_fnc_Param;
	_distanz = _startposition distance player;
	taxikosten = round ((_distanz * 10) + _anfahrtskosten); 
[2,getPlayerUID player,taxikosten,name player,player] remoteExec ["life_fnc_taxijobAktivTaxifahrer",taxifahrerUID];
} 
else
{
	hint "Der Fahrer hat die Fahrt beendet";
	taxijobbeansprucht = false;
};

