/*
	File:	faq.hpp
	Date:   26.07.16 00:39
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/


class Life_infos {
	idd = 4000;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "_this call life_fnc_faq_init;";

	class controlsBackground {
		class MainBG: Life_RscPicture
		{
			idc = -1;
			text = "images\dialog\bg_faq.paa";
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.649688 * safezoneW;
			h = 0.649 * safezoneH;
		};
	};

	class controls {
		class Header: Life_RscStructuredText
		{
			idc = 4001;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.639375 * safezoneW;
			h = 0.175 * safezoneH;

			class Attributes {
				font = "PuristaBold";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
			};
		};
		
		class Text: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.515 * safezoneW;
			h = 0.429 * safezoneH;
			class Controls
			{
				class TextBoxFull : Life_RscStructuredText
				{
					idc = 4002;
					text = "";
					x = 0;
					y = 0;
					w = 0.510469 * safezoneW;
					h = 0;
				};

				class TextBoxLeft : TextBoxFull
				{
					idc = 4005;
					text = "";
					x = 0;
					w = 0.25523450 * safezoneW;
				};

				class TextBoxCenter : TextBoxFull
				{
					idc = 4007;
					text = "";
					x = 0.25523450;
					w = 0.12761725 * safezoneW;
				};

				class TextBoxRight : TextBoxFull
				{
					idc = 4006;
					text = "";
					x = 0.38285175 * safezoneW;
					w = 0.12761725 * safezoneW;
				};
			};
		};
		
		class ColerBar: Life_RscText
		{
			idc = 4003;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.650209 * safezoneW;
			h = 0.00822222 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class Topics: Life_RscListBox
		{
			onLBSelChanged = "_this call life_fnc_faq_lbChange;";

			idc = 4004;
			x = 0.180313 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.429 * safezoneH;
			sizeEx = 0.024 * safeZoneH;
		};
		
		class close_btn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			
			idc = -1;
			text = "$STR_Global_Close";
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.799666 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class farmingSim: Life_RscButtonMenu
		{
			onButtonClick = "createDialog 'farmingSim';";
			
			idc = -1;
			text = "Farm-Simulator";
			x = 0.748131 * safezoneW + safezoneX;
			y = 0.799666 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
