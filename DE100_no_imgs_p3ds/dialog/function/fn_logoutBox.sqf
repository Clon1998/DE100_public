/*
   File:    fn_logoutBox.sqf
   Date:    2017-10-6 13:31:41
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;

params[
	["_txt", "", [""]],
	["_kill", true]
];

if (isNull ((findDisplay 0) displayCtrl 825)) then {
	//Hide the new QuickPlayButtons since they suck
	with uiNamespace do {
		(findDisplay 0 displayCtrl 1123) ctrlShow false;
	};
	for "_i" from 1020 to 1022 do {
		with uiNamespace do {
			private _ctrl = findDisplay 0 displayCtrl _i;
			if (!isNull _ctrl) then {
				_ctrl ctrlShow false;
			};
		};
	};

	private _Header = (findDisplay 0) ctrlCreate ["RscPicture", 821];
	_Header ctrlSetPosition [0.2875,-0.32,0.45,0.6];
	_Header ctrlSetText format["%1images\ui\ui_logo_full.paa",MISSION_ROOT];
	_Header ctrlCommit 0;

	private _Main = (finddisplay 0) ctrlCreate ["RscStructuredText", 822];
	_Main ctrlSetPosition [-0.0375,0.16,1.075,0.701];
	_Main ctrlSetTextColor [1,1,1,1];
	_Main ctrlSetBackgroundColor [0,0,0,0.9];
	_Main ctrlCommit 0;

	private _Footer = (finddisplay 0) ctrlCreate ["RscStructuredText", 823];
	_Footer ctrlSetPosition [-0.0375,0.86,1.075,0.06];;
	_Footer ctrlSetTextColor [1,1,1,1];
	_Footer ctrlSetBackgroundColor [0,0,0,0.9];
	_Footer ctrlSetStructuredText parseText "<t size='1.2' align='left'><a href='http://www.de100-altis.life/'>DE100 Webseite</a></t> <t size='1.2' align='right'><a href='http://www.de100-altis.life/server/'>DE100 TeamSpeak</a></t>";
	_Footer ctrlCommit 0;

	private _Bottom = (finddisplay 0) ctrlCreate ["RscStructuredText", 824];
	_Bottom ctrlSetPosition [-0.0375,0.92,1.075,0.08];
	_Bottom ctrlSetTextColor [0,0,0,1];
	_Bottom ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]), (profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
	_Bottom ctrlCommit 0;

	private _Button = (finddisplay 0) ctrlCreate ["RscButton", 825];
	_Button ctrlSetPosition [-0.0375,0.92,1.075,0.08];
	_Button ctrlSetTextColor [1,1,1,1];
	_Button ctrlSetText "Schließen";
	_Button buttonSetAction "for '_i' from 821 to 825 step 1 do {ctrlDelete ((finddisplay 0) displayCtrl _i); }; for '_i' from 1020 to 1022 do {with uiNamespace do {_ctrl = findDisplay 0 displayCtrl _i; if (!isNull _ctrl) then {_ctrl ctrlShow true; }; }; };";
	_Button ctrlSetBackgroundColor [0.4,0,0,1];
	_Button ctrlCommit 0;
};

((findDisplay 0) displayCtrl 822) ctrlSetStructuredText parseText _txt;
if (_kill) then {
	for "_i" from 1 to 101 do {
		(findDisplay _i) closeDisplay 2;
	};
};