/*
	File:	fn_transferID.sqf
	Date:   2016-08-15 02:47:24
	Author: Anton & Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_uid",'',['']],
	["_cid",'',['']]
];
if !([_uid,_cid]call AH_fnc_verify) exitWith {};
private _unit = _uid call life_fnc_unitFromUid;

//Check if he modifyed Pid in Chache
if !(_uid isEqualTo getPlayerUID _unit) exitwith {
	private _msg =format ["UID-Manipulation. Übergebene-UID(%1) vom Server gelesene UID(%2)",_uid,getPlayerUID _unit];
	if (life_HC_isActive) then {
		[format["[%1|%2]",[_unit] call life_fnc_name,(getPlayerUID _unit)]+_msg,"AntiHackLog"] remoteExec ["A3Log",HC_Life];
	} else {
		[format["[%1|%2]",[_unit] call life_fnc_name,(getPlayerUID _unit)]+_msg,"AntiHackLog"] call A3Log;
	};
	_unit spawn TON_fnc_banPlayer;
};

if (isNil'AH_ADMINS') then {
	AH_ADMINS = [];
	private _arr = ["SELECT playerid FROM players WHERE adminlevel > '0';",2,true] call DB_fnc_asyncCall;
	{
		AH_ADMINS pushBackUnique (_x select 0);
		nil
	} count _arr;
};

if (_uid in AH_ADMINS) exitWith{
	[0,"DE100-AH:: Hallo Admin, das AntiHack wurde bei dir beendet"] remoteExecCall ["life_fnc_broadcast",_unit];
};

if (isNil'AH_CODE') then {

	/* Automatisch generierte Waffen Blacklist, die zu einem Ban führen  */
	private _BL_WEA = [];
	/* Automatisch generierte Waffen Whitelist, die nicht zu einem Ban führen  */
	private _WH_WEA = [];

	/* Code zum generieren der Waffen White/Blacklist */
	{
		private _data = _x select 1;
		private _pistols = ["pistols",_data] call life_fnc_dataFromKey;
		private _rifels = ["rifles",_data] call life_fnc_dataFromKey;
		if (_rifels isEqualTo false) then {_rifels = [];};
		if (_pistols isEqualTo false) then {_pistols = [];};
		_rifels append _pistols;
		_WH_WEA append (_rifels apply {toLower (_x select 0)});
		nil;
	} count de100_Shops;

	{
		if !((toLower configName _x) in _WH_WEA) then {
			if (configName _x isKindOf ["Pistol", configFile >> "CfgWeapons"] || configName _x isKindOf ["Rifle", configFile >> "CfgWeapons"] || configName _x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
				_BL_WEA pushBackUnique (configName _x)
			};
		};
		nil;
	} count ("true" configClasses (configfile >> "CfgWeapons"));
	_BL_WEA = _BL_WEA - ["Rifle","Pistol","Launcher"]; //Base Klassen die besser entfernt werden sollten!

	/* Liste an Dialogen, die zum Ban führen, wenn sie geöffnet sind */
	private _BL_IDC = [2, 3, 7, 17, 19, 25, 26, 27, 28, 29, 30, 31, 32, 37, 40, 41, 43, 44, 45, 51, 52, 56, 64, 74, 105, 106, 126, 127, 132, 144, 146, 147, 152, 153, 157, 164, 314, 632, 1320, 2121, 2727, 2928, 2929, 3030, 100002, 316000 ];

	/* Liste an Variablen, die geblacklistet sind */
	private _BL_VARS = ["lutrRAM","oxBOB","..."];

	/* Liste an Variablen, die gewhitelistet sind */
	private _WH_VARS = ["life_inv_pickaxe","life_esp","life_fnc_adminmenu"];

	/* Liste an ParsingVariablen, die gewhitelistet sind */
	private _WH_PVARS = ["mission_root","bis_rscdebugconsoleexpressionresultctrl","bis_rscdebugconsoleexpressionresulthistory"];

	/* Liste an ParsingVariablen, die gewhitelistet sind */
	private _WH_AA_STRING= ["Aufstehen","Blitzer plazieren","Aussteigen (Unbewaffnet)","<p></p>","Betanke den Tanklaster","Tankstelle befüllen","Taxifahrt abbrechen","Fischernetz auswerfen","Person ausrauben","Spawnpunkt setzen","Als Fahrer Einsteigen","Als Beifahrer Einsteigen","Aussteigen","Als Fahrer Einsteigen","Aufschließen","Waffe beschlagnahmen","Absetzen","Taxifahrt beenden und bezahlen","<t color='#FF0000'>Mauer aufheben</t>","<t color='#FF0000'>BandAbsperrung aufheben</t>","<t color='#FF0000'>Leitkegel aufheben</t>", "<t color='#FF0000'>Straßensperre aufheben</t>", "<t color='#FF0000'>Lange Mauer aufheben</t>", "<t color='#FF0000'>PfeilabsperreR aufheben</t>", "<t color='#FF0000'>PfeilabsperreL aufheben</t>", "<t color='#FF0000'>Schranke aufheben</t>", "<t color='#FF0000'>Rakete aufheben</t>", "<t color='#FF0000'>Rakete/n starten</t>","Nagelband platzieren","Nagelband zusammenpacken","<t color='#B20000'>Bombe zünden!!!</t>","Box abdocken","Box andocken"];

	// Blacklisted Strings
	private _BL_STRINGS = ["g-e-f","j_m_e","infinite ammo","spoody","no recoil","lystic","dankhax","kill all","no grass","no fatigue","explosive bullets","run script"];

	// Whitelisted Ctrls
	private _WH_CTRL = '[(findDisplay 8) displayCtrl 149,(findDisplay 70) displayCtrl 109]';

	private _WH_CHARS = "ABCDEFGHIJKLMNOPQRESTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890ßüöäÜÖÄ&,.|[]<>-–_!?;#^=+/\$€():@´'  ""`*";

	private _MAX_PING_TIME = 3;

	private _WEAPONCHECK = '{
		private _BL_WEA = '+ str _BL_WEA +';

		private _error = [];
		private _string = toLower str(getUnitLoadout player);
		{
			if(_string find(toLower _x)>=0)then{
				_error pushBack _x;
				player removeWeapon _x;
			};
			nil;
		} count _BL_WEA;
		if (count _error>0) then {
			[getPlayerUID player,call(life_clientId)select 0,[47,format["Geblacklistete Waffe(n): %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _DIALOGCHECK = '{
		private _BL_IDC = '+ str _BL_IDC +';

		private _error = [];
		{
			if(!isNull(findDisplay _x))then{
				_error pushBack _x;
			};
			nil;
		} count _BL_IDC;
		if (count _error>0) then {
			[getPlayerUID player,call(life_clientId)select 0,[48,format["Geblacklistete(r) Dialog(e): %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _BLVARIABLECHECK = '{
		private _BL_VARS = '+ str _BL_VARS +';

		private _error=[];
		{
			if(_x in _BL_VARS)then{
				_error pushBack[_x,missionNamespace getVariable _x]
			};
			nil;
		} count (allVariables missionNamespace);
		if (count _error>0) then {
			[getPlayerUID player,call(life_clientId)select 0,[49,format["Geblacklistete Variable(n): %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _DOUBLEUIDCHECK = '{
		private _UIDS=profileNamespace getVariable ["DE100_UID_Storage",[]];
		if !(getPlayerUID player in _UIDS) then {_UIDS pushBack(getPlayerUID player)};
		if(count _UIDS>1 && (getPlayerUID player) != (_UIDS select 0))then{
			[getPlayerUID player,call(life_clientId)select 0,[50,format["Nutzt mehrere Steam-Accounts auf diesem Server: %1",_UIDS]],true] remoteExecCall ["TON_fnc_report",2];
		};
		profileNamespace setVariable["DE100_UID_Storage",_UIDS];
		saveProfileNamespace;
	}';

	private _PARSINGNMSCHECK = '{
		private _WH_PVARS = '+ str _WH_PVARS +';
		private _error = [];
		{
			if !(_x in _WH_PVARS) then {
				_error pushBack[_x,parsingNamespace getVariable _x];
			};
			nil
		} count (allVariables parsingNamespace);
		if(count _error>0)then{
			[getPlayerUID player,call(life_clientId)select 0,[51,format["Der Parsingnamespace enthält Variablen: %1",_error]],false] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _BLACKLISTED_STRINGS_NMSCHECK = '{
		private _BL_STRINGS = '+ str _BL_STRINGS +';
		private _error=[];
		{
			private _var = _x;
			private _c = missionNamespace getVariable[_var,""];
			_c = if (_c isEqualType "") then {_c;} else {str _c;};
			private _bad = false;
			private _string = "";
			{
				if (_var find _x >= 0 || _c find _x >= 0) exitWith {
					_bad = true;
					_string = _x;
				};
				nil
			} count _BL_STRINGS;
			if(_bad)then{
				_error pushBack [_string,_var,_c];
			};
			nil;
		} count (allVariables missionNamespace);
		if ((count _error) > 0) then {
			[getPlayerUID player,call(life_clientId)select 0,[52,format["Es wurden Bad Strings im missionNamespace gefunden: %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _BLACKLISTED_STRINGS_DIALOGCHECK = '{
		private _BL_STRINGS = '+ str _BL_STRINGS +';
		private _WH_CHARS = toArray('+ str _WH_CHARS +');
		private _rekrusive = {
			params[
				["_c", controlNull],
				["_p",[]]
			];
			private _bs = [];
			for "_i" from 0 to ((_c tvCount _p)-1) do {
				private _tt = _c tvText [_i];
				private _dd = _c tvData [_i];
				private _vv = str(_c tvValue [_i]);

				{
					if !(_x in _WH_CHARS) exitwith {
						_bs pushBack [_x,_tt];
					};
					nil
				} count (toArray _tt);

				{
					if(toLower _tt find toLower _x >= 0)then{
						_bs pushBack[_x,_tt];
					};

					if(toLower _dd find toLower _x >= 0)then{
						_bs pushBack[_x,_dd];
					};

					if(toLower _vv find toLower _x >= 0)then{
						_bs pushBack[_x,_vv];
					};
					nil					
				} count _BL_STRINGS;
				if ((_c tvCount (_p+[_i])) > 0) then {
					private _ret = [_c,_p+[_i]] call _rekrusive;
					if (count _ret > 0) then {
						_bs append _ret;
					};
				};
			};
			_bs
		};
		private _error = [];
		disableSerialization;
		{
			private _disp = _x;
			{
				private _ctrl = _x;
				private _badstr = [];
				if !(_ctrl in '+_WH_CTRL+') then {
					private _t = ctrlText _x;

					if !(ctrlType _ctrl in [2,13,0]) then {
						{
							if(toLower _t find toLower _x >= 0)then{
								_badstr pushBack[ctrlIDC _ctrl,_x,_t];
							};	
							nil		
						} count _BL_STRINGS;
					};

					if (ctrlType _ctrl == 5) exitWith {
						for "_i" from 0 to ((lbSize _ctrl)-1) do {
							private _tt = _ctrl lbText _i;
							private _dd = _ctrl lbData _i;
							private _vv = str(_ctrl lbValue _i);

							{
								if !(_x in _WH_CHARS) exitwith {
									_badstr pushBack [_x,_tt];
								};
								nil;
							} count (toArray _tt);

							{
								if (toLower _tt find toLower _x >= 0)then{
									_badstr pushBack[_x,_tt];
								};

								if(toLower _dd find toLower _x >= 0)then{
									_badstr pushBack[_x,_dd];
								};

								if(toLower _vv find toLower _x >= 0)then{
									_badstr pushBack[_x,_vv];
								};
								nil;
							} count _BL_STRINGS;
						};
					};

					if (ctrlType _ctrl == 12) exitWith {
						private _ret = [_ctrl,[]] call _rekrusive;
						if (count _ret > 0) then {
							_badstr append _ret;
						};
					};

					if (ctrlType _ctrl == 102) exitWith {
						for "_i" from 0 to ((lnbSize _ctrl select 0)-1) do {
							for "_j" from 0 to ((lnbSize _ctrl select 1)-1) do {
								private _tt = _ctrl lnbText [_i,_j];
								private _dd = _ctrl lnbData [_i,_j];
								private _vv = str(_ctrl lnbValue [_i,_j]);

								{
									if !(_x in _WH_CHARS) exitwith {
										_badstr pushBack [_x,_tt];
									};
									nil;
								} count (toArray _tt);

								{
									if(toLower _tt find toLower _x >= 0)then{
										_badstr pushBack[_x,_tt];
									};

									if(toLower _dd find toLower _x >= 0)then{
										_badstr pushBack[_x,_dd];
									};

									if(toLower _vv find toLower _x >= 0)then{
										_badstr pushBack[_x,_vv];
									};
									nil;
								} count _BL_STRINGS;
							};
						};
					};

				};
				if(count _badstr>0)then{
					_error pushBack[_disp,_ctrl,_badstr];
				};
				nil;
			} count (allControls _disp);
			nil;
		} count allDisplays;

		if(count _error>0)then{
			[getPlayerUID player,call(life_clientId)select 0,[53,format["Es wurden Blacklisted Strings in Dialogen gefunden: %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _ADDACTION_CHECK = '{
		private _WH_AA_STRING ='+ str _WH_AA_STRING +';
		private _error=[];
		{
			if !((player actionParams _x select 0) in _WH_AA_STRING) then {
				_error pushBack (player actionParams _x);
			};
			nil;
		} count (actionIDs player);

		if (count _error > 0) then {
			[getPlayerUID player,call(life_clientId)select 0,[54,format["Es wurden Bad AddActions gefunden: %1",_error]],true] remoteExecCall ["TON_fnc_report",2];
		};
	}';

	private _MONEYCHECK = '{
		if (de100_mSpace getVariable ["rdy",false]) then {
			if (!((de100_luciandjuli_bc + de100_luciandjuli_mula) isEqualTo (de100_mSpace getVariable ["cV",0])) && diag_tickTime - (de100_mSpace getVariable ["cT",diag_tickTime]) > 2) then {
				[getPlayerUID player,call(life_clientId)select 0,[55,format["Unerwartete Geldänderung. %1€ mehr/weniger als erwartet (%2 Sek.)",[de100_luciandjuli_bc + de100_luciandjuli_mula - (de100_mSpace getVariable ["cV",0])] call life_fnc_numberText,diag_tickTime - (de100_mSpace getVariable ["cT",diag_tickTime])]],true] remoteExecCall ["TON_fnc_report",2];
			};
		};
	}';

	private _PINGCHECK = '{
		private _ping = missionNamespace getVariable ["de100_ping",0];
		if (_ping > 0) then {
			if ((diag_tickTime - _ping) > '+ str _MAX_PING_TIME+') then {
				profileNamespace setVariable ["de100_ping_exceeded",true];
				saveProfileNamespace;
				endMission "pingCheck";
			};
		};
	}';

	AH_CODE = compile('
		call '+_DOUBLEUIDCHECK+';
		if (profileNamespace getVariable ["de100_ping_exceeded",false]) then {
			[getPlayerUID player,call(life_clientId)select 0,[57,"Möglicher Lagswitch gefunden"],true] remoteExecCall ["TON_fnc_report",2];
		};

		de100_mSpace = createLocation ["fakeTown", [-2000,-2000,-2000], 0, 0];
		private _WEAPONCHECK ='+_WEAPONCHECK+';
		private _DIALOGCHECK ='+_DIALOGCHECK+';
		private _BLVARIABLECHECK ='+_BLVARIABLECHECK+';
		private _PARSINGNMSCHECK ='+_PARSINGNMSCHECK+';
		private _BLACKLISTED_STRINGS_NMSCHECK ='+_BLACKLISTED_STRINGS_NMSCHECK+';
		private _BLACKLISTED_STRINGS_DIALOGCHECK ='+_BLACKLISTED_STRINGS_DIALOGCHECK+';
		private _ADDACTION_CHECK ='+_ADDACTION_CHECK+';
		private _MONEYCHECK ='+_MONEYCHECK+';
		private _threads = [];

		_threads pushBackUnique [{1},time-1,_MONEYCHECK];
		_threads pushBackUnique [{1},time-1,_PINGCHECK];
		_threads pushBackUnique [{5},time-4,_WEAPONCHECK];
		_threads pushBackUnique [{5},time-4,_DIALOGCHECK];
		_threads pushBackUnique [{5},time-4,_PARSINGNMSCHECK];
		_threads pushBackUnique [{30},time-15,_BLACKLISTED_STRINGS_DIALOGCHECK];
		_threads pushBackUnique [{30},time,_ADDACTION_CHECK];
		_threads pushBackUnique [{300},time-150,_BLVARIABLECHECK];
		_threads pushBackUnique [{300},time,_BLACKLISTED_STRINGS_NMSCHECK];

		_threads execFSM "core\fsm\AHC.fsm";
	');
};


AH_CODE remoteExecCall ['call',_unit];

//SERVERSIDE

// if(uiNamespace getVariable["AH_SSIDE_INIT",false])exitWith{};
// uiNamespace setVariable["AH_SSIDE_INIT",true];

// _ALLTHREADS=[];

// _HEARTBEAT_CHECK={
// 	_rdmkey='';
// 	for'_i'from 0 to 7 do{
// 		_rdmkey=_rdmkey+(str(round(random 9)));
// 		_rdmkey=_rdmkey+selectRandom['a','b','c','c','e','f','g','h','i','j','k','l','m','n','o','o','p','q','r','s','t','u','v','w','x','y','z'];
// 	};
// 	uiNamespace setVariable["AH_RDMKEY",_rdmkey];
// 	uiNamespace setVariable["AH_PLAYERS",allPlayers-[hc_1]];
// 	compile("
// 		_rdmkey='"+_rdmkey+"';
// 		[getPlayerUID player,(call life_clientId)select 0,_rdmkey]remoteExec['TON_fnc_confirm'];
// 	")remoteExec['call',allPlayers-[hc_1]];
// 	sleep 30;
// 	uiNamespace setVariable["AH_RDMKEY",""];

// 	_failed=uiNamespace getVariable["AH_PLAYERS",[]];
// 	if(count _failed > 0)then{
// 		{
// 			if(!isNull _x)then{
// 				if (life_HC_isActive&&(uiNamespace getVariable["AH_LOG_ENABLED",true])) then {
// 					[format["[%1|%2]",name _x,getPlayerUID _x]+"AntiCheat Heartbeat wurde nicht zurückgegeben. (Möglicherweise AntiCheat gekillt)","AntiHackLog"] remoteExec ["A3Log",HC_Life];
// 				} else {
// 					[format["[%1|%2]",name _x,getPlayerUID _x]+"AntiCheat Heartbeat wurde nicht zurückgegeben. (Möglicherweise AntiCheat gekillt)","AntiHackLog"] remoteExec ["A3Log",2];
// 				};
// 			};
// 		}forEach _failed;
// 	};
// };

// //_ALLTHREADS pushBack[{60},time,_HEARTBEAT_CHECK];

// /*[_ALLTHREADS]spawn{
// 	_ALLTHREADS=param[0,[],[[]]];
// 	for'_fuck'from 0 to 1 step 0 do {
// 		sleep .1;
// 		{
// 			if((time-(call(_x select 0)))>=(_x select 1))then{
// 				_this spawn(_x select 2);
// 				_ALLTHREADS set[_forEachIndex,[_x select 0,time,_x select 2]]
// 			}
// 		}forEach _ALLTHREADS;
// 	};	
// };