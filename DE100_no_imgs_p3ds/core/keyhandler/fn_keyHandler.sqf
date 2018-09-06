/*
	File: fn_keyHandler.sqf
	Author: Anton & Lucian
	
	Description:
	Verbesserte Version des Keyhandlers, der zu einfachen Verwaltung führt.
*/
params[
	["_mode", 0, [0]],
	["_data", [], [[]]]
];

_data params[
	["_ctrl", displayNull, [displayNull]],
	["_keyCode", 0, [0]],
	["_shift", false, [false]],
	["_ctrl", false, [false]],
	["_alt", false, [false]]
];

if !(missionNamespace getVariable["life_session_completed",false]) exitWith {true;};

private _stop = false;
private _vPlayerInv = if((actionKeys "User9") isEqualTo []) then {[21]} else {(actionKeys "User9")};
private _interactionKey = if((actionKeys "User10") isEqualTo []) then {[219]} else {(actionKeys "User10")};
private _redgullKey = if((actionKeys "User11") isEqualTo []) then {[3]} else {(actionKeys "User11")};
private _sirenKey = if((actionKeys "User12") isEqualTo []) then {[33]} else {(actionKeys "User12")};
private _VoN_Keys = (actionKeys "PushToTalk") + (actionKeys "PushToTalkDirect") + (actionKeys "PushToTalkVehicle");
private _interruptionKeys = [57,20] + _vPlayerInv + (actionKeys "MoveBack") + (actionKeys "MoveForward") + (actionKeys "TurnRight") + (actionKeys "TurnLeft") + (actionKeys "Gear");

call {
	if (_mode == 0) exitWith {
		//Prevent holding of a Key

		if (uiNamespace getVariable [format["pressed_%1",_keyCode],false] && !(_keyCode in [5,6] && (call life_adminlevel) > 0) && _shift) exitWith {};
		uiNamespace setVariable [format["pressed_%1",_keyCode],true];
		
		if (_keyCode in _VoN_Keys && !(player getVariable ["VoN_Talking",false])) then {
			player setVariable["VoN_Talking", true, true];
		};

		//Vault handling...
		if((_keyCode in (actionKeys "GetOver") || _keyCode in (actionKeys "salute")) && (player getVariable ["restrained",false])) exitWith {
			_stop=true;
		};

		if(life_action_inUse) exitWith {
			if(!life_interrupted && _keyCode in _interruptionKeys) then {life_interrupted = true;};
		};

		if ((!alive player || !(player getVariable ["isAlive",true])) && _keyCode != 60) exitWith {};
		if ((!alive player || !(player getVariable ["isAlive",true])) && _keyCode == 60 && call (life_adminlevel) == 0) exitWith {};

		if(_keyCode==57)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key57.sqf")};
		if(_keyCode==35)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key35.sqf")};
		if(_keyCode in _interactionKey)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key_interactionKey.sqf")};
		if(_keyCode==19)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key19.sqf")};
		if(_keyCode==34)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key34.sqf")};
		if(_keyCode==20)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key20.sqf")};
		if(_keyCode==2)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key2.sqf")};
		if(_keyCode in _redgullKey)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key_redgullKey.sqf")};
		if(_keyCode==4)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key4.sqf")};
		if(_keyCode==211)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key211.sqf")};
		if(_keyCode==5)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key5.sqf")};
		if(_keyCode==6)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key6.sqf")};
		if(_keyCode==8)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key8.sqf")};
		if(_keyCode==38)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key38.sqf")};
		if(_keyCode in _vPlayerInv)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key_vPlayerInv.sqf")};
		if(_keyCode==24)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key24.sqf")};
		if(_keyCode in _sirenKey)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key_sirenKey.sqf")};
		if(_keyCode==22)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key22.sqf")};
		if(_keyCode==59)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key59.sqf")};
		if(_keyCode==60)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key60.sqf")};
		if(_keyCode==61)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key61.sqf")};
		if(_keyCode==65)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key65.sqf")};

		if(_keyCode==79)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key79.sqf")};//1
		if(_keyCode==80)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key80.sqf")};//2
		if(_keyCode==81)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key81.sqf")};//3
		if(_keyCode==75)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key75.sqf")};//4
		if(_keyCode==76)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key76.sqf")};//5
		if(_keyCode==77)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key77.sqf")};//6
		if(_keyCode==71)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key71.sqf")};//7
		if(_keyCode==72)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key72.sqf")};//8
		if(_keyCode==73)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key73.sqf")};//9
		if (_keyCode in actionKeys "tacticalView") then {
			_stop=true;
		};
		if (_keyCode in (actionKeys "CommandingMenu1" + actionKeys "CommandingMenu2" + actionKeys "CommandingMenu3" + actionKeys "CommandingMenu4" + actionKeys "CommandingMenu5" + actionKeys "CommandingMenu6" + actionKeys "CommandingMenu7" + actionKeys "CommandingMenu8" + actionKeys "CommandingMenu9" + actionKeys "CommandingMenu0" + actionKeys "selectAll" + actionKeys "SelectGroupUnit1" + actionKeys "SelectGroupUnit2" + actionKeys "SelectGroupUnit3" + actionKeys "SelectGroupUnit4" + actionKeys "SelectGroupUnit5" + actionKeys "SelectGroupUnit6" + actionKeys "SelectGroupUnit7" + actionKeys "SelectGroupUnit8" + actionKeys "SelectGroupUnit9" + actionKeys "SelectGroupUnit0" + actionKeys "SetTeamRed" + actionKeys "SetTeamGreen" + actionKeys "SetTeamBlue" + actionKeys "SetTeamYellow" + actionKeys "SetTeaWhite" + actionKeys "SelectTeamRed" + actionKeys "SelectTeamGreen" + actionKeys "SelectTeamBlue" + actionKeys "SelectTeamYellow" + actionKeys "SelectTeamWhite")) then {
			_stop = true;
		};
	};
	if (_mode == 1) exitWith {
		//Prevent holding of a Key
		uiNamespace setVariable [format["pressed_%1",_keyCode],false];
		if (_keyCode in _VoN_Keys) then {
			player setVariable["VoN_Talking", nil, true];
		};
		if(_keyCode==4)then{_stop=[_shift,_ctrl,_alt,false,_interactionKey]call(compile preprocessFileLineNumbers"core\keyhandler\key4.sqf")};
	};
};
_stop;