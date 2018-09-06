/*
	File:	fn_send_answer.sqf
	Date:   2016-07-31 03:47:53
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

[player] remoteExecCall ["life_fnc_recive_answer",life_caller];
life_call_target = true;
life_call_mode = "active";
_sound = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";
if (!isNull _sound) then {
	deleteVehicle _sound;
};
closeDialog 0;
["Anruf angenommen",false,"slow"] call life_fnc_notification_system;
[] spawn {
	while {life_call_active} do {
		if (!alive life_caller || life_istazed || life_battery < 1  || !("ItemRadio" in (assignedItems  player)) || (animationState player) isEqualTo "unconscious" || player getVariable ["restrained",false]) then {
			["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[life_caller,player]];
			life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
			life_telekomInUse = [life_caller getVariable ["steam64ID",(getPlayerUid life_caller)]];
			publicVariable "life_telekomInUse";
			life_call_active = false;
			if (life_battery < 1) then {
				createDialog "Life_smartphoneAkku";
			};
		};
	};
};