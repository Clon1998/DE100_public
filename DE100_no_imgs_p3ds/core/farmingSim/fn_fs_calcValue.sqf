/*
	File:	fn_fs_calcValue.sqf
	Date:   2017-07-01 23:06:58
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_d", displayNull, [displayNull]],
	["_item", "", [""]]
];
private _oGrp = _d displayCtrl 8;
private _iT = _oGrp controlsGroupCtrl 1;
private _pS = _oGrp controlsGroupCtrl 2;
private _bS = _oGrp controlsGroupCtrl 3;
private _veh = _d getVariable ["vehicle",""];

private _vS = getNumber(missionConfigFile >> "lifeVehicles" >> _veh >> "vItemSpace")*(sliderPosition _pS)+50*(sliderPosition _bS);
private _oI = if (getText(missionConfigFile >> "ItemProcessing" >> _item >> "oldItem") isEqualTo "blueprint") then {
	getArray(missionConfigFile >> "ItemProcessing" >> _item >> "oldItems");
} else {
	[[getText(missionConfigFile >> "ItemProcessing" >> _item >> "oldItem"),1]];
};

private _nI = getText(missionConfigFile >> "ItemProcessing" >> _item >> "newItem");

private _w = 0;
{
	_w = _w + (getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight"))*(_x select 1);
	nil;
} count _oI;
private _cM = floor (_vS/_w);
_d setVariable ["canMake",_cM];

{
	if (!isNull _x) then {
		ctrlDelete _x;
	};
	nil;
} count (_oGrp getVariable ["ctrls",[]]);

private _fI = _d getVariable ["finalItems",[]];
private _rI = _d getVariable ["rawItems",[]];
private _aC = [];
private _rekusiv = {
	private _items = param[0,[],[[]]];

	{
		private _index = [toLower (_x select 0),_fI] call life_fnc_index;
		if (_index >= 0) then {
			private _index = _fI select _index select 0;
			private _oI = if (getText(missionConfigFile >> "ItemProcessing" >> _index >> "oldItem") isEqualTo "blueprint") then {
				getArray(missionConfigFile >> "ItemProcessing" >> _index >> "oldItems");
			} else {
				[[getText(missionConfigFile >> "ItemProcessing" >> _index >> "oldItem"),1]];
			};
			[_oI] call _rekusiv;
		};
		private _str = ["Sammel","Stelle her"] select (_index >= 0);
		private _ben = if (_index >= 0) then {
			private _index = getText(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "neededLicense");
			_index = _index select [12,count _index];
			"<img image='images\icons\ico_contract.paa'/> "+(localize getText(missionConfigFile >> "Licenses" >> _index >> "displayName"));
		} else {
			private _index = [toLower (_x select 0),_rI] call life_fnc_index;
			["Nichts","<img image='images\items\ico_pickaxe.paa'/> Spitzhacke"] select (getNumber(missionConfigFile >> "resourceFields" >> (_rI select _index select 0) >> "mineral") isEqualTo 1);
		};
		private _t = _d ctrlCreate ["RscStructuredText",-1,_oGrp];
		private _b = _d ctrlCreate ["RscButtonTextOnly",-1,_oGrp];
		private _p = _d ctrlCreate ["RscPictureKeepAspect",-1,_oGrp];
		private _offSet = if (_aC isEqualTo []) then {
			(ctrlPosition _iT select 1) + (ctrlTextHeight _iT);
		} else {
			private _p = _aC select (count _aC)-3;
			(ctrlPosition _p select 1) + (ctrlTextHeight _p);
		};
		private _mkr = if (_index >= 0) then {
			if (isArray(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")) then {
				getArray(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")
			} else {
				[getText(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")];
			};
		} else {
			private _index = [toLower (_x select 0),_rI] call life_fnc_index;
			getArray(missionConfigFile >> "resourceFields" >> (_rI select _index select 0) >> "zones");
		};
		_mkr = _mkr apply {mapGridPosition (getMarkerPos _x)};
		_t ctrlSetPosition [0,_offSet + 0.005 * safezoneH,0.252656 * safezoneW,0];
		_t ctrlCommit 0;
		_t ctrlSetStructuredText parseText format ["<t size='1.05'>%1 </t><br/>Item: <img image='%3'/> %2<br/>Menge: %4x<br/>Benötigt: %6<br/>MapGrid: %5",_str,localize getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName"),getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "icon"),[_cM/(_x select 1)] call life_fnc_numberText,_mkr joinString ", ",_ben];
		_t ctrlSetPosition [0,_offSet + 0.005 * safezoneH,0.252656 * safezoneW,ctrlTextHeight _t];

		_p ctrlSetText "images\icons\ico_localize.paa";
		_p ctrlSetPosition [0.225 * safezoneW,_offSet + 0.005 * safezoneH,0.0154688 * safezoneW,0.033 * safezoneH];
		_b ctrlSetPosition [0.225 * safezoneW,_offSet + 0.005 * safezoneH,0.0154688 * safezoneW,0.033 * safezoneH];
		_b setVariable ["item",_x select 0];
		_b ctrlSetEventHandler ["MouseEnter","_this call life_fnc_fs_onMouseEnter;"];
		_b ctrlSetEventHandler ["MouseExit","_this call life_fnc_fs_onMouseExit;"];
		_t ctrlCommit 0;
		_b ctrlCommit 0;
		_p ctrlCommit 0;
		_aC pushBack _t;
		_aC pushBack _b;
		_aC pushBack _p;
	} forEach _items;
	_oGrp setVariable ["ctrls",_aC];
};
[_oI] call _rekusiv;
private _index = [toLower _nI,_fI] call life_fnc_index;
private _ben = getText(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "neededLicense");
_ben = _ben select [12,count _ben];
_ben = (localize getText(missionConfigFile >> "Licenses" >> _ben >> "displayName"));


private _t = _d ctrlCreate ["RscStructuredText",-1,_oGrp];
private _b = _d ctrlCreate ["RscButtonTextOnly",-1,_oGrp];
private _p = _d ctrlCreate ["RscPictureKeepAspect",-1,_oGrp];
private _offSet = if (_aC isEqualTo []) then {
	(ctrlPosition _iT select 1) + (ctrlTextHeight _iT);
} else {
	private _p = _aC select (count _aC)-3;
	(ctrlPosition _p select 1) + (ctrlTextHeight _p);
};
private _mkr = if (_index >= 0) then {
	if (isArray(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")) then {
		getArray(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")
	} else {
		[getText(missionConfigFile >> "ItemProcessing" >> (_fI select _index select 0) >> "refinery")];
	};
} else {
	private _index = [toLower _nI,_rI] call life_fnc_index;
	getArray(missionConfigFile >> "resourceFields" >> (_rI select _index select 0) >> "zones");
};
_mkr = _mkr apply {mapGridPosition (getMarkerPos _x)};
_t ctrlSetPosition [0,_offSet + 0.005 * safezoneH,0.252656 * safezoneW,0];
_t ctrlCommit 0;
private _mV = ["SELL",_nI] call life_fnc_marketGetPrice;
_t ctrlSetStructuredText parseText format ["<t size='1.05'>Stelle her </t><br/>Item: <img image='%2'/> %1<br/>Menge: %3x<br/>Benötigt:<img image='images\icons\ico_contract.paa'/> %5<br/>MapGrid: %4%6%7",localize getText(missionConfigFile >> "VirtualItems" >> _nI >> "displayName"),getText(missionConfigFile >> "VirtualItems" >> _nI >> "icon"),[_cM] call life_fnc_numberText,_mkr joinString ", ",_ben,if(_mV > 0) then {format["<br/>Aktueller Wert: €%1",[_mV*_cM] call life_fnc_numberText];} else {"";},if((sliderPosition _pS) > 1 && _mV > 0) then {format["<br/>Pro Person: €%1",[(_mV*_cM)/(sliderPosition _pS)] call life_fnc_numberText];} else {"";}];
_t ctrlSetPosition [0,_offSet + 0.005 * safezoneH,0.252656 * safezoneW,ctrlTextHeight _t];
_p ctrlSetText "images\icons\ico_localize.paa";
_p ctrlSetPosition [0.225 * safezoneW,_offSet + 0.005 * safezoneH,0.0154688 * safezoneW,0.033 * safezoneH];
_b ctrlSetPosition [0.225 * safezoneW,_offSet + 0.005 * safezoneH,0.0154688 * safezoneW,0.033 * safezoneH];
_b setVariable ["item",_nI];
_b ctrlSetEventHandler ["MouseEnter","_this call life_fnc_fs_onMouseEnter;"];
_b ctrlSetEventHandler ["MouseExit","_this call life_fnc_fs_onMouseExit;"];

_b ctrlCommit 0;
_p ctrlCommit 0;
_t ctrlCommit 0;
_aC pushBack _b;
_aC pushBack _p;
_aC pushBack _t;