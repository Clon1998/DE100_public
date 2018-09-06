/*
	File:	fn_smartphoneMsgView.sqf
	Date:   2016-08-01 17:05:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_mode", "", [""]],
	"_type",
	"_index",
	"_text",
	"_name"
];
private _display = findDisplay 7100;
private _SearchEdit = _display displayCtrl 7098;
private _SearchText = _display displayCtrl 7099;
private _header = _display displayCtrl 7100;
private _playerList = _display displayCtrl 7101;
private _ctrlGrp = _display displayCtrl 7102;
private _edit = _display displayCtrl 7103;
private _sendBtn = _display displayCtrl 7104;
private _sendPic = _display displayCtrl 7105;
private _emojiBtn = _display displayCtrl 7106;
private _emojiPic = _display displayCtrl 7107;
private _back = _display displayCtrl 7108;

switch (_mode) do {
	case "contacts" : {
		_playerList ctrlShow true;
		_SearchEdit ctrlShow true;
		_SearchText ctrlShow true;
		_header ctrlShow false;
		_edit ctrlShow false;
		_sendBtn ctrlShow false;
		_ctrlGrp ctrlShow false;
		_sendPic ctrlShow false;
		_emojiBtn ctrlShow false;
		_emojiPic ctrlShow false;
		_back buttonSetAction "closeDialog 0;";
		lbClear _playerList;
		{
			_type = switch(side _x) do {case west: {"Polizei";}; case civilian: {"Zivilist";}; case independent: {"THR";}; };
			_index = _playerList lbAdd format["%1 (%2)",[_x] call life_fnc_name,_type];
			_playerList lbSetData [_index,netId(_x)];
		} forEach (allPlayers select {alive _x && _x != hc_1 && _x != player});
		lbSort _playerList;
	}; 
	case "write" : {
		_back buttonSetAction "['contacts'] spawn life_fnc_smartphoneMsgView;";
		private _target = objectFromNetId (_playerList lbData (lbCurSel _playerList));
		if (isNull _target) then {
			_target = life_smartphoneTarget;
		};
		if (isNull _target) exitWith {};
		private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
		private _msgArray = profileNamespace getVariable[format["DE100_%1_%2",_flag,getPlayerUID _target],[]];
		if !(_msgArray isEqualType []) exitWith {};
		private _footerPos = 0;
		private _footerHigh = 0.005 * safezoneH;
		life_smartphoneTarget = _target;
		_playerList ctrlShow false;
		_SearchEdit ctrlShow false;
		_SearchText ctrlShow false;
		_header ctrlShow true;
		_edit ctrlShow true;
		_sendBtn ctrlShow true;
		_ctrlGrp ctrlShow true;
		_sendPic ctrlShow true;
		_emojiBtn ctrlShow true;
		_emojiPic ctrlShow true;
		{
			ctrlDelete _x;
		} forEach ((allControls _display) select {ctrlParentControlsGroup _x isEqualTo _ctrlGrp});
		_header ctrlSetStructuredText parseText format["<t size='1.3'>%1</t><br/><t size='1'>%2</t>",[_target] call life_fnc_name,switch (side _target) do {case west : {"Polizei"; }; case civilian : {"Zivilist"; }; case independent : {"THR"; }; }];
		if (count _msgArray > 0) then {
			{
				private _type = _x select 0;
				private _msg = _x select 1;
				private _timeStamp = _x select 2;

				private _textField = _display ctrlCreate ["RscStructuredText",100 +_forEachIndex,_ctrlGrp];
				private _footer = _display ctrlCreate ["RscStructuredText",200 +_forEachIndex,_ctrlGrp];
				private _offset = if (_type isEqualTo "recive") then {
					0.01 * safezoneW;
				} else {
					0.06 * safezoneW;
				};

				_textField ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.5,0.093917 * safezoneW,0];
				_footer ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.5,0.093917 * safezoneW,0];
				_textField ctrlSetBackgroundColor [0,0,0,0.7];
				_footer ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
				_textField ctrlCommit 0;
				_footer ctrlCommit 0;

				_textField ctrlSetStructuredText parseText _msg;
				_footer ctrlSetStructuredText parseText (format["<t align='center'>%1</t>",_timeStamp]);

				_textField ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.3,0.093917 * safezoneW,ctrlTextHeight _textField];
				_footer ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.3 + ctrlTextHeight _textField,0.093917 * safezoneW,ctrlTextHeight _footer];
				_textField ctrlCommit 0;
				_footer ctrlCommit 0;

				_footerPos = _footerPos + _footerHigh * 1.3 + ctrlTextHeight _textField;
				_footerHigh = (ctrlPosition _footer select 3);
			} forEach _msgArray;
		};

	}; 
	case "search" : {
		_text = ctrlText _SearchEdit;
		lbClear _playerList;
		{
			_name = [_x] call life_fnc_name;
			if (toLower _name find toLower _text > -1 || _text isEqualTo "") then {
				_type = switch(side _x) do {case west: {"Polizei";}; case civilian: {"Zivilist";}; case independent: {"THR";}; };
				_index = _playerList lbAdd format["%1 (%2)",_name,_type];
				_playerList lbSetData [_index,netId(_x)];
			};
		} forEach (allPlayers select {alive _x && _x != hc_1 && _x != player});
		lbSort _playerList;
	};
};