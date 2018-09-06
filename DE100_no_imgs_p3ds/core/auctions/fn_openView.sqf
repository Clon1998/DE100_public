/*
	File:	fn_openView.sqf
	Date:   2017-08-10 17:45:11
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
	0 - AuctionView
	1 - ArticleData
	2 - CreateAuction_item
	3 - myAuctions
	4 - pastAuction
	5 - CreateAuctin_Imo
*/

params[
	["_display", displayNull, [displayNull,controlNull]],
	["_type", 0],
	["_data",[]]
];

if ((lockers_obj getVariable [format["%1_%2_locker_id",getPlayerUID player,playerSide],-1]) < 0) exitWith {
	_display closeDisplay 0;
	["Ooops,<br/>es scheint so als wäre dein Spind noch nicht eingerichtet. Solange dein Spind nicht eingerichtet ist, kannst du das Auktionshaus nicht benutzen.<br/>Um den Spind einzurichten musst du den Spind nur einmal öffnen und auf die bestätigung warten.", true, "slow"] call life_fnc_notification_system;
};

if !(missionNamespace getVariable ["life_ac_ready",false]) exitWith {
	_display closeDisplay 0;
	["Oooops,<br/>es scheint so als wäre das Auktionshaus noch nicht bereit. Bitte versuche es in 1-2 Minuten nochmal.", true, "slow"] call life_fnc_notification_system;
};

if (_display isEqualType controlNull) then {
	_display = ctrlParent _display;
};

[_display,true] call life_fnc_handleMenu;
if ((_display getVariable ["crntView",-1]) == _type && (_display getVariable ["crntView",-1]) in [1,2,5]) exitWith {};
	
if (_display getVariable ["openAuction",-1] >= 0) then {
	_display setVariable ["openAuction",nil];
};

if !(player getVariable ["auction_open",false]) then {
	player setVariable ["auction_open",true,true];
};

