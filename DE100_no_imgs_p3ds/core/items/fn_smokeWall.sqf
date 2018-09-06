/*
   File:    fn_smokeWall.sqf
   Date:    2018-2-24 15:36:20
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
private _mode = param [0,0];
private _radSpawn = 400;
private _len = 50;
call {
	if (_mode == 0) exitWith {
		closeDialog 0;
		if (serverTime - (bank_obj getVariable [format["%1%2_SW",getPlayerUID player,playerSide],0]) < 1200) exitWith {
			["Die Rauch Wand hat eine Abklingzeit von 20 Minuten", true, "fast"] call life_fnc_notification_system;
		};
		private _m = createMarkerLocal ["SW_RAD",getPosATL player];
		_m setMarkerColorLocal "ColorYellow";
		_m setMarkerTypeLocal "Empty";
		_m setMarkerBrushLocal "Grid";
		_m setMarkerShapeLocal "ELLIPSE";
		_m setMarkerSizeLocal [_radSpawn,_radSpawn];
		openMap [true,true];
		["Bitte wähle den Startpunkt für die Rauchwand", false, "fast"] call life_fnc_notification_system;
		["Mit ALT-Mausklick kannst du den Vorgang abbrechen!", true, "slow"] call life_fnc_notification_system;
		[1,_m] onMapSingleClick life_fnc_smokeWall;
	};
	if (_mode == 1) exitWith {
		private _m = param [1,"SW_RAD"];
		if (_alt) exitWith {
			["Vorgang abgebrochen!", false, "fast"] call life_fnc_notification_system;
			openMap [false,false];
			deleteMarkerLocal _m;
			onMapSingleClick {};
		};
		if (_pos distance2d getPosATL player > _radSpawn) exitWith {
			[format["Der Startpunkt muss in einem %1 Meter Radius um deine Position liegen!",_radSpawn call life_fnc_numberText], true, "fast"] call life_fnc_notification_system;
		};
		["Bitte wähle den Endpunkt für die Rauchwand", false, "fast"] call life_fnc_notification_system;
		["Mit ALT-Mausklick kannst du den Vorgang abbrechen!", true, "slow"] call life_fnc_notification_system;
		_m setMarkerPosLocal _pos;
		_m setMarkerSizeLocal [_len,_len];
		[2,_m,_pos] onMapSingleClick life_fnc_smokeWall;
	};
	if (_mode == 2) exitWith {
		private _m = param [1,"SW_RAD"];
		private _s = param [2,getPosATL player];
		if (_alt) exitWith {
			["Vorgang abgebrochen!", false, "fast"] call life_fnc_notification_system;
			openMap [false,false];
			deleteMarkerLocal _m;
			onMapSingleClick {};
		};
		if (_pos distance2d _s > _len) exitWith {
			[format["Der Endpunkt muss in einem %1 Meter Radius um den Startpunkt liegen!",_len call life_fnc_numberText], true, "fast"] call life_fnc_notification_system;
		};
		if(([false,"smokeWall",1] call life_fnc_handleInv) > 0) then {
			["Die Rauchwand sollte in kürze abgefeuert werden!", false, "fast"] call life_fnc_notification_system;
			[_s,_pos,50 + random 30]  remoteExecCall ["life_fnc_smokeCanon",-2];
		} else {
			["Du hast keine Rauchwand?", true, "fast"] call life_fnc_notification_system;
		};
		openMap [false,false];
		deleteMarkerLocal _m;
		onMapSingleClick {};
		bank_obj setVariable [format["%1%2_SW",getPlayerUID player,playerSide],serverTime,true];
	};
};