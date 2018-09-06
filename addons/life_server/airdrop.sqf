/*
	File : airdrop.sqf
	Date:   08.08.2015	
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
*/

_postion = 














while {true} do {

}















sleep 120;

airdrop_helicopter_main = "B_Heli_Transport_03_unarmed_F";

_airdrop_positions = [[6224.38,11925.8,0.00156784],[7592,13856,0.00119019],[10018,12119.2,0.00144005],[9122.34,17830.7,0.00247192]];

if (airdrop_goingon) exitWith {};
_chance = floor(random 100);
diag_log format["Airdrop wuerfel: %1",_chance];
if (_chance>10) exitWith {};
diag_log "Airdrop gestartet";
airdrop_goingon = true;
_minTime = (60*60);
_maxTime = (180*60);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
sleep 60;
// AIRDROP STARTEN
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>Ein Rebellenhelikopter hat vor eine Versorgungsgüterbox in 15 Minuten abzuwerfen. Diese kann sowohl Waffen alsauch Munition beinhalten. Die Position wird demnächst durchgegeben!</t>"] remoteExec ["life_fnc_broadcast",0];
_poses = count _airdrop_positions;
_inArr = floor(random _poses);
_dest = _airdrop_positions select _inArr;

sleep 300;

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Airdrop-Mission";
"Airdropmarkertext" setMarkerType "mil_warning";
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>10 Minuten bis zum Abwurf der Box! Die Position ist nun verfügbar! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

sleep 300;

[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>5 Minuten bis zum Abwurf der Box! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>4 Minuten bis zum Abwurf der Box! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>3 Minuten bis zum Abwurf der Box! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>2 Minuten bis zum Abwurf der Box! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>1 Minute bis zum Abwurf der Box! Checke deine Map für den Abwurfort! ACHTUNG: Im rot markierten Bereich ist eine Frei-Feuer-Zone, direktes Töten ist nur in dieser erlaubt!</t>"] remoteExec ["life_fnc_broadcast",0];

heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"];

heli1 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1} forEach units _mygroup1;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[1.47,28267.8,0], 0];


_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorBlue";
"airbox_marker" setMarkerText " Airdrop-Box";
"airbox_marker" setMarkerType "mil_destroy";
while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; sleep 1 };
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>Die Gueter wurden abgeworfen! 20 Minuten bis zu Selbstzerstoerung der Kiste! Viel Glueck!</t>"] remoteExec ["life_fnc_broadcast",0];
// Drop the container

_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
sleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos _container; sleep 1  };

"BO_GBU12_LGB" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deletevehicle _container;
_box = createVehicle ["B_supplyCrate_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;
_smoke="SmokeShellGreen" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

// Fill box

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
sleep 0.1;
_var=floor(random 16);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_SW_Black_F",((floor(random 2))+1)];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", ((floor(random 25))+10)];};
sleep 0.1;
_var=floor(random 17);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_GL_F", ((floor(random 2))+1)];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", ((floor(random 25))+10)];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F", ((floor(random 15))+5)];};
sleep 0.1;
_var=floor(random 18);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_F", ((floor(random 2))+1)];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", ((floor(random 25))+10)];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_EBR_F", ((floor(random 2))+1)];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_01_F", ((floor(random 2))+1)];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_Katiba_GL_F", ((floor(random 4))+1)];};
sleep 0.1;
_var=floor(random 3);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", ((floor(random 4))+1)];};
sleep 0.1;
_var=floor(random 20);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MXM_F", 1];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["30Rnd_65x39_caseless_mag", ((floor(random 15))+5)];};

diag_log format["getWeaponCargo _box: %1",getWeaponCargo _box];
sleep 300;
deleteVehicle heli1;
sleep 600;
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>5 Minuten bis zur Selbstzerstörung der Kiste!</t>"] remoteExec ["life_fnc_broadcast",0];
sleep 240;
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>1 Minute bis zur Selbstzerstörung der Kiste!</t>"] remoteExec ["life_fnc_broadcast",0];
sleep 50;
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>10 Sekunden bis zur Selbstzerstörung!</t>"] remoteExec ["life_fnc_broadcast",0];
sleep 10;
[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission beendet!</t></t><br/><br/><t size='1'>Die Airdrop-Mission wurde beendet und die Box wird gesprengt! Die Frei-Feuer-Zone wird hiermit aufgehoben!</t>"] remoteExec ["life_fnc_broadcast",0];
deleteVehicle _box; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)-1,(getPos _box select 1)+56,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+23,(getPos _box select 1)-75,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)-50,(getPos _box select 1)+1,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+87,(getPos _box select 1)-22,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+0,(getPos _box select 1)-0,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+20,(getPos _box select 1)-20,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)-100,(getPos _box select 1)+56,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+100,(getPos _box select 1)-100,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)-55,(getPos _box select 1)+123,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+577,(getPos _box select 1)-83,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+35,(getPos _box select 1)-99,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)+100,(getPos _box select 1)-100,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box  select 0)-431,(getPos _box select 1)-431,0];

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;

sleep 10;
deletevehicle _bmb;
