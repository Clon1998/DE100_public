/*
	File:	fn_unimpound.sqf
	Date:   2017-01-01 15:15:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
life_action_delay = time;
if (life_isUnimpounding) exitwith {
	["Du parkst bereits etwas aus.",true,"fast"] call life_fnc_notification_system;
};
life_isUnimpounding = true;
disableSerialization;

private _display = findDisplay 2800;
private _vehList = _display displayCtrl 2802;
private _dtype = _display getVariable ["Type",0];

if (lbCurSel _vehList == -1) exitWith {[localize "STR_Global_NoSelection",true,"fast"] call life_fnc_notification_system;};
private _className = (parseSimpleArray format["%1",_vehList lbData (lbCurSel _vehList)]) select 0;
private _vid = _vehList lbValue (lbCurSel _vehList);

if (_dtype == 0) then {
	private _price = switch (playerSide) do { 
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_THR");
	    };
	};
	private _buyMultiplier = switch (playerSide) do {
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
	    };
	};
	private _basePrice = round (getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * _buyMultiplier);
	_price = round (_basePrice * _price);

	if(de100_luciandjuli_bc < _price) exitWith {[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;life_isUnimpounding = false;};
	if (_price+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	};

	private _spawnPoint = _display getVariable ["SpawnPoint",[]];
	if (count _spawnPoint == 0) exitwith {
		closeDialog 0;
		life_isUnimpounding = false;
		["Fehler beim ausparken, versuche es später nochmal.",true,"fast"] call life_fnc_notification_system;
	};
	private _pos = [];
	private _exit = true;
	if (_spawnPoint isEqualType []) then {
		if (_spawnPoint isEqualTypeArray [[],0]) exitwith {
			_pos = _spawnPoint;
			if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) exitwith {
				_exit = false;
			};
		};
		{
			_pos = if (getMarkerPos _x isEqualTo [0,0,0]) then {
				private _offset = switch (_x) do { 
					case "Land_Pier_Box_F" : {[0,0,0.1];}; 
					case "Land_Hospital_side2_F" : {[-0.8,-3,20];}; 
					default {[0,0,0.1];}; 
				};
				[(getPosATL (nearestObject [player, _x])) vectorAdd _offset, getDir (nearestObject [player,_x])];
			} else {
				[markerPos _x,markerDir _x];
			};

			if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) exitwith {
				_exit = false;
			};
		} forEach _spawnPoint;
	} else {
		_pos = if (getMarkerPos _spawnPoint isEqualTo [0,0,0]) then {
			private _offset = switch (_spawnPoint) do { 
				case "Land_Pier_Box_F" : {[0,0,0.1];}; 
				case "Land_Hospital_side2_F" : {[-0.8,-3,20];}; 
				default {[0,0,0.1];}; 
			};
			[(getPosATL (nearestObject [player, _spawnPoint])) vectorAdd _offset, getDir (nearestObject [player,_spawnPoint])];
		} else {
			[markerPos _spawnPoint,markerDir _spawnPoint];
		};

		if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) then {
			_exit = false;
		};
	};

	if (_exit) exitwith {
		[1,(localize "STR_Garage_SpawnPointError")] call life_fnc_broadcast;
		life_isUnimpounding = false;
	};
	closeDialog 0;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_bc = de100_luciandjuli_bc - _price;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,_vid,_pos,false] remoteExecCall ["VEH_fnc_spawn",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,_vid,_pos,false] remoteExecCall ["VEH_fnc_spawn",2];
	};	
} else {
	private _price = switch (playerSide) do { 
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_THR");
	    };
	};
	private _buyMultiplier = switch (playerSide) do {
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
	    };
	};
	private _basePrice = round (getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * _buyMultiplier);
	_price = round (_basePrice * _price);

	if(de100_luciandjuli_bc < _price) exitWith {[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText],true,"fast"] call life_fnc_notification_system;life_isUnimpounding = false;};
	if (_price+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	};
	private _spawnPoint = _display getVariable ["SpawnPoint",[]];
	if (count _spawnPoint == 0) exitwith {
		closeDialog 0;
		life_isUnimpounding = false;
		["Fehler beim ausparken, versuche es später nochmal.",true,"fast"] call life_fnc_notification_system;
	};
	private _pos = [];
	private _exit = true;
	if (_spawnPoint isEqualType []) then {
		if (_spawnPoint isEqualTypeArray [[],0]) exitwith {
			_pos = _spawnPoint;
			if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) exitwith {
				_exit = false;
			};
		};
		{
			_pos = if (getMarkerPos _x isEqualTo [0,0,0]) then {
				private _offset = switch (_x) do { 
					case "Land_Pier_Box_F" : {[0,0,0.1];}; 
					case "Land_Hospital_side2_F" : {[-0.8,-3,20];}; 
					default {[0,0,0.1];}; 
				};
				[(getPosATL (nearestObject [player, _x])) vectorAdd _offset, getDir (nearestObject [player,_x])];
			} else {
				[markerPos _x,markerDir _x];
			};

			if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) exitwith {
				_exit = false;
			};
		} forEach _spawnPoint;
	} else {
		_pos = if (getMarkerPos _spawnPoint isEqualTo [0,0,0]) then {
			private _offset = switch (_spawnPoint) do { 
				case "Land_Pier_Box_F" : {[0,0,0.1];}; 
				case "Land_Hospital_side2_F" : {[-0.8,-3,20];}; 
				default {[0,0,0.1];}; 
			};
			[(getPosATL (nearestObject [player, _spawnPoint])) vectorAdd _offset, getDir (nearestObject [player,_spawnPoint])];
		} else {
			[markerPos _spawnPoint,markerDir _spawnPoint];
		};

		if (count (nearestObjects[_pos select 0,["Car","Air","Ship","Pod_Heli_Transport_04_base_F"],10]) == 0) then {
			_exit = false;
		};
	};

	if (_exit) exitwith {
		life_isUnimpounding = false;
		[1,(localize "STR_Garage_SpawnPointError")] call life_fnc_broadcast;
	};
	closeDialog 0;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_bc = de100_luciandjuli_bc - _price;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,_vid,_pos,true] remoteExecCall ["VEH_fnc_spawn",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,_vid,_pos,true] remoteExecCall ["VEH_fnc_spawn",2];
	};	
};