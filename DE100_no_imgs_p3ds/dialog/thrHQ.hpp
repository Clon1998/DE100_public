class THR_HQ
{
	idd = 3000;
	movingEnabled = false;
	onLoad = "for '_i' from 3 to 8 do {((_this select 0) displayCtrl _i) ctrlSetFade 1; ((_this select 0) displayCtrl _i) ctrlCommit 0; ((_this select 0) displayCtrl _i) ctrlEnable false; };(_this + [0]) spawn life_fnc_thrHQ;";
	class controlsBackground
	{
		class Titel: Life_RscText
		{
			idc = 1;
			text = "THR-Kommandozentrale"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class BG: Life_RscText
		{
			idc = 2;
			style = 0x02;
			colorBackground[] = {0,0,0,0.85};
			x = 0.252499 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.583 * safezoneH;
			sizeEx = 0.042 * safeZoneH;
		};
	};
	
	class Controls
	{
		class MAP: Life_RscMapControl
		{
			idc = 3;
			scaleDefault = 0.01;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.561 * safezoneH;
		};

		class Search_text: Life_RscText
		{
			idc = 4;
			text = "Suche:"; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Search_edit: Life_RscEdit
		{
			idc = 5;
			onKeyDown = "[findDisplay 3000,1] spawn life_fnc_thrHQ;";
			onKeyUp = "[findDisplay 3000,1] spawn life_fnc_thrHQ;";
			style = 0x200;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CASES: Life_RscTree
		{
			idc = 6;
			onTreeSelChanged = "_this call life_fnc_thrHQSelChange;";
			sizeEx = 0.022 * safeZoneH;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.352 * safezoneH;
		};

		class Info_text: Life_RscStructuredText
		{
			idc = 7;
			text = "";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.11 * safezoneH;
		};

		class ACCEPT: life_RscButtonMenu
		{
			idc = 8;
			text = "Annehmen";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
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
			idc = 9;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.8 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};