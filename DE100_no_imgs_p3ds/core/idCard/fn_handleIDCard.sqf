/*
   File:    fn_handleIDCard.sqf
   Date:    2017-10-6 18:19:40
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   0 - Show Local
   1 - Show to Target
*/
disableSerialization;
params[
	["_type", 0, [0]],
	["_target", objNull, [objNull]]
];

if (isNull _target || !isPlayer _target) exitWith {};

if (_type == 0) exitWith {
	private _continue = true;
	if (isRemoteExecuted) then {
		_continue = ["<t size='.8px' align='center'>Jemand möchte dir seinen Personalausweis zeigen.<br/> Möchtest du ihn sehen ?</t>","Fortfahren?","Weiter","Abbrechen"]call BIS_fnc_GUIMessage;
	};
	if (!_continue) exitWith {};
	private _side = side _target;
	private _pData = _target getVariable ["idCard",[]];
	if (_pData isEqualto []) exitWith {
		systemchat "error";
	};
	createDialog (["life_state_idCard","Life_civ_idCard"] select (_side isEqualTo civilian));
	if (_side isequalto civilian) then {
		ctrlSetText [9402, _target call life_fnc_name];
		ctrlSetText [9403, _pData select 0];
		ctrlSetText [9405, _pData select 1];
		ctrlSetText [9404, _pData select 2];
		ctrlSetText [9406,  (_pData select 3) + " CM"];
		ctrlSetText [9408, _pData select 4];
		ctrlSetText [9407, _pData select 5]; 
	} else {
		ctrlSetText [9302, _target call life_fnc_name];
		ctrlSetText [9305, _pData select 0];
		ctrlSetText [9304, _pData select 1];
		ctrlSetText [9303, _pData select 2];
	};
	if !(_target isEqualTo player) then {
		life_perso_seen = life_perso_seen select {alive _x};
		life_perso_seen pushBackUnique _target;
	};
};

[0,player] remoteExec ["life_fnc_handleIdCard",_target];