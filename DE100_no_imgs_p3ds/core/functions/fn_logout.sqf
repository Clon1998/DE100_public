/*
	File:	fn_logout.sqf
	Date:   11.12.2015
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

private["_introCam"];
private _debrifing = "aborted";
player setVariable [(format["logout_validate_id_%1",getPlayerUID player]),true,true];
if (life_session_completed) then {
	[] call SOCK_fnc_updateRequest;
	profileNamespace setVariable [format["DE100_%1_thirst",playerSide],life_thirst];
	profileNamespace setVariable [format["DE100_%1_hunger",playerSide],life_hunger];
	profileNamespace setVariable [format["DE100_%1_dammage",playerSide],(getDammage player)];
	if (playerSide in [civilian,west] && alive player) then {
		if (!life_session_completed || life_firstSpawn || life_pause_pos || !(player getVariable ["isAlive",true]))exitWith{};
		_lastPos = visiblePosition player;
		_lastPos set[2,0];
		bank_obj setVariable [(format["DE100_UID_%2_%1",(getPlayerUID player),playerSide]),_lastPos,true];
	};
} else {
	_debrifing = "abortedNoSync";
	999 cutText ["","BLACK OUT",0.01];
};

[format["<t size='1.4' align='center'><t size='2'>Danke für deinen Besuch auf DE100</t><br/><br/>Das De100-Team bedankt sich für deinen Besuch auf dem DE100 Altis Life Server und freut sich auf deinen nächsten Besuch.<br/><br/>Webseite: <a href='http://www.de100-altis.life/'>DE100-Altis.Life</a><br/>TeamSpeak: <a href='http://www.de100-altis.life/server/'>TS3.DE100-Altis.Life</a></t>"],false] call life_fnc_logoutBox;

disableSerialization;
player allowDamage false;
[player] joinSilent (createGroup civilian);
disableUserInput true;
showChat false;
hintSilent "";
[_debrifing,true,2.4] call BIS_fnc_endMission;
2.4 fadeSound 0;
2.4 fadeRadio 0;
2.4 fadeSpeech 0;
2.4 fadeMusic 0;
1 call life_fnc_hudHide;
life_revealObjects = false;

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1.85];

_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 1;
waitUntil {camCommitted _introCam};

_introCam camSetFov 9;
_introCam camSetRelPos [0,-5,1050.85];
_introCam camCommit 1.5;
waitUntil {camCommitted _introCam};


if(!life_is_arrested) then {
	player setPos (getMarkerPos "respawn_civilian");
};

_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;
