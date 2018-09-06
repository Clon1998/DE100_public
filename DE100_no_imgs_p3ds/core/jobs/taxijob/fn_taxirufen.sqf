if((life_action_delay != 0) && ((time - life_action_delay) < 3)) exitWith {
};
life_action_delay = time;
private["_aktuelleTaxifahrerPos","_nearestTaxifahrer","_taxifahrerUID","_distanz","_ersteAnfrage","_isonline"];
_ersteAnfrage = [_this,0] call BIS_fnc_Param;
if(life_taxi_request) exitWith {hint "Du kannst nur alle 5 Minuten ein Taxi rufen";};
if(taxijobbeansprucht) exitWith {};
if(_ersteAnfrage) then
{
	hint "Taxianfrage wird gestellt..";
	[5,getPlayerUID player] remoteExec ["TON_fnc_handlealleTaxis",2];
};
sleep 3;
if(isNil {alleTaxifahreronDuty}) exitWith {hint "Es steht zur Zeit kein Taxifahrer zur Verfuegung."};  			// wenn die liste das erste Mal angefordert wird.
if(!(_ersteAnfrage) && (count alleTaxifahreronDuty == 0) ) exitWith {hint "Kein Taxifahrer hat deine Anfrage angenommen oder keiner ist frei.";
[] spawn 
{
	life_taxi_request = true;
	sleep (5 * 60);
	life_taxi_request = false;
};};
if(count alleTaxifahreronDuty == 0) exitWith {hint "Es steht zur Zeit kein Taxifahrer zur Verfuegung.";
[] spawn 
{
	life_taxi_request = true;
	sleep (5 * 60);
	life_taxi_request = false;
};};
_distanz = 99999;
_nearestTaxifahrer = "";
{
    //_isonline =_x select 0;
	_aktuelleTaxifahrerPos = _x select 2;	
	if((_aktuelleTaxifahrerPos distance player) < _distanz && !(_x select 1) && ([(_x select 0)] call life_fnc_isUIDActive)) then
	{
		_distanz = _aktuelleTaxifahrerPos distance player;
		_nearestTaxifahrer = _x select 0;
	};	
}foreach alleTaxifahreronDuty;
if (_nearestTaxifahrer == "") exitWith {hint "Es steht zur Zeit kein Taxifahrer zur Verfuegung.";
	[] spawn 
	{
		life_taxi_request = true;
		sleep (5 * 60);
		life_taxi_request = false;
	};
};
[getPlayerUID player,position player,name player] remoteExec ["life_fnc_anfrageAnTaxifahrer",_nearestTaxifahrer];

for "_i" from 0 to count alleTaxifahreronDuty do {		
		if(alleTaxifahreronDuty select _i select 0 == _nearestTaxifahrer) exitWith {
				alleTaxifahreronDuty set [_i,objNull];
				alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
	};
};

if(count alleTaxifahreronDuty > 0) exitWith {};
[] spawn 
{
	life_taxi_request = true;
	sleep (5 * 60);
	life_taxi_request = false;
};