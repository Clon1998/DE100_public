/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender","_whitelistedChars","_error","_nameChars"];
_whitelistedChars = toArray getText(missionConfigFile >> "Life_Settings" >> "allowed_dbChars");
_error = [];
_nameChars = toArray (toLower profileName);

{
	if !(_x in _whitelistedChars) then {
		_error pushBack _x;
	};
} forEach _nameChars;

if (count _error > 0) exitWith {
	player setVariable [(format["logout_validate_id_%1",getPlayerUID player]),true,true];
	_error = toString _error;
	waitUntil {isClass(missionConfigFile >> "CfgDebriefing" >> "aborted") && !isNull (findDisplay 46) && !isNull player && player == player};
	[format["<t size='1.2' align='center'><t size='2'>Unzulässige Zeichen im Spielernamen</t><br/><br/>Hallo %1, dein Name enthält Zeichen, welche zu Problemen in der Datenbank führen können.<br/>Bitte entferne diese/s Zeichen, da du ansonsten nicht auf DE100 spielen kannst.<br/><t size='1.4'>Zeichen: </t><t color='#9C302C'>%2</t><br/><br/>Mit freundlichen Grüßen,<br/>Das DE100-Team</t>",profileName,_error]] call life_fnc_logoutBox;
	[.7,"Fehler ..."] call life_fnc_introCamSetPerc;
	endMission "CharCheck";
};

if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...

if (life_HC_isActive) then {
	[getPlayerUID player,call life_clientId select 0] remoteExecCall ["PL_fnc_request",HC_Life];
} else {
	[getPlayerUID player,call life_clientId select 0] remoteExecCall ["PL_fnc_request",2];
};