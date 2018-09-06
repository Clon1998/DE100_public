class life_copHQ
{
	name = "life_copHQ";
	idd = 3000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="['',[]] spawn life_fnc_copHQLoad;";

	class controlsBackground 
	{
		class Title : Life_RscText
		{
			idc = 1;
			text = "Polizei-Kommandozentrale"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.814687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class BG : Life_RscText
		{
			idc = 2;
			style = 0x02;
			colorBackground[] = {0,0,0,0.85};
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.814687 * safezoneW;
			h = 0.858 * safezoneH;
			sizeEx = 0.042 * safeZoneH;
		};
	};
	class controls {
		class MAP: Life_RscMapControl
		{
			idc = 3;
			scaleDefault = 0.01;
			x = 0.376249 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.525937 * safezoneW;
			h = 0.836 * safezoneH;
		};


		class Search_text: Life_RscText
		{
			idc = 4;
			text = "Suche:";
			x = 0.0978125 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Search_edit: Life_RscEdit
		{
			idc = 5;
			style = 0x200;
			text = "";
			onKeyUp = "[ctrlText (_this select 0),[]] call life_fnc_copHQLoad;";
			x = 0.139063 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Treeview: Life_RscTree
		{
			idc = 6;
			onTreeSelChanged = "_this call life_fnc_copHQSel;";
			x = 0.0978123 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.528 * safezoneH;
		};

		class TextFieldCtrl: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.0978125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.198 * safezoneH;
			class Controls
			{
				class TextField : Life_RscStructuredText
				{
					idc = 7;
					size = 0.022 * safeZoneH;
					text = "";
					x = 0;
					y = 0;
					w = 0.273281 * safezoneW;
					h = 0.198 * safezoneH;
				};
			};
		};

		class Button: life_RscButtonMenu
		{
			idc = 8;
			text = "";
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1, 1, 1, 1};
			size = 0.042 * safeZoneH;
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
			};
		};

		class Close_Btn: life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.933334 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};