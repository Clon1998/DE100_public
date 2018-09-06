class life_weapon_shop
{
	idd = 3400;
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "_this call life_fnc_weaponShopClose;";
	class controlsBackground
	{
		class RscTitleBackground: Life_RscText
		{
			idc = 3400;

			text = "GEGE"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Mainbackground: Life_RscText
		{
			idc = -1;

			x = 0.314375 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
	};
	
	class controls
	{
		class itemList: Life_RscTree
		{
			idc = 3401;
			onTreeSelChanged = "_this call life_fnc_weaponShopSelChange";

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.275 * safezoneH;
			sizeEx = 0.028 * safeZoneH;
		};
		
		class itemInfo: Life_RscStructuredText
		{
			idc = 3402;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.132 * safezoneH;
		};
		
		class itemPicture : Life_RscStructuredText
		{
			idc = 3403;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class ButtonBuy: Life_RscButtonMenu
		{
			idc = 3404;
			onButtonClick = "call life_fnc_weaponShopBuy";

			x = 0.618594 * safezoneW + safezoneX;
			y = 0.766112 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			text = "Schließen";
			idc = -1;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.766112 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
