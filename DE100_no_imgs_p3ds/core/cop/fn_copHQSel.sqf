/*
	File:	fn_copHQSel.sqf
	Date:   2017-03-31 19:37:20
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_tree", controlNull, [controlNull]],
	["_path", [], [[]]]
];

private _type = _tree tvData _path;
private _map = (finddisplay 3000) displayCtrl 3;
private _txt = (finddisplay 3000) displayCtrl 7;
private _btn = (finddisplay 3000) displayCtrl 8;

call {
	if (_type isEqualTo "crime") exitWith {
		private _i = _tree tvValue _path;
		private _c = ((bank_obj getVariable ["Crimes",[]]) select _i) select 2;
		private _t = "";
		private _b = 0;
		{
			private _cEntry = _x select 0;
			private _stackable = getNumber(missionConfigFile >> "crimes" >> _cEntry >> "stackable") isEqualTo 1;
			if (_t isEqualTo "") then {
				if (_stackable) then {
					_t = format ["%1x %2",_x select 1,getText(missionConfigFile >> "crimes" >> _cEntry >> "text")];
					_b = _b + (getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty") * (_x select 1));
				} else {
					{
						if (_t isEqualTo "") then {
							_t = format[getText(missionConfigFile >> "crimes" >> _cEntry >> "text"),_x];
						} else {
							_t = _t + "<br/>" + (format[getText(missionConfigFile >> "crimes" >> _cEntry >> "text"),_x]);
						};
						_b = _b + getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty");
					} forEach (_x select 1);
				};
			} else {
				if (_stackable) then {
					_t = format ["%1<br/>%2x %3",_t,_x select 1,getText(missionConfigFile >> "crimes" >> _cEntry >> "text")];
					_b = _b + (getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty") *( _x select 1));
				} else {
					{
						_t = _t + "<br/>" + (format[getText(missionConfigFile >> "crimes" >> _cEntry >> "text"),_x]);
						_b = _b + getNumber(missionConfigFile >> "crimes" >> _cEntry >> "bounty");
					} forEach (_x select 1);
				};
			};
		} forEach _c;
		_t = format["Kopfgeld: €%1<br/>Letzte Position: %2 (300 Meter Umkreis)<br/><br/>Verbrechen:<br/>%3",[_b] call life_fnc_numberText,mapGridPosition (((bank_obj getVariable ["Crimes",[]]) select _i) select 3),_t];
		[_map,0.5,0.01,((bank_obj getVariable ["Crimes",[]]) select _i) select 3] call life_fnc_setMapPosition;
		_txt ctrlSetStructuredText parseText _t;
		_txt ctrlSetPosition [0,0,0.273281 * safezoneW,ctrlTextHeight _txt];
		_txt ctrlCommit 0;
		if ((call life_coplevel) >= 3) then {
			_btn ctrlShow true;
			_btn ctrlSetText "Erlassen";
		} else {
			_btn ctrlShow false;	
		};
		_btn buttonSetAction format["['%1',true] call life_fnc_removeCrime;['',[]] spawn life_fnc_copHQLoad;",((bank_obj getVariable ["Crimes",[]]) select _i) select 0];
	};

	if (_type isEqualTo "req") exitWith {
		private _i = _tree tvValue (_path select [0,2]);
		private _ii = _tree tvValue _path;
		private _r = (((bank_obj getVariable ["Requests",[]]) select _i) select 1) select _ii;

		[_map,0.5,0.01,_r select 1] call life_fnc_setMapPosition;
		_txt ctrlSetStructuredText parseText format["Uhrzeit: %1 Uhr<br/>Position: %2<br/><br/>Nachricht:<br/>%3",_r select 0,mapGridPosition (_r select 1),_r select 2];
		_txt ctrlSetPosition [0,0,0.273281 * safezoneW,ctrlTextHeight _txt];
		_txt ctrlCommit 0;
		_btn ctrlShow false;
	};

	_btn ctrlShow false;
	_txt ctrlSetStructuredText parseText "";
	_txt ctrlSetPosition [0,0,0.273281 * safezoneW,ctrlTextHeight _txt];
	_txt ctrlCommit 0;
};	