/*
	File:	fn_recive_answer.sqf
	Date:   2016-07-31 03:58:21
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_reciever", objNull, [objNull]]
];
life_call_mode = "active";
life_call_target = true;
if (count life_telekomInUse == 7) exitWith {
	["network"] remoteExecCall ["life_fnc_network_overloaded",[player,_reciever]];
};
private _telekomId = (4 + (count life_telekomInUse));
closeDialog 0;
_telekomId radioChannelAdd [player];
[_telekomId,[_reciever]] remoteExec ["radioChannelAdd",_reciever];
setCurrentChannel (5 + _telekomId);
(5 + _telekomId) remoteExec ["setCurrentChannel",_reciever];
life_telekomInUse pushBack (getPlayerUid player);
publicVariable "life_telekomInUse";
life_call_id = _telekomId;
["join",_telekomId] remoteExecCall ["life_fnc_network_overloaded",_reciever];
["Anruf aktiv",false,"slow"] call life_fnc_notification_system;
life_call_start_time = time;
life_call_pay_time = time;
if (de100_luciandjuli_bc < 5000) exitWith {
	["Du hast nicht genug Geld auf deinem Konto.",false,"fast"] call life_fnc_notification_system;
	["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[player,life_caller]];
	life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
	life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
	publicVariable "life_telekomInUse";
};

if (5000+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[player,life_caller]];
	life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
	life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
	publicVariable "life_telekomInUse";
};

de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - 5000;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
if (!isNull findDisplay 6500 || !isNull findDisplay 6600 || !isNull findDisplay 6700 || !isNull findDisplay 6800 || !isNull findDisplay 7000 || !isNull findDisplay 7100 || !isNull findDisplay 7200 || !isNull findDisplay 8200 || !isNull findDisplay 9200 || !isNull findDisplay 4000 || !isNull findDisplay 9200 || !isNull findDisplay 6200) then {
	closeDialog 0;
	createDialog "Life_my_new_smartphone_incomming_call";
};
while {life_call_active} do {
	if (!alive life_caller || life_istazed || life_battery < 1 || !("ItemRadio" in (assignedItems  player)) || (animationState player) isEqualTo "unconscious" || player getVariable ["restrained",false]) then {
		["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[life_caller,player]];
		life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
		life_telekomInUse = life_telekomInUse - [life_caller getVariable ["steam64ID",(getPlayerUid life_caller)]];
		publicVariable "life_telekomInUse";
		life_call_active = false;
		if (life_battery < 1) then {
			createDialog "Life_smartphoneAkku";
		};
	};
	
	if (time - life_call_pay_time >= 59) then {
		life_call_pay_time = time;
		if (de100_luciandjuli_bc < 5000) exitWith {
			["Das Gespräch wird beendet. Du hattest nicht mehr genug Geld auf deinem Konto",false,"fast"] call life_fnc_notification_system;
			["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[player,life_caller]];
			life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
			life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
			publicVariable "life_telekomInUse";
			life_call_active = false;
		};
		if (5000+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
			["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
			["hangedUp"] remoteExecCall ["life_fnc_network_overloaded",[player,life_caller]];
			life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
			life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
			publicVariable "life_telekomInUse";
			life_call_active = false;
		};
		de100_mSpace setVariable ["cT",diag_tickTime];
		de100_luciandjuli_bc = de100_luciandjuli_bc - 5000;
		de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	};

	if (time - life_call_start_time >= 300) then {
		["hangedUp5Min"] remoteExecCall ["life_fnc_network_overloaded",[player,life_caller]];
		life_telekomInUse = life_telekomInUse - [(getPlayerUid player)];
		life_telekomInUse = life_telekomInUse - [(getPlayerUid life_caller)];
		publicVariable "life_telekomInUse";
		life_call_active = false;
	};
};