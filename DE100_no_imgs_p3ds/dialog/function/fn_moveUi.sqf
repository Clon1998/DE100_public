/*
	File : fn_moveUi.sqf
	Date:   27.01.2016	
	Author: Patrick "Lucian" Schmidt
	
	Description:
	Take a look for yourself.
	Mode:
		1:Move Out
		2:Move In
	#define EXPAND 0
	#define 1 1
	#define 2 2
	#define 3 3
*/
disableSerialization;

params[
	["_mode", 0, [0]]
];
private _display = uiNameSpace getVariable ["playerHUD",displayNull];
private _vDateTime = _display displayCtrl 4470;

uiNamespace setVariable ["hudPos",_mode];
private _offSet = ((0.958619 * safezoneW + safezoneX) - (0.90504 * safezoneW + safezoneX));
private _allCtrls = (allControls _display) select {!((_x getVariable ["initalPos",false]) isEqualTo false)};
switch (_mode) do { 
	case 0 : {
		_vDateTime ctrlSetFade 1;
		_vDateTime ctrlCommit 0.5;
		{
			_x ctrlSetPosition (_x getVariable ["initalPos",ctrlPosition _x]);
			if (ctrlIDC _x in [4451,4464,4465,4457,4458]) then {
				_x ctrlSetFade 0;
			};
			_x ctrlCommit 0.5;
			nil;
		} count _allCtrls;
		profileNamespace setVariable ["life_HUD_Mode_de100",1];
	};

	case 1 : {
		_vDateTime ctrlSetFade 1;
		_vDateTime ctrlCommit 0;
		{
			_x ctrlSetPosition (_x getVariable ["initalPos",ctrlPosition _x]);
			if (ctrlIDC _x in [4451,4464,4465,4457,4458]) then {
				_x ctrlSetFade 0;
			};
			_x ctrlCommit 0;
			nil;
		} count _allCtrls;
		profileNamespace setVariable ["life_HUD_Mode_de100",1];
	};

	case 2 : {
		_vDateTime ctrlSetFade 0;
		_vDateTime ctrlCommit 0.5;
		{
			_x ctrlSetPosition ([(_x getVariable ["initalPos",ctrlPosition _x]),[_offSet,0,0,0]] call BIS_fnc_vectorAdd);
			if (ctrlIDC _x in [4451,4464,4465,4457,4458]) then {
				_x ctrlSetFade 1;
			};
			_x ctrlCommit 0.5;
			nil;
		} count _allCtrls;
		profileNamespace setVariable ["life_HUD_Mode_de100",2];
	}; 

	case 3 : {
		_vDateTime ctrlSetFade 0;
		_vDateTime ctrlCommit 0;
		{
			_x ctrlSetPosition ([(_x getVariable ["initalPos",ctrlPosition _x]),[_offSet,0,0,0]] call BIS_fnc_vectorAdd);
			if (ctrlIDC _x in [4451,4464,4465,4457,4458]) then {
				_x ctrlSetFade 1;
			};
			_x ctrlCommit 0;
			nil;
		} count _allCtrls;
		profileNamespace setVariable ["life_HUD_Mode_de100",2];
	}; 
};