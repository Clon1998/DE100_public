/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,objNull,[objNull]];
_uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};
if (count (_house getVariable ["house_owner",[]]) > 0) exitWith {["Das Haus gehört bereits jemandem",true,"fast"] call life_fnc_notification_system;};
if (!license_civ_home) exitWith {[localize "STR_House_License",true,"fast"] call life_fnc_notification_system;};
if (count life_houses >= ((call life_houseLimit))) exitWith {[format[localize "STR_House_Max_House",(call life_houseLimit)],true,"fast"] call life_fnc_notification_system;};


closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_house_verification = -1;
	if(de100_luciandjuli_bc < (_houseCfg select 0)) exitWith {[localize "STR_House_NotEnough",true,"fast"] call life_fnc_notification_system;};
	if ((_houseCfg select 0)+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
		["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
	};
	if (life_HC_isActive) then {
	    [_uid,_house,clientOwner] remoteExec ["HC_fnc_addHouse",HC_Life];
	} else {
	    [_uid,_house,clientOwner] remoteExec ["TON_fnc_addHouse",2];
	};
	waitUntil {life_house_verification >= 0};
	if (life_house_verification > 0) exitwith {["Das Haus gehört bereits jemandem",true,"fast"] call life_fnc_notification_system;};
	de100_mSpace setVariable ["cT",diag_tickTime];
	de100_luciandjuli_bc = de100_luciandjuli_bc - (_houseCfg select 0);
	de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
	if (life_HC_isActive) then {
		[getPlayerUID player,call life_clientId select 0,[
			["MSC_fnc_log",false,[getPlayerUID player, 16, format ["%1 hat ein Haus mit der ID %2 und der Position %3 gekauft.",player call life_fnc_nameUID,_house getVariable ["house_id",-1],getPos _house]]],
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["HC_fnc_addHouse",false,[_uid,_house,clientOwner,1]]
		]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
	} else {
		[getPlayerUID player,call life_clientId select 0,[
			["MSC_fnc_log",false,[getPlayerUID player, 16, format ["%1 hat ein Haus mit der ID %2 und der Position %3 gekauft.",player call life_fnc_nameUID,_house getVariable ["house_id",-1],getPos _house]]],
			["PL_fnc_updateP",false,["CASH",true] call SOCK_fnc_updatePartial],
			["TON_fnc_addHouse",false,[_uid,_house,clientOwner,1]]
		]] remoteExecCall ["MSC_fnc_execStack",2];
	};
	_house setVariable["house_owner",[_uid,player call life_fnc_name],true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["container",[],true];
	_house setVariable["weapon_space",[],true];
	_house setVariable["clothing_space",[],true];
	_house setVariable["other_space",[],true];
	life_vehicles pushBack _house;
	life_houses pushBack _house;
	_marker = createMarkerLocal [format["house_%1",netId _house],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	["Du hast das Haus erfolgreich gekauft",false,"fast"] call life_fnc_notification_system;
};