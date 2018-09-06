class checkPlate
{
		idd =4001;
		movingenable = 0;
		class Controlsbackground
		{
			class TBackground: Life_RscText
			{
				idc = -1;
				x = 0.333298 * safezoneW + safezoneX;
				y = 0.346 * safezoneH + safezoneY;
				w = 0.335156 * safezoneW;
				h = 0.286 * safezoneH;
				colorBackground[] = {1,1,1,0.3};
				colorActive[] = {1,1,1,0.3};
				text = "";
			};

			class THeader: Life_RscText
			{
				idc = -1;
				text = "Polizei Bordcomputer"; //--- ToDo: Localize;
				x = 0.42 * safezoneW + safezoneX;
				y = 0.379 * safezoneH + safezoneY;
				w = 0.228 * safezoneW;
				h = 0.044 * safezoneH;
				colorText[] = {0,1,0,0.8};
				colorBackground[] = {1,1,1,0};
				colorActive[] = {1,1,1,0.3};
				sizeEx = 0.06;
			};
		};
	class Controls
	{
		class TButton: Life_RscButton
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorBorder[] = {0,1,0,0.3};
			colorDisabled[] = {0,1,0,0.3};
			colorBackground[] = {0,1,0,0.3};
			colorBackgroundDisabled[] = {0,1,0,0.3};
			colorBackgroundActive[] = {0,1,0,0.3};
			colorFocused[] = {0,1,0,0.5};
			colorActive[] = {0,1,0,0.5};
			action = "closeDialog 0;";
		};
		class TButton2: Life_RscButton
		{
			idc = -1;
			text = "Überprüfen"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorBorder[] = {0,1,0,0.3};
			colorDisabled[] = {0,1,0,0.3};
			colorBackground[] = {0,1,0,0.3};
			colorBackgroundDisabled[] = {0,1,0,0.3};
			colorFocused[] = {0,1,0,0.5};
			colorBackgroundActive[] = {0,1,0,0.3};
			colorActive[] = {0,1,0,0.5};
			tooltip = "Bitte beachte, dass das Kennzeichen geklaut sein könnte"; //--- ToDo: Localize;
			action = "([ctrlText 5001]) call mis_fnc_requestOwner;closeDialog 0;";
		};

		class TPlateNumber: Life_RscEdit
		{
			idc = 5001;
			text = "";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,0.8};
			colorActive[] = {1,1,1,0.8};
		};
	};
};
