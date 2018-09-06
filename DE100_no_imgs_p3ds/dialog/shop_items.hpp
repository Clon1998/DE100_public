class shops_menu {
	
	idd = 2400;
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "hint ''";
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.340019 * safezoneW + safezoneX;
			y = 0.335053 * safezoneH + safezoneY;
			w = 0.319961 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.340019 * safezoneW + safezoneX;
			y = 0.359245 * safezoneH + safezoneY;
			w = 0.319961 * safezoneW;
			h = 0.28151 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class vasText: Life_RscText
		{
			idc = -1;
			text = "Laden-Inventar";
			x = 0.345019 * safezoneW + safezoneX;
			y = 0.368042 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};

		class vasgText: Life_RscText
		{
			idc = -1;
			text = "Spieler-Inventar";
			x = 0.519998 * safezoneW + safezoneX;
			y = 0.368042 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};
	
	class controls {
		class itemList: Life_RscListBox
		{
			idc = 2401;

			x = 0.345019 * safezoneW + safezoneX;
			y = 0.390035 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.18694 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
		};
		class pItemlist: Life_RscListBox
		{
			idc = 2402;

			x = 0.519998 * safezoneW + safezoneX;
			y = 0.390035 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.18694 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
		};
		class Title: Life_RscTitle
		{
			idc = 2403;

			x = 0.340019 * safezoneW + safezoneX;
			y = 0.335053 * safezoneH + safezoneY;
			w = 0.319961 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class PlayersName: Title
		{
			idc = 601;
			style = 1;

			x = 0.340019 * safezoneW + safezoneX;
			y = 0.335053 * safezoneH + safezoneY;
			w = 0.319961 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class buyEdit: Life_RscEdit
		{
			idc = 2404;

			text = "1"; //--- ToDo: Localize;
			x = 0.345019 * safezoneW + safezoneX;
			y = 0.576975 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
		class ButtonAddG: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_virt_buy;";

			idc = -1;
			text = "Kaufen"; //--- ToDo: Localize;
			x = 0.345019 * safezoneW + safezoneX;
			y = 0.609965 * safezoneH + safezoneY;
			w = 0.0649922 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.0006875 * safeZoneH;
		};
		class sellEdit: Life_RscEdit
		{
			idc = 2405;

			text = "1"; //--- ToDo: Localize;
			x = 0.519998 * safezoneW + safezoneX;
			y = 0.576975 * safezoneH + safezoneY;
			w = 0.134984 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
		class ButtonRemoveG: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_virt_sell";

			idc = -1;
			text = "Verkaufen"; //--- ToDo: Localize;
			x = 0.519998 * safezoneW + safezoneX;
			y = 0.609965 * safezoneH + safezoneY;
			w = 0.0649922 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.0006875 * safeZoneH;
		};
		class AllesV: Life_RscButtonMenu
		{
			onButtonClick = "[""All""] call life_fnc_virt_sell";

			idc = -1;
			text = "Alles ..."; //--- ToDo: Localize;
			x = 0.58999 * safezoneW + safezoneX;
			y = 0.609965 * safezoneH + safezoneY;
			w = 0.0649922 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.0006875 * safeZoneH;
		};
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			x = 0.340019 * safezoneW + safezoneX;
			y = 0.642954 * safezoneH + safezoneY;
			w = 0.0624925 * safezoneW;
			h = 0.0219929 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			sizeEx = 0.0006875 * safeZoneH;
		};
	};
};