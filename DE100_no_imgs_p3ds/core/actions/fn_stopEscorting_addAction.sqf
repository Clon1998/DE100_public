/*
	File:	fn_stopEscorting_addAction.sqf
	Date:   27.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_unit"];
_unit = life_action_target;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable ["Escorting",false])) exitWith {}; //He's not being Escorted.
if(!(side _unit in [civilian,independent])) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting",false,true];
life_escort = false;