private _map = _display displayCtrl 1000;
private _map2 = _display displayCtrl 1100;
private _sectionHeader = _display displayCtrl 4000;
private _auctionsGrp = _display displayCtrl 4300;
private _articleVGrp = _display displayCtrl 4400;
private _createIGrp = _display displayCtrl 4500;
private _createBGrp = _display displayCtrl 4600;
private _createVGrp = _display displayCtrl 4700;
_sectionHeader ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0.2 * safezoneW,0.0439841 * safezoneH];
_map2 ctrlShow false;
call {
	if (_type == 0) exitWith {
		_auctionsGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[
			["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],
			["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],
			["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],
			["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],
			["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],
			["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]
		]] call life_fnc_setSections;
		if (_data isEqualType []) then {
			_sectionHeader ctrlSetText "Auktionen Übersicht";
			[_display,""] call life_fnc_handleTables;
		} else {
			_type = -1;
		};
	};
	if (_type == 1) exitWith {
		_articleVGrp ctrlShow true;
		_createIGrp ctrlShow false;
		_auctionsGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[["Zurück","a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa","(_this+[0,true]) call life_fnc_openView"]]] call life_fnc_setSections;
		_data call life_fnc_articleData;
	};
	if (_type == 2) exitWith {
		_createIGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_auctionsGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[["Items","images\dialog\ico_itemDealer.paa","(_this+[2]) call life_fnc_openView;"], ["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this+[7]) call life_fnc_openView;"], ["Immobilien","images\dialog\ico_imo.paa","(_this+[5]) call life_fnc_openView;"]]] call life_fnc_setSections;
		if (isNull (_display getVariable ["house",objNull])) then {
			[_display] call life_fnc_setupAucInv;
		} else {
			[_display,_display getVariable ["lastCatIndex",0]] call life_fnc_setupAucSection;
		};
		_sectionHeader ctrlSetText "";
		_sectionHeader ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0,0];
	};
	if (_type == 3) exitWith {
		_auctionsGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[
			["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],
			["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],
			["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],
			["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],
			["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],
			["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]
		]] call life_fnc_setSections;
		[_display,"myAuctions"] call life_fnc_handleTables;
		_sectionHeader ctrlSetText "Meine Auktionen";
	};
	if (_type == 4) exitWith {
		_auctionsGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[
			["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],
			["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],
			["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],
			["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],
			["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],
			["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]
		]] call life_fnc_setSections;
		[_display,"pastAuctions"] call life_fnc_handleTables;
		_sectionHeader ctrlSetText "Auktions Historie";
	};

	if (_type == 5) exitWith {
		_createBGrp ctrlShow true;
		_map ctrlShow true;
		_auctionsGrp ctrlShow false;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createVGrp ctrlShow false;
		[_display,[["Items","images\dialog\ico_itemDealer.paa","(_this+[2]) call life_fnc_openView;"], ["Fahrzeuge","images\dialog\ico_rifle.paa","(_this+[7]) call life_fnc_openView;"], ["Immobilien","images\dialog\ico_imo.paa","(_this+[5]) call life_fnc_openView;"]]] call life_fnc_setSections;
		if (isNull (_display getVariable ["lastCategoryImo",controlNull])) then {
			[(_display displayCtrl 4600) controlsGroupCtrl 4610,0] call life_fnc_setupSellHouse;
		};
		_sectionHeader ctrlSetText "";
		_sectionHeader ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0,0];
	};
	if (_type == 6) exitWith {
		_auctionsGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[
			["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],
			["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],
			["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],
			["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],
			["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],
			["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]
		]] call life_fnc_setSections;
		[_display,"watchlist"] call life_fnc_handleTables;
		_sectionHeader ctrlSetText "Watchliste";
	};
	if (_type == 7) exitWith {
		_createVGrp ctrlShow true;
		_createBGrp ctrlShow false;
		_auctionsGrp ctrlShow false;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_map ctrlShow false;

		[_display,[["Items","images\dialog\ico_itemDealer.paa","(_this+[2]) call life_fnc_openView;"], ["Fahrzeuge","images\dialog\ico_rifle.paa","(_this+[7]) call life_fnc_openView;"], ["Immobilien","images\dialog\ico_imo.paa","(_this+[5]) call life_fnc_openView;"]]] call life_fnc_setSections;
		if ((_display getVariable ["reqVeh",[]]) isEqualTo []) then {
			[(_display displayCtrl 4700) controlsGroupCtrl 4710,0] call life_fnc_setupSellVeh;
		};
		_sectionHeader ctrlSetText "";
		_sectionHeader ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.0821507 * safezoneH + safezoneY,0,0];
	};
	if (_type == 8) exitWith {
		_auctionsGrp ctrlShow true;
		_articleVGrp ctrlShow false;
		_createIGrp ctrlShow false;
		_createBGrp ctrlShow false;
		_createVGrp ctrlShow false;
		_map ctrlShow false;
		[_display,[
			["Waffen","images\dialog\ico_weaDealer.paa","(_this + ['weapon']) call life_fnc_handleFilter;"],
			["Kleidung","images\dialog\ico_cloDealer.paa","(_this + ['clothing']) call life_fnc_handleFilter;"],
			["Items","images\dialog\ico_itemDealer.paa","(_this + ['items']) call life_fnc_handleFilter;"],
			["Z-Items","images\dialog\ico_vIDealer.paa","(_this + ['zitems']) call life_fnc_handleFilter;"],
			["Fahrzeuge","images\dialog\ico_vehDealer.paa","(_this + ['vehicle']) call life_fnc_handleFilter;"],
			["Immobilien","images\dialog\ico_imo.paa","(_this + ['buildings']) call life_fnc_handleFilter;"]
		]] call life_fnc_setSections;
		[_display,"wonAuctions"] call life_fnc_handleTables;
		_sectionHeader ctrlSetText "Gewonnene Auktionen";
	};
};
_sectionHeader ctrlCommit 0;
_display setVariable ["crntView",_type];