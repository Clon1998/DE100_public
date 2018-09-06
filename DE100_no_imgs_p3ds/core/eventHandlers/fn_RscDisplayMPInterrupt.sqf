/*
	File:   fn_RscDisplayMPInterrupt.sqf
	Author: Anton
	
	Description:
	Verwaltet das Escape-Menü in Echtzeit
*/

if(isNull(findDisplay 49))exitWith{};
_display=findDisplay 49;
_TitleBackground=_display displayCtrl 1050;
_Pause1=_display displayCtrl 1000;
_Pause2=_display displayCtrl 1001;
_Title=_display displayCtrl 523;
_MissionTitle=_display displayCtrl 120;
_PlayersName=_display displayCtrl 109;
_ButtonCancel=_display displayCtrl 2;
_ButtonSAVE=_display displayCtrl 103;
_ButtonSkip=_display displayCtrl 1002;
_ButtonRespawn=_display displayCtrl 1010;
_ButtonOptions=_display displayCtrl 101;
_ButtonVideo=_display displayCtrl 301;
_ButtonAudio=_display displayCtrl 302;
_ButtonControls=_display displayCtrl 303;
_ButtonGame=_display displayCtrl 307;
_ButtonTutorialHints=_display displayCtrl 122;
_ButtonAbort=_display displayCtrl 104;
_Version=_display displayCtrl 1005;

if((findDisplay 49)getVariable['init',false])exitWith{
	_NewButtonSAVE=_display displayCtrl 13371;
	_NewButtonRespawn=_display displayCtrl 13372;
	_NewButtonAbort=_display displayCtrl 13374;

	_NewButtonSAVE ctrlSetPosition ctrlPosition _ButtonSAVE;
	_NewButtonRespawn ctrlSetPosition ctrlPosition _ButtonRespawn;
	_NewButtonSAVE ctrlCommit 0;
	_NewButtonRespawn ctrlCommit 0;

	_aborttime=_NewButtonAbort getVariable['abort',time];
	_timeout=(10-(time-_aborttime));
	if(!((findDisplay 49)getVariable['abortStop',false])) then {
		if(_timeout<=0 || (call life_adminlevel) > 0)then{
			_NewButtonAbort ctrlSetText'DE100 verlassen';
			_NewButtonAbort ctrlEnable true;
			_NewButtonAbort buttonSetAction'
				[]spawn{
					_confirm=["Willst du DE100 wirklich verlassen? Deine Daten werden automatisch gespeichert.","DE100 verlassen?","Verlassen","Abbrechen",findDisplay 49]call BIS_fnc_GUIMessage;
					if(_confirm)then{
						[]spawn life_fnc_logout;
						(findDisplay 49)closeDisplay 2;
					};
				};
			';
			(findDisplay 49)setVariable['abortStop',true];
		}else{
			_NewButtonAbort ctrlSetText format['DE100 verlassen (%1 Sekunden)',round(_timeout)];
		};
	};
};

(findDisplay 49)setVariable['init',true];
1 call life_fnc_hudHide;
_display displayAddEventHandler ["Unload","call life_fnc_hudShow"];
_LogoDE100=_display ctrlCreate['RscPicture',-1];
_LogoDE100 ctrlSetPosition[0.839375 * safezoneW + safezoneX,0.0326666 * safezoneH + safezoneY,0.144375 * safezoneW,0.275 * safezoneH];
_LogoDE100 ctrlSetText'images\ui\ui_logo_full.paa';
_LogoDE100 ctrlCommit 0;

// _LogoPlayerIndex=_display ctrlCreate['RscPicture',-1];
// _LogoPlayerIndex ctrlSetPosition[0.799062 * safezoneW + safezoneX,0.00500001 * safezoneH + safezoneY,0.226875 * safezoneW,0.099 * safezoneH];
// _LogoPlayerIndex ctrlSetText'images\ui\ui_playerindex.paa';
// _LogoPlayerIndex ctrlCommit 0;

_NewButtonSAVE=_display ctrlCreate['RscStructuredText',13371];
_NewButtonSAVE ctrlSetStructuredText parseText'Teamspeak: <t colorLink="#FFFFFF"><a href="http://de100-altis.life/server">TS3.DE100-Altis.Life</a>';
_NewButtonSAVE ctrlSetTooltip'Besuche unseren Teamspeak³-Server';
_NewButtonSAVE ctrlSetPosition ctrlPosition _ButtonSAVE;
_NewButtonSAVE ctrlSetBackgroundColor[0,0,0,.8];
_NewButtonSAVE ctrlCommit 0;	
_NewButtonRespawn=_display ctrlCreate['RscStructuredText',13372];
_NewButtonRespawn ctrlSetStructuredText parseText'Webseite: <t colorLink="#FFFFFF"><a href="http://de100-altis.life">DE100-Altis.Life</a>';
_NewButtonRespawn ctrlSetTooltip'Besuche unsere Homepage (Forum, Bugreport, etc)';	
_NewButtonRespawn ctrlSetPosition ctrlPosition _ButtonRespawn;
_NewButtonRespawn ctrlSetBackgroundColor[0,0,0,.8];
_NewButtonRespawn ctrlCommit 0;
_NewButtonUID=_display ctrlCreate['RscText',13373];
_NewButtonUID ctrlSetText format['UserID: %1',getPlayerUID player];
_NewButtonUID ctrlSetTooltip'Deine UserID/SteamID64';	
_NewButtonUID ctrlSetPosition ctrlPosition _ButtonTutorialHints;
_NewButtonUID ctrlSetBackgroundColor[0,0,0,.8];
_NewButtonUID ctrlCommit 0;
_NewButtonAbort=_display ctrlCreate['RscButtonMenu',13374];
_NewButtonAbort ctrlSetText'DE100 verlassen (10 Sekunden)';
_NewButtonAbort ctrlSetPosition ctrlPosition _ButtonAbort;
_NewButtonAbort ctrlCommit 0;
_NewButtonAbort ctrlEnable false;
_NewButtonAbort setVariable['abort',time];
_MissionTitle ctrlSetText life_versionInfo;


_Title ctrlShow false;
_TitleBackground ctrlShow false;
_Version ctrlShow false;
_ButtonSAVE ctrlShow false;	
_ButtonRespawn ctrlShow false;
_ButtonAbort ctrlShow false;
_ButtonTutorialHints ctrlShow false;
_PlayersName ctrlShow false;
_Pause1 ctrlShow false;
_Pause2 ctrlShow false;

{_x ctrlSetFont'RobotoCondensed';if(ctrlClassName _x=='MissionNameBackground')then{_x ctrlSetBackgroundColor[0,0,0,.8]}}forEach(allControls(findDisplay 49));
private ["_handle"];
findDisplay 49 call life_fnc_bgBlure;