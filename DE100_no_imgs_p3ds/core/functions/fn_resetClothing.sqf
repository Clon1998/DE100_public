/*
	File:	fn_resetClothing.sqf
	Date:   22.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

if (time - life_clothing_fix_cooldown < 60) exitWith {["Das kannst du nur einmal in der Minute machen.",true,"fast"] call life_fnc_notification_system;};
private _uniform = uniform player;
life_clothing_fix_cooldown = time;


private _loadout = getUnitLoadout player;
player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
player setUnitLoadout _loadout;
["Deine Kleidung sollt wieder für alle sichtbar sein.",false,"fast"] call life_fnc_notification_system;
/*for "_i" from 0 to ((count _texture) -1) step 1 do {
	player setObjectTextureGlobal [_i,_texture select _i]
};*/