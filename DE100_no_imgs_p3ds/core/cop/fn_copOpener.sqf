/*
	File:	fn_copOpener.sqf
	Date:   2017-06-14 18:15:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

{
	private _state = [0,1] select ((_x animationSourcePhase 'Door_1_sound_source') < 0.5);
	_x animateSource ["Door_1_sound_source", _state,[1,3] select (typeOf _x isEqualTo "Land_ConcreteWall_01_l_gate_F")];
	_x animateSource ["Door_1_noSound_source", _state,[1,3] select (typeOf _x isEqualTo "Land_ConcreteWall_01_l_gate_F")];
} forEach (nearestObjects [player, ["Land_BarGate_F","Land_ConcreteWall_01_l_gate_F"], 15]);
