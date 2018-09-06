/*
	File:	ui.hpp
	Date:   15.07.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/

// Control types
#define CT_STATIC	0
// Static styles
#define ST_PICTURE	48

class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 1e+011;
  	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	
	class controlsBackground 
	{
		class BG: Life_RscPicture
		{
			idc = 4451;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			shadow = 0;
			type = CT_STATIC;
			style = ST_PICTURE;
			text = "images\ui\ui_mainbg.paa";
			x = 0.90504 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.10001 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class BG2: BG
		{
			idc = 4466;
			shadow = 0;
			type = CT_STATIC;
			style = ST_PICTURE;
			text = "images\ui\ui_secbg.paa";
			x = 0.90504 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.10001 * safezoneW;
			h = 0.396 * safezoneH;
		};
	};
	
	class controls
	{
		class Text_FOOD : Life_RscStructuredText
		{
			idc = 4452;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "100%"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.6945 * safezoneH + safezoneY;
			w = 0.0300029 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_THIRST: Life_RscStructuredText
		{
			idc = 4453;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "100%"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.72572 * safezoneH + safezoneY;
			w = 0.0300029 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_HEALTH: Life_RscStructuredText
		{
			idc = 4454;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "100%"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.75608 * safezoneH + safezoneY;
			w = 0.0300029 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_FAT: Life_RscStructuredText
		{
			idc = 4455;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "100%"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.78622 * safezoneH + safezoneY;
			w = 0.0300029 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_BAGP: Life_RscStructuredText
		{
			idc = 4456;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.0175 * safeZoneH;
			text = "64/64"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.818 * safezoneH + safezoneY;
			w = 0.0400039 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_TIME: Life_RscStructuredText
		{
			idc = 4457;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "TIME"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.847 * safezoneH + safezoneY;
			w = 0.0350034 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Text_DATE: Life_RscStructuredText
		{
			idc = 4458;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.019 * safeZoneH;
			text = "DATE"; //--- ToDo: Localize;
			x = 0.906 * safezoneW + safezoneX;
			y = 0.87708 * safezoneH + safezoneY;
			w = 0.0350034 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ProgressBar_FOOD: Life_RscProgress
		{
			idc = 4459;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			colorFrame[] = {0, 0, 0, 0};
			x = 0.948 * safezoneW + safezoneX;
			y = 0.700778 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class ProgressBar_THIRST: ProgressBar_FOOD
		{
			idc = 4460;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			x = 0.948 * safezoneW + safezoneX;
			y = 0.73163 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class ProgressBar_HEALTH: ProgressBar_FOOD
		{
			idc = 4461;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			x = 0.948 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class ProgressBar_FAT: ProgressBar_FOOD
		{
			idc = 4462;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			x = 0.948 * safezoneW + safezoneX;
			y = 0.792593 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class ProgressBar_BAGP: ProgressBar_FOOD
		{
			idc = 4463;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			x = 0.948 * safezoneW + safezoneX;
			y = 0.822 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class TIME: Life_RscStructuredText
		{
			idc = 4464;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.021 * safeZoneH;
			text = "01:00"; //--- ToDo: Localize;
			x = 0.948544 * safezoneW + safezoneX;
			y = 0.84496 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.0238517 * safezoneH;
			colorBackground[] = {1,1,1,0};
			class Attributes {
				align = "center";
			};
		};
		
		class DATE: Life_RscStructuredText
		{
			idc = 4465;
			onLoad="(_this select 0) setVariable ['initalPos',ctrlPosition (_this select 0)];";
			size = 0.021 * safeZoneH;
			text = "12.01.2016"; //--- ToDo: Localize;
			x = 0.9475 * safezoneW + safezoneX;
			y = 0.87598 * safezoneH + safezoneY;
			w = 0.0534431 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0};
			class Attributes {
				align = "center";
			};
		};
		
		class WATERMARK: Life_RscPicture
		{
			idc = -1;
			text = "images\ui\ui_logo_alpha.paa";
			x = -4.90237e-005 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.187 * safezoneH;
		};
		
		class DXP: Life_RscPicture
		{
			idc = 4468;
			text = "images\ui\ui_dxp.paa";
			x = 0.960045 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0350034 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class OHRS: Life_RscPicture
		{
			idc = 4469;
			text = "images\ui\ui_ohrS.paa";
			x = 0.960045 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0350034 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class TIMEANDDATE: Life_RscText
		{
			idc = 4470;
			size = 0.0222 * safeZoneH;
			style = "0x01";
			text = ""; //--- ToDo: Localize;
			x = 0.849859 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0};
		};
	};   
};