/*

	file: fn_smartphoneKontakte.sqf
	Author: GamerDF
	Made for Nameless-Gaming Altis Life
*/
private["_display","_type","_contacts"];
_type = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 6800};
_display = findDisplay 6800;
private _cPlayerList = _display displayCtrl 6803;
ctrlEnable[6804,false];
private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
private _infoContact = profileNamespace getVariable [format["DE100_contacts_%1",_flag],[]];
if (playerSide in [west,independent]) then {
	_contacts = allplayers select {side _x == playerSide || (getPlayerUID _x in _infoContact)};
} else {
	_contacts = allplayers select {(getPlayerUID _x) in _infoContact || _x in (Units group player)};
};
switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		{
			if(alive _x && _x != player) then//if(alive _x && _x != player) then
			{
				switch(side _x) do
				{
					case west: {_type = "Polizei"};
					case civilian: {_type = "Ziv"};
					case independent: {_type = "THR"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x call life_fnc_name,_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,netId(_x)];
			};
		} forEach _contacts;
		
		ctrlEnable[6804,false];
		lbSort [_cPlayerList, "ASC"]
	};
	
	case 1:
	{
		ctrlEnable[6804,true];
		life_smartphoneTarget = objectFromNetId (lbData[6803,(lbCurSel 6803)]);
	};
};
