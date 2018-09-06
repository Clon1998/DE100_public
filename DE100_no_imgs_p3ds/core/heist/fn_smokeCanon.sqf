/*
   File:    fn_smokeCanon.sqf
   Date:    2018-2-20 23:55:42
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

params[
	["_start", [], [[]]],
	["_end", [], [[]]],
	["_time", 50 + random 30]
];
private _shells = [];
if (!hasInterface) exitwith {};
private _deltaX = ((_end select 0) - (_start select 0));
private _deltaY = ((_end select 1) - (_start select 1));
private _distance = _start distance _end;
private _num = ceil(_distance/3);
for "_i" from 0 to _num do {
	_smokeg = "SmokeShellVehicle" createVehicleLocal [0, 0, 0];
	_smokeg setPos [(_start select 0)+(_deltaX/_num)*_i,(_start select 1)+(_deltaY/_num)*_i,0];
	_shells pushBackUnique _smokeg
};

[_shells,_time] spawn {
	scriptName "smokeCanon_Loop";
	private _sources = [];
	{
		_src1 = "#particlesource" createVehicleLocal getpos _x;
		_src1 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 1, 0.025, [0.5, 8, 12, 15], [
			[1, 1, 1, 0.7],
			[1, 1, 1, 0.5],
			[1, 1, 1, 0.25],
			[1, 1, 1, 0]
		], [0.2], 1, 0.04, "", "", _x];
		_src1 setParticleRandom[2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
		_src1 setDropInterval 0.2;
		_sources pushBackUnique _src1;

		_src2 = "#particlesource" createVehicleLocal getpos _x;
		_src2 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 7, 0], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 1, 0.025, [0.5, 8, 12, 15], [
			[1, 1, 1, 1],
			[1, 1, 1, 1],
			[1, 1, 1, 0.5],
			[1, 1, 1, 0]
		], [0.2], 1, 0.04, "", "", _x];
		_src2 setParticleRandom[2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
		_src2 setDropInterval 0.15;
		_sources pushBackUnique _src2;
		uiSleep 0.08;
		nil;
	} count (_this select 0);

	uiSleep (_this select 1); 
	{
		deleteVehicle _x;
		nil;
	} count _sources;
};