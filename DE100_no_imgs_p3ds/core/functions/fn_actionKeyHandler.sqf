/*
	File:   fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/

params[
	["_altStat", false, [false]]
];
if (player getVariable["restrained",false] || life_action_inUse || dialog || !isNull objectParent player) exitwith {};
if (life_interrupted) exitWith {life_interrupted = false;};
private _curTarget = if (!isNull cursorObject) then {
	cursorObject;
} else {
	cursorTarget;
};
life_action_target = _curTarget;

if (isPlayer _curTarget && _curTarget isKindOf "Man") exitWith {
	call {
		if (playerSide isEqualTo civilian) exitWith {[_curTarget] call life_fnc_civIM;};
		if (playerSide isEqualTo west) exitWith {[_curTarget] call life_fnc_copIM;};
		if (playerSide isEqualTo independent) exitWith {[_curTarget] call life_fnc_medIM;};
	};	
};

if ((_curTarget isKindOf "landVehicle" || _curTarget isKindOf "Ship" || _curTarget isKindOf "Air") && ([_curTarget,player] call life_fnc_bBoxDistance) <= 5 && alive _curTarget) exitWith {
		[_curTarget] call life_fnc_vehIM;
};

if (_curTarget in lockers_whitelist && playerSide isEqualTo west && ([_curTarget,player] call life_fnc_bBoxDistance) <= 5) exitwith {
	[lockers_obj] call life_fnc_lockersIM;
};

if (_curTarget isKindOf "House_F" && playerSide != independent && ([_curTarget,player] call life_fnc_bBoxDistance) <= 5 || (((nearestObjects  [(getMarkerPos "fed_reserve"),["Land_Dome_Small_F"],200 ]) select 0) == _curTarget || (nearestObject [(getMarkerPos "fed_reserve"),"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseIM;
};

if (isSimpleObject _curTarget) exitwith {
	if ((_curTarget getVariable["className", ""]) == "m2_radarCam" && playerside == west) then {
		[_curTarget] call life_fnc_radarfallemenu;
	};
};

if (surfaceIsWater (getPosASL player) && ((getposASL player) select 2)< 4) exitWith {
	_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
	if(!isNil "_fish") then {
		[_fish] call life_fnc_catchFish;
	};
	_fish = (nearestObjects[getPos player,["Turtle_F"],3]) select 0;
	if(!isNil "_fish") then {
		[_fish] call life_fnc_catchTurtle;
	};
};

private _toPickUp = nearestObjects[getPos player,getArray(missionConfigFile >> "Life_Settings" >> "droped_items") ,3];
if !(_toPickUp isEqualTo []) exitWith {
	[_toPickUp] call life_fnc_pickUpItem;
};

if (playerSide isEqualTo civilian) then {
	[_altStat] call life_fnc_startGather;
	if (([0,"pickaxe"] call life_fnc_handleVItem) > 0) then{
		[_altStat] call life_fnc_startPickaxe;
	};
};