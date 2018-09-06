/*
	File:	fn_handleLicense.sqf
	Date:   2017-06-04 13:40:15
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
		if (!isClass(missionConfigFile >> "Licenses" >> _data)) exitWith {false;};
		missionNamespace getVariable [format["license_%1_%2",getText(missionConfigFile >> "Licenses" >> _data >> "side"),getText(missionConfigFile >> "Licenses" >> _data >> "variable")],false];
	};

	// setValue
	if (_mode isEqualTo 1) exitwith {
		_data params[
			["_var", "", [""]],
			["_val", false]
		];
		if (_var find "license_" >= 0) then {
			missionNamespace setVariable [_var,_val];
		} else {
			missionNamespace setVariable [format["license_%1_%2",getText(missionConfigFile >> "Licenses" >> _var >> "side"),getText(missionConfigFile >> "Licenses" >> _var >> "variable")],_val];
		};
	};
}