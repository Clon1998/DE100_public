/*
    File: fn_initNobody.sqf
    Author: Anton

    Description:
    Initialisiert die Nobody-Fraktion
*/

_mode=param[0,'join',['join']];

switch(_mode)do{
	case'join':{
		[]call SOCK_fnc_updateRequest;
		life_my_gang = group player;
		if (count (units life_my_gang) == 1) then {
			life_my_gang = GrpNull;
		};
		if(isNil'nobody_group')then{
			nobody_group=(createGroup civilian);
			publicVariable"nobody_group";
		}else{
			if(isNull nobody_group)then{
				nobody_group=(createGroup civilian);
				publicVariable"nobody_group";
			};
		};
		[player] joinSilent nobody_group;
		player setVariable["nobody",true,true];
		license_civ_nobody=true;
		[player]call life_fnc_saveGear;
		life_civoldGear = life_gear;

		[getPlayerUID player,(call life_clientID)select 0,'getNobodyGear']remoteExec["TON_fnc_Nobody",2];

		["Du bist Nobody beigetreten",false,"fast"] call life_fnc_notification_system;
	};
	case'leave':{
		[]call SOCK_fnc_updateRequest;

		player setVariable["nobody",false,true];
		license_civ_nobody=false;
		
		[player]call life_fnc_saveGear;
		
		[getPlayerUID player,(call life_clientID)select 0,'saveNobodyGear',life_gear]remoteExec["TON_fnc_Nobody",2];

		life_gear=life_civoldGear;
		call life_fnc_loadGear;
		
		//[]spawn life_fnc_initGang;

        call life_fnc_spawnmenu;

		["Du hast Nobody verlassen",true,"fast"] call life_fnc_notification_system;
	};	
};