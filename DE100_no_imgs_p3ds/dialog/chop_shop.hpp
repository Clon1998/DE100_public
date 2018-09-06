class life_chop_Shop
{
	idd = 2000;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class Title: Life_RscText
		{
			idc = -1;

			text = "$STR_ChopShop_Title";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class MainBackGround: Life_RscText
		{
			idc = -1;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
				
		class infoText: Life_RscStructuredText
		{
			idc = 2001;

			x = 0.427812 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
	
	class controls
	{
		class vehicleList: Life_RscListBox
		{
			idc = 2002;
			onLBSelChanged = "_this call life_fnc_chopShopSelection";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.231 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};
		
		class BtnMode: Life_RscButtonMenu
		{
			onButtonclick = "[1] spawn life_fnc_chopShopMenu;";

			idc = 2003;
			text = "Zurückkaufen"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			class Attributes {
				align = "center";
			};
		};

		class BtnSell: Life_RscButtonMenu
		{
			idc = 2004;
			text = "$STR_Global_Sell";
			x = 0.509075 * safezoneW + safezoneX;
			y = 0.6463 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BtnClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0";

			idc = -1;
			text = "$STR_Global_Close";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.6463 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};