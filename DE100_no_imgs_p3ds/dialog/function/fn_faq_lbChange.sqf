/*
	File:	fn_faq_lbChange.sqf
	Date:   2016-07-26 14:08:26
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_listBox", controlNull, [controlNull]],
	["_selectedIndex", -1, [0]]
];
private _header = (findDisplay 4000) displayCtrl 4001;
private _textBoxFull = (findDisplay 4000) displayCtrl 4002;
private _textBoxLeft = (findDisplay 4000) displayCtrl 4005;
private _textBoxCenter = (findDisplay 4000) displayCtrl 4007;
private _textBoxRight = (findDisplay 4000) displayCtrl 4006;
private _className = _listBox lbData _selectedIndex;
private _params = getArray(missionConfigFile >> "frequently_asked_questions" >> _className >> "params");
private _description = getText(missionConfigFile >> "frequently_asked_questions" >> _className >> "description");
private _type = getText(missionConfigFile >> "frequently_asked_questions" >> _className >> "type");

_textBoxFull ctrlSetStructuredText parseText "";
_textBoxLeft ctrlSetStructuredText parseText "";
_textBoxCenter ctrlSetStructuredText parseText "";
_textBoxRight ctrlSetStructuredText parseText "";


_textBoxFull ctrlSetPosition [0,0,0.510469 * safezoneW,0];
_textBoxLeft ctrlSetPosition [0,0,0.25523450 * safezoneW,0];
_textBoxCenter ctrlSetPosition [0.25523450 * safezoneW,0,0.12761725 * safezoneW,0];
_textBoxRight ctrlSetPosition [0.38285175 * safezoneW,0,0.12761725 * safezoneW,0];

_textBoxFull ctrlCommit 0;
_textBoxLeft ctrlCommit 0;
_textBoxCenter ctrlCommit 0;
_textBoxRight ctrlCommit 0;
switch (_type) do { 
	case "cfgVehicle" : {
		private _text = "<t font='TahomaB'>Fahrzeug</t><t font='PuristaMedium'>";
		private _prices = "<t font='TahomaB'>Preis</t><t font='PuristaMedium'>";
		private _vSpace = "<t font='TahomaB'>Lagerraum</t><t font='PuristaMedium'>";
		private _array = call compile _description;
		private _items = [];
		{
			private _displayName = getText (configFile >> "cfgVehicles" >> (configName _x) >> "displayname");
			private _space = getNumber(_x >> "vItemSpace");
			if (_space <= 0) then {
				_space = "Keinen";
			};
			private _buyPrice = getNumber(_x >> "price");
			_items pushBack [_buyPrice,_displayName,_space];
		} forEach _array;
		_items sort true;
		{
			_prices = _prices + format["<br/>€%1",[_x select 0] call life_fnc_numberText];
			_text = _text + format["<br/>%1",_x select 1];
			_vSpace = _vSpace + format["<br/>%1",_x select 2];
		} forEach _items;
		_textBoxLeft ctrlSetStructuredText parseText _text;
		_textBoxCenter ctrlSetStructuredText parseText _vSpace;
		_textBoxRight ctrlSetStructuredText parseText _prices;
		_textBoxLeft ctrlSetPosition [0,0,0.25523450 * safezoneW,ctrlTextHeight _textBoxLeft];
		_textBoxCenter ctrlSetPosition [0.25523450 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxCenter];
		_textBoxRight ctrlSetPosition [0.38285175 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxRight];
		_textBoxLeft ctrlCommit 0;
		_textBoxCenter ctrlCommit 0;
		_textBoxRight ctrlCommit 0;
	}; 
	
	case "cfgLicenses" : {
		private _text = "<t font='TahomaB'>Lizenz</t><t font='PuristaMedium'>";
		private _prices = "<t font='TahomaB'>Preis</t><t font='PuristaMedium'>";
		private _typeText = "<t font='TahomaB'>Typ</t><t font='PuristaMedium'>";
		private _array = call compile _description;
		private _items = [];
		{
			private _displayName = getText (_x >> "displayname");
			private _legal = if (getNumber(_x >> "illegal") == 0) then {
				"<t color='#FFFFFF'>Legal</t>";
			} else {
				format["<t color='%1'>Illegal</t>",getText(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color_hex")];
			};
			private _buyPrice = getNumber(_x >> "price");
			_items pushBack [localize _displayName,_buyPrice,_legal];
		} forEach _array;
		_items sort true;
		{
			_prices = _prices + format["<br/>€%1",[_x select 1] call life_fnc_numberText];
			_text = _text + format["<br/>%1",_x select 0];
			_typeText = _typeText + format["<br/>%1",_x select 2];
		} forEach _items;
		_textBoxLeft ctrlSetStructuredText parseText _text;
		_textBoxCenter ctrlSetStructuredText parseText _typeText;
		_textBoxRight ctrlSetStructuredText parseText _prices;
		_textBoxLeft ctrlSetPosition [0,0,0.25523450 * safezoneW,ctrlTextHeight _textBoxLeft];
		_textBoxCenter ctrlSetPosition [0.25523450 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxCenter];
		_textBoxRight ctrlSetPosition [0.38285175 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxRight];
		_textBoxLeft ctrlCommit 0;
		_textBoxCenter ctrlCommit 0;
		_textBoxRight ctrlCommit 0;
	};

	case "cfgvItems" : {
		private _text = "<t font='TahomaB'>Item</t><t font='PuristaMedium'>";
		private _prices = "<t font='TahomaB'>Kaufpreis</t><t font='PuristaMedium'>";
		private _prices2 = "<t font='TahomaB'>Verkaufpreis</t><t font='PuristaMedium'>";
		private _array = call compile _description;
		private _items = [];
		{
			private _displayName = if (getNumber(_x >> "illegal") == 0) then {
				format["<t color='#FFFFFF'>%1</t>",localize (getText (_x >> "displayname"))];
			} else {
				format["<t color='%1'>%2</t>",getText(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color_hex"),localize (getText (_x >> "displayname"))];
			};
			private _buyPrice = getNumber(_x >> "buyPrice");
			private _sellPrice = getNumber(_x >> "sellPrice");
			_items pushBack [localize (getText (_x >> "displayname")),_displayName,_buyPrice,_sellPrice];
		} forEach _array;
		_items sort true;
		{
			_prices = _prices + format["<br/>€%1",[_x select 2] call life_fnc_numberText];
			_text = _text + format["<br/>%1",_x select 1];
			_prices2 = _prices2 + format["<br/>€%1",[_x select 3] call life_fnc_numberText];
		} forEach _items;
		_textBoxLeft ctrlSetStructuredText parseText _text;
		_textBoxCenter ctrlSetStructuredText parseText _prices;
		_textBoxRight ctrlSetStructuredText parseText _prices2;
		_textBoxLeft ctrlSetPosition [0,0,0.25523450 * safezoneW,ctrlTextHeight _textBoxLeft];
		_textBoxCenter ctrlSetPosition [0.25523450 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxCenter];
		_textBoxRight ctrlSetPosition [0.38285175 * safezoneW,0,0.12761725 * safezoneW,ctrlTextHeight _textBoxRight];
		_textBoxLeft ctrlCommit 0;
		_textBoxCenter ctrlCommit 0;
		_textBoxRight ctrlCommit 0;
	};

	case "text" : {
		_textBoxFull ctrlSetStructuredText parseText _description;
		_textBoxFull ctrlSetPosition [0,0,0.510469 * safezoneW,ctrlTextHeight _textBoxFull];
		_textBoxFull ctrlCommit 0;
	};
};

//_header ctrlSetStructuredText parseText ("<t size='6'>DE100-" + (getText(missionConfigFile >> "frequently_asked_questions" >> _className >> "displayname")) + "</t>");