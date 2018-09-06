/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
params[
	["_bounty", 0, [0]],
	["_bad", false, [false]],
	["_time", 15, [0]]
];
_time = time + (_time * 60);

life_bail_amount = _bounty;
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Bitte melde das einem Admin: JAIL_FALLBACK_15, Zeit ist Null!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then
	{
		//sleep (10 * 60);
		//50% of time
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//sleep (5 * 60);
		//20% of time
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};


while {true;} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " €%2",_countDown,([life_bail_amount] call life_fnc_numberText), if(isNil "life_canpay_bail") then {"Ja"} else {"Nein"}];
	};
	
	if(player distance [16707,13683.1,4.3] > 60) exitWith {
		_esc = true;
	};
	
	if(life_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


call {
	if (_bail) exitWith {
		life_is_arrested = false;
		life_bail_paid = false;

		[localize "STR_Jail_Paid",false,"fast"] call life_fnc_notification_system;
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player,false] call life_fnc_removeCrime;
		["JAILED"] call SOCK_fnc_updatePartial;
	};

	if (_esc) exitWith {
		life_is_arrested = false;
		[localize "STR_Jail_EscapeSelf",false,"fast"] call life_fnc_notification_system;
		[0,"STR_Jail_EscapeNOTF",true,[player call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",-2];
		[player,"prisonBreak",1] call life_fnc_addCrime;
		["JAILED"] call SOCK_fnc_updatePartial;
	};

	if (alive player && !_esc && !_bail) exitWith {
		life_is_arrested = false;
		[localize "STR_Jail_Released",false,"fast"] call life_fnc_notification_system;
		[getPlayerUID player,false] call life_fnc_removeCrime;
		player setPos (getMarkerPos "jail_release");
		["JAILED"] call SOCK_fnc_updatePartial;
	};
};