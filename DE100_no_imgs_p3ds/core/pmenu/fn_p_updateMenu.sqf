/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_icon","_licenses","_near","_near_units","_displayName","_mstatus","_shrt","_side","_curTarget","_licTxt"];
disableSerialization;

if((call life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
};

_side = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};

_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_struct = [];
_licTxt = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;


_curTarget = if(isNull cursorObject)then{cursorTarget}else{cursorObject};
//Near players
if !((_curTarget isEqualTo objNull)) then {
	_near_units = [_curTarget];
	_near_units = _near_units select {
   	 	_x isKindOf "Man"
	};
} else {
	_near_units = [];
};



//{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
if (count _near_units > 0) then {
	{
		if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
		{
			_near lbAdd format["%1","Person vor dir"];
			_near lbSetData [(lbSize _near)-1,netId(_x)];
			_near_i lbAdd format["%1","Person vor dir"];
			_near_i lbSetData [(lbSize _near)-1,netId(_x)];
		};
	} foreach _near_units;
};

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='images\icons\ico_bank.paa'/> <t size='0.8px'>€%1</t><br/><img size='1.2' image='images\icons\ico_money.paa'/> <t size='0.8'>€%2</t>",[de100_luciandjuli_bc] call life_fnc_numberText,[de100_luciandjuli_mula] call life_fnc_numberText];

ctrlSetText[2009,format["Gewicht: %1 / %2", life_carryWeight, life_maxWeight]];

{
	private _val = [0,configName _x] call life_fnc_handleVItem;
	if(_val > 0) then {
		_inv lbAdd format["%2 [x%1]",_val,localize (getText(_x >> "displayName"))];
		_inv lbSetTooltip [(lbSize _inv)-1,format["%2 [x%1]",_val,localize (getText(_x >> "displayName"))]];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
		_icon = getText(missionConfigFile >> "VirtualItems" >> (configName _x) >> "icon");
		if(!((_icon isEqualTo ""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
		if (((getNumber(missionConfigFile >> "VirtualItems" >> (configName _x) >> "illegal")) isEqualTo 1)) then {
			_inv lbSetColor [(lbSize _inv)-1, getArray(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color")];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

if ((lbSize _inv) isEqualTo 0) then {
	_inv lbAdd "Keine Items";
	_inv lbSetData [(lbSize _inv)-1,""];
};
lbSort [_inv, "ASC"];

{
    _displayName = localize(getText(_x >> "displayName"));

    if ([0,configName _x] call life_fnc_handleLicense) then {
        _struct pushBack _displayName;
    };
} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

_struct sort true;

{
	_licTxt = _licTxt + format["%1<br/>",_x];
} forEach _struct;

if(_licTxt == "") then
{
	_licTxt = "Keine Lizenzen/Fähigkeiten";
};

_lic ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_licTxt];
_lic ctrlSetPosition [0,0,0.1080105 * safezoneW,ctrlTextHeight _lic];
_lic ctrlCommit 0;