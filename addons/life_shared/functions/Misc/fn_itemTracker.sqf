#include "\life_shared\script_macros.hpp"
/*
	File:	fn_itemTracker.sqf
	Date:   2017-04-02 21:36:14
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_item", "", [""]],
	["_amnt", 0, [0]]
];

[format["INSERT INTO `item_tracker` (`item`, `val`, `time`) VALUES ('%1', '%2', NOW());",_item,_amnt],1] call DB_fnc_asyncCall;