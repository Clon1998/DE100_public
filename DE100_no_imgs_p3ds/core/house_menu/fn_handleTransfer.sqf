/*
	File:	fn_handleTransfer.sqf
	Date:   2017-05-02 15:49:09
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	#define STORE 0
	#define TAKE 1
*/
disableSerialization;

params[
	["_button", controlNull, [controlNull]],
	["_mode", 0, [0]],
	["_option",""],
	["_customItem",[]]
];

private _display = ctrlParent _button;
private _houseLB = _display displayCtrl 1100;
private _playerLB = _display displayCtrl 1200;
private _houseED = _display displayCtrl 1102;
private _playerED = _display displayCtrl 1202;
private _storageObj = _display getVariable ["house",objNull];
private _cNamespace = _display getVariable ["current_Namespace",""];
private _cKey = _display getVariable ["current_Key",""];
private _cSektion = _display getVariable ["lastSelection",controlNull];
private _loadout = getUnitLoadout player;
_display setVariable ["errors",[]];
if (diag_frameNo isEqualTo (_display getVariable ["frameNo",0])) exitwith {
	_display setVariable ["frameNo",diag_frameNo];
	_button ctrlEnable true;
};
_display setVariable ["frameNo",diag_frameNo];
if ((_storageObj getVariable ["trunkUser",""]) != (getPlayerUID player) && !(_house isEqualTo lockers_obj)) exitWith {
	closeDialog 0;
	["Das Inventar wird gerade von jemand anderem benutzt",true,"fast"] call life_fnc_notification_system;
};

