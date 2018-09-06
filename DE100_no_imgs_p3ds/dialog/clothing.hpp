class Life_Clothing {
    idd = 4000;
    name= "Life_Clothing";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "_this call life_fnc_clothingLoad;";
	onUnLoad = "_this call life_fnc_clothingUnLoad;";
	onMouseMoving = "[0,_this] call life_fnc_clothingMouse;";
	onMouseButtonDown = "[1,_this] call life_fnc_clothingMouse;";
	onMouseButtonUp = "[2,_this] call life_fnc_clothingMouse;";
	onMouseZChanged = "[3,_this] call life_fnc_clothingMouse;";

    class controlsBackground {
        class MainBackground_shop: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.137131 * safezoneH + safezoneY;
			w = 0.273324 * safezoneW;
			h = 0.296893 * safezoneH;
        };
		class MainBackground_cart: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.456016 * safezoneH + safezoneY;
			w = 0.273324 * safezoneW;
			h = 0.296893 * safezoneH;
        };
		class title_cart: Life_RscText
		{
			idc = -1;
			text = "Einkaufswagen";
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.434024 * safezoneH + safezoneY;
			w = 0.273324 * safezoneW;
			h = 0.0219921 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
    };

    class controls {
		class title: Life_RscText
		{
			idc = 4001;
			text = "";
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.115139 * safezoneH + safezoneY;
			w = 0.273324 * safezoneW;
			h = 0.0219921 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Shop_tree: Life_RscTree
		{
			idc = 4002;
			onTreeDblClick = "_this call life_fnc_clothingCart;";
			onTreeSelChanged = "_this call life_fnc_clothingValue;";
			idcSearch = 645;
			x = 0.0203945 * safezoneW + safezoneX;
			y = 0.148127 * safezoneH + safezoneY;
			w = 0.26301 * safezoneW;
			h = 0.241913 * safezoneH;
			colorSearch[] = {0.196,0.588,0,1};
		};
		class Shop_search: Life_RscEdit
		{
			idc = 645;
			text = "";
			x = 0.0203941 * safezoneW + safezoneX;
			y = 0.401036 * safezoneH + safezoneY;
			w = 0.26301 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
		class Cart_list: Life_RscListbox
		{
			idc = 4003;
			onLbDblClick = "_this call life_fnc_clothingCart;";
			onLbSelChanged = "_this call life_fnc_clothingValue;";
			sizeEx = 0.0219921*safezoneH;
			x = 0.0203941 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.128926 * safezoneW;
			h = 0.274901 * safezoneH;
		};
		class Shop_Info: Life_RscStructuredText
		{
			idc = 4004;
			text = "Warenwert:<br/>0€<br/>Ausgewählt:<br/>Nichts<br/>Preis:<br/>0€";
			x = 0.154477 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.128926 * safezoneW;
			h = 0.208925 * safezoneH;
		};
		class Buy: Life_RscButtonMenu
		{
			idc = 4005;
			text = "Kaufen"; //--- ToDo: Localize;
			onButtonClick = "_this call life_fnc_clothingBuy;";
			size = 0.042 * safeZoneH;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorDisabled[] = {1,1,1,1};
			color[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			class Attributes : Attributes {
				align = "center";
				valign = "middle";
			};
			x = 0.154477 * safezoneW + safezoneX;
			y = 0.686933 * safezoneH + safezoneY;
			w = 0.128926 * safezoneW;
			h = 0.0549802 * safezoneH;
		};
		class cancel: Life_RscButtonMenu
		{
			idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0; [] call life_fnc_playerSkins;";
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.757313 * safezoneH + safezoneY;
			w = 0.053 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
    };
};