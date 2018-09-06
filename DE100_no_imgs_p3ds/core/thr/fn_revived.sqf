/*
	File:	fn_revived.sqf
	Date:   2016-08-15 02:47:26
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private _medic = param [0,objNull,[objNull]];
[findDisplay 7000,1,2] spawn life_fnc_deathScreen;
waitUntil {!(missionNamespace getVariable ["life_deathScreen",true])};

[] call life_fnc_updateclothing;

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
call life_fnc_hudShow;
if (side _medic isEqualTo independent) then {
	[format[localize "STR_Medic_RevivePay",_medic call life_fnc_name,[(call life_revive_fee)] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;
	de100_mSpace setVariable ["cT",diag_tickTime];
	if(de100_luciandjuli_bc > (call life_revive_fee)) then {
		de100_luciandjuli_bc = de100_luciandjuli_bc - (call life_revive_fee);
	} else {
		de100_luciandjuli_bc = 0;
	};
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
} else {
	[] spawn {
		scriptName "AmateurBloodEfffect";

		_handle = ppEffectCreate ["ChromAberration", 324];
		_handle ppEffectEnable true;
		
		for "_i" from 1 to 35 step 1 do {
			if (_i % 3 == 0) then {
				call BIS_fnc_indicateBleeding;
			};
			_handle ppEffectAdjust ([[0.03, 0.09, true],[0.005, 0.025, true]]select (_i % 2 == 0)); 
			_handle ppEffectCommit 1;
			uisleep 1.5;
		};
		_handle ppEffectEnable false;
		ppEffectDestroy _handle;
	};
};

player setVariable ["thrClerk",nil,true];
player setVariable ["request",nil,true];
player setVariable ["requestveh",nil,true];
player setVariable ["isAlive",nil,true];
player setVariable ["inMission",true,true];
player setVariable ["painKiller",nil,true];
player setVariable["reviver",nil,true];

false call life_fnc_setUnconscious;
[["GEAR","CASH"]] call SOCK_fnc_updatePartial;