/*
	File:	fn_end_call.sqf
	Date:   2016-07-31 13:25:06
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_mode", "", [""]]
];

switch (_mode) do { 
	case "stop" : {
		life_call_active = false;
		life_call_interrupt = true;
		["stopPartner"] remoteExecCall ["life_fnc_end_call",life_caller];
	}; 

	case "stopPartner" : {
		life_call_active = false;
		life_call_interrupt = true;
	}; 
	
	case "hangup" : {
		["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[life_caller,player]];
		life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
		life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
		publicVariable "life_telekomInUse";
	}; 
};
closeDialog 0;