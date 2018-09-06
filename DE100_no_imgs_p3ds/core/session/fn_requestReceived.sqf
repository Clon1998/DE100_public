/*
	File:	fn_requestReceived.sqf
	Date:   2016-09-24 19:50:01
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
scopeName "main";
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {};
if (life_session_tries > 5) exitWith {cutText[localize "STR_Session_Error","PLAIN DOWN"];};

[.7,"Daten werden überprüft"] call life_fnc_introCamSetPerc;
uiSleep 0.4;

if (isNil "_this") exitWith {call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualTo []) exitWith {call SOCK_fnc_insertPlayerInfo;};

//Parse basic player information.
de100_luciandjuli_mula = parseNumber (["cash",_this] call life_fnc_dataFromKey);
de100_luciandjuli_bc = parseNumber (["bankacc",_this] call life_fnc_dataFromKey);
de100_mSpace setVariable ["cT",diag_tickTime];
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
de100_mSpace setVariable ["rdy",true];
life_adminlevel = compileFinal str (["adminlevel",_this] call life_fnc_dataFromKey);
player setVariable ["isAdmin",call life_adminlevel,true];
life_U_Ruck = compileFinal str (if ((["backpack",_this] call life_fnc_dataFromKey) isEqualType "") then {
	false;
} else {
	(["backpack",_this] call life_fnc_dataFromKey) > 0;
});
life_skin_tier = compileFinal str (["skin_tier",_this] call life_fnc_dataFromKey);

life_advent = parseNumber (["advent",_this] call life_fnc_dataFromKey);

private _tmp = (["achievements",_this] call life_fnc_dataFromKey)+([call {
	if (playerSide isEqualTo civilian) exitWith {"civ_prof";};
	if (playerSide isEqualTo west) exitWith {"cop_prof";};
	if (playerSide isEqualTo independent) exitWith {"thr_prof";};
},_this] call life_fnc_dataFromKey);
{
	missionNamespace setVariable [_x select 0,[_x select 1, _x select 2]];
	nil;
} count _tmp;

_tmp = [call {
	if (playerSide isEqualTo civilian) exitWith {"civ_licenses";};
	if (playerSide isEqualTo west) exitWith {"cop_licenses";};
	if (playerSide isEqualTo independent) exitWith {"thr_licenses";};
},_this] call life_fnc_dataFromKey;
{
	[1,[_x select 0,(_x select 1) call life_fnc_clientBool]] call life_fnc_handleLicense;
	nil;
} count _tmp;

life_thrlevel = 0;
life_coplevel = 0;
life_playTime = parseNumber(["playtime",_this] call life_fnc_dataFromKey);

call {
	if (playerSide isEqualTo civilian) exitWith {
		private _perso = ["idCard",_this] call life_fnc_dataFromKey;
		if (_perso isEqualTo []) then {
			life_perso_formular = false;
			createDialog "life_perso_formular";
			waitUntil {!((player getVariable ["idCard",[]]) isEqualTo [])};
		} else {
			player setVariable ["idCard",_perso,true];
			if (!((["name",_this] call life_fnc_dataFromKey) isEqualTo (player call life_fnc_name)) && call life_adminlevel == 0) exitWith {
				[.7,"Namen Stimmen nicht überein"] call life_fnc_introCamSetPerc;
				waitUntil {isClass(missionConfigFile >> "CfgDebriefing" >> "aborted") && !isNull (findDisplay 46) && !isNull player && player == player};
				[format["<t size='1.2' align='center'><t size='2'>Name stimmt nicht überein</t><br/><br/>Hallo %1, es scheint so, als hätten Sie ihren Namen geändert.<br/>Auf DE100 haben sie eine feste Identität und können ihren Namen nur gegen eine Gebühr beim Einwohnermeldeamnt ändern.<br/>Bitte benutzen Sie wieder ihren alten Namen, ansonsten können Sie nicht mehr auf DE100 spielen.<br/>Gespeicherter Name (zwischen """"): ""<t size='1.25' color='#9C302C'>%2</t>""<br/><br/>Mit freundlichen Grüßen,<br/>Das DE100-Team</t>",player call life_fnc_name,["name",_this] call life_fnc_dataFromKey]] call life_fnc_logoutBox;
				endMission "nameMatching";
				breakOut "main";
			};
		};
		player setVariable ["Perso_has_IdCard",true,true];

		life_is_arrested = ["arrested",_this] call life_fnc_dataFromKey;
		life_civjob = ["life_civjob",_this] call life_fnc_dataFromKey;
		life_nobody = compileFinal str (["nobody_level",_this] call life_fnc_dataFromKey);
		
		life_houses = ["Houses",_this] call life_fnc_dataFromKey;
		life_vehicles append life_houses;
		if (count (["Gang",_this] call life_fnc_dataFromKey) isEqualTo 8) then {
			(["Gang",_this] call life_fnc_dataFromKey) call life_fnc_initGangLocal;
		} else {
			[player] joinSilent (createGroup civilian);
			life_gang_init = true;
		};
		call life_fnc_initHouses;
		player setVariable ["newBee",life_playTime < 600*60 && (["newBee",_this] call life_fnc_dataFromKey),true];
	};

	if (playerSide isEqualTo west) exitWith {
		life_coplevel = ["coplevel",_this] call life_fnc_dataFromKey;
		life_blacklisted = ["blacklist",_this] call life_fnc_dataFromKey;
		life_has_locker= count (["Locker",_this] call life_fnc_dataFromKey) > 0;
		private _perso = [
			["Lappen","Kavala"],
			["Praktikant","Kavala"],
			["Polizeimeister","Kavala"],
			["Polizeiobermeister","Kavala"],
			["Polizeihauptmeister","Kavala"],
			["Polizeikommissar","Athira"],
			["Polizeioberkommissar","Athira"],
			["Polizeihauptkommissar","Athira"],
			["Polizeihauptkommissar","Athira"],
			["Erster Polizeihauptkommissar","Athira"],
			["Polizeioberrat", "Pyrgos"],
			["Polizeidirektor", "Pyrgos"],
			["Polizeipräsident", "Pyrgos"]
		] select life_coplevel;

		_rank = _perso select 0;
		_dist = _perso select 1;
		player setVariable ["idCard",[getPlayerUID player,_dist,_rank],true];
		player setVariable ["Perso_has_IdCard",true,true];
		life_gang_init = true;
	};

	if (playerSide isEqualTo independent) exitWith {
		life_thrlevel = ["thrlevel",_this] call life_fnc_dataFromKey;
		private _perso = [
			["Lappen","Kavala"],
			["Praktikant","Kavala"],
			["Auszubildender","Kavala"],
			["Geselle","Kavala"],
			["Meister","Kavala"],
			["Ausbilder","Kavala"]
		] select life_thrlevel;
		_rank = _perso select 0;
		_dist = _perso select 1;
		player setVariable ["idCard",[getPlayerUID player,_dist,_rank],true];
		player setVariable ["Perso_has_IdCard",true,true];
		life_gang_init = true;
	};
};

life_coplevel = compileFinal (if( life_coplevel isEqualType "") then {life_coplevel} else {str life_coplevel});
life_thrlevel = compileFinal (if( life_thrlevel isEqualType "") then {life_thrlevel} else {str life_thrlevel});
private _vehs = bank_obj getVariable [format["%1_Keys_%2",getPlayerUID player,playerSide],[]];
if (count _vehs > 0) then {
	{
		if (!isNull objectFromNetId _x) then {
			life_vehicles pushBackUnique objectFromNetId _x;
		};
		nil
	} count _vehs;
};

if ((call life_adminlevel) > 0 && (missionNamespace getVariable ["Custom",[0,0]]) select 1 == 0) then {
	["Custom",2] spawn life_fnc_addAchievExp;
};

_Achiev = missionNamespace getVariable ["Archi_Donator",[0,0]];
if (call life_U_Ruck || call life_skin_tier > 0) then {
	if ((_Achiev select 1) != 1) then {
		["Donator",1] spawn life_fnc_addAchievExp;
	};
} else {
	if ((_Achiev select 1) == 1) then {
		missionNamespace setVariable ["Archi_Donator",[0,0]];
	};
};
_type = call {
	if (playerSide isEqualTo civilian) exitWith {"civ_gear";};
	if (playerSide isEqualTo west) exitWith {"cop_gear";};
	if (playerSide isEqualTo independent) exitWith {"thr_gear";};
};
life_gear = [_type,_this] call life_fnc_dataFromKey;
[] call life_fnc_loadGear;

life_session_completed = true;
if (playerSide isEqualTo civilian) then {
	["IDCARD"] call SOCK_fnc_updatePartial;
};