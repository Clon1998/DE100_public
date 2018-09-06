/*
   File:    fn_marihuana.sqf
   Date:    2018-2-25 12:15:48
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
params[
	["_type", 0],
	["_arg", ""]
];
if (!hasInterface) exitWith {};

call {
	if (_type == 0) exitWith {
		if (isRemoteExecuted) exitWith {};
		private _color = ppEffectCreate ["colorCorrections",1500002];
		private _chrom = ppEffectCreate ["chromAberration",100];
		_color ppEffectEnable true;
		_color ppEffectAdjust [1.175, 1.175, 0, [0, 0, 0.0, 0],[0, 0, 0, 1.0],[0, 0, 0, 0]];
		_color ppEffectCommit 90;

		_chrom ppEffectEnable true;
		_chrom ppEffectAdjust [0.027,0.027,true];
		_chrom ppEffectCommit 90;

		["Du rauchst etwas Grass! Du könntest durstig werden!",false,"fast"] call life_fnc_notification_system;
		[1,player] remoteExec ["life_fnc_marihuana",-2];
		for "_i" from 1 to 60 step 1 do {
			if (_i % 10 == 0) then {
				player setDamage ((damage player - 0.05) max 0.1);
			};

			if (_i % 20 == 0) then {
				life_thirst = (life_thirst - 5) max 5;
			};
			uiSleep 1;
		};

		_color ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0],[1.0, 1.0, 1.0, 1.0],[0.199, 0.587, 0.114, 0.0]];
		_color ppEffectCommit 180;
		_chrom ppEffectAdjust [0.0,0.0,true];
		_chrom ppEffectCommit 180;

		uiSleep 180;
		ppEffectDestroy _chrom;
		ppEffectDestroy _color;
	};

	if (_type == 1) exitWith {
		private _obj = "#particlesource" createVehicleLocal getPos _arg;
		_obj setParticleCircle [0, [0, 0, 0]];
		_obj setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_obj setParticleParams [["\A3\data_f\missileSmoke", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 2], [0, 0.1, 0.2], 0, 0.006, 0.005, 0.005, [1.2, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _arg];
		_obj setDropInterval 0.05;
		uiSleep 60;
		deleteVehicle _obj;
	};
};