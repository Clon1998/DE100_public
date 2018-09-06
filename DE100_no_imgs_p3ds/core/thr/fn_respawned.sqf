/*
	File:	fn_respawned.sqf
	Date:   2016-08-15 21:28:24
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

profileNamespace setVariable[format["DE100_%1_dammage",playerSide],0];
profileNamespace setVariable [format["DE100_%1_thirst",playerSide],100];
profileNamespace setVariable [format["DE100_%1_hunger",playerSide],100];

bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]),nil,true];


life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_mula = 0;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];

life_respawned = false;
life_perso_seen = [];

//Cleanup of weapon containers near the body & hide it.
player setVariable["isAlive",nil,true];
player setVariable["thrClerk",nil,true];
player setVariable["request",nil,true];
player setVariable["requestveh",nil,true];
false call life_fnc_setUnconscious;
player setPos (getMarkerPos "respawn_civilian");

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

call {
	if (playerSide isEqualTo civilian) exitWith {call life_fnc_civLoadout;};
	if (playerSide isEqualTo west) exitWith {call life_fnc_copLoadout;};
	if (playerSide isEqualTo independent) exitWith {call life_fnc_thrloadout;};
};

//Bad boy
if(life_is_arrested) exitWith {
	[localize "STR_Jail_Suicide",true,"fast"] call life_fnc_notification_system;
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[getPlayerUID player] call life_fnc_getBounty,true] remoteExecCall ["life_fnc_bountyReceive",life_copRecieve];
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player,false] call life_fnc_removeCrime;
};

[] call SOCK_fnc_updateRequest;