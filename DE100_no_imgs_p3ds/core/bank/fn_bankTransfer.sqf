/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax","_ver","_AmntFld","_CrntStats","_dialog"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};
if (!isnull (findDisplay 6670)) then {
	_dialog = findDisplay 6670;
} else {
	_dialog = findDisplay 8200;
};

life_action_delay = time;
_val = parseNumber(ctrlText 6680);
_ver = ctrlText 6684;
_unit = objectFromNetId (lbData[6682,(lbCurSel 6682)]);
if (isNull _unit) exitWith {};
if (_ver == "") exitWith {["Du musst einen Verwendungszweck angeben!",true,"fast"] call life_fnc_notification_system;};
if (count _ver > 80) exitWith {["Maximal 80 Zeichen",true,"fast"] call life_fnc_notification_system;};
if ((lbCurSel 6682) == -1) exitWith {[localize "STR_ATM_NoneSelected",true,"fast"] call life_fnc_notification_system;};
if (isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist",true,"fast"] call life_fnc_notification_system;};
//if (_val > 999999 && (call life_adminlevel) == 0) exitWith {hint localize "STR_ATM_TransferMax";};
if (_val < 0) exitWith {};
if (!([(ctrlText 6680)] call life_fnc_isnumber)) exitWith {[localize "STR_ATM_notnumeric",true,"fast"] call life_fnc_notification_system;};
if (_val > de100_luciandjuli_bc) exitWith {[localize "STR_ATM_NotEnoughFunds",true,"fast"] call life_fnc_notification_system;};
_tax = _val * 0.07;
if((_val + _tax) > de100_luciandjuli_bc) exitWith {[format[localize "STR_ATM_SentMoneyFail",_val,_tax],true,"fast"] call life_fnc_notification_system;};
if ((_val + _tax)+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - _val - _tax;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 2, format ["%1 hat %2 €%3 überwiesen",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[_val] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["HC_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID _unit, player call life_fnc_name, _unit call life_fnc_name,  0,  _val,  _ver]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 2, format ["%1 hat %2 €%3 überwiesen",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[_val] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["TON_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID _unit, player call life_fnc_name, _unit call life_fnc_name,  0,  _val,  _ver]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};


[_val,player,_ver] remoteExecCall ["life_fnc_clientWireTransfer",_unit];

_CrntStats =  _dialog displayCtrl 6661; 
_AmntFld = _dialog displayCtrl 6680;
_CrntStats ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Kontostand:<br/>€%1</t>",[de100_luciandjuli_bc] call life_fnc_numberText];
_AmntFld ctrlSetText format ["%1",[_val] call life_fnc_number];

[format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit call life_fnc_name,[_tax] call life_fnc_numberText,_ver],false,"fast"] call life_fnc_notification_system;