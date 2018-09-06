/*
	File:	fn_getItemType.sqf
	Date:   2017-05-03 17:31:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_item", "", [""]]
];

private _info = _item call BIS_fnc_itemType;
switch (true) do { 
	case ((_info select 1) in ["AssaultRifle","MachineGun","MachineGun","Rifle","SubmachineGun"]) : {
		["weapon_space","rifle"];
	}; 
	case ((_info select 1) in ["SniperRifle"]) : {
		["weapon_space","sniper"];
	}; 
	case ((_info select 1) in ["Handgun"]) : {
		["weapon_space","pistole"];
	}; 
	case ((_info select 1) in ["AccessorySights"]) : {
		["weapon_space","scope"];
	};
	case ((_info select 1) in ["AccessoryMuzzle"]) : {
		["weapon_space","muzzle"];
	}; 
	case ((_info select 1) in ["AccessoryPointer"]) : {
		["weapon_space","siderail"];
	};
	case ((_info select 1) in ["AccessoryBipod"]) : {
		["weapon_space","bipod"];
	};
	case ((_info select 1) in ["Bullet","Shell"]) : {
		["weapon_space","magazine"];
	};
	case ((_info select 1) in ["SmokeShell","Grenade","Flare","Artillery"]) : {
		["weapon_space","grenate"];
	}; 
	case ((_info select 1) in ["Binocular","LaserDesignator","NVGoggles"]) : {
		["weapon_space","binocular"];
	};
	case ((_info select 1) in ["Glasses"]) : {
		["clothing_space","glasses"];
	}; 
	case ((_info select 1) in ["Headgear"]) : {
		["clothing_space","headgear"];
	}; 
	case ((_info select 1) in ["Vest"]) : {
		["clothing_space","vest"];
	}; 
	case ((_info select 1) in ["Uniform"]) : {
		["clothing_space","uniform"];
	}; 
	case ((_info select 1) in ["Backpack"]) : {
		["clothing_space","backpack"];
	}; 
	case ((_info select 1) in ["Watch","Compass","GPS","Radio","Map","FirstAidKit","Medikit","Toolkit","UAVTerminal"]) : {
		["other_space","other"];
	};
};