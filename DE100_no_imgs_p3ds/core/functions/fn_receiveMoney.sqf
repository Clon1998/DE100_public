/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call life_fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

if (parseNumber _val >= 500000) then {
	[format[localize "STR_NOTF_GivenMoney",_from call life_fnc_name,[(parseNumber (_val))] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
} else {
	[format["Eine Person hat dir €%1 gegeben",[(parseNumber (_val))] call life_fnc_numberText],false,"fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = de100_luciandjuli_mula + parseNumber _val;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 5, format ["%1 hat €%3 von %2 erhalten",player call life_fnc_nameUID, _from call life_fnc_nameUID,[parseNumber(_val)] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0,[
		["MSC_fnc_log",false,[getPlayerUID player, 5, format ["%1 hat €%3 von %2 erhalten",player call life_fnc_nameUID, _from call life_fnc_nameUID,[parseNumber(_val)] call life_fnc_numberText]]],
		["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial]
	]] remoteExecCall ["MSC_fnc_execStack",2];
};
