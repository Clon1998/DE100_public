/*
	File:	fn_LoadMobileBanking.sqf
	Date:   18.03.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
params[
	"_dialog",
	"_PList",
	"_CrntStats",
	"_AmntFld",
	"_type"
];

disableSerialization;

_dialog = findDisplay 8200;

_PList = _dialog displayCtrl 6682;
_CrntStats =  _dialog displayCtrl 6661; 
_AmntFld = _dialog displayCtrl 6680;
_CrntStats ctrlSetStructuredText parseText format["<t size= '1.1' align = 'left'>Kontostand:<br/>€%1</t>",[de100_luciandjuli_bc] call life_fnc_numberText];
lbClear _PList;
{
	switch (side _x) do
	{
		case west: {_type = "Cop"};
		case civilian: {_type = "Civ"};
		case independent: {_type = "THR"};
	};
	_PList lbAdd format["%1 (%2)",_x call life_fnc_name,_type];
	_PList lbSetData [(lbSize _PList)-1,netId(_x)];
} foreach (allPlayers select {alive _x && _x != hc_1 && _x != player});
lbSort [_PList, "ASC"];
_PList lbSetCurSel 0;