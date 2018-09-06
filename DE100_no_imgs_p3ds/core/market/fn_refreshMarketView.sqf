/*

	Refreshes current dialog

*/

private["_display", "_selectedindex", "_index", "_shortname","_marketControll"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 6600;
_marketControll = _display displayCtrl 6603; 
_txtglobal = _display displayCtrl 6607;
_txtlocal = _display displayCtrl 6609;

if(isNull _display) exitWith {hint "Dialog not open!"; };

//Selected index
_selectedindex = lbCurSel 6603;
if(_selectedindex == -1) then
{
	lbClear 6603;
	{
		_index = lbAdd [6603, localize (getText(missionConfigFile >> "VirtualItems" >> (configName _x) >> "displayName"))];
		lbSetData [6603, _index,(configName(_x))];
	} foreach ("getNumber(_x >> 'dynTracker') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));
lbSetCurSel [6603, 0];
lbSort [_marketControll, "ACS"];
} else {
	_shortname = lbData [6603, _selectedindex];
	_icon = getText(missionConfigFile >> "VirtualItems" >> _shortname >> "icon");
	ctrlSetText [6610, lbText [6603, _selectedindex] ]; //Set name
	ctrlSetText [6612, _icon];
	
	{
		if((_x select 0) == _shortname) exitWith {
			ctrlSetText [6611, format["€%1", [_x select 1] call life_fnc_numberText ] ];
			
			//Trend Global
			ctrlSetText [6607, format["€%1", [((_x select 1) - (_x select 2))] call life_fnc_numberText ] ];
			
			if(((_x select 1) - (_x select 2)) >= 0) then {
				if ((_x select 3) == 0) then { 
					ctrlSetText [6604, "images\icons\ico_trendup.paa"];
					_txtglobal ctrlSetTextColor [1,1,1,1];
				} else {
					ctrlSetText [6604, "images\icons\ico_trendup.paa"];
					_txtglobal ctrlSetTextColor [0.098,0.412,0.047,1];
				};
			} else {
				ctrlSetText [6604, "images\icons\ico_trenddown.paa"];
				_txtglobal ctrlSetTextColor [0.451,0,0,1];
			};
			
			//Trend local
			ctrlSetText [6609, format["€%1", [_x select 3] call life_fnc_numberText ] ];
			
			if((_x select 3) >= 0) then {	
				if ((_x select 3) == 0) then { 
					ctrlSetText [6605, "images\icons\ico_trendup.paa"];
					_txtlocal ctrlSetTextColor [1, 1, 1, 1];
				} else {
					_txtlocal ctrlSetTextColor [0.098,0.412,0.047,1];
					ctrlSetText [6605, "images\icons\ico_trendup.paa"];
				};
			} else {
				_txtlocal ctrlSetTextColor [0.451,0,0,1];
				ctrlSetText [6605, "images\icons\ico_trenddown.paa"];
			};
		};
	} foreach DYN_Price_array;
};