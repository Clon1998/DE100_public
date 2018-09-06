/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
if((life_action_delay != 0) && ((time - life_action_delay) < 2)) exitWith {["Speedklicker Schutz",true,"fast"] call life_fnc_notification_system;life_klickcount = life_klickcount + 1; if(life_klickcount> 2) then {closeDialog 0;life_klickcount = 0;};};

life_action_delay = time;

_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {["Du hast kein Ziel ausgewählt",true,"fast"] call life_fnc_notification_system;ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = objectFromNetId _unit;
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
//if(parseNumber(_amount) > 999999) exitWith {hint "Du kannst nicht mehr als €999,999 geben"};
//A series of checks *ugh*
if(!([_amount] call life_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat",true,"fast"] call life_fnc_notification_system;ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {["Du hast keine Zahl eingegeben",true,"fast"] call life_fnc_notification_system;ctrlShow[2001,true];};
if(parseNumber(_amount) > de100_luciandjuli_mula) exitWith {["Du hast nicht so viel Geld",true,"fast"] call life_fnc_notification_system;ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Das augewählte Ziel ist nicht in Reichweite",true,"fast"] call life_fnc_notification_system;};
if ((parseNumber(_amount)) >= 500000) then {
	[format["Du hast %2 €%1 gegeben",[(parseNumber(_amount))] call life_fnc_numberText,_unit call life_fnc_name],false,"fast"] call life_fnc_notification_system;
} else {
	[format["Du hast der Person vor dir €%1 gegeben",[(parseNumber(_amount))] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula - parseNumber(_amount);
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 4, format ["%1 hat %2 €%3 gegeben",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[parseNumber(_amount)] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 4, format ["%1 hat %2 €%3 gegeben",player call life_fnc_nameUID, _unit call life_fnc_nameUID,[parseNumber(_amount)] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};

[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;
ctrlShow[2001,true];