/*
	File:	fn_refreshAuction.sqf
	Date:   2017-09-07 23:20:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_aIds", 0, [[],0]],
	["_aData", [], [[]]],
	["_bData", [], [[]]],
	["_nameSpace", "", [""]]
];

private _display = findDisplay 4000;
if (isNull _display) exitWith {player setVariable ["auction_open",false,true];};
private _arr = de100_ac_storage getVariable [_nameSpace,[]];
private _aArr = de100_ac_storage getVariable ["active_auctions",[]];
if (_aIds isEqualType 0) then {
	if (_nameSpace isEqualTo "past_auctions") then {
		[_aIds,_aArr] call life_fnc_setDataAtKey;
	};
	[_aIds,_arr,_aData] call life_fnc_setDataAtKey;
	de100_ac_storage setVariable [format["%1_auction_history",_aIds],_bData];
	_aIds = [_aIds];
} else {
	{
		[_x select 0,_arr,_x select 1] call life_fnc_setDataAtKey;
		if (_nameSpace isEqualTo "past_auctions") then {
			[_x select 0,_aArr] call life_fnc_setDataAtKey;
		};
		nil;
	} count _aData;
};
if (_nameSpace isEqualTo "past_auctions") then {
	de100_ac_storage setVariable ["active_auctions",_aArr];		
};
de100_ac_storage setVariable [_nameSpace,_arr];
private _aId = _display getVariable ["openAuction",-1];
if !(_aId in _aIds) exitWith {};

private _grp = _display displayCtrl 4400;
private _price = _grp controlsGroupCtrl 4402;
private _betTree = _grp controlsGroupCtrl 4405;
private _betBtn = _grp controlsGroupCtrl 4408;
private _buyBtn = _grp controlsGroupCtrl 4409;
private _betEdit = _grp controlsGroupCtrl 4407;
private _delBtn = _grp controlsGroupCtrl 4411;

private _aData = [_aId,de100_ac_storage getVariable [_nameSpace,[]]] call life_fnc_dataFromKey;

private _expired = (([_aData select 5] call life_fnc_timeUnix) < ([life_real_time] call life_fnc_timeUnix)) || (_aData select 11);
if ((_aData select 7) > 0 && !_expired && !((_aData select 0) isEqualTo (getPlayerUID player))) then {
	_buyBtn ctrlEnable true;
	_buyBtn ctrlSetTextColor [1,1,1,1];
} else {
	_buyBtn ctrlEnable false;
	_buyBtn ctrlSetTextColor [0.4,0.4,0.4,1];
};

if (!_expired && !((_aData select 0) isEqualTo (getPlayerUID player))) then {
	_betBtn ctrlEnable true;
	_betEdit ctrlEnable true;
	_betBtn ctrlSetTextColor [1,1,1,1];
} else {
	_betBtn ctrlEnable false;
	_betEdit ctrlEnable false;
	_betBtn ctrlSetTextColor [0.4,0.4,0.4,1];
};
_delBtn ctrlShow ((_aData select 0) isEqualTo (getPlayerUID player) && !_expired);

private _bHisData = +(de100_ac_storage getVariable [format["%1_auction_history",_aId],[]]);
reverse _bHisData;
tvClear _betTree;
private _mask = (_aData select 1) in ["houses","storehouses"];
{
	private _num = _x select 2;
	private _i = _betTree tvAdd [[],if ((_x select 0) isEqualTo (_aData select 0)) then {if (_num < 0) then {"Zurückgezogen";} else {"Startgebot";}} else {private _name = _x select 1;if (_mask && !((_x select 0) isEqualTo getPlayerUID player)) then {format["%1*****",_name select [0,1]];} else {_name;};}];
	_betTree tvSetPicture [[_i],'A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_toolbox_units_ca.paa'];
	private _ii = _betTree tvAdd [[_i],[0,_x select 3] call life_fnc_timeToStr];
	_betTree tvSetPicture [[_i,_ii],'a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa'];
	if (!((_x select 0) isEqualTo (_aData select 0)) || _num >= 0) then{
		private _ii = _betTree tvAdd [[_i],if (_num<0) then {"Sofortkauf";} else {[_num] call life_fnc_numberText;}];
		_betTree tvSetPicture [[_i,_ii],'images\icons\ico_money.paa'];
	};
	_betTree tvExpand [_i];
	nil;
} count _bHisData;

_price ctrlSetStructuredText parseText (if (_expired) then {"<t align='center'>Beendet</t>"} else {format ["<t align='left'>Sofortkauf: %1</t><t align='right'>Höchstgebot: %2€</t>",if ((_aData select 7) < 0) then {"Nicht verfügbar";} else {format["%1€",[_aData select 7] call life_fnc_numberText];}, [_aData select 6] call life_fnc_numberText];});