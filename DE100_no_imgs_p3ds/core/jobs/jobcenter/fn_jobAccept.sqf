/*
	File:	fn_jobAccept.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(life_civjob != 0) exitWith {["Du hast schon einen Beruf. Kündige diesen erst!",true,"fast"] call life_fnc_notification_system;};

if(lbCurSel 4802 == -1) exitWith {["Du hast nichts ausgewählt",true,"fast"] call life_fnc_notification_system;};
_job = lbCurSel 4802;

switch (_job) do {
	case 0:{
		life_civjob = 1;
		[] call SOCK_fnc_updateRequest;
		["Du bist nun Tanklastfahrer!",false,"fast"] call life_fnc_notification_system;
	};
    case 1: { 
		life_civjob = 2;
		[] call SOCK_fnc_updateRequest;
		["Du bist nun Taxifahrer!",false,"fast"] call life_fnc_notification_system;
	};
    default { 
		life_civjob = 0;
	};
};



