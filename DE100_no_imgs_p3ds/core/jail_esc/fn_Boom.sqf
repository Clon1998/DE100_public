/*
	File:	fn_Boom.sqf
	Date:   15.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

_wall = position (jail_destroy_objects select 0);
_bomb = "M_Titan_AT_static" createVehicle _wall;

sleep 0.3;
{
	jail_destroy_objects_pos pushBack getPosWorld _x;
	jail_destroy_objects_pos_vector pushBack vectorDir _x;
	jail_destroy_objects_pos_vector_up pushBack vectorUp _x;
	jail_destroy_objects_class pushBack typeOf _x;
	deleteVehicle _x
} forEach jail_destroy_objects;
player removeAction bomb_acc;
["Die Mauer wird in 1 Minute wieder aufgebaut!",false,"fast"] call life_fnc_notification_system;
sleep 60;
{ 
	_class = jail_destroy_objects_class select _forEachIndex;
	_pos = jail_destroy_objects_pos select _forEachIndex;
	_vector = jail_destroy_objects_pos_vector select _forEachIndex;
	_vectorUp = jail_destroy_objects_pos_vector_up select _forEachIndex;
	_ob = _class createVehicle _pos;
	_ob setVectorDir _vector;
	_ob setPosWorld _pos;
	_ob setVectorUp _vectorUp;
 } forEach jail_destroy_objects;
 life_bomb_true = false;