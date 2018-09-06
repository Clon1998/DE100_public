/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a 
	stored procedure on restart.
*/

params[
	["_house", objNull, [objNull]],
	"_houseID",
	"_housePos",
	"_ownerID",
	"_query"
];

if(isNull _house) exitWith {[":SERVER:sellHouse: House is null"] call A3Log;};

_houseID = _house getVariable["house_id",-1];
if(_houseID == -1) then {
	_housePos = getPosATL _house;
	_ownerID = (_house getVariable "house_owner") select 0;
	_query = format["DELETE FROM houses WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_housePos];
} else {
	_query = format["DELETE FROM houses WHERE id='%1';",_houseID];
};
_house setVariable["clothing_space",nil,true];
_house setVariable["container",nil,true];
_house setVariable["house_id",nil,true];
_house setVariable["house_owner",nil,true];
_house setVariable["other_space",nil,true];
_house setVariable["trunk",nil,true];
_house setVariable["trunkuser",nil,true];
_house setVariable["vehspawnpoint",nil,true];
_house setVariable["weapon_space",nil,true];

[_query,1] call DB_fnc_asyncCall;