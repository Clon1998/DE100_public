/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber","_money"];
_robber = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(de100_luciandjuli_mula > 0) then
{
	_money = de100_luciandjuli_mula;
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_mula = 0;
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	[_robber,"robbery",player] call life_fnc_addCrime;
	[1,"STR_NOTF_Robbed",true,[_robber call life_fnc_name,player call life_fnc_name,[_money] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];
	["CASH"] call SOCK_fnc_updatePartial;
	[_money] remoteExecCall ["life_fnc_robReceive",_robber];
}
	else
{
	[2,"STR_NOTF_RobFail",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",_robber];
};