#include "..\..\script_macros.hpp"
/*
	File:	fn_init_hideouts.sqf
	Date:   2016-08-08 17:32:59
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _config = (configProperties [(missionConfigFile >> "Life_Settings" >> "gangHideouts"), "!(getText(_x >> 'displayName')  isEqualTo '')",	true]);

{
	private _displayName = getText(_x >> "displayName");
	private _size = getNumber(_x >> "size");
	private _marker = getText(_x >> "marker");
	private _type = getText(_x >> "type");


	private _trigger = createTrigger ["NONE",getMarkerPos _marker,true];
	_trigger setTriggerArea [_size,_size,0,false,10];
	_trigger setTriggerStatements [format["[this,thisTrigger,thisList,%1] call life_fnc_triggerGangCondition;",(configName _x)],format["[thisTrigger,thisList,%1] call life_fnc_triggerGangActivation;",(configName _x)],format["[thisTrigger,%1] call life_fnc_triggerGangDeactivation;",(configName _x)]];
} forEach _config;