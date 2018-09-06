/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
sleep 5;
if(count _fish == 0) exitWith {titleText[localize "STR_NOTF_NetDropFail","PLAIN"]; life_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then {
		call {
			if ((typeOf _x) isEqualTo "Salema_F") exitWith {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
			if ((typeOf _x) isEqualTo "Ornate_random_F") exitWith {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
			if ((typeOf _x) isEqualTo "Mackerel_F") exitWith {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
			if ((typeOf _x) isEqualTo "Tuna_F") exitWith {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
			if ((typeOf _x) isEqualTo "Mullet_F") exitWith {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
			if ((typeOf _x) isEqualTo "CatShark_F") exitWith {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
			_type = "";
		};	
		if !(_type isEqualTo "") then {
			sleep 3;
			
			if(([true,_type,1] call life_fnc_handleInv) > 0) then
			{
				deleteVehicle _x;
				titleText[format[(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
			};
		};
	};
	nil;
} count _fish;

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;