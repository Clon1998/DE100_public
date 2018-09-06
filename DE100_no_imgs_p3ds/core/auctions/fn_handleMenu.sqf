/*
	File:	fn_handleMenu.sqf
	Date:   2017-08-10 17:52:28
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_btn", controlNull, [controlNull,displayNull]],
	["_forceClose",false],
	"_display"
];

if (_btn isEqualType controlNull) then {
	_display = ctrlParent _btn;
} else {
	_display = _btn;
	_btn = _display displayCtrl 4000;
};

private _mode = _display getVariable ["menuMode",0];

if (_forceClose && _mode == 0) exitWith {};

private _menuGrp = _display displayCtrl 4100;
private _sectionGrp = _display displayCtrl 4200;

private _map = _display displayCtrl 1000;
private _map2 = _display displayCtrl 1100;
private _auctionsGrp = _display displayCtrl 4300;
private _articleVGrp = _display displayCtrl 4400;
private _createIGrp = _display displayCtrl 4500;
private _createBGrp = _display displayCtrl 4600;
private _createvGrp = _display displayCtrl 4700;

private _moduls = [_auctionsGrp,_articleVGrp,_createIGrp,_createBGrp,_createvGrp];
call {
	if (_mode == 0) exitWith {
		_btn ctrlSetPosition [0.350469 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.2 * safezoneW,0.0439841 * safezoneH];
		_menuGrp ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.242344 * safezoneW,0.66 * safezoneH];
		_sectionGrp ctrlSetPosition [0.350469 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.0721875 * safezoneW,0.648766 * safezoneH];
		_map ctrlSetPosition [0.422656 * safezoneW + safezoneX, 0.4699207 * safezoneH + safezoneY];
		_map2 ctrlSetPosition [0.422656 * safezoneW + safezoneX,0.159131 * safezoneH + safezoneY];
		{
			_x ctrlSetPosition [0.422656 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.479531 * safezoneW,0.648766 * safezoneH];
			nil;
		} count _moduls;
	};

	if (_mode == 1) exitWith {
		_btn ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.2 * safezoneW,0.0439841 * safezoneH];
		_menuGrp ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0,0.66 * safezoneH];
		_sectionGrp ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.0721875 * safezoneW,0.648766 * safezoneH];
		_map ctrlSetPosition [0.180312 * safezoneW + safezoneX, 0.4699207 * safezoneH + safezoneY];
		_map2 ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.159131 * safezoneH + safezoneY];
		{
			_x ctrlSetPosition [0.180312 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.721875 * safezoneW,0.648766 * safezoneH];
			nil;
		} count _moduls;
	};
};

_btn ctrlCommit 0.25;
_menuGrp ctrlCommit 0.25;
_sectionGrp ctrlCommit 0.25;
_map ctrlCommit 0.25;
_map2 ctrlCommit 0.25;
{
	_x ctrlCommit 0.25;
	nil;
} count _moduls;

_display setVariable ["menuMode",[1,0] select _mode];