/*
	File:   fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/

if (!alive player || dialog) exitWith {};
if (player getVariable ["restrained",false]) exitWith {
	["Du bist gefesselt", false, "fast"] call life_fnc_notification_system;
};
createDialog "playerSettings";
setMousePosition [0.5, 0.5];
disableSerialization;

private _d = findDisplay 2001;
private _btnGang = _d displayCtrl 2011;
private _btnAdmin = _d displayCtrl 2021;
private _btnAuc = _d displayCtrl 2521;
switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2046,false];
		ctrlShow[2045,false];	
		ctrlShow[9800,false];
		ctrlShow[2222,false];
		if((call life_coplevel) >= 10 ) then {ctrlShow[9800,true];};
		_btnGang ctrlSetText localize "STR_PM_WantedList";
		_btnGang buttonSetAction "createDialog 'life_copHQ';";

	};
	
	case civilian:
	{
		ctrlShow[2046,false];
		ctrlShow[2045,false];
		ctrlShow[9800,false];
		_btnGang ctrlSetText "Gang";
		_btnGang buttonSetAction "if ((group player) getVariable ['gang_ID',-1] >= 0) then {createDialog 'Life_Gang_System'; } else {createDialog 'Life_Create_Gang'; };";

		_btnAuc ctrlSetText "Auktionen";
		_btnAuc buttonSetAction "[0,[],false] call life_fnc_loadAucData;";

		if (!(player getVariable "Perso_has_IdCard")) then {
			_btn = (findDisplay 2001) displayCtrl 2223;
			_btn ctrlSetText "Kein Perso";
			_btn ctrlEnable false;
			_btn ctrlCommit 0;
			ctrlSetText[2222,"images\icons\ico_noid.paa"];
		} else {
			ctrlSetText[2222,"images\icons\ico_hasid.paa"];
		};
	};
	case independent:
	{
		ctrlShow[2046,false];
		ctrlShow[2045,false];
		ctrlShow[2222,false];
		_btnGang ctrlSetText "Zentrale";
		_btnGang buttonSetAction "closeDialog 0; createdialog 'THR_HQ';";

		_btnAuc ctrlSetText "Squadmanager";
		_btnAuc buttonSetAction "[] spawn life_fnc_showJoiner;";

		if((call life_thrlevel) < 5) then{ctrlShow[9800,false];};	
	};
};



if((call life_adminlevel) < 1) then
{
	_btnAdmin ctrlShow true;
	_btnAdmin ctrlSetText "Infos";
	_btnAdmin buttonSetAction "createDialog ""life_infos"";";
	_btnAdmin ctrlCommit 0;
} else {
	_btnAdmin ctrlShow true;
	_btnAdmin ctrlSetText (localize "STR_PM_AdminMenu");
	_btnAdmin buttonSetAction "call life_fnc_adminMenu";
	_btnAdmin ctrlCommit 0;
};

[] call life_fnc_p_updateMenu;
