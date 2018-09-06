/*
	File : fn_bankWithdraw.sqf
	Date:   30.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_val","_CrntStats","_dialog","_AmntFld"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};

life_action_delay = time;
_val = parseNumber(ctrlText 6659);
//if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_val < 0) exitWith {};
if (!([(ctrlText 6659)] call life_fnc_isnumber)) exitWith {[localize "STR_ATM_notnumeric",true,"fast"] call life_fnc_notification_system;};
if (_val > de100_luciandjuli_bc) exitWith {[localize "STR_ATM_NotEnoughFunds",true,"fast"] call life_fnc_notification_system;};
if (_val+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
if (_val < 1000 && de100_luciandjuli_bc > 20000000) exitWith {[localize "STR_ATM_WithdrawMin",true,"fast"] call life_fnc_notification_system;}; //Temp fix for something.
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula + _val;
de100_luciandjuli_bc = de100_luciandjuli_bc - _val;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;

_dialog = findDisplay 6650;
_CrntStats =  _dialog displayCtrl 6661; 
_CrntStats ctrlSetStructuredText parseText format["<t size= '1.6' align = 'center'>Kontoübersicht:</t><br/><br/><t size= '1.1' align = 'center'><img size='1.7' image='images\icons\ico_bank.paa'/> €%1<br/><img size='1.7' image='images\icons\ico_money.paa'/> €%2</t>",[de100_luciandjuli_bc] call life_fnc_numberText,[de100_luciandjuli_mula] call life_fnc_numberText];
_dialog = findDisplay 6650;

_AmntFld = _dialog displayCtrl 6659;
_CrntStats =  _dialog displayCtrl 6661; 
_CrntStats ctrlSetStructuredText parseText format["<t size= '1.6' align = 'center'>Kontoübersicht:</t><br/><br/><t size= '1.1' align = 'center'><img size='1.7' image='images\icons\ico_bank.paa'/> €%1<br/><img size='1.7' image='images\icons\ico_money.paa'/> €%2</t>",[de100_luciandjuli_bc] call life_fnc_numberText,[de100_luciandjuli_mula] call life_fnc_numberText];
_AmntFld ctrlSetText  format ["%1",[_val] call life_fnc_number];

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 1, format ["%1 hat €%2 ausgezahlt",player call life_fnc_nameUID,[_val] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["HC_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID player, player call life_fnc_name, player call life_fnc_name, 1, _val]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 1, format ["%1 hat €%2 ausgezahlt",player call life_fnc_nameUID,[_val] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["TON_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID player, player call life_fnc_name, player call life_fnc_name, 1, _val]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};