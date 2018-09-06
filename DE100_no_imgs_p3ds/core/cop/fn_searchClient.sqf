/*
	File:	fn_searchClient.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _cop = param [0,objNull,[objNull]];
if (isNull _cop) exitWith {};
private _vInv = [];
private _wea = [];

//Illegal items
{
	_var = configName(_x);
	_val = [0,_var] call life_fnc_handleVItem;
	if(_val > 0) then {
		_vInv pushBack [_var,_val];
		[false,_var,_val] call life_fnc_handleInv;
	};
} forEach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));

{
	if(_x in getArray(missionConfigFile >> "Life_Settings" >> "illegal_arma_items")) then
	{
		_wea pushBack _x;
	};
} forEach ([primaryWeapon player,handgunWeapon player,secondaryWeapon player]+(uniformItems player)+(backpackItems player)+(vestItems player)+(assignedItems player));

{
	if (_x in [primaryWeapon player,handgunWeapon player,secondaryWeapon player] || _x in (assignedItems player)) then {
		player removeWeapon _x; 
	};

	if (_x in (vestItems player) || _x in (backpackItems player) || _x in (uniformItems player)) then {
		player removeItem _x; 
	};

	if ((([_x] call BIS_fnc_itemType) select 1) in ["Grenade","Bullet","SmokeShell"]) then {
		player removeMagazine _x;
	} else {
		player removeItem _x;
	};
} forEach _wea;

[player,_vInv,_wea] remoteExec ["life_fnc_copSearch",_cop];