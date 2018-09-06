/*
	Author GamerDF "Dominic"
	Creates Dialog

*/
if("ItemRadio" in assignedItems player) then {
	if (life_call_active) exitWith {
		createDialog "Life_my_new_smartphone_incomming_call";
		setMousePosition [0.5, 0.5];
	};
	if(life_battery < 1) then {
		createDialog "Life_smartphoneAkku";
	} else {
		createDialog "Life_my_new_smartphone";
		setMousePosition [0.5, 0.5];
	};
} else {
	["Du hast kein Smartphone",true,"fast"] call life_fnc_notification_system;
};