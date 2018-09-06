/*
	File:	fn_network_overloaded.sqf
	Date:   2016-07-31 04:32:52
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params[
	["_mode", "network", [""]]
];
switch ( _mode) do { 
	case "network" : {
		["Das Mobilnetz ist im Moment überlastet. Versuche es später nochmal.",false,"fast"] call life_fnc_notification_system;
		life_call_active = false;
		player setVariable ["inCall",false,true];
		
	}; 
	
	case "hangedUp" : {
		["Der Anruf wurde beendet",false,"fast"] call life_fnc_notification_system;
		setCurrentChannel 5;
		life_call_active = false;
		[life_call_id,[player]] remoteExec ["radioChannelRemove",2];
		player setVariable ["inCall",false,true];
		life_call_id = -1;
		0 enableChannel [false,false];
		1 enableChannel [false,false];
		2 enableChannel [false,false];
		7 enableChannel [true,false];
	}; 

	case "hangedUp5Min" : {
		["Der Anruf wurde automatisch nach 5 Minuten beendet",false,"fast"] call life_fnc_notification_system;
		setCurrentChannel 5;
		life_call_active = false;
		[life_call_id,[player]] remoteExec ["radioChannelRemove",2];
		player setVariable ["inCall",false,true];
		life_call_id = -1;
		0 enableChannel [false,false];
		1 enableChannel [false,false];
		2 enableChannel [false,false];
		7 enableChannel [true,false];
	}; 

	case "join" : {
		life_call_id = _this select 1;
	}; 
};
closeDialog 0;