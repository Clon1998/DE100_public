/*
	File:	fn_weaponShopSelChange.sqf
	Date:   01.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_itemList", controlNull, [controlNull]],
	["_path", [], [[]]],
	"_infoText",
	"_infoPic",
	"_className",
	"_price",
	"_desc",
	"_details",
	"_caliber",
	"_type"
];
private _display = ctrlParent _itemList;
_infoText = _display displayCtrl 3402;
_infoPic = _display displayCtrl 3403;

_className = _itemList tvData _path;
_price = _itemList tvValue _path;

if (_className isEqualTo "error" || _price < 0) then {
	_infoPic ctrlSetStructuredText parseText "";
	_infoText ctrlSetStructuredText parseText "";
} else {
	_details = [_className] call life_fnc_fetchCfgDetails;
	_desc = _details select 9;
	_type = ([_className] call BIS_fnc_itemType) select 1;
	_infoPic ctrlSetStructuredText parseText format["<img align='center' size='5' image='%1'/>",_details select 2];

	if (count _desc > 0 && _type in ["AssaultRifle", "Handgun", "Launcher", "MachineGun", "MissileLauncher", "RocketLauncher", "Rifle", "SubmachineGun", "SniperRifle"]) then {
		_infoText ctrlSetStructuredText parseText format["Name: %1<br/>Type: %2<br/>Preis: <t color='#8cff9b'>€%3</t>",_details select 1,_desc,[_price] call life_fnc_numberText];
	} else {
		_type = switch (_type) do { 
			case "Bullet" : {"Magazin";};
			case "SmokeShell" : {"Rauchgranate";};
			case "Grenade" : {"Granate";};
			case "AccessoryMuzzle" : {"Schalldämpfer";};
			case "AccessorySights" : {"Visier";};
			case "AccessoryBipod" : {"Zweibein";};
			case "AccessoryPointer" : {"Aufsatz";};
			case "Binocular" : {"Fernglas";};
			case "Compass" : {"Kompass";};
			case "GPS" : {"Gps";};
			case "Map" : {"Karte";};
			case "FirstAidKit" : {"Erste-Hilfe-Kasten";};
			case "Medikit" : {"Verbandskasten";};
			case "NVGoggles" : {"Nachtsichtgerät";};
			case "Radio" : {"Smartphone";};
			case "Toolkit" : {"Werkzeugkasten";};
			case "UAVTerminal" : {"Fernsteuerung";};
			case "Watch" : {"Uhr";};
			default {"Unbekannt";};
		};
		_infoText ctrlSetStructuredText parseText format["Name: %1<br/>Type: %2<br/>Preis: <t color='#8cff9b'>€%3</t>",
			_details select 1,
			_type,
			[_price] call life_fnc_numberText
		];
	};
};