/*
	File:	fn_gangMenuLbChange.sqf
	Date:   2016-10-14 15:18:54
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_listBox", controlNull, [controlNull]],
	["_selectedIndex", -1, [0]],
	"_usedSpaceOther",
	"_usedSpaceClothing",
	"_usedSpaceWeapon",
	"_item",
	"_amount",
	"_info",
	"_mass",
	"_space"
];
if ((_listBox lbData _selectedIndex) isEqualTo "exit") exitwith {};

private _unit = if (isNull (objectFromNetId (_listBox lbData _selectedIndex))) then {
	_listBox lbData _selectedIndex;
} else {
	objectFromNetId (_listBox lbData _selectedIndex);
};
private _display = findDisplay 2500;
private _gang = group player;
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _wightFactor = getNumber(missionConfigFile >> "Life_Settings" >> "houseInv_weightFactor");

private _playerPermissions = (_gangMembers select ([getPlayerUID player,_gangMembers] call life_fnc_index)) select 1;
switch (_display getVariable ["mode",""]) do { 
	case  "member" : {
		private _unitPermissions = (_gangMembers select ([getPlayerUID _unit,_gangMembers] call life_fnc_index)) select 1;
		_display displayCtrl 2507 cbSetChecked ("BANK" in _unitPermissions);
		_display displayCtrl 2509 cbSetChecked ("MEMBERMANAGER" in _unitPermissions);
		_display displayCtrl 2511 cbSetChecked ("INVITE" in _unitPermissions);
		_display displayCtrl 2515 cbSetChecked ("HOUSE" in _unitPermissions);


		_display displayCtrl 2507 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo player || !("BANK" in _playerPermissions));
		_display displayCtrl 2509 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo player);// no need to check here since this view need this permission
		_display displayCtrl 2511 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo player || !("INVITE" in _playerPermissions));
		_display displayCtrl 2515 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo player || !("HOUSE" in _playerPermissions));
		_display displayCtrl 2516 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo player);

		_display displayCtrl 2505 ctrlSetText "";
		_display displayCtrl 2504 ctrlShow false;
		_display displayCtrl 2504 ctrlEnable false;

		if ("OWNER" in _playerPermissions && !(_unit isEqualTo player)) then {
			_display displayCtrl 2505 ctrlSetText "Zum Besitzer machen";
			_display displayCtrl 2505 ctrlShow true;
			
			_display displayCtrl 2504 ctrlShow true;
			_display displayCtrl 2504 ctrlEnable true;
		};
	};

	case  "memberOff" : {
		private _unitPermissions = (_gangMembers select ([_unit,_gangMembers] call life_fnc_index)) select 1;
		_display displayCtrl 2507 cbSetChecked ("BANK" in _unitPermissions);
		_display displayCtrl 2509 cbSetChecked ("MEMBERMANAGER" in _unitPermissions);
		_display displayCtrl 2511 cbSetChecked ("INVITE" in _unitPermissions);
		_display displayCtrl 2515 cbSetChecked ("HOUSE" in _unitPermissions);

		private _pid = getPlayerUID player;
		_display displayCtrl 2507 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo _pid || !("BANK" in _playerPermissions));
		_display displayCtrl 2509 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo _pid);// no need to check here since this view need this permission
		_display displayCtrl 2511 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo _pid || !("INVITE" in _playerPermissions));
		_display displayCtrl 2515 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo _pid || !("HOUSE" in _playerPermissions));
		_display displayCtrl 2516 ctrlEnable !("OWNER" in _unitPermissions || _unit isEqualTo _pid);
	};

	case  "invite" : {
		_display displayCtrl 2507 cbSetChecked false;
		_display displayCtrl 2509 cbSetChecked false;
		_display displayCtrl 2511 cbSetChecked false;
		_display displayCtrl 2515 cbSetChecked false;


		_display displayCtrl 2507 ctrlEnable ("BANK" in _playerPermissions);
		_display displayCtrl 2509 ctrlEnable ("MEMBERMANAGER" in _playerPermissions);
		_display displayCtrl 2511 ctrlEnable ("INVITE" in _playerPermissions);
		_display displayCtrl 2515 ctrlEnable ("HOUSE" in _playerPermissions);

		_display displayCtrl 2505 ctrlSetText "Einladen";
		_display displayCtrl 2505 ctrlShow true;
		
		_display displayCtrl 2504 ctrlShow true;
		_display displayCtrl 2504 ctrlEnable true;
	};

	case  "storehouses" : {
		if (isClass (missionConfigFile >> "life_gang_config" >> "storehouslevels" >> format["level_%1",(_unit getVariable ["storehouse_level",1]) + 1])) then {
			_display displayCtrl 2505 ctrlSetText format["Lagerhaus-Ausbauen: €%1",[getNumber(missionConfigFile >> "life_gang_config" >> "storehouslevels" >> format["level_%1",(_unit getVariable ["storehouse_level",1]) + 1] >> "price")] call life_fnc_numberText];
			_display displayCtrl 2505 ctrlSetTooltip (getText(missionConfigFile >> "life_gang_config" >> "storehouslevels" >> format["level_%1",(_unit getVariable ["storehouse_level",1]) + 1] >> "tooltip"));
			
			_display displayCtrl 2504 buttonSetAction "[] spawn life_fnc_upgradeStorehouse;";
			_display displayCtrl 2504 ctrlEnable ("OWNER" in _playerPermissions);
		} else {
			_display displayCtrl 2505 ctrlSetText "Maximale Ausbaustufe erreicht!";
			_display displayCtrl 2505 ctrlSetTooltip "";
			_display displayCtrl 2504 buttonSetAction "";
			_display displayCtrl 2504 ctrlEnable false;
		};

		_space = 0;
		{
			switch (_x) do { 
				case "gang_storageBox" : {
					_space = _space + 4000;
				};

				case "big_storageBox" : {
					_space = _space + 900;
				};
				
				case "small_storageBox" : {
					_space = _space + 700;
				};
			};
		} forEach (_unit getVariable ["container",[]]);

		_usedSpaceWeapon = [_unit,"weapon_space"] call life_fnc_getUsedSpace;
		_usedSpaceClothing = [_unit,"clothing_space"] call life_fnc_getUsedSpace;
		_usedSpaceOther = [_unit,"other_space"] call life_fnc_getUsedSpace;
		
		private _airGarage = if ((_unit getVariable ["storehouse_level",1]) >= 2) then {
			"<t color='#3366ff'>Gekauft</t>";
		} else {
			"<t color='#8cff9b'>Kauf möglich</t>";
		};

		private _markt = if ((_unit getVariable ["storehouse_level",1]) >= 3) then {
			"<t color='#3366ff'>Gekauft</t>";
		} else {
			if ((_gang getVariable ["gang_LEVEL",1]) >= 5 && (_unit getVariable ["storehouse_level",1]) >= 2) then {
				"<t color='#8cff9b'>Kauf möglich</t>";
			} else {
				"<t color='#F24B4B'>Kauf nicht möglich</t>";
			};
		};

		private _clothing = if ((_unit getVariable ["storehouse_level",1]) >= 4) then {
			"<t color='#3366ff'>Gekauft</t>";
		} else {
			if ((_gang getVariable ["gang_LEVEL",1]) >= 6 && (_unit getVariable ["storehouse_level",1]) >= 3) then {
				"<t color='#8cff9b'>Kauf möglich</t>";
			} else {
				"<t color='#F24B4B'>Kauf nicht möglich</t>";
			};
		};

		private _weapon = if ((_unit getVariable ["storehouse_level",1]) >= 5) then {
			"<t color='#3366ff'>Gekauft</t>";
		} else {
			if ((_gang getVariable ["gang_LEVEL",1]) >= 7 && (_unit getVariable ["storehouse_level",1]) >= 4) then {
				"<t color='#8cff9b'>Kauf möglich</t>";
			} else {
				"<t color='#F24B4B'>Kauf nicht möglich</t>";
			};
		};

		_display displayCtrl 2503 ctrlSetStructuredText parseText format["Position: %1<br/>Container: %2/%3<br/>Waffen: %4/%5<br/>Kleidung: %6/%5<br/>Items: %7/%5<br/>Sonstiges: %8/%5<br/>Helikopter Garage: %9<br/>Markt: %10<br/>Rebellen Kleidung: %11<br/>Rebellen Waffen: %12<br/>", mapGridPosition _unit, count (_unit getVariable ["container",[]]), getNumber (missionConfigFile >> "life_gang_config" >> "gang_storeRoom_slots"), _usedSpaceWeapon, _space, _usedSpaceClothing, (_unit getVariable ["Trunk",[[],0]]) select 1, _usedSpaceOther, _airGarage, _markt, _clothing, _weapon ];

	};

	default {}; 
};