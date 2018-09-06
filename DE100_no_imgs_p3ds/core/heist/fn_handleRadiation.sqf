/*
	File: fn_handleRadiation.sqf
	Author: Remote

	Description:
	Do the radiation effect + damage to the player
 */
params [
	["_distance",0,[0]]
];
private _distanceMax = getNumber(missionConfigFile >> "Life_Settings" >> "radiation_range");
_distancePercent = (1 - (_distance / _distanceMax)); //1.00 = 100% , 0.00 = 0% near
[format["Strahlung!!!"],true,"fast"] call life_fnc_notification_system;
player setDamage ((damage player) + _distancePercent * 0.12);

//Effects yeah
[] spawn {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [0.67,1,0,0.1], [1,0,1,0]];
	"colorCorrections" ppEffectCommit 1.5;

	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [0.01,0.01,true];
	"chromAberration" ppEffectCommit 1.5;

	uiSleep 1.75;

	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [1,1,1,1]];
	"colorCorrections" ppEffectCommit 1.0;

	"chromAberration" ppEffectAdjust [0.005,0.005,false];
	"chromAberration" ppEffectCommit 1.0;

	uiSleep 1.0;

	"chromAberration" ppEffectEnable false;
	"colorCorrections" ppEffectEnable false;
};
