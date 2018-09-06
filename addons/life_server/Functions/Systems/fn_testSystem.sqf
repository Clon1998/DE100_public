#include "..\..\script_macros.hpp"
/*
	File:   fn_testSystem.sqf
	Date:   11.03.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private ["_msg"];

if (life_Lucian_Want_test) then {
	life_Lucian_Want_test = false;
	_msg = format ["ACHTUNG! DAS NEUE NAMETAG-SYS WURDE DEAKTIVIERT"];
} else {
	life_Lucian_Want_test = true;
	_msg = format ["ACHTUNG! DAS NEUE NAMETAG-SYS WURDE AKTIVIERT"];
};
publicVariable "life_Lucian_Want_test";
uiSleep 0.1;
[0,_msg] remoteExecCall ["life_fnc_broadcast",RCLIENT];