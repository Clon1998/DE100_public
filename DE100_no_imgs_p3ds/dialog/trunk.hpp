/*
	File : trunk.hpp
	Date:   25.10.2014	
	Author: Tonic
	Edited by Patrick "Lucian" Schmidt
*/

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "if (life_vehicle_session) then {[(_this select 0) getVariable ['vehicle',objNull]] spawn life_fnc_updateTrunk;};dupeProtectionFSM setFSMVariable ['stopfsm',true]; ((_this select 0) getVariable ['vehicle',objNull]) setVariable ['trunkUser',nil,true]; life_vehicle_session = false;";
	class controlsBackground
	{
		class RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class RscBackground: Life_RscText
		{
			idc = -1;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 6.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 15.3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class RscTitleText: Life_RscTitle
		{
			idc = 3501;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class VehicleWeight: RscTitleText
		{
			idc = 3504;
			style = 1;

			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class RscTrunkText: Life_RscText
		{
			idc = -1;

			text = "Lagerraum"; //--- ToDo: Localize;
			x = 4.4 * GUI_GRID_W + GUI_GRID_X;
			y = 6.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		
		class RscPlayerText: Life_RscText
		{
			idc = -1;

			text = "Spielerinventar"; //--- ToDo: Localize;
			x = 18.7 * GUI_GRID_W + GUI_GRID_X;
			y = 6.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};
	
	class Controls
	{
		class TrunkGear: Life_RscListBox
		{
			idc = 3502;

			onLBDblClick = "['All'] call life_fnc_vehTakeItem;";
			x = 4.4 * GUI_GRID_W + GUI_GRID_X;
			y = 7.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
			sizeEx = 0.75 * GUI_GRID_H;
		};
		
		class PlayerGear: Life_RscListBox
		{
			idc = 3503;

			onLBDblClick = "['All'] call life_fnc_vehStoreItem;";
			x = 18.7 * GUI_GRID_W + GUI_GRID_X;
			y = 7.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
			sizeEx = 0.75 * GUI_GRID_H;
		};
		
		class TrunkEdit: Life_RscEdit
		{
			idc = 3505;

			text = "1"; //--- ToDo: Localize;
			x = 4.4 * GUI_GRID_W + GUI_GRID_X;
			y = 18.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 0.84 * GUI_GRID_H;
		};
		
		class PlayerEdit: Life_RscEdit
		{
			idc = 3506;

			text = "1"; //--- ToDo: Localize;
			x = 18.7 * GUI_GRID_W + GUI_GRID_X;
			y = 18.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 0.84 * GUI_GRID_H;
		};
		
		class TakeItem: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_vehTakeItem;";

			idc = 1010;
			text = "Nehmen"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.05 * GUI_GRID_H;
		};
		
		class StoreItem: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_vehStoreItem;";

			idc = 1011;
			text = "Lagern"; //--- ToDo: Localize;
			x = 18.8 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.05 * GUI_GRID_H;
		};
		
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			text = "Schließen"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.25 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			sizeEx = 0.05 * GUI_GRID_H;
		};

		class TakeAll: Life_RscButtonMenu
		{
			onButtonClick = "['All'] call life_fnc_vehTakeItem;";

			idc = 1013;
			text = "Alles ..."; //--- ToDo: Localize;
			tooltip = "Alles nehmen"; //--- ToDo: Localize;
			x = 11.4 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.05 * GUI_GRID_H;
		};

		class StoreAll: Life_RscButtonMenu
		{
			onButtonClick = "['All'] call life_fnc_vehStoreItem;";

			idc = 1014;
			text = "Alles ..."; //--- ToDo: Localize;
			tooltip = "Alles lagern"; //--- ToDo: Localize;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.05 * GUI_GRID_H;
		};

		class TankAnzeige: Life_RscStructuredText
		{
			idc = 1015;
			text = "Tankstand: 25.000 Liter"; //--- ToDo: Localize;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 21.37 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
	};
};