private _handleItemContainer = {
	params[
		["_cElements", [], [[]]],
		["_cNamespace", "", [""]],
		["_cKey", "", [""]],
		["_lIndex", 3, [3]]
	];
	{
		_tItem = _x select 0;
		_tAmnt = _x select 1;
		if (_tAmnt isEqualType false) then {
			_tAmnt = 1;
		};

		//If its an weapon Container with scopes etc.
		if (_tItem isEqualType []) then {
			if ([_display,_cNamespace,_cKey,_tItem select 0,_tAmnt,true] call life_fnc_handlePushback) then {
				switch (_lIndex) do { 
					case 3 : {player removeItemFromUniform (_tItem select 0)}; 
					case 4 : {player removeItemFromVest (_tItem select 0)};
					case 5 : {player removeItemFromBackpack (_tItem select 0)}; 
				};
				for "_i" from 1 to (count _tItem -1) do {
					if (!((_tItem select _i) isEqualTo "") && !((_tItem select _i) isEqualTo [])) then {
						[_display,_cNamespace,_cKey,if ((_tItem select _i) isEqualType []) then {(_tItem select _i) select 0} else {_tItem select _i},1,true] call life_fnc_handlePushback;
					};
				};
			};
		} else {
			if ([_display,_cNamespace,_cKey,_tItem,_tAmnt,true] call life_fnc_handlePushback) then {
				for "_i" from 1 to _tAmnt do {						
					switch (_lIndex) do { 
						case 3 : {player removeItemFromUniform _tItem;}; 
						case 4 : {player removeItemFromVest _tItem;}; 
						case 5 : {player removeItemFromBackpack _tItem;}; 
					};
				};
			};
		};
		nil;
	} count _cElements;
};
if (_mode isEqualTo 0) then {
	private ["_item","_lIndex","_amnt"];
	if ((lnbCurSelRow _playerLB < 0 || (lnbSize _playerLB select 0) isEqualTo 0) && _customItem isEqualTo []) exitwith {
		["Du musst ein Item auswählen",true,"fast"] call life_fnc_notification_system;
	};
	if (_customItem isEqualTo []) then {
		_item = _playerLB lnbData [lnbCurSelRow _playerLB,0];
		_lIndex = _playerLB lnbValue [lnbCurSelRow _playerLB,0];
		_amnt = parseNumber(ctrlText _playerED) max 1;

	} else {
		_item = _customItem select 0;
		_lIndex = _customItem select 1;
		_amnt = _customItem select 2;
	};
	private _displayname = ([_item] call life_fnc_fetchCfgDetails) select 1;

	if (_lIndex >= 3 && !(_lIndex isEqualTo 8)) exitWith {
		//Here we handel Item Containers like the Uniform, Backpack ...
		if ((_item isEqualTo uniform player && _lIndex isEqualTo 3) || (_item isEqualTo vest player && _lIndex isEqualTo 4) || (_item isEqualTo backpack player && _lIndex isEqualTo 5)) exitwith {
			if (_amnt > 1) exitwith {
				["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
			};
			//loadoutElement
			private _lElement = _loadout select _lIndex;
			//containerElements
			private _cElements = _lElement select 1;
			if !(_cElements isEqualTo []) then {
				[_cElements,_cNamespace,_cKey,_lIndex] call _handleItemContainer;
			};

			private _retText = "";
			if ((_display getVariable ["errors",[]]) isEqualTo []) then {
				if ([_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handlePushback) then {
					switch (_lIndex) do { 
						case 3 : {removeUniform player;}; 
						case 4 : {removeVest player;}; 
						case 5 : {removeBackpack player;}; 
					};

					if (_cElements isEqualTo []) then {
						[format["%1 wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						[format["%1 wurde eingelagert, zusammen mit den enthaltenen Items",_displayname],false,"fast"] call life_fnc_notification_system;
					};
				} else {
					[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
				};
			} else {
				[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
			};
		};

		//Here we handle Headgear Facewear 
		if ((_item isEqualTo headgear player && _lIndex isEqualTo 6) || (_item isEqualTo goggles player && _lIndex isEqualTo 7)) exitwith {
			if (_amnt > 1) exitwith {
				["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
			};
			if ([_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handlePushback) then {
				if (_item isEqualTo headgear player) then {
					removeHeadgear player;
				} else {
					removeGoggles player;
				};
				[format["%1 wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
			} else {
				[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
			};
		};

		//Here we handle the Map Watch so on
		if (_lIndex isEqualTo 9) exitwith {
			if (_amnt > 1) exitwith {
				["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
			};
			if ([_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handlePushback) then {
				player unassignItem _item;
				player removeItem _item;
				[format["%1 wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
			} else {
				[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
			};
		};
		//Maybe rework this soon aswell???
		private _aAmnt = switch (_lIndex) do {
			case 3 : {{_x isEqualTo _item} count (uniformItems player);};
			case 4 : {{_x isEqualTo _item} count (vestItems player);};
			case 5 : {{_x isEqualTo _item} count (backpackItems player);};
		};
		if (_option isEqualTo "All") then {
			_amnt = _aAmnt;
		};
		if (_amnt > _aAmnt) exitWith {
			["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
		};
		private _added = 0;
		for "_i" from 1 to _amnt step 1 do {
			if !([_display,_cNamespace,_cKey,_item,1] call life_fnc_handlePushback) exitWith {};
			switch (_lIndex) do {
				case 3 : {player removeItemFromUniform _item;}; 
				case 4 : {player removeItemFromVest _item;};
				case 5 : {player removeItemFromBackpack _item;};
			};
			_added = _added + 1;
		};
		if (_added > 0) then {
			if ((_display getVariable ["errors",[]]) isEqualTo []) then {
				[format["%1x %2 wurde(n) eingelagert",_added,_displayname],false,"fast"] call life_fnc_notification_system;	
			} else {
				[format["%1x %2 wurde(n) eingelagert, da in folgenen Inventaren kein Platz mehr war: %3",_added,_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;	
			};
		} else {
			[format["%1x %2 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %3",_amnt,_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
		};
	};
	//Here we handle the Storage of the Assigned Weapons and the attachments of them
	if (_item in [primaryWeapon player,secondaryWeapon player,handgunWeapon player,binocular player]) exitwith { // We can check it like this beacause we check early the getUnitLoadout index? we did ?
		if (_amnt > 1) exitwith {
			["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
		};
		//Get attachted Items
		private _lElement = _loadout select _lIndex;
		private _hadAttach = false;
		for "_i" from 1 to (count _lElement - 1) step 1 do {
			private _tItem = _lElement select _i;
			if (_tItem isEqualType []) then {
				 _tItem = _tItem select 0;
			};
			if !(_tItem isEqualTo "") then {
				_hadAttach = true;
				if !([_display,_cNamespace,_cKey,_tItem,1,true] call life_fnc_handlePushback) exitwith {};//Not sure if this even has a effect lel xD
				switch (_lIndex) do {
					case 0 : {player removePrimaryWeaponItem _tItem;}; 
					case 1 : {player removeSecondaryWeaponItem _tItem;}; 
					case 2 : {player removeHandgunItem _tItem;}; 
				};
			};
		};
		if ((_display getVariable ["errors",[]]) isEqualTo []) then {
			if ([_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handlePushback) then {
				player removeWeapon _item;
				if (_hadAttach) then {
					[format["%1 wurde eingelagert, zusammen mit den montierten Items",_displayname],false,"fast"] call life_fnc_notification_system;
				} else {
					[format["%1 wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
				};
			} else {
				[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
			};
		} else {
			[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
		};
	};
	//Here we handle the attached items
	if (_amnt > 1) exitwith {
		["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
	};
	private _lElement = _loadout select _lIndex;
	if ([_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handlePushback) then {
		switch (_lIndex) do {
			case 0 : {player removePrimaryWeaponItem _item;}; 
			case 1 : {player removeSecondaryWeaponItem _item;}; 
			case 2 : {player removeHandgunItem _item;}; 
		};
		[format["%1 wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
	} else {
		[format["%1 konnte nicht eingelagert werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],true,"fast"] call life_fnc_notification_system;
	};
} else {
	if (lnbCurSelRow _houseLB < 0 || (lnbSize _houseLB select 0) isEqualTo 0) exitwith {
		["Du musst ein Item auswählen",true,"fast"] call life_fnc_notification_system;
	};
	private _item = _houseLB lnbData [lnbCurSelRow _houseLB,0];
	private _displayname = ([_item] call life_fnc_fetchCfgDetails) select 1;
	private _itemType = _item call BIS_fnc_itemType;
	private _aAmnt = _houseLB lnbValue [lnbCurSelRow _houseLB,0];
	private _amnt = parseNumber(ctrlText _houseED) max 1;
	if (_option isEqualTo "All") then {
		_amnt = _aAmnt;
	};
	if (_amnt > _aAmnt) exitwith {
		["Davon hast du nicht so viele Gegestände",true,"fast"] call life_fnc_notification_system;
	};

	if (_option isEqualTo "Equip") exitwith {
		_amnt = 1;

		if ((_itemType select 0) isEqualTo "Equipment") exitwith {
			switch (_itemType select 1) do { 
				case "Uniform" : {
					if (uniform player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player forceAddUniform _item;
						[format["Du hast %1 angezogen",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 3;
						private _cElements = _lElement select 1;
						if !(_cElements isEqualTo []) then {
							[_cElements,_cNamespace,_cKey,3] call _handleItemContainer;
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player forceAddUniform _item;
								[format["Du hast %1 angezogen, die alte Kleidung wurde zusammen mit den enthaltenen items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "Vest" : {
					if (vest player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addVest _item;
						[format["Du hast %1 angezogen",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 4;
						private _cElements = _lElement select 1;
						if !(_cElements isEqualTo []) then {
							[_cElements,_cNamespace,_cKey,4] call _handleItemContainer;
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player addVest _item;
								[format["Du hast %1 angezogen, die alte Kleidung wurde zusammen mit den enthaltenen items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "Backpack" : {
					if (backpack player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addBackpack _item;
						[format["Du hast %1 angezogen",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 5;
						private _cElements = _lElement select 1;
						if !(_cElements isEqualTo []) then {
							[_cElements,_cNamespace,_cKey,5] call _handleItemContainer;
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player addBackpack _item;
								[format["Du hast %1 angezogen, die alte Kleidung wurde zusammen mit den enthaltenen items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "Headgear" : {
					if (headgear player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addHeadgear _item;
						[format["Du hast %1 angezogen",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,headgear player,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addHeadgear _item;
							[format["Du hast %1 angezogen, die alte Kopfbedeckung wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "Glasses" : {
					if (goggles player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addGoggles _item;
						[format["Du hast %1 angezogen",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,goggles player,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addGoggles _item;
							[format["Du hast %1 angezogen, die alte Brille wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht angezogen werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};
			};
		};

		if ((_itemType select 1) in ["AccessoryMuzzle","AccessorySights","AccessoryPointer","AccessoryBipod"]) exitwith {
			if (primaryWeapon player isEqualTo "") exitwith {
				["Du hast keine Primärwaffe",true,"fast"] call life_fnc_notification_system;
			};
			private _attachableItems = [];
			private _tmp = [primaryWeapon player] call life_fnc_fetchCfgDetails;
			{
				_attachableItems pushBackUnique (toLower _x);
				nil;
			} count ((_tmp select 10) + (_tmp select 11) + (_tmp select 12) + (_tmp select 16));
			if !(toLower _item in _attachableItems) exitwith {
				[format["%1 kann nicht an der Primärwaffe montiert werden",_displayname],true,"fast"] call life_fnc_notification_system;
			};

			switch (_itemType select 1) do { 
				case "AccessoryMuzzle" : {
					if ((primaryWeaponItems player select 0) isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addPrimaryWeaponItem _item;
						[format["%1 wurde an deiner Primärwaffe montiert",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,primaryWeaponItems player select 0,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addPrimaryWeaponItem _item;
							[format["%1 wurde an deiner Primärwaffe montiert, dein alter Schalldämpfer wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht an deiner Primärwaffe montiert werden, da in folgenden Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "AccessorySights" : {
					if ((primaryWeaponItems player select 2) isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addPrimaryWeaponItem _item;
						[format["%1 wurde an deiner Primärwaffe montiert",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,primaryWeaponItems player select 2,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addPrimaryWeaponItem _item;
							[format["%1 wurde an deiner Primärwaffe montiert, dein altes Visir wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht an deiner Primärwaffe montiert werden, da in folgenden Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "AccessoryPointer" : {
					if ((primaryWeaponItems player select 1) isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addPrimaryWeaponItem _item;
						[format["%1 wurde an deiner Primärwaffe montiert",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,primaryWeaponItems player select 1,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addPrimaryWeaponItem _item;
							[format["%1 wurde an deiner Primärwaffe montiert, dein altes Modul wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht an deiner Primärwaffe montiert werden, da in folgenden Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case "AccessoryBipod" : {
					if ((primaryWeaponItems player select 3) isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addPrimaryWeaponItem _item;
						[format["%1 wurde an deiner Primärwaffe montiert",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,primaryWeaponItems player select 3,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addPrimaryWeaponItem _item;
							[format["%1 wurde an deiner Primärwaffe montiert, dein altes Zweibein wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht an deiner Primärwaffe montiert werden, da in folgenden Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};
			};
		};

		if ((_itemType select 0) isEqualTo "Weapon" || (_itemType select 1) in ["NVGoggles","Binocular","LaserDesignator"]) exitwith {
			switch (true) do { 
				case ((_itemType select 1) in ["AssaultRifle","MachineGun","Rifle","SubmachineGun","SniperRifle"]) : {
					if (primaryWeapon player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addWeapon _item;
						removeAllPrimaryWeaponItems player;
						[format["%1 wurde ausgerüstet",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 0;

						for "_i" from 1 to (count _lElement -1) do {
							private _tItem = _lElement select _i;
							if (_tItem isEqualType []) then {
								 _tItem = _tItem select 0;
							};
							if !(_tItem isEqualTo "") then {
								if !([_display,_cNamespace,_cKey,_tItem,1,true] call life_fnc_handlePushback) exitwith {};//Not sure if this even has a effect lel xD
								player removePrimaryWeaponItem _tItem;
							};
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player addWeapon _item;
								removeAllPrimaryWeaponItems player;
								[format["%1 wurde ausgerüstet, die alte Primärwaffe wurde zusammen mit den montierten Items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case ((_itemType select 1) in ["Launcher","MissileLauncher"]) : {
					if (secondaryWeapon player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addWeapon _item;
						[format["%1 wurde ausgerüstet",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 1;

						for "_i" from 1 to (count _lElement -1) do {
							private _tItem = _lElement select _i;
							if (_tItem isEqualType []) then {
								 _tItem = _tItem select 0;
							};
							if !(_tItem isEqualTo "") then {
								if !([_display,_cNamespace,_cKey,_tItem,1,true] call life_fnc_handlePushback) exitwith {};//Not sure if this even has a effect lel xD
								player removeSecondaryWeaponItem _tItem;
							};
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player addWeapon _item;
								[format["%1 wurde ausgerüstet, die alte Sekundärwaffe wurde zusammen mit den montierten Items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				}; 

				case ((_itemType select 1) isEqualTo "Handgun") : {
					if (handgunWeapon player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addWeapon _item;
						removeAllHandgunItems player;
						[format["%1 wurde ausgerüstet",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						private _lElement = _loadout select 2;

						for "_i" from 1 to (count _lElement -1) do {
							private _tItem = _lElement select _i;
							if (_tItem isEqualType []) then {
								 _tItem = _tItem select 0;
							};
							if !(_tItem isEqualTo "") then {
								if !([_display,_cNamespace,_cKey,_tItem,1,true] call life_fnc_handlePushback) exitwith {};//Not sure if this even has a effect lel xD
								player removePrimaryWeaponItem _tItem;
							};
						};

						if ((_display getVariable ["errors",[]]) isEqualTo []) then {
							if ([_display,_cNamespace,_cKey,_lElement select 0,1] call life_fnc_handlePushback) then {
								[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
								player addWeapon _item;
								removeAllHandgunItems player;
								[format["%1 wurde ausgerüstet, die alte Handfeuerwaffe wurde zusammen mit den montierten Items eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
							} else {
								[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
							};
						} else {
							[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				}; 

				case ((_itemType select 1) in ["Binocular","LaserDesignator"]) : {
					if (binocular player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addWeapon _item;
						[format["%1 wurde ausgerüstet",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,binocular player,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addWeapon _item;
							[format["%1 wurde ausgerüstet, das alte Fernglas wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				};

				case ((_itemType select 1) isEqualTo "NVGoggles") : {
					if (hmd player isEqualTo "") then {
						[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
						player addWeapon _item;
						[format["%1 wurde ausgerüstet",_displayname],false,"fast"] call life_fnc_notification_system;
					} else {
						if ([_display,_cNamespace,_cKey,hmd player,_amnt] call life_fnc_handlePushback) then {
							[_display,_cNamespace,_cKey,_item,_amnt] call life_fnc_handleDeleteat;
							player addWeapon _item;
							[format["%1 wurde ausgerüstet, das alte Nachtsichtgerät wurde eingelagert",_displayname],false,"fast"] call life_fnc_notification_system;
						} else {
							[format["%1 konnte nicht ausgerüstet werden, da in folgenen Inventaren kein Platz mehr war: %2",_displayname,_display call life_fnc_fetchErrorText],false,"fast"] call life_fnc_notification_system;
						};
					};
				}; 
			};
		};

		["Das Item kann nicht direkt ausgerüstet werden",true,"fast"] call life_fnc_notification_system;
	};
	private _added = 0;
	for "_i" from 1 to _amnt do {
		if !(player canAdd _item) exitwith {};
		player addItem _item;
		_added = _added + 1;
	};

	if (_added isEqualTo _amnt) then {
			[_display,_cNamespace,_cKey,_item,_added] call life_fnc_handleDeleteat;
		[format["%1x %2 wurd in dein Inventar gelegt",_added,_displayname],false,"fast"] call life_fnc_notification_system;
	} else {
		if (_added isEqualTo 0) then {
			[format["Du hast keinen Platz um %1 zu nehmen",_displayname],false,"fast"] call life_fnc_notification_system;
		} else {
			[_display,_cNamespace,_cKey,_item,_added] call life_fnc_handleDeleteat;
			[format["Es konnten nur %1x %2 in dein Inventar gelegt werden",_added,_displayname],true,"fast"] call life_fnc_notification_system;
		};
	};
};
_button ctrlEnable true;
switch (_cNamespace) do {
	case "weapon_space" : {[_cSektion controlsGroupCtrl 3,_cKey] call life_fnc_fetchWeapons;};
	case "clothing_space" : {[_cSektion controlsGroupCtrl 3,_cKey] call life_fnc_fetchClothing;};
	case "other_space" : {[_cSektion controlsGroupCtrl 3,_cKey] call life_fnc_fetchOthers;};
};