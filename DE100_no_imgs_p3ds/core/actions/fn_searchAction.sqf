/*
	File:	fn_searchAction.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

if (life_action_inUse || life_interrupted) exitWith {};
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {[localize "STR_NOTF_CannotSearchPerson",true,"fast"] call life_fnc_notification_system;};


private _fnc = {
	params[
		["_u", objNull, [objNull]],
		["_s", true, [true]]
	];
	if (_s) then {
		[player] remoteExec ["life_fnc_searchClient",_u];
		private _getXp = (round ((random 80)+20));
		if (life_real_date in (call de100_Dxp_days) || life_admin_moreXp) then {
			_getXp = _getXp * 2;
		};

		[format["Du hast %1 Erfahrung erhalten.",_getXp],false,"fast"] call life_fnc_notification_system;
		["search_player",_getXp] call life_fnc_addExp;
	} else {
		[localize "STR_NOTF_ActionCancel",true,"fast"] call life_fnc_notification_system;
	};
	life_action_inUse = false;
};

life_action_inUse = true;
private _pData = "search_player" call life_fnc_getProf;
[player,"MedicOther",2,_pData select 0,{!life_action_inUse || !isNull objectParent player}] spawn life_fnc_doAnimation;
[_pData select 0,"Person wird durchsucht",{!life_action_inUse || !isNull objectParent player},[_unit],_fnc,_fnc] spawn life_fnc_progressBar;