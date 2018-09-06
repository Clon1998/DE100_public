/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
params[
	["_uid", "", [""]],
	["_house", objNull, [objNull]],
	["_unitID", -1, [-1]],
	["_mode",0],
	"_housePos",
	"_query",
	"_queryResult"
];

if(isNull _house || _uid == "") exitWith {};
if (_mode == 0) then {	
	life_house_verification = -1;

	_housePos = getPosATL _house;
	_query = format["SELECT * FROM houses WHERE pos = '%1'",_housePos];
	_queryResult = [_query,2] call DB_fnc_asyncCall;

	if (count _queryResult > 0) exitwith {life_house_verification = 1;_unitID publicVariableClient "life_house_verification";};

	_query = format["INSERT INTO houses (pid, pos, inventory, container, owned, space_data) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1', '""[[],[],[]]""')",_uid,_housePos];
	[_query,1] call DB_fnc_asyncCall;

	//Since the DB is to Slow i need to make this shit.
	//Maybe one uiSleep would be enough but so i make sure it works even if the DB is even slower.
	for "_i" from 0 to 1 step 0 do {
		uiSleep 0.1;
		_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid];
		_queryResult = [_query,2] call DB_fnc_asyncCall;
		if (count _queryResult > 0) exitWith {};
	};

	_house setVariable["house_id",(_queryResult select 0),true];
	life_house_verification = 0;
	_unitID publicVariableClient "life_house_verification";
} else {
	[format["UPDATE houses SET paid='1' WHERE id='%1' and pid='%2';",_house getVariable ["house_id",-1],_uid],1] call DB_fnc_asyncCall;
};