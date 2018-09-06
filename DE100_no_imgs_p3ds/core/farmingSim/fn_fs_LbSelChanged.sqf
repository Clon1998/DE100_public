/*
	File:	fn_fs_LbSelChanged.sqf
	Date:   2017-07-01 23:06:18
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_lb", controlNull, [controlNull]],
	["_sI", 0, [0]]
];
private _d = ctrlParent _lb;
if ((_lb getVariable ["lastSel",-1]) isEqualTo _sI && (_lb getVariable ["lastState",-1]) isEqualTo (_d getVariable ["lbState",-1])) exitWith {};
_lb setVariable ["lastSel",_sI];
_lb setVariable ["lastState",_d getVariable ["lbState",-1]];

private _cGrp = _d displayCtrl 2;
private _lbD = _lb lbData _sI;

if (_d getVariable ["lbState",-1] isEqualTo 0) exitWith {
	private _nI = getText(missionConfigFile >> "ItemProcessing" >> _lbD >> "newItem");
	private _oI = if (getText(missionConfigFile >> "ItemProcessing" >> _lbD >> "oldItem") isEqualTo "blueprint") then {
		getArray(missionConfigFile >> "ItemProcessing" >> _lbD >> "oldItems");
	} else {
		[[getText(missionConfigFile >> "ItemProcessing" >> _lbD >> "oldItem"),1]];
	};

	{
		if (!isNull _x) then {
			ctrlDelete _x;
		};
		nil;
	} count (_cGrp getVariable ["ctrls",[]]);

	private _aC = [];
	{
		private _p = _d ctrlCreate ["RscPictureKeepAspect",-1,_cGrp];
		private _t = _d ctrlCreate ["RscText",-1,_cGrp];
		private _b = _d ctrlCreate ["RscButtonTextOnly",-1,_cGrp];
		_aC pushBack _p;
		_aC pushBack _t;
		_aC pushBack _b;

		_p ctrlSetText getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "icon");
		_p ctrlSetPosition [0+(0.0670313 * safezoneW)*_forEachIndex,0.044 * safezoneH,0.0464063 * safezoneW,0.088 * safezoneH];
		
		_b ctrlSetPosition [0+(0.0670313 * safezoneW)*_forEachIndex,0.044 * safezoneH,0.0464063 * safezoneW,0.088 * safezoneH];
		_b ctrlSetTooltip format["%1x - %2",_x select 1,localize getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName")];
		_b setVariable ["item",_x select 0];
		_b ctrlSetEventHandler ["MouseEnter","_this call life_fnc_fs_onMouseEnter;"];
		_b ctrlSetEventHandler ["MouseExit","_this call life_fnc_fs_onMouseExit;"];
		_b ctrlSetEventHandler ["ButtonClick","_this call life_fnc_fs_onItemClick;"];

		_t ctrlSetPosition [0.0464062 * safezoneW+(0.0670313 * safezoneW)*_forEachIndex,0.055 * safezoneH,0.020625 * safezoneW,0.055 * safezoneH];
		_t ctrlSetText (if (_forEachIndex isEqualTo (count _oI -1)) then {"=";} else {"+";});
		_t ctrlSetFontHeight (0.08 * safeZoneH);

		_p ctrlCommit 0;
		_t ctrlCommit 0;
		_b ctrlCommit 0;
	} forEach _oI;
	private _p = _d ctrlCreate ["RscPictureKeepAspect",-1,_cGrp];
	private _b = _d ctrlCreate ["RscButtonTextOnly",-1,_cGrp];
	_aC pushBack _p;
	_aC pushBack _b;

	_p ctrlSetText getText(missionConfigFile >> "VirtualItems" >> _nI >> "icon");
	_p ctrlSetPosition [0+(0.0670313 * safezoneW)*(count _oI),0.044 * safezoneH,0.0464063 * safezoneW,0.088 * safezoneH];

	_b ctrlSetPosition [0+(0.0670313 * safezoneW)*(count _oI),0.044 * safezoneH,0.0464063 * safezoneW,0.088 * safezoneH];
	_b ctrlSetTooltip format["1x - %1",localize getText(missionConfigFile >> "VirtualItems" >> _nI >> "displayName")];
	_b setVariable ["item",_nI];
	_b setVariable ["isEnd",true];
	_b ctrlSetEventHandler ["MouseEnter","_this call life_fnc_fs_onMouseEnter;"];
	_b ctrlSetEventHandler ["MouseExit","_this call life_fnc_fs_onMouseExit;"];

	_b ctrlCommit 0;
	_p ctrlCommit 0;

	_cGrp setVariable ["ctrls",_aC];
	_d setVariable ["item",_lbD];
};

if (_d getVariable ["lbState",-1] isEqualTo 1) exitWith {
	private _oGrp = _d displayCtrl 8;
	private _iT = _oGrp controlsGroupCtrl 1;
	private _pS = _oGrp controlsGroupCtrl 2;
	private _bS = _oGrp controlsGroupCtrl 3;
	_bs sliderSetRange [0,getNumber(missionConfigFile >> "lifeVehicles" >> _lbD >> "maxTrunkUpdate")];
	_bs sliderSetPosition 0;
	_d setVariable ["vehicle",_lbD];
	_iT ctrlSetStructuredText parseText format ["<t size='1'>Spieler: </t>%1<br/><t size='1'>Kisten: </t>0/%2<br/><t size='1'>Item: </t>%3<br/><t size='1'>Fahrzeug: </t>%4<br/><t size='1.2'>Schritte: </t>",sliderPosition _pS,getNumber(missionConfigFile >> "lifeVehicles" >> _lbD >> "maxTrunkUpdate"),localize getText(missionConfigFile >> "VirtualItems" >> getText(missionConfigFile >> "ItemProcessing" >> (_d getVariable ["item",""]) >> "newItem") >> "displayName"),getText(configFile >> "CfgVehicles" >> _lbD >> "displayName")];
	private _p = ctrlPosition _iT;
	_iT ctrlSetPosition [_p select 0,_p select 1,_p select 2,ctrlTextHeight _iT];
	_iT ctrlCommit 0;
	[_d,_d getVariable ["item",""]] call life_fnc_fs_calcValue;
};