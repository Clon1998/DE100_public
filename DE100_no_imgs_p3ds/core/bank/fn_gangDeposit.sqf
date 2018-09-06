/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private ["_value","_gFund","_dialog","_AmntFld","_CrntStats"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};

if (group player getVariable ["gang_atm_active",getPlayerUID player] != getPlayerUID player) exitWith {
	life_dupe_protection = true;
	closeDialog 6950;
	["Ein anderes Gangmitglied benutzt gerade das Gangkonto",true,"fast"] call life_fnc_notification_system;
	life_dupe_protection = false;
};



life_action_delay = time;
_value = parseNumber(ctrlText 6959);

//Series of stupid checks
//if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value < 0) exitWith {};
if (_value < 1000 && de100_luciandjuli_bc > 20000000) exitWith {["Du musst mindestens €100 einzahlen",true,"fast"] call life_fnc_notification_system;}; //Temp fix for something.
if !([ctrlText 6959] call life_fnc_isnumber) exitWith {[localize "STR_ATM_notnumeric",true,"fast"] call life_fnc_notification_system;};
if (_value > de100_luciandjuli_bc) exitWith {[localize "STR_NOTF_NotEnoughFunds",true,"fast"] call life_fnc_notification_system;};
if (_value+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - _value;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
_gFund = (group player) getVariable ["gang_bank",0];
_gFund = _gFund + _value;
(group player) setVariable ["gang_bank",_gFund,true];

[format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 24, format ["%1 hat €%2 auf das Gangkonto(%3 [%4]) überwiesen",player call life_fnc_nameUID,[_value] call life_fnc_numberText,(group player) getVariable ["gang_NAME","Error::NoGangName"],(group player) getVariable ["gang_ID","Error::NoGangID"]]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["HC_fnc_gangUpdatePartial",false,["Bank",(group player) getVariable ["gang_ID",1],[(group player) getVariable ["gang_BANK",1]]]],
		["HC_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID player, player call life_fnc_name, player call life_fnc_name, 3, _value]]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 24, format ["%1 hat €%2 auf das Gangkonto(%3 [%4]) überwiesen",player call life_fnc_nameUID,[_value] call life_fnc_numberText,(group player) getVariable ["gang_NAME","Error::NoGangName"],(group player) getVariable ["gang_ID","Error::NoGangID"]]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
		["TON_fnc_gangUpdatePartial",false,["Bank",(group player) getVariable ["gang_ID",1],[(group player) getVariable ["gang_BANK",1]]]],
		["TON_fnc_insertKontoAuzug",false,[getPlayerUID player, getPlayerUID player, player call life_fnc_name, player call life_fnc_name, 3, _value]]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

_dialog = findDisplay 6950;
_AmntFld = _dialog displayCtrl 6959;
_CrntStats =  _dialog displayCtrl 6961; 
_CrntStats ctrlSetStructuredText parseText format ["<t size= '1.6' align = 'center'>Gangkontoübersicht:</t><br/><br/><t size= '1.1' align = 'center'><img size='1.7' image='images\icons\ico_bank.paa'/> €%1",[(group player) getVariable "gang_bank"] call life_fnc_numberText];
_AmntFld ctrlSetText  format ["%1",[_value] call life_fnc_number];

//[5,[],_value] spawn life_fnc_atmMenu; 