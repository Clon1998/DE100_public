/**
 * file: fn_heistPrepAction.sqf
 * Author: Remote
 *
 * Description:
 * Starts the heist preparation
 *
 * Can be Called with :
 * this addAction[format["Alte Bunker freilegen (%1€)",(getArray(missionConfigFile >> "Life_Settings" >> "heistPrepCost") select 0) call life_fnc_numberText], life_fnc_heistPrepAction,0,1,false,true,"",'player distance _target < 5.0'];
 * this addAction[format["Sabortiere Turm (%1€)",(getArray(missionConfigFile >> "Life_Settings" >> "heistPrepCost") select 0) call life_fnc_numberText], life_fnc_heistPrepAction,1,1,false,true,"",'player distance _target < 5.0'];
 */
 
params[
	["_vendor", objNull, [objNull]],
	["_caller", objNull, [objNull]],
	["_addactionId", 0, [0]],
	["_type", 0, [0]]
];

private _prepCfg = getArray(missionConfigFile >> "Life_Settings" >> "heistPrepCost");

if (_type > (count _prepCfg - 1)) exitWith {};
if (bank_obj getVariable ["heistPrep",false]) exitWith {
	["Es wurde bereits eine Vorbereitung abgeschlossen oder diese Chance wurde verpasst!",true,"fast"] call life_fnc_notification_system;
};

//WallBreach -0 TowerBreack-1
private _cost = _prepCfg select _type;

if (_cost > de100_luciandjuli_mula) exitWith {
	["Deine Geldmittel reichen dafür nicht aus", true, "fast"] call life_fnc_notification_system;
};

if ((_cost)+(call life_fnc_calcDebts) > de100_luciandjuli_mula) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};

de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - _cost;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
bank_obj setVariable ["heistPrep",true,true];
call {
	if (_type == 0) exitWith {
		0 spawn {
			private _ObjArrOpA = [W1,W2,W3,W4,W5,W6,W7,W8,W9];
			uiSleep 2.5;
			{
				_x allowDamage true;
				("DemoCharge_Remote_Ammo_Scripted" createVehicle (getPosATl _x)) setDamage 1;
				uiSleep 0.1;
				deleteVehicle _x;
				uiSleep 0.2;
				nil;
			} count _ObjArrOpA;
		};
		[Bcam1, Bcam2, 7, 4] call life_fnc_flyingCameraView;
	};
	if (_type == 1) exitWith {
		0 spawn {
			private _ObjArrOpB = [T1];
			uiSleep 3.5;
			{
				_x allowDamage true;
				("DemoCharge_Remote_Ammo_Scripted" createVehicle (getPosATl _x)) setDamage 1;
				uiSleep 1;
				deleteVehicle _x;
				nil;
			} count _ObjArrOpB;
		};
		[Bcam3, Bcam4, 7, 4] call life_fnc_flyingCameraView;
	};
};
