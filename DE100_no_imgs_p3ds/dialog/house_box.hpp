/*
	File : house_box.hpp
	Date:   04.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/

class life_house_boxlist
{
	idd = 7770;
	name = "life_house_boxlist";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Main_bg: Life_RscText
		{
			idc = -1;

			x = 0.339912 * safezoneW + safezoneX;
			y = 0.290944 * safezoneH + safezoneY;
			w = 0.320176 * safezoneW;
			h = 0.3741 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
				
		class Topic: Life_RscText
		{
			idc = -1;

			text = "Verbaute Boxen"; //--- ToDo: Localize;
			x = 0.339912 * safezoneW + safezoneX;
			y = 0.268938 * safezoneH + safezoneY;
			w = 0.320176 * safezoneW;
			h = 0.0220059 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls 
	{
		class Box_lb: Life_RscListBox
		{
			idc = 7771;
			onLBSelChanged = "[] spawn life_fnc_showBoxesLbChange;";

			x = 0.344915 * safezoneW + safezoneX;
			y = 0.301947 * safezoneH + safezoneY;
			w = 0.150082 * safezoneW;
			h = 0.352094 * safezoneH;
			rowHeight = 0.10;
			sizeEx = 0.022 * safeZoneH;
		};

		class Close_Btn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			x = 0.339912 * safezoneW + safezoneX;
			y = 0.669427 * safezoneH + safezoneY;
			w = 0.0850467 * safezoneW;
			h = 0.0220059 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Delete_box_btn: Life_RscButtonMenu
		{
			onButtonClick = "_this call life_fnc_deleteBoxes";

			idc = 7772;
			text = "Ausbauen"; //--- ToDo: Localize;
			x = 0.575041 * safezoneW + safezoneX;
			y = 0.669427 * safezoneH + safezoneY;
			w = 0.0850467 * safezoneW;
			h = 0.0220059 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class InfoBox: Life_RscStructuredText
		{
			idc = 7773;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.301947 * safezoneH + safezoneY;
			w = 0.155085 * safezoneW;
			h = 0.352094 * safezoneH;
		};
	};
};