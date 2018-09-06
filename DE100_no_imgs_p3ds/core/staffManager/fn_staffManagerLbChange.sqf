/*
	File:	fn_staffManagerLbChange.sqf
	Date:   2016-11-01 19:50:42
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.

	#define COP 0
#define THR 1
*/

params[
	["_listBox", controlNull, [controlNull]],
	["_index", -1, [0]],
	"_unit"
];
private _display = ctrlParent _listBox;

private _data = if (isNull (objectFromNetId (_listBox lbData _index))) then {
	parseSimpleArray format["%1",_listBox lbData _index];
} else {
	_unit = objectFromNetId (_listBox lbData _index);
	[getPlayerUID _unit,[_unit] call life_fnc_name,-1];
};
if ((_data select 2) isEqualTo -1) exitwith {
	(_display displayCtrl 4004) ctrlSetStructuredText parseText format[""];

};
if ((_data select 2) isEqualType "") then {
	_data set [2,parseNumber (_data select 2)];
};
private _lvlname = switch (_display getVariable ["type",0]) do {
	// === Sanis ===
	case 1 : {
		switch (_data select 2) do { 
			case 0 : {"Keinen";};
			case 1 : {"Praktikant";}; 
			case 2 : {"Auszubildender";}; 
			case 3 : {"Geselle";}; 
			case 4 : {"Meister";};
			case 5 : {"Ausbilder";};
			default {"Error";};
		};
	}; 
	// === Cop ===
	case 0 : {
		switch (_data select 2) do { 
			case 0 : {"Keinen";}; 
			case 1 : {"Polizeimeisteranwärter";}; 
			case 2 : {"Polizeimeister";}; 
			case 3 : {"Polizeiobermeister";};
			case 4 : {"Polizeihauptmeister";};
			case 5 : {"Polizeikommisaranwärter";};
			case 6 : {"Polizeikommissar";};
			case 7 : {"Polizeioberkommissar";};
			case 8 : {"Polizeihauptkommissar";};
			case 9 : {"Erster Polizeihauptkommissar";};
			case 10 : {"Polizeioberrat";};
			case 11 : {"Polizeidirektor";};
			case 12 : {"Polizeipräsident";};
			default {"Error";};
		};
	};
};

(_display displayCtrl 4004) ctrlSetStructuredText parseText format[
	"<t font='TahomaB'>Name:</t><br/>%1<br/><t font='TahomaB'>Rang:</t><br/>%2",
	_data select 1,
	_lvlname
];
