class Life_impound_menu
{
	idd = 2800;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground
	{
		class Life_RscTitleBackground: Life_RscText
		{
			idc = 2801;
			text = "$STR_GUI_Garage";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.301954 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class MainBackground : Life_RscText
		{
			idc = 2801;
			x = 0.309221 * safezoneW + safezoneX;
			y = 0.323959 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.341079 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		
		class VehicleTitleBox : Life_RscText
		{
			idc = -1;

			text = "$STR_GUI_YourVeh"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.334962 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class VehicleInfoHeader : Life_RscText
		{
			idc = 2830;

			text = "$STR_GUI_VehInfo"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.334962 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1005;
			text = "$STR_Global_Close"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.676041 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class UnImpound : Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_unimpound;";

			idc = 1006;
			text = "$STR_Global_Retrieve"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.676041 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class SellCar: Life_RscButtonMenu
		{
			idc = 2842;
			onButtonClick = "(_this select 0) ctrlShow false; [] spawn life_fnc_sellGarage;";

			text = "$STR_Global_Sell"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.676041 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220051 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls
	{
		class VehicleList: Life_RscListBox
		{
			idc = 2802;
			onLBSelChanged = "_this call life_fnc_garageLBChange;";
			sizeEx = 0.022 * safeZoneH;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.356967 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.286066 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		
		class vehicleInfomationList_grp: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.356967 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286066 * safezoneH;
			class Controls
			{
				class vehicleInfomationList : Life_RscStructuredText
				{
					idc = 2803;
					text = "";
					sizeEx = 0.01925 * safeZoneH;
					x = 0;
					y = 0;
					w = 0.180469 * safezoneW;
					h = 0.286066 * safezoneH;
				};
			};
		};
		
		class MainBackgroundHider : Life_RscText
		{
			idc = 2810;

			x = 0.309219 * safezoneW + safezoneX;
			y = 0.323959 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.341079 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		
		class MainHideText : Life_RscText
		{
			idc = 2811;

			text = "$STR_ANOTF_QueryGarage"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.466992 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.0366751 * safezoneH;
		};
	};
};