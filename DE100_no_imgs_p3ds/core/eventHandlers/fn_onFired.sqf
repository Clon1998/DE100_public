/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this;} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[_position] remoteExec ["life_fnc_flashbang",allPlayers select {_x distance _position <= 30}];
	};
};

if(_ammoType in ["G_40mm_SmokePurple","SmokeShellPurple"]) then {
	_projectile spawn {
		private["_position"];
		waitUntil {(speed _this < 1)};
		sleep 2;
		waitUntil {(speed _this < 1)};
		_position = getPosATL _this;
		[_position] remoteExec ["life_fnc_teargas",allPlayers select {_x distance _position <= 70}];
	};
};