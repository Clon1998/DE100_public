/*
	File:	fn_handleEdit.sqf
	Date:   2017-03-30 16:17:10
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _search = findDisplay 12 getVariable ["MarkerSearchEdit",controlNull];
private _lb = findDisplay 12 getVariable ["MarkerSearchLb",controlNull];
if (!isNull _search) then {
	ctrlDelete _search;
	if (!isNull _lb) then {
		ctrlDelete _lb;
	};
} else {
	_search = findDisplay 12  ctrlCreate ["RscEdit", -1];
	findDisplay 12 setVariable ["MarkerSearchEdit",_search];
	_search ctrlSetPosition [0.40203 * safezoneW + safezoneX, 0.04 * safezoneH + safezoneY, 0.195937 * safezoneW, 0.033 * safezoneH];
	_search ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.3];
	_search ctrlCommit 0;
	_search ctrlAddEventHandler ["keyUp", {_this call life_fnc_searchEdit}];
	_search call life_fnc_searchEdit;
};