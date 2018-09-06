/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/

call {
	if (playerSide isEqualTo civilian) exitWith {
		player addAction["Fischernetz auswerfen",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped '];
		//Rob person
		player addAction["Person ausrauben",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable["robbed",FALSE]) '];
		player addAction["Taxifahrt abbrechen",life_fnc_taxiAction,0,1,false,false,"","life_civjob==2 && (taxionduty==1) && (taxiused)"];
		player addAction["Spawnpunkt setzen",{life_spawn_fine = true},0,1,false,false,"","life_wants_new_spawn"];
		player addAction["Box andocken",life_fnc_handlePod,"Attach",2,false,true,"",'((vehicle player) isKindOf "O_Heli_Transport_04_F" || (vehicle player) isKindOf "O_Heli_Transport_04_black_F") && !isNull (getSlingLoad (vehicle player)) && !((vehicle player) getVariable ["pod_attached",false]) && !life_action_inUse && driver (vehicle player) isEqualTo player && speed (vehicle player) < 10'];
		player addAction["Box abdocken",life_fnc_handlePod,"Detach",2,false,true,"",'((vehicle player) isKindOf "O_Heli_Transport_04_F" || (vehicle player) isKindOf "O_Heli_Transport_04_black_F") && !isNull (getSlingLoad (vehicle player)) && ((vehicle player) getVariable ["pod_attached",false]) && !life_action_inUse && driver (vehicle player) isEqualTo player && speed (vehicle player) < 10'];
	};

	if (playerSide isEqualTo west) exitWith {
		player addAction["Als Fahrer Einsteigen",life_fnc_copEnter,"driver",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Car" && (locked cursorObject) != 0 && cursorObject distance player < 3.5'];
		player addAction["Als Beifahrer Einsteigen",life_fnc_copEnter,"passenger",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Car" && (locked cursorObject) != 0 && cursorObject distance player < 3.5']; 
		player addAction["Aussteigen",life_fnc_copEnter,"exit",100,false,false,"",'(!isNull objectParent player) && (locked(vehicle player)==2)']; 		
		player addAction["Als Fahrer Einsteigen",life_fnc_copEnter,"driver",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Air" && (locked cursorObject) != 0 && cursorObject distance player < 3.5'];
		player addAction["Als Beifahrer Einsteigen",life_fnc_copEnter,"passenger",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Air" && (locked cursorObject) != 0 && cursorObject distance player < 3.5']; 
		player addAction["Aufschließen",life_fnc_copEnter,"open",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Air" && (locked cursorObject) != 0 && cursorObject distance player < 3.5']; 
		player addAction["Aufschließen",life_fnc_copEnter,"open",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Car" && (locked cursorObject) != 0 && cursorObject distance player < 3.5']; 
		player addAction["Waffe beschlagnahmen",life_fnc_seizeObjects,cursorObject,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0'];
		player addAction["Absetzen",life_fnc_stopEscorting_addAction,"",0,false,false,"",'life_escort'];
	};
	
	if (playerSide isEqualTo independent) exitWith {
		player addAction["Als Fahrer Einsteigen",life_fnc_copEnter,"driver",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Car" && (locked cursorObject) != 0 && cursorObject distance player < 3.5'];
		player addAction["Als Beifahrer Einsteigen",life_fnc_copEnter,"passenger",0,false,false,"",'!isNull cursorObject && cursorObject isKindOf "Car" && (locked cursorObject) != 0 && cursorObject distance player < 3.5']; 
		player addAction["Aussteigen",life_fnc_copEnter,"exit",100,false,false,"",'(!isNull objectParent player) && (locked(vehicle player)==2)']; 
	};
};	


player AddAction["Taxifahrt beenden und bezahlen",life_fnc_taxiAction,1,1,false,false,"","(taxijobbeansprucht)"];
player AddAction["Aussteigen (Unbewaffnet)",{
	scopeName "main";
	if (diag_tickTime - (player getVariable ["getOutTime",0]) < 90) exitWith {
		["Du kannst nur alle 90 Sekunden unbewaffnet aussteigen.", true, "fast"] call life_fnc_notification_system;
	};
	player setVariable ["getOutTime",diag_tickTime];
	private _l = getUnitLoadout player;
	private _r = _l select 0;
	private _p = _l select 2;
	call {
		if !((_l select 3) isEqualTo []) exitWith {
			private _tmp = _l select 3;
			if !(_r isEqualTo []) then {
				(_tmp select 1) pushBack [_r,1];
			};
			if !(_p isEqualTo []) then {
				(_tmp select 1) pushBack [_p,1];
			};
			_l set [3,_tmp];
			["Deine Waffen wurden in deine Uniform gelegt", true, "fast"] call life_fnc_notification_system;
		};
		if !((_l select 4) isEqualTo []) exitWith {
			private _tmp = _l select 4;
			if !(_r isEqualTo []) then {
				(_tmp select 1) pushBack [_r,1];
			};
			if !(_p isEqualTo []) then {
				(_tmp select 1) pushBack [_p,1];
			};
			_l set [4,_tmp];
			["Deine Waffen wurden in deine Weste gelegt", true, "fast"] call life_fnc_notification_system;
		};
		if !((_l select 5) isEqualTo []) exitWith {
			private _tmp = _l select 5;
			if !(_r isEqualTo []) then {
				(_tmp select 1) pushBack [_r,1];
			};
			if !(_p isEqualTo []) then {
				(_tmp select 1) pushBack [_p,1];
			};
			_l set [5,_tmp];
			["Deine Waffen wurden in deinen Rucksack gelegt", true, "fast"] call life_fnc_notification_system;
		};
		["Du hast keine Uniform, Weste oder Rucksack in welcher man die Waffen hätte lagern können", true, "fast"] call life_fnc_notification_system;
		breakOut "main";
	};
	_l set [0,[]];
	_l set [2,[]];
	player setUnitLoadout _l;
	player action ["getOut", objectParent player];
	call life_fnc_updateClothing;
},"",-1,false,false,"","!isNull objectParent player && !(weapons player isEqualTo []) && !(playerside isEqualTo independent) && speed (vehicle player) < 2 && (locked vehicle player) == 0"];

player addAction["<t color='#FF0000'>Mauer aufheben</t>",life_fnc_packupobjekt,["Land_Concrete_SmallWall_4m_F", [west], "mauer"],0,false,true,"",'_object = nearestObjects[getPos player,["Land_Concrete_SmallWall_4m_F"],3] select 0; typeOf _object == "Land_Concrete_SmallWall_4m_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>BandAbsperrung aufheben</t>",life_fnc_packupobjekt,["TapeSign_F", [west], "tapesign"],0,false,true,"",'_object = nearestObjects[getPos player,["TapeSign_F"],3] select 0; typeOf _object == "TapeSign_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Leitkegel aufheben</t>",life_fnc_packupobjekt,["RoadCone_L_F ", [west,independent], "roadcone"],0,false,true,"",'_object = nearestObjects[getPos player,["RoadCone_L_F "],3] select 0; typeOf _object == "RoadCone_L_F " && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Straßensperre aufheben</t>",life_fnc_packupobjekt,["RoadBarrier_F", [west,independent], "roadbarrier"],0,false,true,"",'_object = nearestObjects[getPos player,["RoadBarrier_F"],3] select 0; typeOf _object == "RoadBarrier_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Lange Mauer aufheben</t>",life_fnc_packupobjekt,["Land_HBarrier_Big_F", [west], "hescobag"],0,false,true,"",'_object = nearestObjects[getPos player,["Land_HBarrier_Big_F"],3] select 0; typeOf _object == "Land_HBarrier_Big_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>PfeilabsperreR aufheben</t>",life_fnc_packupobjekt,["ArrowDesk_R_F", [west], "arrowdeskr"],0,false,true,"",'_object = nearestObjects[getPos player,["ArrowDesk_R_F"],3] select 0; typeOf _object == "ArrowDesk_R_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>PfeilabsperreL aufheben</t>",life_fnc_packupobjekt,["ArrowDesk_L_F", [west], "arrowdeskl"],0,false,true,"",'_object = nearestObjects[getPos player,["ArrowDesk_L_F"],3] select 0; typeOf _object == "ArrowDesk_L_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Schranke aufheben</t>",life_fnc_packupobjekt,["Land_BarGate_F", [west], "gate"],0,false,true,"",'_object = nearestObjects[getPos player,["Land_BarGate_F"],5] select 0; typeOf _object == "Land_BarGate_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Rakete aufheben</t>",life_fnc_packupobjekt,["Metal_Pole_F", [west, civilian, independent], "rocket_random"],0,false,true,"",'_object = nearestObjects[getPos player,["Metal_Pole_F"],3] select 0; typeOf _object == "Metal_Pole_F" && _object getVariable "Placed"'];
player addAction["<t color='#FF0000'>Rakete/n starten</t>",life_fnc_callFirework,"",0,false,true,"",'count life_preRockets > 0 && isNull DE100_Fortifications_Setup'];
