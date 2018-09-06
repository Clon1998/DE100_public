/*

//  RUNWAY LIGHT SCRIPT \\
//     BY AUSTINATST    \\
//         v.01         \\

null = [this,#] execVM "runwayLights.sqf";

Different Lights:
( USE for # )

1 = Yellow Navigation Light	 ---   "Land_NavigLight"
2 = White Edge Light   	 ---   "Land_runway_edgelight"
2.1= Red Edge Light		---    "Land_Flush_Light_red_F"
2.2 = Green Edge Light	    ---     "Land_Flush_Light_green_F"
2.3 = Blue Edge Light	     ---    "Land_runway_edgelight_blue_F"
2.4 = Yellow Edge Light		---    "Land_Flush_Light_yellow_F"
3 = 3 Nav Lights			---    "Land_NavigLight_3_F"

NOTES:
->(r,g,b,y) or (.1,.2,.3,.4) <-

USE A "SPHERE 25mm" AS YOUR OBJECT
THIS WILL BE MORE CONVIENENT
Then other objects but its not required.

*/

//Object arrays
_Light = _this select 0;
_LightType = _this select 1;
_LightDir = direction _Light;
_lightPos = getPos _Light;

//Deletes said object
deleteVehicle _Light;

//This creates the lights
if (_LightType == 1) then {
	_Light = createVehicle ["Land_NavigLight", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 2) then {
	_Light = createVehicle ["Land_runway_edgelight", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 2.1) then {
	_Light = createVehicle ["Land_Flush_Light_red_F", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 2.2) then {
	_Light = createVehicle ["Land_Flush_Light_green_F", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 2.3) then {
	_Light = createVehicle ["Land_runway_edgelight_blue_F", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 2.4) then {
	_Light = createVehicle ["Land_Flush_Light_yellow_F", _lightPos, [], 0, "CAN_COLLIDE"];
};
if (_LightType == 3) then {
	_Light = createVehicle ["Land_NavigLight_3_F", _lightPos, [], 0, "CAN_COLLIDE"];
};

waitUntil {!isNil "_Light" && {!isNull _Light}};
//Sets light params from object
_Light setDir _LightDir;
_Light setPos _lightPos;