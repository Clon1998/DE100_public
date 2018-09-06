/*
	File:	fn_setupSection.sqf
	Date:   2017-04-30 22:38:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define WEA 0
	#define CLO 1
	#define VITEMS 2
	#define OTHER 3
*/


params[
	["_display", displayNull, [displayNull]],
	["_type", 0, [0]]
];
private _ctrl = controlNull;

for "_i" from 1300 to 1309 step 1 do {
	(_display displayCtrl _i) ctrlShow false;
};

switch (_type) do { 
	case 0 : {
		_ctrl = _display displayCtrl 1300;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_rifle.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Gewehr";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'rifle'] call life_fnc_fetchWeapons;"];

		_ctrl = _display displayCtrl 1301;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_sniper.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Sniper";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'sniper'] call life_fnc_fetchWeapons;"];

		_ctrl = _display displayCtrl 1302;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_handgun.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Pistole";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'pistole'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1303;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_scope.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Visire";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'scope'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1304;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_muzzle.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Laufzubehör";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'muzzle'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1305;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_sideAttach.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Befestigungsschiene";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'siderail'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1306;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_bipods.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Zweibein";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'bipod'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1307;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_ammunition.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Magazine";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'magazine'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1308;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_grenades.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Granaten";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'grenate'] call life_fnc_fetchWeapons;"];
		
		_ctrl = _display displayCtrl 1309;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_binocular.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Ferngläser";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'binocular'] call life_fnc_fetchWeapons;"];

		[(_display displayCtrl 1300) controlsGroupCtrl 3,"rifle"] call life_fnc_fetchWeapons;
	}; 
	case 1 : {
		_ctrl = _display displayCtrl 1300;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_uniform.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Uniform";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'uniform'] call life_fnc_fetchClothing;"];

		_ctrl = _display displayCtrl 1301;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_vest.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Weste";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'vest'] call life_fnc_fetchClothing;"];

		_ctrl = _display displayCtrl 1302;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_backpack.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Rucksack";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'backpack'] call life_fnc_fetchClothing;"];
		
		_ctrl = _display displayCtrl 1303;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_helmet.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Helm";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'headgear'] call life_fnc_fetchClothing;"];
		
		_ctrl = _display displayCtrl 1304;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_glasses.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Brille";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'glasses'] call life_fnc_fetchClothing;"];
		[(_display displayCtrl 1300) controlsGroupCtrl 3,"uniform"] call life_fnc_fetchClothing;
	};
	case 2 : {
		_ctrl = _display displayCtrl 1300;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_vInv.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Items";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0] call life_fnc_fetchVirtualItems;"];

		[(_display displayCtrl 1300) controlsGroupCtrl 3] call life_fnc_fetchVirtualItems;
	};
	case 3 : {
		_ctrl = _display displayCtrl 1300;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_other.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Sonstiges";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'other'] call life_fnc_fetchOthers;"];

		[(_display displayCtrl 1300) controlsGroupCtrl 3,"other"] call life_fnc_fetchOthers;
	};
};