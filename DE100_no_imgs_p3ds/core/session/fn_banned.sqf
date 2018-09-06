/*
	File:	fn_banned.sqf
	Date:   24.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.

	Description:
	Take a look for yourself.
*/

params[
	["_banner", "", [""]],
	["_date", "", [""]],
	["_reason", "", [""]],
	["_banId", 0, [0]],
	"_year",
	"_month",
	"_day",
	"_hrs",
	"_minu",
	"_timeAndDataRl",
	"_dateString",
	"_dateYear"

];
waitUntil {isClass(missionConfigFile >> "CfgDebriefing" >> "aborted") && !isNull (findDisplay 46) && !isNull player && player == player};
_dateString = _date;
player setVariable [(format["logout_validate_id_%1",getPlayerUID player]),true,true];

if ((parseNumber _dateString) < 0) then {
	format["<t size='1.2' align='center'><t size='2'>Hausverbot auf DE100</t><br/><br/>Hallo %1, du wurdest durch <t font='TahomaB'>%2</t> permanent von DE100 gebannt.<br/><a href='http://bc.de100-altis.life/?id=%3' size='1.25' color='#9C302C'>Online-Ban-Check</a><br/><t size='1.4'>Grund:</t><br/><t color='#9C302C'>%4</t></t>",player call life_fnc_name,_banner,_banId,_reason] call life_fnc_logoutBox;;
	endMission "Permbanned";
} else {
	_dateYear = parseNumber (_dateString select [0,4]);
	_date = parseNumber (_dateString select [4]);
	_year = life_real_time select 0;
	_month = if (life_real_time select 1 < 10) then {format ["0%1",life_real_time select 1]} else {life_real_time select 1};
	_day = if (life_real_time select 2 < 10) then {format ["0%1",life_real_time select 2]} else {life_real_time select 2};
	_hrs = if (life_real_time select 3 < 10) then {format ["0%1",life_real_time select 3]} else {life_real_time select 3};
	_minu = if (life_real_time select 4 < 10) then {format ["0%1",life_real_time select 4]} else {life_real_time select 4};
	_timeAndDataRl = format["%1%2%3%4", _month, _day, _hrs, _minu];
	_timeAndDataRl = parseNumber _timeAndDataRl;
	if ((_date <= _timeAndDataRl && _dateYear == _year) || _dateYear < _year) exitWith {

		if (life_HC_isActive) then {
			[getPlayerUID player,(call life_clientId) select 0] remoteExecCall ["AH_fnc_pardon",HC_Life];
		} else {
			[getPlayerUID player,(call life_clientId) select 0] remoteExecCall ["AH_fnc_pardon",2];
		};
		endMission "Entbannt";
	};
	_till = format["%3.%4.%5 %1:%2 Uhr",_dateString select [8,2],_dateString select [10,2],_dateString select [6,2],_dateString select [4,2],_dateString select [0,4]];
	format["<t size='1.2' align='center'><t size='2'>Hausverbot auf DE100</t><br/><br/>Hallo %1, du wurdest durch <t font='TahomaB'>%2</t> temporär von DE100 gebannt.<br/><a href='http://bc.de100-altis.life/?id=%3' size='1.25' color='#9C302C'>Online-Ban-Check</a><br/><t size='1.4'>Gebannt bis:</t><br/><t color='#9C302C'>%4</t><br/><t size='1.4'>Grund:</t><br/><t color='#9C302C'>%5</t></t>",player call life_fnc_name,_banner,_banId,_till,_reason] call life_fnc_logoutBox;;
	endMission "Tempbanned";
};