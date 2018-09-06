private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

if (call (life_adminlevel)>=5) then {
	_veh=if(isNull objectParent player) then {
		cursorObject;
	} else {
		vehicle player;
	};
	if (isNull _veh) exitwith {};
	if(_veh isKindOf "House_F" && playerSide == civilian) then {
		if(([_veh,player] call life_fnc_bBoxDistance) < 8 || _veh isKindOf "House_F") then {
			_door = [_veh] call life_fnc_nearestDoor;
			if(_door == 0) exitWith {[localize "STR_House_Door_NotNear",true,"fast"] call life_fnc_notification_system;};
			_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
			if(_locked == 0) then {
				_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
				_veh animate [format["door_%1_rot",_door],0];
				[composeText [ image "images\icons\ico_lock.paa", "  Tür abgeschlossen" ],false,"fast"] call life_fnc_notification_system;
			} else {
				_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
				_veh animate [format["door_%1_rot",_door],1];
				[composeText [ image "images\icons\ico_unlock.paa", " Tür aufgeschlossen" ],false,"fast"] call life_fnc_notification_system;
			};
		};
	} else {
		_locked = locked _veh;
		if((([_veh,player] call life_fnc_bBoxDistance) < 8 || !isNull objectParent player)) then {
			if(_locked == 2) then {
				if(local _veh) then {
					_veh lock 0;

					//Animate the doors ?
					_veh animateDoor ["door_back_R",1];
					_veh animateDoor ["door_back_L",1];
					_veh animateDoor ['door_R',1];
					_veh animateDoor ['Door_R_source',1];
					_veh animateDoor ['door_L',1];
					_veh animateDoor ['Door_L_source',1];
					_veh animateDoor ['Door_rear',1];
					_veh animateDoor ['Door_rear_source',1];
					_veh animateDoor ['Door_1_source',1];
					_veh animateDoor ['Door_2_source',1];
					_veh animateDoor ['Door_3_source',1];
					_veh animateDoor ['Door_LM',1];
					_veh animateDoor ['Door_RM',1];
					_veh animateDoor ['Door_LF',1];
					_veh animateDoor ['Door_RF',1];
					_veh animateDoor ['Door_LB',1];
					_veh animateDoor ['Door_RB',1];
					_veh animate ['DoorL_Front_Open',1];
					_veh animate ['DoorR_Front_Open',1];
					_veh animate ['DoorL_Back_Open',1];
					_veh animate ['DoorR_Back_Open ',1];
				} else {
					[_veh,0] remoteExecCall ['life_fnc_lockVehicle',_veh];
					_veh animateDoor ["door_back_R",1];
					_veh animateDoor ["door_back_L",1];
					_veh animateDoor ['door_R',1];
					_veh animateDoor ['Door_R_source',1];
					_veh animateDoor ['door_L',1];
					_veh animateDoor ['Door_L_source',1];
					_veh animateDoor ['Door_rear',1];
					_veh animateDoor ['Door_rear_source',1];
					_veh animateDoor ['Door_1_source',1];
					_veh animateDoor ['Door_2_source',1];
					_veh animateDoor ['Door_3_source',1];
					_veh animateDoor ['Door_LM',1];
					_veh animateDoor ['Door_RM',1];
					_veh animateDoor ['Door_LF',1];
					_veh animateDoor ['Door_RF',1];
					_veh animateDoor ['Door_LB',1];
					_veh animateDoor ['Door_RB',1];
					_veh animate ['DoorL_Front_Open',1];
					_veh animate ['DoorR_Front_Open',1];
					_veh animate ['DoorL_Back_Open',1];
					_veh animate ['DoorR_Back_Open ',1];
				};
				[composeText [ image "images\icons\ico_unlock.paa", "  Fahrzeug aufgeschlossen" ],false,"fast"] call life_fnc_notification_system;
			} else {
				if(local _veh) then {
					_veh lock 2;

					_veh animateDoor ["door_back_R",0];
					_veh animateDoor ["door_back_L",0];
					_veh animateDoor ['door_R',0];
					_veh animateDoor ['Door_R_source',0];
					_veh animateDoor ['door_L',0];
					_veh animateDoor ['Door_L_source',0];
					_veh animateDoor ['Door_rear',0];
					_veh animateDoor ['Door_rear_source',0];
					_veh animateDoor ['Door_1_source',0];
					_veh animateDoor ['Door_2_source',0];
					_veh animateDoor ['Door_3_source',0];
					_veh animateDoor ['Door_LM',0];
					_veh animateDoor ['Door_RM',0];
					_veh animateDoor ['Door_LF',0];
					_veh animateDoor ['Door_RF',0];
					_veh animateDoor ['Door_LB',0];
					_veh animateDoor ['Door_RB',0];
					_veh animate ['DoorL_Front_Open',0];
					_veh animate ['DoorR_Front_Open',0];
					_veh animate ['DoorL_Back_Open',0];
					_veh animate ['DoorR_Back_Open ',0];
				} else {
					[_veh,2] remoteExecCall ['life_fnc_lockVehicle',_veh];

					_veh animateDoor ["door_back_R",0];
					_veh animateDoor ["door_back_L",0];
					_veh animateDoor ['door_R',0];
					_veh animateDoor ['Door_R_source',0];
					_veh animateDoor ['door_L',0];
					_veh animateDoor ['Door_L_source',0];
					_veh animateDoor ['Door_rear',0];
					_veh animateDoor ['Door_rear_source',0];
					_veh animateDoor ['Door_1_source',0];
					_veh animateDoor ['Door_2_source',0];
					_veh animateDoor ['Door_3_source',0];
					_veh animateDoor ['Door_LM',0];
					_veh animateDoor ['Door_RM',0];
					_veh animateDoor ['Door_LF',0];
					_veh animateDoor ['Door_RF',0];
					_veh animateDoor ['Door_LB',0];
					_veh animateDoor ['Door_RB',0];
					_veh animate ['DoorL_Front_Open',0];
					_veh animate ['DoorR_Front_Open',0];
					_veh animate ['DoorL_Back_Open',0];
					_veh animate ['DoorR_Back_Open ',0];
				};
				[composeText [ image "images\icons\ico_lock.paa", "  Fahrzeug abgeschlossen" ],false,"fast"] call life_fnc_notification_system;
			};
		};
	};	
};

_stop