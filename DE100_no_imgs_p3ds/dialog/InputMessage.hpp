class Life_InputMessage
{
	idd = 565444;
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class Background: Life_RscBackground
		{
			idc = 1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class Title: Life_RscStructuredText
		{
			idc = 2;
			text = "";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class Middlepart: Life_RscStructuredText
		{
			idc = 3;
			text = "";
			x = 0.444323 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.111406 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class Text: Life_RscStructuredText
		{
			idc = 4;
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};

	class controls
	{
		class ButtonConfirm: Life_RscButtonMenu
		{
			idc = 5;
			text = "Bestätigen";
			onButtonClick = "disableSerialization;(findDisplay 46)setVariable['Confirm',ctrlText((findDisplay 565444)displayCtrl 7)];closeDialog 0";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonCancel: Life_RscButtonMenu
		{
			idc = 6;
			text = "Abbrechen";
			onButtonClick = "closeDialog 0;";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Input: Life_RscEdit
		{
			idc = 7;
			style="0x00 + 0x200";
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {.25,0,0,.7};
		};
	};
};