/*
	File:	virt_houseMenu.hpp
	Date:   15.07.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/

class virt_houseMenu {

	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0, uiNamespace getVariable ['De100_SSys',false]] call life_fnc_setupHousDisplay";
	onUnload = "life_houseInUse = false; if(life_house_session) then {[(_this select 0) getVariable ['house',objNull]] call life_fnc_updateHouseContainer; ['GEAR'] call SOCK_fnc_updatePartial;};dupeProtectionFSM setFSMVariable ['stopfsm',true]; life_action_target setVariable ['trunkUser',nil,true]; uiNamespace setVariable ['De100_SSys',false];";
	class controlsBackground {
	
		class titel: life_RscText
		{
			idc = 4000;

			text = "Hous Blahhh"; //--- ToDo: Localize;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			sizeEx = 0.022 * safeZoneH;
		};
		
		class MainBackground: Life_RscText
		{
			idc = -1;
			style = "128";
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			sizeEx = 0.022 * safeZoneH;
		};	
		
		class HouseTitelLeft: Life_RscText
		{
			idc = 4001;
			style = "0x00";
			text = "Lager Inventar"; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			sizeEx = 0.022 * safeZoneH;
		};
		
		class HouseTitelRight: Life_RscText
		{
			idc = 4002;
			style = "0x01";
			text = "10/3000"; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};
		
		class PlayerTitelLeft: Life_RscText
		{
			idc = 4003;
			style = "0x00";
			text = "Dein Inventar"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			sizeEx = 0.022 * safeZoneH;
		};	
		
		class PlayerTitelRight: Life_RscText
		{
			idc = 4004;
			style = "0x01";
			text = "20/64"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};

		class House_lb_bg: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.495 * safezoneH;
			colorBackground[] = {0.28,0.28,0.28,0.28};
		};	
		
		class Player_lb_bg: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.495 * safezoneH;
			colorBackground[] = {0.28,0.28,0.28,0.28};
		};	
	};
	
	class controls {
		class Weapon_btn: Life_RscButtonMenu
		{
			idc = 1001;
			text = "Waffen"; //--- ToDo: Localize;
			onButtonClick = "[_this select 0,0] call life_fnc_setupCategory;";
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			size = 0.032 * safeZoneH;
			class Attributes : Attributes {
				align = "center";
			};
			color[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorFocused[] = {0.761,0.761,0.761,1};
		};
		
		class Clothing_btn: Weapon_btn
		{
			idc = 1002;
			text = "Kleidung"; //--- ToDo: Localize;
			onButtonClick = "[_this select 0,1] call life_fnc_setupCategory;";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class item_btn: Weapon_btn
		{
			idc = 1003;
			text = "Items"; //--- ToDo: Localize;
			onButtonClick = "[_this select 0,2] call life_fnc_setupCategory;";			
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class other_btn: Weapon_btn
		{
			idc = 1004;
			text = "Sonstiges"; //--- ToDo: Localize;
			onButtonClick = "[_this select 0,3] call life_fnc_setupCategory;";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class House_lb: Life_RscListNBox
		{
			idc = 1100;
			drawSideArrows = 0;
			//0.11 
			columns[] = {-0.01,0.11,0.21};
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.495 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			colorSelect[] = {1, 1, 1, 1};
			colorSelect2[] = {1, 1, 1, 1};
		};
		
		class Player_lb: Life_RscListNBox
		{
			idc = 1200;
			drawSideArrows = 0;
			//0.11,0.21 bigge
			//0.05,0.15 small
			columns[] = {-0.01,0.11,0.21};
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.495 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			colorSelect[] = {1, 1, 1, 1};
			colorSelect2[] = {1, 1, 1, 1};
		};
		
		class House_leftBtn: Life_RscButtonMenu
		{
			idc = 1101;
			text = "Left Btn"; //--- ToDo: Localize;
			
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			size = 0.022 * safeZoneH;
		};

		class House_edit: Life_RscEdit
		{
			idc = 1102;
			style = "0x02 + 0x200";
			text = "1"; //--- ToDo: Localize;
			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};

		class House_rightbtn: Life_RscButtonMenu
		{
			idc = 1103;
			text = "Right Btn"; //--- ToDo: Localize;
			
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			size = 0.022 * safeZoneH;
		};

		class Player_leftBtn: Life_RscButtonMenu
		{
			idc = 1201;
			text = "Left Btn"; //--- ToDo: Localize;
			style = "0x02";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			size = 0.022 * safeZoneH;
		};

		class Player_edit: Life_RscEdit
		{
			idc = 1202;
			style = "0x02 + 0x200";
			text = "1"; //--- ToDo: Localize;
			
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};

		class Player_rightbtn: Life_RscButtonMenu
		{
			idc = 1203;
			text = "Right Btn"; //--- ToDo: Localize;
			
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			size = 0.022 * safeZoneH;
		};
		
		class Filter_1: Life_RscControlsGroup
		{
			idc = 1300;
			text = "images\icons\ico_bank.paa";
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			class Controls
			{
				class Image: Life_RscPicture
				{
					idc = 1;
					text = "";
					x = 0;
					y = 0;
					w = 0.0257812 * safezoneW;
					h = 0.044 * safezoneH;
				};

				class Selector: Life_RscPicture
				{
					idc = 2;
					text = "";
					colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					x = 0;
					y = 0;
					w = 0.0257812 * safezoneW;
					h = 0.044 * safezoneH;
				};

				class Btn: Life_RscButtonMenu
				{
					idc = 3;
					text = "";
					colorBackground[] = {0,0,0,0};
					colorBackground2[] = {0,0,0,0};
					colorBackgroundFocused[] = {0,0,0,0};
					x = 0;
					y = 0;
					w = 0.0257812 * safezoneW;
					h = 0.044 * safezoneH;
				};
			};
		};
		class Filter_2: Filter_1
		{
			idc = 1301;
			y = 0.291 * safezoneH + safezoneY;
		};
		class Filter_3: Filter_1
		{
			idc = 1302;
			y = 0.346 * safezoneH + safezoneY;
		};
		class Filter_4: Filter_1
		{
			idc = 1303;
			y = 0.401 * safezoneH + safezoneY;
		};
		class Filter_5: Filter_1
		{
			idc = 1304;
			y = 0.456 * safezoneH + safezoneY;
		};
		class Filter_6: Filter_1
		{
			idc = 1305;
			y = 0.511 * safezoneH + safezoneY;
		};
		class Filter_7: Filter_1
		{
			idc = 1306;
			y = 0.566 * safezoneH + safezoneY;
		};
		class Filter_8: Filter_1
		{
			idc = 1307;
			y = 0.621 * safezoneH + safezoneY;
		};
		class Filter_9: Filter_1
		{
			idc = 1308;
			y = 0.676 * safezoneH + safezoneY;
		};
		class Filter_10: Filter_1
		{
			idc = 1309;
			y = 0.731 * safezoneH + safezoneY;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.800593 * safezoneH + safezoneY;
			w = 0.0650064 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};