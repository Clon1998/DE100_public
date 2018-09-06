/*
	File:	fn_handleVItem.sqf
	Date:   2017-06-04 15:12:19
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

	Description:
	Take a look for yourself.
	0 - getVal
	1 - setVal
*/

params[
	["_mode", 0, [0]],
	["_data", ""]
];

call {
	// getValue
	if (_mode isEqualTo 0) exitwith {
		if (!isClass(missionConfigFile >> "VirtualItems" >> _data)) exitWith {0;};
		missionNamespace getVariable [format["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> _data >> "variable")],0];
	};

	// setValue
	if (_mode isEqualTo 1) exitwith {
		_data params[
			["_var", "", [""]],
			["_val", 0]
		];
		if (!isClass(missionConfigFile >> "VirtualItems" >> _var)) exitWith {};
		missionNamespace setVariable [format["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> _var >> "variable")],_val max 0];
	};
}
