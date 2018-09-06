/*
	File:	fn_setupAucSection.sqf
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

for "_i" from 4501 to 4510 step 1 do {
	(_display displayCtrl 4500 controlsGroupCtrl _i) ctrlShow false;
};

switch (_type) do { 
	case 0 : {
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4501;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_rifle.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Gewehr";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'rifle'] call life_fnc_fetchAucWeapons;"];

		_ctrl =_display displayCtrl 4500 controlsGroupCtrl 4502;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_sniper.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Sniper";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'sniper'] call life_fnc_fetchAucWeapons;"];

		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4503;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_handgun.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Pistole";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'pistole'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4504;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_scope.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Visire";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'scope'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4505;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_muzzle.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Laufzubehör";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'muzzle'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4506;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_sideAttach.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Befestigungsschiene";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'siderail'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4507;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_bipods.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Zweibein";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'bipod'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4508;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_ammunition.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Magazine";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'magazine'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4509;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_grenades.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Granaten";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'grenate'] call life_fnc_fetchAucWeapons;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4510;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_binocular.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Ferngläser";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'binocular'] call life_fnc_fetchAucWeapons;"];

		[(_display displayCtrl 4500 controlsGroupCtrl 4501) controlsGroupCtrl 3,"rifle"] call life_fnc_fetchAucWeapons;
	}; 
	case 1 : {
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4501;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_uniform.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Uniform";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'uniform'] call life_fnc_fetchAucClothing;"];

		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4502;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_vest.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Weste";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'vest'] call life_fnc_fetchAucClothing;"];

		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4503;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_backpack.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Rucksack";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'backpack'] call life_fnc_fetchAucClothing;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4504;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_helmet.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Helm";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'headgear'] call life_fnc_fetchAucClothing;"];
		
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4505;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_glasses.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Brille";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'glasses'] call life_fnc_fetchAucClothing;"];

		[(_display displayCtrl 4500 controlsGroupCtrl 4501) controlsGroupCtrl 3,"uniform"] call life_fnc_fetchAucClothing;
	};
	case 2 : {
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4501;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_vInv.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Items";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0] call life_fnc_fetchAucVirtualItems;"];

		[(_display displayCtrl 4500 controlsGroupCtrl 4501) controlsGroupCtrl 3] call life_fnc_fetchAucVirtualItems;
	};
	case 3 : {
		_ctrl = _display displayCtrl 4500 controlsGroupCtrl 4501;
		_ctrl ctrlShow true;
		(_ctrl controlsGroupCtrl 1) ctrlSetText "images\dialog\ico_other.paa";
		(_ctrl controlsGroupCtrl 3) ctrlSetTooltip "Sonstiges";
		(_ctrl controlsGroupCtrl 3) ctrlSetEventHandler ["ButtonClick","[_this select 0,'other'] call life_fnc_fetchAucOthers;"];

		[(_display displayCtrl 4500 controlsGroupCtrl 4501) controlsGroupCtrl 3,"other"] call life_fnc_fetchAucOthers;
	};
};