class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	onUnLoad = "[] call life_fnc_vehicleShopEnd3DPreview";

	class controlsBackground
	{
		class MainBackground: Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.66 * safezoneH;
		};

		class SecondBackground: Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.820099 * safezoneW + safezoneX;
			y = 0.082188 * safezoneH + safezoneY;
			w = 0.180055 * safezoneW;
			h = 0.318857 * safezoneH;
		};

		class Title : Life_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.0329852 * safezoneH;
		};

		class VehicleTitleBox: Life_RscText
		{
			idc = -1;
			text = "$STR_GUI_ShopStock";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class VehicleInfoHeader: Life_RscText
		{
			idc = 2330;
			text = "$STR_GUI_VehInfo";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.820099 * safezoneW + safezoneX;
			y = 0.0601979 * safezoneH + safezoneY;
			w = 0.180055 * safezoneW;
			h = 0.0219901 * safezoneH;
		};

		class CloseBtn: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.0298555 * safezoneW + safezoneX;
			y = 0.686916 * safezoneH + safezoneY;
			w = 0.0600185 * safezoneW;
			h = 0.0219901 * safezoneH;
		};

		class RentCar: Life_RscButtonMenu
		{
			idc = 2312;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.0298555 * safezoneW + safezoneX;
			y = 0.642936 * safezoneH + safezoneY;
			w = 0.0600185 * safezoneW;
			h = 0.0219901 * safezoneH;
		};

		class BuyCar: life_RscButtonMenu
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.103369 * safezoneW + safezoneX;
			y = 0.642936  * safezoneH + safezoneY;
			w = 0.0600185 * safezoneW;
			h = 0.0219901 * safezoneH;
		};
	};

	class controls
	{
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.022 * safeZoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			x = 0.023487 * safezoneW + safezoneX;
			y = 0.095 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.5 * safezoneH;
		};

		class ColorList: Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[] spawn life_fnc_vehiclecolor3DRefresh;";
			x = 0.0298555 * safezoneW + safezoneX;
			y = 0.60996 * safezoneH + safezoneY;
			w = 0.135042 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.01924 * safeZoneH;
			x = 0.8251 * safezoneW + safezoneX;
			y = 0.0931831 * safezoneH + safezoneY;
			w = 0.175054 * safezoneW;
			h = 0.296866 * safezoneH;
		};
	};
};