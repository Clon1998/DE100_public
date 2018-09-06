/*
   File:    fn_calcHistory.sqf
   Date:    2017-9-19 19:38:28
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
	["_grp", controlNull, [controlNull]],
	["_s", 1, [0]]
];

private _d = ctrlParent _grp;
private _hT = _grp controlsGroupCtrl 4406;
private _aId = _d getVariable ["openAuction",-1];
private _aD = [_aId,_d getVariable ["tableData",[]]] call life_fnc_dataFromKey;
private _c = _aD select 2;

private _z = if (_s == 31) then {0;} else {([life_real_time] call life_fnc_timeUnix)-_s*86400};

private _pA = (de100_ac_storage getVariable ["past_auctions",[]]) select {(_x select 1) select 2 isEqualTo _c && ([(_x select 1) select 5] call life_fnc_timeUnix) >= _z};
private _cB = 0;
private _cP = 0;
private _b = 0;
private _p = 0;
{
	private _tB = (_x select 1) select 6;
	private _tP = (_x select 1) select 7;
	private _bD = de100_ac_storage getVariable [format["%1_auction_history",_x select 0],[]];
	if !(((_bD select (count _bD -1)) select 0) isEqualTo ((_x select 1) select 0)) then {
		if (_tB < 0) then {
			if (_tP > 0) then {
				_p = _p + _tP;
				_cP = _cP + 1;
			};
		} else {
			_b = _b + _tB;
			_cB = _cB + 1;
		};
	};
	nil;
} count _pA;

if (_p > 0) then {
	_p = round (_p/_cP);
};
if (_b > 0) then {
	_b = round (_b/_cB);
};

_t = call {
	if (_s <= 3) exitWith {format["%1 Stunden",_s*24];};
	if (_s == 31) exitWith {"seit Aufzeichnung";};
	format["%1 Tagen",_s];
};

_hT ctrlSetStructuredText parseText format["Zeit skalierung: %1<br/>Verkauft: %2 Stück<br/>Ø-Sofortkaufpreis: %3€<br/>Ø-Höchstgebot: %4€",_t,_cB+_cP,[_p] call life_fnc_numberText,[_b] call life_fnc_numberText];