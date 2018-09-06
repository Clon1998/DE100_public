/*

	VOID marketShortView [ [SHORTNAMES] ];
	
	shows list of current market values

*/

private["_items", "_shortname", "_price", "_globalchange", "_lastchange", "_row", "_text", "_resname", "_didanything"];

_items = _this select 0;

if(count _items == 0) exitWith {};

_text = "<t size='1.5' color='#00FF00'>Altis Markt</t><br/>";

_didanything = false;

{
	if (getNumber(missionConfigFile >> "VirtualItems" >> _x >> "dynTracker") isEqualTo 1) then {
	_didanything = true;

	_Index = [_x,DYN_Price_array] call life_fnc_index;
	_row = DYN_Price_array select _Index;
	
	_price = _row select 1;
	_globalchange = ((_row select 1) - (_row select 2));
	_lastchange = _row select 3;
	
	_resname = localize (getText(missionConfigFile >> "VirtualItems" >> _x >> "displayName"));
	
	_text = format["%1<br/><t size='1.2'>%2</t><br/><t size='1.3' color='#FFFF00'>€%3</t><br/>", _text,_resname, [_price] call life_fnc_numberText];
	
	if(_globalchange >= 0) then
	{
		_text = format["%1<img size='2' image='images\icons\ico_trendup.paa'/> €%2 <br/>", _text, _globalchange];
	}
	else
	{
		_text = format["%1<img size='2' image='images\icons\ico_trenddown.paa'/> €%2 <br/>", _text, _globalchange];
	};
	
	if(_lastchange >= 0) then
	{
		_text = format["%1<img size='2' image='images\icons\ico_trendup.paa'/> €%2 <br/>", _text, _lastchange];
	}
	else
	{
		_text = format["%1<img size='2' image='images\icons\ico_trenddown.paa'/> €%2 <br/>", _text, _lastchange];
	};
	
	};
} foreach _items;

//Show everyting
if(_didanything) then {hintSilent parseText _text;};