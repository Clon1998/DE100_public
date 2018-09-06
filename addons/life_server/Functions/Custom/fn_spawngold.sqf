private["_heli","_wreck","_chance"];

//Create gold vehicle wreck 
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkGreen",2,["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3"]] call SHK_pos);
waitUntil {!isNil "_heli" && {!isNull _heli}};
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;

_wreck = "Land_UWreck_FishingBoat_F" createVehicle (getPos _heli);
_wreck SetPosATL [(getPos _heli select 0)-300*sin(round(random 359)),(getPos _heli select 1)-300*cos(round(random 359)), 0];
_wreck enableSimulation false;

gold_safe attachTo [_wreck,[3,4,-0.4]];
gold_safe setVectorDirAndUp [[90,0,80],[-90,0,0]];
gold_safe enableSimulation false;
gold_safe allowDamage false;

_chance = floor(random 100);
//diag_log format["Schiffswrack wuerfel: %1",_chance];
if (_chance>65) exitWith {
deletevehicle _heli;
deletevehicle _wreck;
deletevehicle gold_safe;};

_minTime = (60*60);
_maxTime = (180*60);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
_Pos = position _heli;
 _marker = createMarker ["Marker200", _Pos];
"Marker200" setMarkerColor "ColorOrange";
"Marker200" setMarkerType "Empty";
"Marker200" setMarkerShape "ELLIPSE";
"Marker200" setMarkerSize [2500,2500];
_markerText = createMarker ["MarkerText200", _Pos];
"MarkerText200" setMarkerColor "ColorBlack";
"MarkerText200" setMarkerText "Schiffswrack";
"MarkerText200" setMarkerType "mil_warning";
[5,"<t size='2'><t color='#00FF00'>Schiffswrack</t></t> <br/><br/><t size='1'>Ein Schiffswrack wurde gesichtet, überprüf die Gegend nach Kisten.<br/> Check deine Karte</t>"] remoteExec ["life_fnc_broadcast",0];

while{true} do
{
	sleep 60;
	if(gold_safe getVariable["gold",0] == 0) exitWith
		{
		deletevehicle _heli;
		deletevehicle _wreck;
		"Marker200" setMarkerAlpha 0;
		"MarkerText200" setMarkerAlpha 0;
[5,"<t size='2'><t color='#00FF00'>Schiffswrack</t></t><br/><br/><t size='1'>Das Schiffwrack wurde geborgen!</t>"] remoteExec ["life_fnc_broadcast",0];
		};
	
};
