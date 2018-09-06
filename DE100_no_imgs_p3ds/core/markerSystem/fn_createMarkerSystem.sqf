/*
	File:	fn_createMarkerSystem.sqf
	Date:   2016-09-27 14:40:44
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
private ["_indexZero","_indexOne","_indexTwo","_markerAlpha","_sizeInfo","_tmp"];
disableSerialization;

if (!isNull (findDisplay 12 getVariable ["MarkerSystemBackGround",controlNull])) exitwith {};

findDisplay 12 setVariable ["MarkerSystemBackGround", (findDisplay 12 ctrlCreate ["RscText", -1])];
findDisplay 12 setVariable ["MarkerSystemSettings_Icon", (findDisplay 12 ctrlCreate ["RscPicture", -1])];
findDisplay 12 setVariable ["MarkerSystemSettings_Btn", (findDisplay 12 ctrlCreate ["RscButtonTextOnly", -1])];
findDisplay 12 setVariable ["MarkerSystemHeader", (findDisplay 12 ctrlCreate ["RscStructuredText", -1])];
findDisplay 12 setVariable ["MarkerSystemBOX", (findDisplay 12 ctrlCreate ["RscTree", -1])];
findDisplay 12 setVariable ["MarkerSearchBtn",findDisplay 12  ctrlCreate ["RscButtonTextOnly", -1]];


private _Background = findDisplay 12 getVariable ["MarkerSystemBackGround",controlNull];
private _Settings_Icon = findDisplay 12 getVariable ["MarkerSystemSettings_Icon",controlNull];
private _Settings_Btn = findDisplay 12 getVariable ["MarkerSystemSettings_Btn",controlNull];
private _Header = findDisplay 12 getVariable ["MarkerSystemHeader",controlNull];
private _Tree = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];
private _btnSearch = findDisplay 12 getVariable ["MarkerSearchBtn",controlNull];

_Background ctrlSetPosition [safezoneW + safezoneX, 0.078 * safezoneH + safezoneY, 0.232031 * safezoneW, 0.924 * safezoneH];
_Settings_Icon ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY, 0.0257812 * safezoneW, 0.044 * safezoneH];
_Settings_Btn ctrlSetPosition [0.972312 * safezoneW + safezoneX, 0.9532 * safezoneH + safezoneY, 0.0257812 * safezoneW, 0.044 * safezoneH];
_Header ctrlSetPosition [safezoneW + safezoneX, 0.0335 * safezoneH + safezoneY, 0.232031 * safezoneW, 0.0445 * safezoneH];
_Tree ctrlSetPosition [1.005156 * safezoneW + safezoneX, 0.087 * safezoneH + safezoneY, 0.221719 * safezoneW, 0.836 * safezoneH];
_btnSearch ctrlSetPosition [0.412344 * safezoneW + safezoneX, 0.00500001 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.022 * safezoneH];

_Background ctrlSetBackgroundColor [0,0,0,0.85];
_Header ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),1];
_Tree ctrlSetBackgroundColor [0,0,0,0];

_Settings_Icon ctrlSetText "images\dialog\ico_settings.paa";
_Header ctrlSetStructuredText parseText "<t align='center' size='2.0'>Markierungs Manager</t>";
_btnSearch ctrlSetText "Marker-Suche";
_btnSearch ctrlSetFont "PuristaMedium";
_btnSearch ctrlSetFontHeight 0.065;

_Settings_Btn buttonSetAction "[] spawn life_fnc_showMarkerSystem";
_btnSearch buttonSetAction "[] call  life_fnc_handleEdit";

_Background ctrlCommit 0;
_Settings_Icon ctrlCommit 0;
_Settings_Btn ctrlCommit 0;
_Header ctrlCommit 0;
_Tree ctrlCommit 0;
_btnSearch ctrlCommit 0;

_Tree ctrlAddEventHandler ["TreeDblClick",{_this call life_fnc_treeDblClickMarkerSystem;}];
private _playerSide = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
if (player getVariable["nobody",false]) then {_playerSide = "nobody";};


{
	findDisplay 12 setVariable [format["%1_shown",configName _x],profileNamespace getVariable [format["%1_shown",configName _x],true]];

	_sizeInfo = switch (profileNamespace getVariable [format["%1_size",configName _x],"default"]) do { 
		case "big" : {[2,2]}; 
		case "default" : {[1,1]};
		case "small" : {[0.5,0.5]}; 
	};

	_markerColor = profileNamespace getVariable [format["%1_color",configName _x],[]];

	_indexZero = _Tree tvAdd [[],getText(_x >> "displayname")];
	_Tree tvSetData [[_indexZero], configName _x];

	_indexOne = _Tree tvAdd [[_indexZero],"Zeigen"];
	_Tree tvSetData [[_indexZero,_indexOne], "show"];
	_Tree tvSetPicture [[_indexZero,_indexOne] ,"images\icons\ico_switchDefault.paa"];
	if (findDisplay 12 getVariable [format["%1_shown",configName _x],true]) then {
		_Tree tvSetPictureColor [[_indexZero,_indexOne], [0,0.8,0,1]];
		_Tree tvSetPictureColorSelected  [[_indexZero,_indexOne], [0,0.8,0,1]];
		_markerAlpha = 1;
	} else {
		_Tree tvSetPictureColor [[_indexZero,_indexOne], [0.8,0,0,1]];
		_Tree tvSetPictureColorSelected  [[_indexZero,_indexOne], [0.8,0,0,1]];
		_markerAlpha = 0;
	};

	_indexOne = _Tree tvAdd [[_indexZero],"Farbe"];
	_Tree tvSetData [[_indexZero,_indexOne], "color"];
	_Tree tvSetPicture [[_indexZero,_indexOne] ,"images\icons\ico_switchDefault.paa"];
	_Tree tvSetPictureColor [[_indexZero,_indexOne], if (count _markerColor > 0) then {(_markerColor select 1) } else {getArray(_x >> "defaultColor") }];
	_Tree tvSetPictureColorSelected  [[_indexZero,_indexOne],if (count _markerColor > 0) then {(_markerColor select 1) } else {getArray(_x >> "defaultColor") }];
 
	{
	 	private _indexTwo = _Tree tvAdd [[_indexZero,_indexOne], _x select 0];
		_Tree tvSetData [[_indexZero,_indexOne,_indexTwo], str [_x select 1,_x select 2]];
		_Tree tvSetPicture [[_indexZero,_indexOne,_indexTwo] ,"images\icons\ico_switchDefault.paa"];
		_Tree tvSetPictureColor [[_indexZero,_indexOne,_indexTwo], _x select 2];
		_Tree tvSetPictureColorSelected  [[_indexZero,_indexOne,_indexTwo], _x select 2];
	} forEach [["Schwarz","ColorBlack",[0,0,0,1]], ["Grau","ColorGrey",[0.5,0.5,0.5,1]], ["Rot","ColorRed",[0.9,0,0,1]], ["Braun","ColorBrown",[0.5,0.25,0,1]], ["Orange","ColorOrange",[0.85,0.4,0,1]], ["Geld","ColorYellow",[0.85,0.85,0,1]], ["Khaki","ColorKhaki",[0.5,0.6,0.4,1]], ["Grün","ColorGreen",[0,0.8,0,1]], ["Blau","ColorBlue",[0,0,1,1]], ["Pink","ColorPink",[1,0.3,0.4,1]], ["Weiß","ColorWhite",[1,1,1,1]], ["BLUEFOR","ColorWEST",[0,0.3,0.6,1]], ["OPFOR","ColorEAST",[0.5,0,0,1]], ["INDEPENDENT","ColorGUER",[0,0.5,0,1]], ["ZIVILIST","ColorCIV",[0.4,0,0.5,1]], ["UNBEKANNT","ColorUNKNOWN",[0.7,0.6,0,1]]];

	_indexOne = _Tree tvAdd [[_indexZero],"Größe"];
	_Tree tvSetData [[_indexZero,_indexOne], "size"];
	
	{
		_indexTwo = _Tree tvAdd [[_indexZero,_indexOne], _x select 0];
		_Tree tvSetData [[_indexZero,_indexOne,_indexTwo], _x select 1];
	} forEach [["Groß","big"],["Normal","default"],["Klein","small"]];

	private _markers = if (configName _x isEqualTo "Houses") then {
		_tmp = [];
		{
			_tmp pushBack format["house_%1",netId _x];
		} forEach (life_houses + ((group player) getVariable ["gang_HOUSES",[]]));
		_tmp
	} else {
		(getArray(_x >> "markers"))
	};
	{
		_x setMarkerAlphaLocal _markerAlpha;
		if (markerType _x != "Empty") then {
			_x setMarkerSizeLocal _sizeInfo;
			if (count _markerColor > 0) then {
				_x setMarkerColorLocal (_markerColor select 0); 
			};
		};
	} forEach _markers;
} forEach (format["count getArray(_x>>'markers') > 0 && '%1' in getArray(_x>>'factions')",_playerSide] configClasses (missionConfigFile >> "Marker"));
_Tree tvSort [ [], false];

findDisplay 12 setVariable ["MarkerSystemInit",true];