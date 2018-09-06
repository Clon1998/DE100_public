/*
	File:   fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/

private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {[localize "STR_ISTR_SelectItemFirst",true,"fast"] call life_fnc_notification_system;};
_item = lbData[2005,(lbCurSel 2005)];

if (_item == "") exitWith {["Du hast nichts zum benutzen",true,"fast"] call life_fnc_notification_system;};
switch (true) do
{
	case (_item == "waterBottle" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			life_thirst = 100;
			life_water_boy = true;
			player setFatigue 0;
		};
	};

	case (_item == "battery"):
	{
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			life_battery = 100;
		};
	};
	case (_item == "speedtrap"): {
        [] spawn life_fnc_radarAdd;
        closeDialog 0;
	};

	case (_item == "smokeWall"): {
		call life_fnc_smokeWall;
	};

	case (_item == "boltcutter"): {
		if ((player distance (nearestObject [player, "Land_Razorwire_F"])) <=3)  then {
			[nearestObject [player, "Land_Razorwire_F"]] spawn life_fnc_cutFence;
			closeDialog 0;
		} else {
			[cursorObject] spawn life_fnc_boltcutter;
			closeDialog 0;
		};
	};

	case (_item == "blastingcharge"): {
		if (cursorObject isKindOf "Land_CncWall1_F") then {
			[cursorObject] spawn life_fnc_BlowUp;
			closeDialog 0;
		} else {
			["Du musst eine Wand beim Eingang des Gefängnises anschauen!",true,"fast"] call life_fnc_notification_system;
		};
	};
	case (_item == "vehicleBox"): {
		[cursorObject] spawn life_fnc_vehicleBox;
	};
	case (_item in ["storagesmall","storagebig","storagegang","storagecop"]): {
		[_item] call life_fnc_storageBox;
	};


	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			life_thirst = 100;
			[] spawn
			{
				life_redgull_effect = time;
				life_water_boy = true;
				[localize "STR_ISTR_RedGullEffect",false,"fast"] call life_fnc_notification_system;
				waitUntil {!alive player || ((time - life_redgull_effect) > (3 * 60))};
				["Die Wirkung des Redgull lässt nach...",false,"fast"] call life_fnc_notification_system;
				uiSleep 1;
				life_redgull_effect = nil;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {[localize "STR_ISTR_SpikesDeployment",true,"fast"] call life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "heroin_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["Keine Drogen im Dienst !",true,"fast"] call life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			[] spawn life_fnc_heroin;
		};
	};

	case (_item == "cocaine_processed"):
	{
		if(playerSide in [west,independent]) exitWith {["Keine Drogen im Dienst !",true,"fast"] call life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			[] spawn life_fnc_kokain;
		};
	};

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			[] spawn life_fnc_marihuana;
		};
	};

	case (_item in ["mauer", "gate", "arrowdeskl", "arrowdeskr", "roadbarrier", "roadcone", "hescobag", "tapesign","rocket_random","rocket_normal_red","rocket_normal_blue","rocket_normal_white","rocket_normal_green","rocket_fizzer_blue", "rocket_fizzer_red", "rocket_fizzer_white", "rocket_fizzer_green", "rocket_rain_blue", "rocket_rain_red", "rocket_rain_white", "rocket_rain_green"]):
	{
		if(!isNull life_tobeplaced) exitWith {["Du versuchst bereits etwas aufzustellen",true,"fast"] call life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv) > 0) then
		{
			[_item] spawn life_fnc_placeObjekt;
			closeDialog 0;
		};
	};

	case (_item == "fuelFull"):
	{
		if(!isNull objectParent player) exitWith {[localize "STR_ISTR_RefuelInVehicle",true,"fast"] call life_fnc_notification_system;};
		[] spawn life_fnc_jerryRefuel;
		closeDialog 0;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["fSalad","grapes","tomato","apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtlesoup","donuts","tbacon","peach"]):
	{
		if(!((getNumber(missionConfigFile >> "VirtualItems" >> _item >> "edible") isEqualTo -1))) then {
			if(([false,_item,1] call life_fnc_handleInv) > 0) then {
				_val = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100; life_prof_noXp = true;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};

	case (_item == "gpstracker"):
	{
		[cursorTarget] spawn life_fnc_gpsTracker;
	};

	case (_item == "Graffiti1"):
	{
		[player,"images\graffiti\Graffiti_ACAB_F.paa"] call life_fnc_sprayPaint;
	};

	case (_item == "Graffiti2"):
	{
		[player,"images\graffiti\Graffiti_Dale_F.paa"] call life_fnc_sprayPaint;
	};

	case (_item == "Graffiti3"):
	{
		[player,"images\graffiti\Graffiti_Weed_F2.paa"] call life_fnc_sprayPaint;
	};

	case (_item == "Graffiti4"):
	{
		[player,"images\graffiti\Graffiti_DE100_F2.paa"] call life_fnc_sprayPaint;
	};

	default
	{
		[ localize "STR_ISTR_NotUsable",true,"fast"] call life_fnc_notification_system;
	};
};

[] call life_fnc_p_updateMenu;
