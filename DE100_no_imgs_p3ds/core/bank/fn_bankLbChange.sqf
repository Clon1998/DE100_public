/*
	File : fn_bankLbChange.sqf
	Date:   26.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_index","_dialog","_auzgLB","_Verwendungszweck","_data"];

_index = _this select 0;

disableSerialization;
waitUntil {!isnull (findDisplay 6900)};
_dialog = findDisplay 6900;
_auzgLB = _dialog displayCtrl 6901;
_Verwendungszweck =  _dialog displayCtrl 6902; 

_data = parseSimpleArray (lbData [6901, _index]);


call {
	if ((_data select 2) isEqualTo 0) exitWith {
		if ((_data select 6) isEqualTo (getPlayerUID player)) then {
			_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Ausgehender Transfer<br/>Datum: %1<br/>Menge: €%2<br/>Empfänger: %3<br/>Empfänger Konto Nr.: %4</t>",_data select 5,[_data select 3] call life_fnc_numberText,_data select 1,_data select 7];
		} else {
			_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Eingehender Transfer<br/>Datum: %1<br/>Menge: €%2<br/>Sender: %3<br/>Sender Konto Nr: %4</t>",_data select 5,[_data select 3] call life_fnc_numberText,_data select 0,_data select 6];
		};
	};

	if ((_data select 2) isEqualTo 1) exitWith {_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Auzahlung<br/>Datum: %1<br/>Menge: €%2</t>",_data select 5,[_data select 3] call life_fnc_numberText];};
	if ((_data select 2) isEqualTo 2) exitWith {_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Einzahlung<br/>Datum: %1<br/>Menge: €%2</t>",_data select 5,[_data select 3] call life_fnc_numberText];};
	if ((_data select 2) isEqualTo 3) exitWith {_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Gang-Einzahlung<br/>Datum: %1<br/>Menge: €%2</t>",_data select 5,[_data select 3] call life_fnc_numberText];};
	if ((_data select 2) isEqualTo 4) exitWith {_Verwendungszweck ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Typ: Gang-Auzahlung<br/>Datum: %1<br/>Menge: €%2</t>",_data select 5,[_data select 3] call life_fnc_numberText];};
};