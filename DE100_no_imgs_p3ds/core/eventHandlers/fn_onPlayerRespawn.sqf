/*
	File:	fn_onPlayerRespawn.sqf
	Date:   2016-08-15 02:47:27
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", objNull, [objNull]],
	["_corpse", objNull, [objNull]],
	"_containers"
];
life_corpse = _corpse;
life_thr_request_delay = [0,0];
_corpse setVariable["isAlive",false,true];
_corpse setVariable["steam64id",(getPlayerUID _unit),true];
_corpse setVariable["realname",profileName,true];
_corpse setVariable["side",playerSide,true];
_corpse setVariable["thrClerk",nil,true];
_corpse setVariable["request",nil,true];
_corpse setVariable["requestveh",nil,true];
_corpse allowDamage false;

_unit setVariable["isAlive",false,true];
_unit setVariable["deathTime",serverTime,true];
_unit setVariable["newBee",_corpse getVariable ["newBee",false],true];
_unit setVariable["steam64id",(getPlayerUID _unit),true];
_unit setVariable["realname",profileName,true];
_unit setVariable["side",playerSide,true];
_unit setVariable["thrClerk",nil,true];
_unit setVariable["request",nil,true];
_unit setVariable["restrained",nil,true];
_unit setVariable["requestveh",nil,true];
_unit setVariable["painKiller",false,true];

profileNamespace setVariable[format["DE100_%1_dammage",playerSide],0];
profileNamespace setVariable [format["DE100_%1_thirst",playerSide],100];
profileNamespace setVariable [format["DE100_%1_hunger",playerSide],100];
_unit call life_fnc_stripDownUnit;
_unit setUnitLoadout [[],[],[],["U_C_WorkerCoveralls",[]],[],[],"H_HeadBandage_bloody_F","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
onMapSingleClick {};//Reset any possible MapSingleClicks!

[_corpse] call life_fnc_dropItems;
private _veh = _corpse getVariable ["inVeh",objNull];
if (!isNull _veh && alive _veh) then {
	private _driver = driver _veh isEqualTo _corpse;
	private _cC = count crew _veh;
	_corpse action ["Eject", _veh];
	if (_driver) then {
		_unit moveInDriver _veh;
		_unit action ["UnlockVehicleControl", _veh];
		_veh engineOn false;
	} else {
		_unit moveInAny _veh;
	};
	0 spawn {
		disableUserInput true;
		uiSleep 1;
		disableUserInput false;
		true call life_fnc_setUnconscious;
	};
} else {
	_unit setDir getDir _corpse;
	_unit setPos getPos _corpse;
	true call life_fnc_setUnconscious;
};
deleteVehicle _corpse;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
life_deathCamera cameraEffect ["Internal","Back"];
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

_unit spawn {
	for "_i" from 0 to 1 step 0 do {
		if (speed _this == 0 && isNull objectParent _this) exitWith {
			true;
		};
		life_deathCamera camSetRelPos [0,3.5,4.5];
		life_deathCamera camCommit 0;
	};
};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = 0;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID _unit),playerSide]),nil,true];

life_vehicles = life_vehicles select {!(_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship" || _x isKindOf "Pod_Heli_Transport_04_base_F") || ((_x getVariable ["owner",["",""]]) select 0) isEqualTo (getPlayerUID player)};

if (life_call_id >= 0) then {
	[life_call_id,[_unit]] remoteExec ["radioChannelRemove",2];
};
[] call life_fnc_setupActions;

_unit enableFatigue false;
_unit enableStamina false;
setCurrentChannel 5;

call life_fnc_manageSC;

[["GEAR","CASH"]] call SOCK_fnc_updatePartial;