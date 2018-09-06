/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
life_gang_init = false;
waitUntil {!(isNull (findDisplay 46))};
0 cutText ["","BLACK IN",0.5];
call life_fnc_introCamCreate;
0 enableChannel [false,false];
1 enableChannel [false,false];
2 enableChannel [false,false];
3 enableChannel [true,false];
4 enableChannel [true,false];
5 enableChannel [true,false];
private _timeStamp = diag_tickTime;

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting DE100 Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "::DE100:: Warte darauf das die Unit bereit ist";

[.05,"Warte das die Unit bereit ist"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
waitUntil {!isNull player && player == player && isPlayer player && player in allPlayers}; //Wait till the player is ready
if (playerside isEqualTo civilian) then {
	[player] joinSilent (createGroup civilian);//Make sure player Joins Empty Gang;
};
diag_log ("::DE100:: Unit bereit UID"+(getPlayerUID player));

[.1,"Lösche parsingNamespace"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Lösche parsingNamespace";
{
	if(_x != 'mission_root')then{
		parsingNamespace setVariable[_x,nil];
	};
	nil;
} count (allVariables parsingNamespace);
diag_log "::DE100:: parsingNamespace gelöscht";
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
player setVariable["side",playerSide,true];
[.15,"Warte auf ClientID"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
private _bad = true;
for "_i" from 0 to 30 do {
	if !((missionNamespace getVariable ["life_clientId",{[]}]) isEqualTo {[]}) exitwith {_bad = false;};
	uiSleep 0.5;
};

if (_bad) exitwith {
	if (missionNamespace getVariable ["life_HC_isActive",false]) then {
		[format["%1 hatte nach 15 Sekunden keine CID",player call life_fnc_nameUID],"AntiHackLog"] remoteExecCall ["A3Log",HC_Life];
	} else {
		[format["%1 hatte nach 15 Sekunden keine CID",player call life_fnc_nameUID],"AntiHackLog"] remoteExecCall ["A3Log",2];
	};
	[] remoteExecCall ["life_fnc_dummy",2];
};
diag_log "::DE100:: CID erhalten";
diag_log "::DE100:: AH-Init";
[getPlayerUID player,(call life_clientId) select 0] remoteExecCall ["TON_fnc_transferID",2];
waitUntil {!(isNull (findDisplay 46))};
[.2,"Warte auf Arma HUD"] call life_fnc_introCamSetPerc;
uiSleep 0.4;

[.25,"Lade Variablen"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Lädt Config";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::DE100:: Config geladen";
waitUntil {!isNil "life_dp_point1s"};
[.3,"Setze Eventhandlers"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Lädt Player-EVH";
[] call life_fnc_setupPlayerEVH;
diag_log "::DE100:: Player-EVH geladen";

[.35,"Lade Mausradpunkte"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Lädt addActions";
[] call life_fnc_setupActions;
diag_log "::DE100:: addActions geladen";

[.4,"Tankstellen werden befüllt"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Tankstellen werden betankt";
waitUntil{!isNil "life_fuelstation_stationlist" && !isNil "tankstellen"};
[] call life_fnc_initFuelstations;
diag_log "::DE100:: Tankstellen betankt";

[.45,"Dealer werden plaziert"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Dealer werden gesetzt";
waitUntil {!isNil "DealerMarkers"};
[1] call life_fnc_dealerAddaction;
diag_log "::DE100:: Dealer gesetzt";

[.5,"Radarfallen werden justiert"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Radarfallen werden geladen";
[] call life_fnc_initRadars;
diag_log "::DE100:: Radarfallen gesetzt";

[.55,"Warte auf eine Antwort vom Server"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Warte auf den Server";
waitUntil{(missionNamespace getVariable ["life_server_isReady",false]) isEqualTo true};
if (life_server_isReady isEqualType "") exitWith {
    diag_log life_server_isReady;
    999999 cutText ["extDB failed to load, please contact an administrator.","PLAIN DOWN"];
};
diag_log "::DE100:: Server ist bereit";

[.6,"Warte auf eine Antwort vom Kopflosen"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Warte auf den HeadlessClient";

waitUntil{(missionNamespace getVariable ["life_HC_isActive",false]) isEqualTo true};
if (life_HC_isActive isEqualType "") exitWith {
    diag_log life_HC_isActive;
    999999 cutText ["extDB failed to load, please contact an administrator.","PLAIN DOWN"];
};
diag_log "::DE100:: HeadlessClient ist bereit";

[.65,format["Daten werden abgefragt [%1]",getPlayerUID player]] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Frage Daten ab";
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed && life_gang_init};
3 enableChannel [true,true];
4 enableChannel [true,true];
5 enableChannel [true,true];
setCurrentChannel 5;
player enableFatigue false;
player enableStamina false;
enableSentences false;
enableRadio false;

[.75,"Spieldaten geladen"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Daten empfangen";
diag_log "::DE100:: Setzte Mission Objekte";
[.8,"Objekte werden plaziert"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
private _time = diag_tickTime;
private _handle = [] execVM "buildings\buildings_1.sqf";
waitUntil {scriptDone _handle};
diag_log str (diag_tickTime-_time);
diag_log "::DE100:: Alle Mission Objekte plaziert";
[.85,"Starte Threads"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
diag_log "::DE100:: Starte FSM";
[] execFSM "core\fsm\de100.fsm";
[] execFSM "core\fsm\fatigue.fsm";
diag_log "Started all FSM Files";

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of DE100 Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
[.9,"Dreck wird weggeräumt"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
call life_fnc_manageSC;
[] spawn life_fnc_survival;
[] call life_fnc_updateViewDistance;

private _phoneNumber = if (profileNamespace getVariable ["DE100_CustomNumber",""] isEqualTo "") then {
	"01337"+((getPlayerUID player) select [10,7]);
} else {
	profileNamespace getVariable ["DE100_CustomNumber","nope"];
};
player setVariable["phoneNumber",_phoneNumber,true];
[.95,"Noch einen Moment"] call life_fnc_introCamSetPerc;
uiSleep 0.4;
life_fnc_moveIn = compileFinal
"
    player moveInCargo (_this select 0);
";

if (((getResolution select 0)/(getResolution select 1)) != (16/9) && !(profileNamespace getVariable ["DE100_DisplaySizeNotify",false])) then {
	profileNamespace setVariable ["DE100_DisplaySizeNotify",true];
	_action = [
		"Wir möchten Dich darauf hinweisen, dass Du keine 16:9-Auflösung hast. Dies kann zu Problemen mit den GUIs führen, da diese für 16:9 entwickelt wurden. Daher möchten wir Dich bitten dies umzustellen um das beste Spielerlebniss zu haben.",
		"Warnhinweis: Bildschirmauflösung",
		"Verstanden",
		false
	] spawn BIS_fnc_guiMessage;
};
1 call life_fnc_introCamSetPerc;
waitUntil {camCommitted life_intro_cam};
cutText ["","BLACK OUT",2];
uiSleep 2;
call life_fnc_introCamDestroy;
// Make sure the AucData are UpToDate every 10 min for the dept calc
[{600},time,{
	scriptName "Auc-Data-Refresh";
	[0,[],true] call life_fnc_loadAucData;
}]call life_fnc_threadControl;

call {
	if (playerSide isEqualTo civilian) exitWith {
		[] call life_fnc_initCiv;
	};

	if (playerSide isEqualTo west) exitWith {
		[] call life_fnc_initCop;
	};

	if (playerSide isEqualTo independent) exitWith {
		[] call life_fnc_initThr;
	};
};