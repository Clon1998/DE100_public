
if(life_civjob == 0) exitWith {["Du hast keinen Beruf den du Kündigen könntest!" ,true,"fast"] call life_fnc_notification_system;};
["Du hast deinen Job gekündigt!",false,"fast"] call life_fnc_notification_system;
life_civjob = 0;

[] call SOCK_fnc_updateRequest;