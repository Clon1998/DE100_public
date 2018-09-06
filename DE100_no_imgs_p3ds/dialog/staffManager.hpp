class Life_Staff_Manager
{
	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0, 0] call life_fnc_staffManager;";
	
	class controlsBackground
	{
		class Background: Life_RscText
		{
			idc = -1;

			x = 0.355625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};

		class Header: Life_RscText
		{
			idc = -1;

			text = "Personalüberischt"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls
	{
		class PlayerList: Life_RscListBox
		{
			idc = 4001;

			onLBSelChanged = "_this call life_fnc_staffManagerLbChange;";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
		};

		class StaffRank: Life_RscCombo
		{
			idc = 4002;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.28,0.28,0.28,0.85};
		};

		class Mode_Btn: Life_RscButtonMenu
		{
			idc = 4003;

			size = "0.022 * safeZoneH";
			onButtonClick = "";
			text = ""; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			class Attributes
			{
				font = "PuristaMedium";
				align = "center";
				valign = "middle";
			};
		};

		class StaffInfo: Life_RscStructuredText
		{
			idc = 4004;

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class Close_Btn: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;

			text = "Schließen"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.679333 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Confirm_Btn: Life_RscButtonMenu
		{
			idc = -1;

			onButtonClick = "[] call life_fnc_changeRank;";

			text = "Bestätigen"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.679333 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
