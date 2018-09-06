/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
params[
	["_mode", 0, [0]]
];

call {
	if (_mode isEqualTo 0) exitWith {
		{
			[1,[_x,false]] call life_fnc_handleLicense;
			nil;
		} count ["rebel","driver","heroin","marijuana","coke","methn","methb"];
	};

	if (_mode isEqualTo 1) exitWith {
		{
			[1,[_x,false]] call life_fnc_handleLicense;
			nil;
		} count ["gun","driver","rebel"];
	};
	
	if (_mode isEqualTo 2) exitWith {
		{
			[1,[_x,false]] call life_fnc_handleLicense;
			nil;
		} count ["air","driver","truck"];

		[localize "STR_Civ_LicenseRemove_1",false,"fast"] call life_fnc_notification_system;
	};

	if (_mode isEqualTo 3) exitWith {
		[1,["gun",false]] call life_fnc_handleLicense;
		[localize "STR_Civ_LicenseRemove_2",false,"fast"] call life_fnc_notification_system;
	};
};	

["LICENSE"] call SOCK_fnc_updatePartial;