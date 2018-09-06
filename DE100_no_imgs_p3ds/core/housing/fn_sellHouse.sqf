/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,objNull,[objNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "There is no owner for this house."};

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	deleteMarkerLocal format["house_%1",netId _house];

	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles deleteAt _index;
	};
	
	_index = life_houses find _house;
	if(_index != -1) then {
		life_houses deleteAt _index;
	};
	
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_bc = de100_luciandjuli_bc + round((_houseCfg select 0)/2);
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,[
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["MSC_fnc_log",false,[getPlayerUID player, 17, format ["%1 hat das Haus mit der ID %2 und der Position %3 verkauft.",player call life_fnc_nameUID,_house getVariable ["house_id",-1],getPos _house]]],
			["HC_fnc_sellHouse",false,[_house]]
		]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,[
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["MSC_fnc_log",false,[getPlayerUID player, 17, format ["%1 hat das Haus mit der ID %2 und der Position %3 verkauft.",player call life_fnc_nameUID,_house getVariable ["house_id",-1],getPos _house]]],
			["TON_fnc_sellHouse",false,[_house]]
		]] remoteExecCall ["MSC_fnc_execStack",2];
	};
	["Haus wurde verkauft",false,"fast"] call life_fnc_notification_system;
};
