class numberPlate
{
	idd =4000;
	movingenable = 0;
	class Controlsbackground
	{
		class TBackground: Life_RscText
		{
			idc = 2200;
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
			idc = 1000;
			text = "DE100 Nummernschild Generator"; //--- ToDo: Localize;
			x = 0.391094 * safezoneW + safezoneX;
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
			idc = 1600;
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

		class TButton3: Life_RscButton
		{
			idc = 1602;
			text = "Hilfe"; //--- ToDo: Localize;
			x = 0.345313 * safezoneW + safezoneX;
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
			action = "Hint format [""mit diesem Werkzeug, kannst du das KFZ-Kennzeichen eines Autos manipulieren, dazu muss du nahe an das Auto heran und das Item nutzen. Beachte, dass du Kennzeichen von anderen Fahrzeugen nutzen kannst um deine Identität zu verschleiern. Leider haben nicht alle Arma 3 Autos ein Kennzeichen""];";
		};

		class TButton2: Life_RscButton
		{
			idc = 1601;
			text = "Anpassen"; //--- ToDo: Localize;
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
			tooltip = "Bitte beachte, dass das Kennzeichen max 12 - 15 Zeichen haben sollte, weiterhin  besitzen nicht alle Fahrzeuge ein sichtbares Kennzeichen!"; //--- ToDo: Localize;
			action = "([ctrlText 5000]) call mis_fnc_changePlate;closeDialog 0;";
		};

		class TPlateNumber: Life_RscEdit
		{
			idc = 5000;
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
