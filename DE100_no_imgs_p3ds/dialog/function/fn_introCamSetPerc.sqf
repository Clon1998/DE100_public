/*
	File:	fn_introCamSetPerc.sqf
	Date:   2017-06-03 01:52:24
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_perc", 0, [0]],
	["_text", ""]
];
life_intro_cam_ctrls params[
	["_textCtrl", controlNull, [controlNull]],
	["_barCtrl", controlNull, [controlNull]]
];

if !(_text isEqualTo "") then {
	_textCtrl ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_text];
};

_barCtrl ctrlSetPosition [(0.314375 * safezoneW + safezoneX) + 0.185625 * safezoneW * (1-_perc),0.921 * safezoneH + safezoneY,0.37125 * safezoneW * _perc,0.033 * safezoneH];
_barCtrl ctrlSetBackgroundColor [0.7483-(_perc*0.7483),_perc*0.4,0,1];
_barCtrl ctrlCommit 0.1;
private _pos = call {
	if (_perc <= 0.3) exitwith {[4853.47,21959.3,5.22043] vectorDiff ([5.62012,22.3008,4.36664] vectorMultiply (_perc/0.3));};

	if (_perc <= 0.5) exitwith {[4847.85,21937,0.85379] vectorDiff ([-0.100098,18.6992,-16.242] vectorMultiply ((_perc-0.3)/0.2));};

	if (_perc <= 0.9) exitwith {[4847.95,21918.3,17.0958] vectorDiff ([-16.8096,-25.8984,-2.1107] vectorMultiply ((_perc-0.5)/0.4));};

	[4864.76,21944.2,19.2065] vectorDiff ([-3.53027,-3.90039,-0.491901] vectorMultiply ((_perc-0.9)/0.1));
};

private _dir = call {
	if (_perc <= 0.3) exitwith {[0.976481,-0.0154819,0.215646] vectorDiff ([1.02288,0.817393,-0.336096] vectorMultiply (_perc/0.3));};

	if (_perc <= 0.5) exitwith {[-0.0463998,-0.832875,0.551742] vectorDiff ([-0.629585,-1.62339,0.364034] vectorMultiply ((_perc-0.3)/0.2));};

	if (_perc <= 0.9) exitwith {[0.583185,0.790517,0.187708] vectorDiff ([0.178086,-0.12386,0.195919] vectorMultiply ((_perc-0.5)/0.4));};

	[0.405099,0.914377,-0.0082108] vectorDiff ([0.688676,-0.044701,-0.00539845] vectorMultiply ((_perc-0.9)/0.1));
};

life_intro_cam camSetPos _pos;
life_intro_cam camSetDir _dir;
life_intro_cam camCommit (10*(_perc - life_intro_cam_last));
life_intro_cam_last = _perc;