/*
	File:	fn_gangMenu.sqf
	Date:   2016-10-14 14:32:47
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull,[]]],
	["_mode", "", [""]],
	["_direction", "", [""]],
	"_ctrl",
	"_index"
];
private _isFill = false;
if (_display isEqualType []) then {
	_isFill = _display;
	_display = (findDisplay 2500);
};
if (isNull _display) exitwith {};
private _playerList = _display displayCtrl 2502;
private _gang = group player;
private _gangMembers = _gang getVariable ["gang_MEMBERS",[]];
private _playerPermissions = (_gangMembers select ([getPlayerUID player,_gangMembers] call life_fnc_index)) select 1;

if ("OWNER" in _playerPermissions) then {
	_display displayCtrl 2516 ctrlSetText "Auflösen";
	_display displayCtrl 2516 buttonSetAction "[] spawn life_fnc_terminateGang;";
} else {
	_display displayCtrl 2516 ctrlSetText "Verlassen";
	_display displayCtrl 2516 buttonSetAction "['leave',group player] spawn life_fnc_leaveGang;";
};
_display displayCtrl 2516 ctrlEnable true;
_display displayCtrl 2516 ctrlSetTooltip "";

switch (_mode) do { 
	case "general" : {
		life_gangSlider = "member";
		life_gangSliderReverse = "storehouses";
		_display setVariable ["mode","general"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
			nil;
		} count [2506,2507,2508,2509,2510,2511,2514,2515];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
			nil;
		} count [2503,2504,2505,2513,2512];

		_display displayCtrl 2499 ctrlSetText "Allgemeine Informationen";
		_display displayCtrl 2501 ctrlSetText "Allgemeine Informationen";
		_display displayCtrl 2513 ctrlSetText "Allgemeine Informationen";
		_display displayCtrl 2512 ctrlSetText "Online-Übersicht";
		_display displayCtrl 2505 ctrlEnable false;

		if (isClass (missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1]) + 1])) then {
			_display displayCtrl 2505 ctrlSetText format["Gang-Upgrade: €%1",[getNumber(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1]) + 1] >> "price")] call life_fnc_numberText];
			_display displayCtrl 2505 ctrlSetTooltip (getText(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1]) + 1] >> "tooltip"));
			_display displayCtrl 2504 buttonSetAction "[] spawn life_fnc_gangLevelUp;";
			_display displayCtrl 2504 ctrlEnable ("OWNER" in _playerPermissions);
		} else {
			_display displayCtrl 2505 ctrlSetText "Maximal Level erreicht!";
			_display displayCtrl 2505 ctrlSetTooltip "";
			_display displayCtrl 2504 buttonSetAction "";
			_display displayCtrl 2504 ctrlEnable false;
		};

		lbClear _playerList;
		{
			_index = _playerList lbAdd (_x call life_fnc_name);
			_playerList lbSetData [_index,netId _x];
			nil;
		} count units (group player);
		lbSort _playerList;
		if (lbSize _playerList > 0) then {
			_playerList lbSetCurSel 0;
		};

		private _spawn = if ((_gang getVariable ["gang_LEVEL",1]) >= 4) then {
			"<t color='#8cff9b'>Möglich</t>";
		} else {
			"<t color='#F24B4B'>Nicht möglich</t>";
		};


		private _markt = if ((_gang getVariable ["gang_LEVEL",1]) >= 5) then {
			"<t color='#8cff9b'>Kauf möglich</t>";
		} else {
			"<t color='#F24B4B'>Kauf nicht möglich</t>";
		};

		private _clothing = if ((_gang getVariable ["gang_LEVEL",1]) >= 6) then {
			"<t color='#8cff9b'>Kauf möglich</t>";
		} else {
			"<t color='#F24B4B'>Kauf nicht möglich</t>";
		};

		private _weapon = if ((_gang getVariable ["gang_LEVEL",1]) >= 7) then {
			"<t color='#8cff9b'>Kauf möglich</t>";
		} else {
			"<t color='#F24B4B'>Kauf nicht möglich</t>";
		};

		_display displayCtrl 2503 ctrlSetStructuredText parseText format["Gangname: %13%1<br/>Ganglevel: %2<br/>Gangmitglieder: %3/%6<br/>Gangmitglieder Online: %4<br/>Gangkontostand: €%5<br/>Lagerhäuser: %7/%8<br/>Spawnen an Lagerhäusern: %12<br/>Markt: %9<br/>Rebellen Kleidung: %10<br/>Rebellen Waffen: %11",_gang getVariable ["gang_NAME",""],_gang getVariable ["gang_LEVEL",1],count _gangMembers,count units _gang,[_gang getVariable ["gang_BANK",0]] call life_fnc_numberText, getNumber(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1])] >> "maxMember"),count (_gang getVariable ["gang_HOUSES",[]]),getNumber(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1])] >> "storehouses"),_markt,_clothing,_weapon,_spawn, _gang getVariable ["gang_TAG",""]];
	};

	case "member" : {
		life_gangSlider = "memberOff";
		life_gangSliderReverse = "general";
		if !("MEMBERMANAGER" in _playerPermissions) exitWith {
			if (_direction isEqualTo "left") then {
				[(findDisplay 2500),life_gangSliderReverse,'left'] call life_fnc_gangMenu;
			} else {
				[(findDisplay 2500),life_gangSlider,'right'] call life_fnc_gangMenu;
			};
		};
		_display setVariable ["mode","member"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
			nil;
		} count [2503,2504,2505];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
			nil;
		} count [2506,2507,2508,2509,2510,2511,2514,2515,2513,2512];

		_display displayCtrl 2499 ctrlSetText "Online Mitglieder Verwalten";
		_display displayCtrl 2501 ctrlSetText "Online Mitglieder Verwalten";
		_display displayCtrl 2513 ctrlSetText "Rechte Verwalten";
		_display displayCtrl 2512 ctrlSetText "Online-Übersicht";

		_display displayCtrl 2505 ctrlSetTooltip "";
		_display displayCtrl 2504 buttonSetAction "[] spawn life_fnc_newLeader;";
		_display displayCtrl 2505 ctrlEnable false;

		_display displayCtrl 2516 ctrlSetText "Rauswerfen";
		_display displayCtrl 2516 buttonSetAction "[] spawn life_fnc_kickOut;";

		lbClear _playerList;
		{
			_index = _playerList lbAdd (_x call life_fnc_name);
			_playerList lbSetData [_index,netId _x];
			nil;
		} count units (group player);
		lbSort _playerList;
		if (lbSize _playerList > 0) then {
			_playerList lbSetCurSel 0;
		};
	};

	case "memberOff" : {
		life_gangSlider = "invite";
		life_gangSliderReverse = "member";
		if !("MEMBERMANAGER" in _playerPermissions) exitWith {
			if (_direction isEqualTo "left") then {
				[(findDisplay 2500),life_gangSliderReverse,'left'] call life_fnc_gangMenu;
			} else {
				[(findDisplay 2500),life_gangSlider,'right'] call life_fnc_gangMenu;
			};
		};
		_display setVariable ["mode","memberOff"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
			nil;
		} count [2503,2505,2504];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
			nil;
		} count [2506,2508,2510,2514,2513,2512];

		{
			_display displayCtrl _x ctrlShow true;
			_display displayCtrl _x ctrlEnable false;
			_display displayCtrl _x cbSetChecked false;
			nil;
		} count [2507,2509,2511,2515];

		_display displayCtrl 2499 ctrlSetText "Offline Mitglieder Verwalten";
		_display displayCtrl 2501 ctrlSetText "Offline Mitglieder Verwalten";
		_display displayCtrl 2512 ctrlSetText "Offline-Übersicht";
		_display displayCtrl 2513 ctrlSetText "Rechte Verwalten";

		_display displayCtrl 2516 ctrlSetText "Rauswerfen";
		_display displayCtrl 2516 buttonSetAction "[] spawn life_fnc_kickOutLocal;";
		if (_isFill isEqualType []) then {			
			lbClear _playerList;
			{
				_index = _playerList lbAdd (_x select 0);
				_playerList lbSetData [_index,(_x select 1)];
				nil;
			} count _isFill;
			lbSort _playerList;
			if (lbSize _playerList > 0) then {
				_playerList lbSetCurSel 0;
			} else {
				_playerList lbSetData [(_playerList lbAdd "Keiner"),"exit"];
				_display displayCtrl 2516 ctrlEnable false;
			};
		} else {
			lbClear _playerList;
			_playerList lbSetData [(_playerList lbAdd "Warte auf Server"),"exit"];
			private _req = "";
			{
				if !([_x select 0,civilian] call life_fnc_isUIDActive) then {
					if (_req isEqualTo "") then {
						_req = format["'%1'",_x select 0];
					} else {
						_req = format["%1, '%2'",_req,_x select 0];
					};
				};
				nil;
			} count _gangMembers;
			if (life_HC_isActive) then {
				[_gang getVariable ["gang_ID",1],_req,_direction,clientOwner] remoteExecCall ["HC_fnc_fetchOfflineMembers",HC_Life];
			} else {
				[_gang getVariable ["gang_ID",1],_req,_direction,clientOwner] remoteExecCall ["TON_fnc_fetchOfflineMembers",2];
			};
		};
	};


	case "invite" : {
		life_gangSlider = "storehouses";
		life_gangSliderReverse = "memberOff";
		if !("INVITE" in _playerPermissions) exitWith {
			if (_direction isEqualTo "left") then {
				[(findDisplay 2500),life_gangSliderReverse,'left'] call life_fnc_gangMenu;
			} else {
				[(findDisplay 2500),life_gangSlider,'right'] call life_fnc_gangMenu;
			};
		};
		_display setVariable ["mode","invite"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
			nil;
		} count [2503];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			nil;
		} count [2513,2504,2505,2506,2507,2508,2509,2510,2511,2514,2515];

		_display displayCtrl 2499 ctrlSetText "Spieler einladen";
		_display displayCtrl 2501 ctrlSetText "Spieler einladen";
		_display displayCtrl 2512 ctrlSetText "Spieler-Liste";
		_display displayCtrl 2513 ctrlSetText "Rechte Verwalten";

		_display displayCtrl 2505 ctrlSetTooltip "";
		_display displayCtrl 2505 ctrlEnable false;
		_display displayCtrl 2504 buttonSetAction "if(count((group player)getVariable['gang_MEMBERS',[]])>=(getNumber(missionConfigFile>>'life_gang_config'>>'levels'>>format['level_%1',((group player)getVariable['gang_LEVEL',1])]>>'maxMember')))exitwith{['Die maximale Anzahl an Mitgliedern wurde erreicht.',true,'fast']call life_fnc_notification_system;};_display=findDisplay 2500;private _perm=[['BANK',cbChecked(_display displayCtrl 2507)],['MEMBERMANAGER',cbChecked(_display displayCtrl 2509)],['INVITE',cbChecked(_display displayCtrl 2511)],['HOUSE',cbChecked(_display displayCtrl 2515)]];[player,group player,_perm]remoteExec['life_fnc_invitePlayer',objectFromNetId(((findDisplay 2500)displayCtrl 2502)lbData(lbCurSel((findDisplay 2500)displayCtrl 2502)))];";

		if ("OWNER" in _playerPermissions) then {
			_display displayCtrl 2516 ctrlSetText "Umbenennen";
			_display displayCtrl 2516 buttonSetAction "closeDialog 0; createDialog 'Life_Rename_Gang';";
			_display displayCtrl 2516 ctrlSetTooltip format["Das Umbenennen kostet %1€",[getNumber(missionConfigFile >> "life_gang_config" >> "gang_rename_price")] call life_fnc_numberText];
		};

		lbClear _playerList;
		{
			_index = _playerList lbAdd (_x call life_fnc_name);
			_playerList lbSetData [_index,netId _x];
			nil;
		} count (allPlayers select {side _x == civilian && (group _x) getVariable ["gang_ID",-1] < 0});
		lbSort _playerList;
		if (lbSize _playerList > 0) then {
			_playerList lbSetCurSel 0;
		} else {
			_playerList lbSetData [(_playerList lbAdd "Keiner"),"exit"];
			{
				_display displayCtrl _x ctrlEnable false;
				_display displayCtrl _x cbSetChecked false;
				nil;
			} count [2507,2509,2511,2515];
		};
	};

	case "storehouses" : {
		life_gangSlider = "general";
		life_gangSliderReverse = "invite";
		if (getNumber(missionConfigFile >> "life_gang_config" >> "levels" >> format["level_%1",(_gang getVariable ["gang_LEVEL",1])] >> "storehouses") isEqualTo 0) exitWith {
			if (_direction isEqualTo "left") then {
				[(findDisplay 2500),life_gangSliderReverse,'left'] call life_fnc_gangMenu;
			} else {
				[(findDisplay 2500),life_gangSlider,'right'] call life_fnc_gangMenu;
			};
		};
		_display setVariable ["mode","storehouses"];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
			nil;
		} count [2506,2507,2508,2509,2510,2511,2514,2515];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
			nil;
		} count [2503,2504,2513,2512];

		_display displayCtrl 2499 ctrlSetText "Lagerhäuser Informationen";
		_display displayCtrl 2501 ctrlSetText "Lagerhäuser Informationen";
		_display displayCtrl 2513 ctrlSetText "Lagerhäuser Informationen";
		_display displayCtrl 2512 ctrlSetText "Lagerhäuser-Übersicht";

		_display displayCtrl 2503 ctrlSetStructuredText parseText "";
		_display displayCtrl 2505 ctrlSetTooltip "";
		_display displayCtrl 2505 ctrlEnable false;
		_display displayCtrl 2504 buttonSetAction "";
		_display displayCtrl 2504 ctrlEnable false;

		_display displayCtrl 2516 ctrlSetText "Verkaufen";
		_display displayCtrl 2516 buttonSetAction "[objectFromNetId (((findDisplay 2500) displayCtrl 2502) lbData (lbCurSel ((findDisplay 2500) displayCtrl 2502)))] spawn life_fnc_sellStorehouse;";
		_display displayCtrl 2516 ctrlEnable ("OWNER" in _playerPermissions);

		lbClear _playerList;
		{
			_index = _playerList lbAdd "Lagerhaus";
			_playerList lbSetData [_index,netId _x];
			nil;
		} count (_gang getVariable ["gang_HOUSES",[]]);
		lbSort _playerList;
		if (lbSize _playerList > 0) then {
			_playerList lbSetCurSel 0;
		} else {
			_index = _playerList lbAdd "Keine Lagerhäuser";
			_playerList lbSetData [_index,"exit"];
		};
	};
};