/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
params[
	["_unit", objNull, [objNull]],
	["_val", 0, [0]],
	["_item", "", [""]],
	["_from", objNull, [objNull]]
];

if (!(_unit isEqualTo player) || _from isEqualTo player) exitwith {};
private _itemName = localize ((getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"))); 
private _cAdd = [_item,_val] call life_fnc_canAdd;
private _log = [];
if(_cAdd < _val) then {
	if(([true,_item,_cAdd] call life_fnc_handleInv) > 0) then {
		[format[localize "STR_MISC_TooMuch_3",_from call life_fnc_name,_val,_cAdd,(_val - _cAdd),_itemName],false,"fast"] call life_fnc_notification_system;
		[_from,_item,_val - _cAdd,_unit] remoteExecCall ["life_fnc_giveDiff",_from];
		_log = [
			[
				getPlayerUID _from,
				29,
				format ["%1 wollte %2 %3 %4 gegeben, %2 konnte aber nur %5 %4 nehmen.",_from call life_fnc_nameUID,_unit call life_fnc_nameUID,_val,_itemName,_cAdd]
			],
			format ["%2 hat von %1 %3 %4 erhalten, %2 konnte aber nur %5 %4 nehmen.",_from call life_fnc_nameUID,_unit call life_fnc_nameUID,_val,_itemName,_cAdd]

		];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
} else {
	if(([true,_item,_val] call life_fnc_handleInv) > 0) then {
		[format[localize "STR_NOTF_GivenItem",_from call life_fnc_name,_val,_itemName],false,"fast"] call life_fnc_notification_system;
		_log = [
			[
				getPlayerUID _from,
				29,
				format ["%1 hat %2 %3 %4 gegeben.",_from call life_fnc_nameUID,_unit call life_fnc_nameUID,_val,_itemName]
			],
			format ["%2 hat von %1 %3 %4 erhalten.",_from call life_fnc_nameUID,_unit call life_fnc_nameUID,_val,_itemName]
		];
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
	};
};
if (count _log > 0) then {
	if (life_HC_isActive) then {
		[getPlayerUID _unit,30,_log] remoteExecCall ["MSC_fnc_log",HC_Life];
	} else {
		[getPlayerUID _unit,30,_log] remoteExecCall ["MSC_fnc_log",2];
	};
};