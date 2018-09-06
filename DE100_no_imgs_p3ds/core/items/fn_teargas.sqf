/*
	File:	fn_teargas.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
if (!hasInterface) exitwith {};
params[
	["_pos", [], [[]]],
	"_startTime",
	"_handle"
];

_startTime = time;
while {(player distance _pos) > 11} do {
	if ((time - _startTime) > 40) exitWith {};
	sleep 1;
};
if (player distance _pos > 11 || (time - _startTime) > 40 || headgear player isEqualTo "H_CrewHelmetHeli_O" || !isNull objectParent player || player getVariable ["isTeared",false]) exitWith {}; //Bad again.
["Ahhh Tränengas, meine Augen brennen.",false,"slow"] call life_fnc_notification_system;
player setVariable ["isTeared", true]; 
_handle = ppEffectCreate ["DynamicBlur", 403]; 
_handle ppEffectForceInNVG true;
_handle ppEffectEnable true; 
_handle ppEffectAdjust [20]; 
_handle ppEffectCommit 1; 
10 fadeSound 0.1;
life_prof_noXp = true;
enableCamShake true;     // enables camera shake
addCamShake [10, 85, 10];    // sets shakevalues
sleep 41;
_handle ppEffectAdjust [0]; 
_handle ppEffectCommit 20; 
sleep 5;
20 fadeSound (profileNamespace getVariable ["de100_fadeSound",1]);
sleep 5;
waitUntil {ppEffectCommitted _handle}; 
_handle ppEffectEnable false;
ppEffectDestroy _handle;
player setVariable ["isTeared", false];