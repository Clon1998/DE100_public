/*
	File:	fn_houseIM.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _house = param [0,objNull,[objNull]];
if (isNull _house) exitwith {};

private _actions = [];
private _owner = _house in life_vehicles && ((_house getVariable ["house_owner",["",""]]) select 0) isEqualTo (getPlayerUID player);
private _permittedUser = _house in life_vehicles;
private _occupied = _house getVariable ["house_id",-1] >= 0 || count (_house getVariable ["house_owner",[]]) isEqualTo 2 || count (_house getVariable ["Trunk",[]]) isEqualTo 2;
private _houseType = if (_house isKindOf "House_F") then {
	if (typeOf _house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) exitWith {
		"GARAGE";
	};

	if (typeOf _house in ["Land_Dome_Small_F","Land_Research_house_V1_F"] && _house distance (getMarkerPos "fed_reserve") <= 400) exitwith {
		"BANK";
	};

	if (typeOf _house in ["Land_i_Shed_Ind_F"]) exitwith {
		"STOREHOUSE";
	};

	if (typeOf _house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]) exitwith {
		"HOUSE";
	};
	"ERROR";
} else {
	"ERROR";
};
private _gang = group player;
private _playerPermissions = if (count (_gang getVariable ["gang_MEMBERS",[]]) > 0) then {
	((_gang getVariable ["gang_MEMBERS",[]]) select ([getPlayerUID player,(_gang getVariable ["gang_MEMBERS",[]])] call life_fnc_index)) select 1;
} else {
	[[getPlayerUID player,[]]];
};
private _isgangOwner = "OWNER" in _playerPermissions && (_gang getVariable ["gang_LEVEL",1]) >= 3;
private _storehouseLevel = _house getVariable ["storehouse_level",1];

if (([typeOf _house] call life_fnc_houseConfig) isEqualTo [] && _houseType == "ERROR") exitWith {};
if (_houseType isEqualTo "ERROR") exitwith {};

switch (playerSide) do { 
	case west : {
		if (_houseType isEqualTo "BANK") then {
			_actions pushBackUnique [-1,localize "STR_pInAct_Repair","closeDialog 0; [life_action_target] spawn life_fnc_repairDoor;"];
			_actions pushBackUnique [-1,localize "STR_pInAct_CloseOpen","closeDialog 0; [life_action_target] spawn life_fnc_doorAnimate;"];
		} else {
			if (_occupied) then {
				_actions pushBackUnique [4,localize "STR_pInAct_BreakDown","closeDialog 0; [life_action_target] spawn life_fnc_copBreakDoor;"];
				_actions pushBackUnique [3,localize "STR_House_Raid_Owner","closeDialog 0; [life_action_target] spawn life_fnc_copHouseOwner;"];
				_actions pushBackUnique [2,localize "STR_pInAct_SearchHouse","closeDialog 0; [life_action_target] call life_fnc_raidHouse;"];
				_actions pushBackUnique [1,localize "STR_pInAct_LockHouse","closeDialog 0; [life_action_target] spawn life_fnc_lockupHouse;"];
			};
		};
	}; 
	case civilian : {
		if (_houseType isEqualTo "BANK") exitwith {};
		if (_occupied) then {
			if (!_owner && ! _permittedUser) exitwith {["Du hast keinen Schlüssel für das Gebäude.",true,"fast"] call life_fnc_notification_system;};
			if (_house getVariable ["forSale",false]) exitwith {["Das Gebäude wird im Auktionshaus verkauft.",true,"fast"] call life_fnc_notification_system;};
			if (_houseType isEqualTo "STOREHOUSE") then {
				if (isNil "_isgangOwner") exitwith {};
				if !("HOUSE" in _playerPermissions) exitwith {["Du hast keine Berechtigung, um auf das Lagerhaus zuzugreifen.",true,"fast"] call life_fnc_notification_system;};
				if !(((_house getVariable ["house_owner",[-1,""]]) select 0) isEqualTo (_gang getVariable ["gang_ID",0])) exitwith {["Nur Gangmitglieder können auf das Lagerhaus zugreifen.",true,"fast"] call life_fnc_notification_system;};
				if (_isgangOwner) then {
					_actions pushBackUnique [6,"Spawnpunkt ändern","closeDialog 0; [life_action_target] spawn life_fnc_setVehSpawnPoint;"];
					_actions pushBackUnique [-1,"Kisten anzeigen","closeDialog 0; [] call life_fnc_showBoxes;"];
				};
				_actions pushBackUnique [9,localize "STR_pInAct_AccessGarage","closeDialog 0; [life_action_target,'Car'] spawn life_fnc_vehicleGarage;"];
				_actions pushBackUnique [7,localize "STR_pInAct_StoreVeh","closeDialog 0; [life_action_target,player] spawn life_fnc_storeVehicle;"];
				if (_storehouseLevel >= 2) then {
					_actions pushBackUnique [8,"Helikopter Garage","closeDialog 0; [life_action_target,'Air'] spawn life_fnc_vehicleGarage;"];
				};

				if (_storehouseLevel >= 3) then {
					_actions pushBackUnique [4,"Bankautomat","closeDialog 0; createDialog 'Life_atm_new_management';"];
					_actions pushBackUnique [-1,"Reb. Markt","closeDialog 0; [life_action_target,nil,nil,'rebel'] call life_fnc_virt_menu;"];
				};

				if (_storehouseLevel >= 4) then {
					_actions pushBackUnique [-1,"Reb. Kleidung","closeDialog 0; [life_action_target,nil,nil,'c_reb'] spawn life_fnc_clothingMenu;"];
				};

				if (_storehouseLevel >= 5) then {
					_actions pushBackUnique [-1,"Reb. Waffen","closeDialog 0; [life_action_target,nil,nil,'w_reb'] call life_fnc_weaponShopMenu;"];
				};
				_actions pushBackUnique [5,"Hausinventar aufrufen","closeDialog 0; if (missionNamespace getVariable ['auc_isLoading', false]) exitWith {['Aufgrund eines potenziellen Netzwerklags darfst du das Inventar erst öffnen wenn das Auktionshaus alle Daten geladen hat.',true,'fast'] call life_fnc_notification_system;}; createDialog 'virt_houseMenu';"];
				if(isNull (_house getVariable ["lightSource",objNull])) then {
					_actions pushBackUnique [-1,localize "STR_pInAct_LightsOn","closeDialog 0; [life_action_target] call life_fnc_lightHouseAction;"];
				} else {
					_actions pushBackUnique [-1,localize "STR_pInAct_LightsOff","closeDialog 0; [life_action_target] call life_fnc_lightHouseAction;"];
				};
			} else {
				if (_owner) then {
					_actions pushBackUnique [10,"Verkaufen","closeDialog 0; [life_action_target] spawn life_fnc_sellHouse;"];
					_actions pushBackUnique [6,"Spawnpunkt ändern","closeDialog 0; [life_action_target] spawn life_fnc_setVehSpawnPoint;"];
					if (_houseType isEqualTo "HOUSE") then {
						_actions pushBackUnique [9,localize "STR_pInAct_AccessGarage","closeDialog 0; [life_action_target,'Car'] spawn life_fnc_vehicleGarage;"];
						_actions pushBackUnique [7,localize "STR_pInAct_StoreVeh","closeDialog 0; [life_action_target,player] spawn life_fnc_storeVehicle;"];
						_actions pushBackUnique [-1,"Kisten anzeigen","closeDialog 0; [] call life_fnc_showBoxes;"];
						if(isNull (_house getVariable ["lightSource",objNull])) then {
							_actions pushBackUnique [-1,localize "STR_pInAct_LightsOn","closeDialog 0; [life_action_target] call life_fnc_lightHouseAction;"];
						} else {
							_actions pushBackUnique [-1,localize "STR_pInAct_LightsOff","closeDialog 0; [life_action_target] call life_fnc_lightHouseAction;"];
						};
					};
				};
				if (_houseType isEqualTo "GARAGE") then {
					_actions pushBackUnique [8,"Helikopter Garage","closeDialog 0; [life_action_target,'Air'] spawn life_fnc_vehicleGarage;"];
					_actions pushBackUnique [9,localize "STR_pInAct_AccessGarage","closeDialog 0; [life_action_target,'Car'] spawn life_fnc_vehicleGarage;"];
					_actions pushBackUnique [7,localize "STR_pInAct_StoreVeh","closeDialog 0; [life_action_target,player] spawn life_fnc_storeVehicle;"];
				} else {
					_actions pushBackUnique [5,"Hausinventar aufrufen","closeDialog 0; if (missionNamespace getVariable ['auc_isLoading', false]) exitWith {['Aufgrund eines potenziellen Netzwerklags darfst du das Inventar erst öffnen wenn das Auktionshaus alle Daten geladen hat.',true,'fast'] call life_fnc_notification_system;}; createDialog 'virt_houseMenu';"];
				};
			};
		} else {
			if (_houseType isEqualTo "STOREHOUSE") then {
				if (_isgangOwner) then {
					_actions pushBackUnique [10,"Lagerhaus Kaufen","closeDialog 0; [life_action_target] spawn life_fnc_buyStoreHouse;"];
				};
			} else {
				_actions pushBackUnique [10,localize "STR_pInAct_BuyHouse","closeDialog 0; [life_action_target] spawn life_fnc_buyHouse;"];
			};
		};
	};
	default {};
};
if (count _actions == 0) exitwith {};
[_house,_actions,"Hausinteraktionsmenü"] call life_fnc_openMenu;