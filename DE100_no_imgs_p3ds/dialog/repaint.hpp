class Life_vehicle_repaint {
	idd = 2300;
	name= "life_vehrepaint_menu";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			text = "Fahrzeug lackieren"; //--- ToDo: Localize;
			x = 0.40499 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.190019 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.404991 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.190019 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
	
	class controls {
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			onLBSelChanged = "_this call life_fnc_Repaintcolor";

			x = 0.409991 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.180018 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.02726 * safeZoneH;
		};
			
		class ColorList: Life_RscCombo
		{
			idc = 2303;

			x = 0.444995 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1005;
			text = "$STR_Global_Close"; //--- ToDo: Localize;
			x = 0.404991 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	
		class RepaintCar: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_RepaintVehicle;";

			idc = 1006;
			text = "Lackieren"; //--- ToDo: Localize;
			x = 0.510001 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0850083 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};

		};
	};
};