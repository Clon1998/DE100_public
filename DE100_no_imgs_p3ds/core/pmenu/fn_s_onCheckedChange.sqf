/*
	File: fn_s_onCheckedChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Switching it up and making it prettier..
*/
private["_option","_state"];
_option = _this select 0;
_state = _this select 1;

switch(_option) do {
	case "tags": {
		if(_state isEqualTo 1) then {
			life_tagson = true;
			profileNamespace setVariable["life_settings_tagson",true];
		} else {
			life_tagson = false;
			profileNamespace setVariable["life_settings_tagson",false];
		};
	};

	case "intro": {
		if(_state isEqualTo 1) then {
			life_skipintro = true;
			profileNamespace setVariable["life_skipintro",true];
		} else {
			life_skipintro = false;
			profileNamespace setVariable["life_skipintro",false];
		};
	};
	
	case "objects": {
		if(_state isEqualTo 1) then {
			life_revealObjects = true;
			profileNamespace setVariable["life_revealObjects",true];
			LIFE_ID_RevealObjects = addMissionEventHandler ["EachFrame", {call life_fnc_revealObjects}];
		} else {
			life_revealObjects = false; 
			profileNamespace setVariable["life_revealObjects",false];
			removeMissionEventHandler ["EachFrame",LIFE_ID_RevealObjects];
		};
	};
	
	case "sidechat": {	
		if(_state isEqualTo 1) then {
			life_sidechat = true;
			profileNamespace setVariable["life_sidechat",true];
		} else {
			life_sidechat = false;
			profileNamespace setVariable["life_sidechat",false];
		};
		call life_fnc_manageSC;
	};

	case "screenshot": {	
		if(_state isEqualTo 1) then {
			life_screenshot = true;
			1 call life_fnc_hudHide;
			profileNamespace setVariable["life_screenshot",true];
		} else {
			life_screenshot = false;
			call life_fnc_hudShow;
			profileNamespace setVariable["life_screenshot",false];
		};
		[] spawn life_fnc_screenshot;
	};

	case "notify": {	
		if(_state isEqualTo 1) then {
			profileNamespace setVariable["de100_notify",true];
		} else {
			profileNamespace setVariable["de100_notify",false];
		};
	};

	case "phone": {	
		if(_state isEqualTo 1) then {
			profileNamespace setVariable["DarkPhone",true];
		} else {
			profileNamespace setVariable["DarkPhone",false];
		};
		["Damit die Änderung wirksam wird, musst du reloggen.",false,"fast"] call life_fnc_notification_system;
	};
};