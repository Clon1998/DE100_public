/*
	File : fn_atmMenu.sqf
	Date:   26.09.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private["_amt","_dialog","_AmntFld","_CrntStats","_mode","_PList","_type","_auzgLB","_Verwendungszweck","_query","_queryIndex","_rowData", "_art","_playerPermissions"];

_mode = param [0, 0];
_query = param [1, []];
_amt = param [2, "1"];

switch (_mode) do {
    case 1: {
		closeDialog 0;
		createdialog "Life_atm_CASH_management";
		disableSerialization;
		waitUntil {!isnull (findDisplay 6650)};
		_dialog = findDisplay 6650;

		_AmntFld = _dialog displayCtrl 6659;
		_CrntStats =  _dialog displayCtrl 6661; 
		_CrntStats ctrlSetStructuredText parseText format["<t size= '1.6' align = 'center'>Kontoübersicht:</t><br/><br/><t size= '1.1' align = 'center'><img size='1.7' image='images\icons\ico_bank.paa'/> €%1<br/><img size='1.7' image='images\icons\ico_money.paa'/> €%2</t>",[de100_luciandjuli_bc] call life_fnc_numberText,[de100_luciandjuli_mula] call life_fnc_numberText];
		_AmntFld ctrlSetText  format ["%1",_amt];
		
	};
	
	case 2: {
		closeDialog 0;
		createdialog "Life_atm_Transfer_management";
		disableSerialization;
		waitUntil {!isnull (findDisplay 6670)};
		_dialog = findDisplay 6670;

		_PList = _dialog displayCtrl 6682;
		_CrntStats =  _dialog displayCtrl 6661; 
		_AmntFld = _dialog displayCtrl 6680;
		_CrntStats ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Kontostand:<br/>€%1</t>",[de100_luciandjuli_bc] call life_fnc_numberText];
		lbClear _PList;
		_AmntFld ctrlSetText format ["%1",_amt];
		{
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "THR"};
			};
			_PList lbAdd format["%1 (%2)",_x call life_fnc_name,_type];
			_PList lbSetData [(lbSize _PList)-1,netId (_x)];
		} foreach (allPlayers select {alive _x && _x != hc_1 && _x != player});
		lbSort [_PList, "ASC"];
		_PList lbSetCurSel 0;
	};
	
	case 3: {
		closeDialog 0;
		createdialog "Life_atm_auzug_management";
		disableSerialization;
		waitUntil {!isnull (findDisplay 6900)};
		_dialog = findDisplay 6900;

		_auzgLB = _dialog displayCtrl 6901;
		_Verwendungszweck =  _dialog displayCtrl 6902; 
		_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Wählen sie eine der Vergangen Transaktionen aus.</t>"];
		if (life_HC_isActive) then {
			[player, getPlayerUID player] remoteExec ["HC_fnc_requestKontoAuzug",HC_Life];
		} else {
			[player, getPlayerUID player] remoteExec ["TON_fnc_requestKontoAuzug",2];
		};
	};
	
	case 4: {
		disableSerialization;
		waitUntil {!isnull (findDisplay 6900)};
		_dialog = findDisplay 6900;
		_auzgLB = _dialog displayCtrl 6901;
		_Verwendungszweck =  _dialog displayCtrl 6902; 
		
		lbClear _auzgLB;
		{
			//SName RName Type Menge Verwendung Time KntNrS KntNrE
			_rowData = [_x select 2, _x select 3, _x select 4, _x select 5, _x select 6, _x select 7,_x select 0,_x select 1];
			switch (_x select 4) do {
				case 0: {
					if (_x select 0 == (getPlayerUID player)) then { 
						_art = "A-Transfer";
					} else {
						_art = "E-Transfer";
					};
				};

				case 1: {
					_art = "Auszahlung";
				};
			
				case 2: {
					_art = "Einzahlung";
				};	

				case 3: {
					_art = "Gang-Einzahlung";
				};

				case 4: {
					_art = "Gang-Auszahlung";
				};
			};
			_auzgLB lbAdd format ["%1 - Art: %2 - €%3", _x select 7, _art, [_x select 5] call life_fnc_numberText];
			_auzgLB lbSetData [(lbSize _auzgLB) - 1, str _rowData];
		}forEach _query;
	};
    case 5: {
	    if (([getPlayerUID player,group player getVariable ["gang_MEMBERS",[]]] call life_fnc_index) < 0) exitwith {
	    	[player] joinSilent (createGroup civilian);
	    	closeDialog 0;
	    };
		if (group player getVariable ["gang_atm_active",getPlayerUID player] != getPlayerUID player) exitWith {
			["Ein anderes Gangmitglied benutzt gerade das Gangkonto",true,"fast"] call life_fnc_notification_system;
		};
		group player setVariable ["gang_atm_active",getPlayerUID player,true];
		closeDialog 0;
		createdialog "Life_atm_gang_management";
		disableSerialization;
		waitUntil {!isnull (findDisplay 6950)};
		_dialog = findDisplay 6950;
		_playerPermissions = if (count (group player getVariable ["gang_MEMBERS",[]]) > 0) then {
			((group player getVariable ["gang_MEMBERS",[]]) select ([getPlayerUID player,(group player getVariable ["gang_MEMBERS",[]])] call life_fnc_index)) select 1;
		} else {
			[[getPlayerUID player,[]]];
		};
		if !("BANK" in _playerPermissions) then {
			(_dialog displayCtrl 6952) ctrlEnable false;
			(_dialog displayCtrl 6953) ctrlShow false;
			(_dialog displayCtrl 6956) ctrlShow false;
		};
		_AmntFld = _dialog displayCtrl 6959;
		_CrntStats =  _dialog displayCtrl 6961; 
		_CrntStats ctrlSetStructuredText parseText format ["<t size= '1.6' align = 'center'>Gangkontoübersicht:</t><br/><br/><t size= '1.1' align = 'center'><img size='1.7' image='images\icons\ico_bank.paa'/> €%1",[(group player) getVariable "gang_BANK"] call life_fnc_numberText];
		_AmntFld ctrlSetText format ["%1",_amt];
	};
};