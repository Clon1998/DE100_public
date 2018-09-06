class radarfalle
{
	idd = 1000;
	movingEnable = false;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class Main_BG: Life_RscText
		{
			idc = -1;

			x = 0.412344 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Header: Life_RscStructuredText
		{
			idc = -1;

			text = "Radarfalle"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Manager_Header: Life_RscText
		{
			idc = -1;

			text = "Editiert von :"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Limit_Header: Life_RscText
		{
			idc = -1;

			text = "Limit:"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls
	{
		class Text_Name: Life_RscStructuredText
		{
			idc = 1001;
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Edit_Limit: Life_RscEdit
		{
			idc = 1002;
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class BTN_1: Life_RscButtonMenu
		{
			idc = 1003;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class BTN_2: Life_RscButtonMenu
		{
			idc = 1004;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class BTN_3: Life_RscButtonMenu
		{
			idc = 1005;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class RscButtonMenuCancel_2700: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.581333 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};

