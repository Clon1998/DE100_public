/*
	File :  smartphone.hpp
	Date:   07.02.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/
#define bg_h_texture __EVAL(["images\smartphone\bg_h_normal_white.paa","images\smartphone\bg_h_normal_black.paa"] select (profilenamespace getvariable ["DarkPhone",false]))
#define bg_s_texture __EVAL(["images\smartphone\bg_s_normal_white.paa","images\smartphone\bg_s_normal_black.paa"] select (profilenamespace getvariable ["DarkPhone",false]))


class Life_my_new_smartphone {
	idd = 6500;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "life_Cell_Opening_time = diag_tickTime; _this spawn life_fnc_handleTimes;";
	onUnload = "life_battery = (life_battery - ((diag_tickTime - life_Cell_Opening_time) / 25)); if (life_battery < 0) then {life_battery = 0}";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;		
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
	};

	class controls {
		class Smarphone_pic_market: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_market.paa";
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.15)";
		};

		class Smarphone_btn_market: Life_RscButtonMenuSmartphone
		{
			tooltip = "Markt";
			onButtonClick = "createDialog ""Life_my_new_smartphone_markt"";";
			idc = 6501;
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_map: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_map.paa";
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_map: Life_RscButtonMenuSmartphone
		{
			tooltip = "Gps";
			onButtonClick = "createDialog ""Life_my_new_smartphone_map"";";
			idc = 6502;
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_msg: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_msg.paa";
			x = 0.502269 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_msg: Life_RscButtonMenuSmartphone
		{
			tooltip = "Nachrichten";
			onButtonClick = "createDialog ""Life_my_new_smartphone_msg"";";
			idc = 6503;
			x = 0.502269 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_phone: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_phone.paa";
			x = 0.537125 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_phone: Life_RscButtonMenuSmartphone
		{
			tooltip = "Telefon";
			onButtonClick = "createDialog ""Life_my_new_smartphone_call"";";
			idc = 6504;
			x = 0.537125 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_bank: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_bank.paa";
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_bank: Life_RscButtonMenuSmartphone
		{
			tooltip = "Bank";
			onButtonClick = "createDialog 'Life_my_new_smartphone_Bank'";
			idc = 6505;
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};


		class Smarphone_pic_contact: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_contact.paa";
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_contact: Life_RscButtonMenuSmartphone
		{
			tooltip = "Kontakte";
			onButtonClick = "createDialog ""Life_my_new_smartphone_contact"";";
			idc = 6506;
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_taxi: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_taxi.paa";
			x = 0.502269 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_taxi: Life_RscButtonMenuSmartphone
		{									//&& _x != player
			tooltip = "Taxi rufen";
			onButtonClick = "closeDialog 0; if (count (allPlayers select {_x getVariable['TaxiDuty',false]}) == 0) then {['Im Moment ist kein Taxifahrer im Dienst!',false,'fast'] call life_fnc_notification_system; } else {[player] remoteExecCall ['life_fnc_callTaxi',allPlayers select {_x getVariable['TaxiDuty',false]}]; ['Du hast eine Taxianfrage gesendet',false,'fast'] call life_fnc_notification_system; };";
			idc = 6507;
			x = 0.502269 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};
		
		class Smarphone_pic_Archi: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_achiv.paa";
			x = 0.537125 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_Archi: Life_RscButtonMenuSmartphone
		{
			tooltip = "Erfolge";
			idc = 6508;
			onButtonClick = "createDialog ""Life_my_new_smartphone_Archi"";";
			x = 0.537125 * safezoneW + safezoneX;
			y = 0.37152 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Smarphone_pic_gamble: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_gamble.paa";
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.43026 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_gamble: Life_RscButtonMenuSmartphone
		{
			tooltip = "De100-Jackpot";
			onButtonClick = "createDialog ""Life_my_new_smartphone_Gamble"";";
			idc = 6509;
			x = 0.431422 * safezoneW + safezoneX;
			y = 0.43026 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};

		class Smarphone_pic_call: RscPicture
		{
			idc = -1;
			size = 0.05;

			text = "images\smartphone\app_emergency.paa";
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.43026 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Smarphone_btn_Call: Life_RscButtonMenuSmartphone
		{
			tooltip = "Notruf";
			onButtonClick = "createDialog ""Life_my_new_smartphone_Notruf"";";
			idc = 6509;
			x = 0.466794 * safezoneW + safezoneX;
			y = 0.43026 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};

		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};

		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
	};
};

class Life_my_new_smartphone_markt {
	idd = 6600;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes; [] call life_fnc_openMarketView;";
	
	class controlsBackground
	{
		class Smartphone_bg: RscPicture
		{
			idc = 4230;
			text = bg_s_texture;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class Itemlist_header: Life_RscText
		{
			idc = -1;

			text = "Itemliste"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.37526 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class Entwicklung_header: Life_RscText
		{
			idc = -1;
			text = "Preisentwicklung";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			x = 0.474218 * safezoneW + safezoneX;
			y = 0.37526 * safezoneH + safezoneY;
			w = 0.176859 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.319222 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.0171837 * safezoneW;
			h = 0.0787021 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322316 * safezoneW + safezoneX;
			y = 0.57106 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322006 * safezoneW + safezoneX;
			y = 0.38538 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};
		
		class Item_lb: Life_RscListBox
		{
			onLBSelChanged = "[] spawn life_fnc_refreshMarketView";
			idc = 6603;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.39704 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.237794 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			sizeEx = 0.0187 * safeZoneH;
		};
		
		class entwicklungseitserverpic: RscPicture
		{
			idc = 6604;
			text = "";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
	
		class entwicklungvorkuzenpic: RscPicture
		{
			idc = 6605;
			text = "";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};	
		
		class ServerStart: Life_RscText
		{
			idc = 6606;
			text = "Seit Serverstart";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ServerStartPreis: Life_RscText
		{
			idc = 6607;
			text = "$xxxxxxx";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Vorkuzen: Life_RscText
		{
			idc = 6608;
			text = "Vor kurzem";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vorkurzenpreis: Life_RscText
		{
			idc = 6609;
			text = "$xxxxxxx";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ItemName: Life_RscText
		{
			idc = 6610;
			text = "TestName";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ItemPrice: Life_RscText
		{
			idc = 6611;
			text = "$xxxxxxx";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class itemicon: RscPicture
		{
			idc = 6612;

			text = "";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};

class Life_my_new_smartphone_map {
	idd = 6700;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes;";
	
	class controlsBackground
	{
		class Smartphone_bg: RscPicture
		{
			idc = 4230;
			text = bg_s_texture;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.385 * safezoneH;
		};
	};
	
	class controls
	{
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.319222 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.0171837 * safezoneW;
			h = 0.0787021 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322316 * safezoneW + safezoneX;
			y = 0.57106 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322006 * safezoneW + safezoneX;
			y = 0.38538 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};
		
		class Smarphone_Map: Life_RscMapControl
		{
			idc = 6703;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.37614 * safezoneH + safezoneY;
			w = 0.306178 * safezoneW;
			h = 0.2607 * safezoneH;
		};
	};
};

class Life_my_new_smartphone_contact {
	idd = 6800;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes;[0] spawn life_fnc_smartphoneKontakte;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class Smartphone_header: Life_RscText
		{
			idc = -1;
			text = "Kontakte";
			x = 0.418 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.159875 * safezoneW;
			h = 0.0210741 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};

	class controls {
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};

		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};

		class Plist: Life_RscListBox
		{
			idc = 6803;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.31388 * safezoneH + safezoneY;
			w = 0.160875 * safezoneW;
			h = 0.402065 * safezoneH;
			onLBDblClick = "closeDialog 0; [(objectFromNetId (lbData[6803,(lbCurSel 6803)])) getVariable ['phoneNumber','nope']] spawn life_fnc_callPlayer;";
			onLBSelChanged = "ctrlEnable[6804,true]";
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.0187 * safeZoneH;
			rowHeight = 0.033 * safeZoneH;
		};

		class smartphone_pic_fly: RscPicture
		{
			idc = 6805;
			text = "images\smartphone\btn_offline.paa";
			x = 0.419356 * safezoneW + safezoneX;
			y = 0.7112 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_btn_fly: life_real_RscButton
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;[] call life_fnc_offline_mode;";
			x = 0.419356 * safezoneW + safezoneX;
			y = 0.7112 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
		};

		class smartphone_send: Life_RscButtonMenuSmartphone
		{
			idc = 6804;
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			
			onButtonClick = "closeDialog 0; [(objectFromNetId (lbData[6803,(lbCurSel 6803)])) getVariable ['phoneNumber','nope']] spawn life_fnc_callPlayer;";
			text = "Anrufen";
			x = 0.441219 * safezoneW + safezoneX;
			y = 0.7189 * safezoneH + safezoneY;
			w = 0.110344 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			size = 0.03 * safeZoneH;
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
		
		class smartphone_pic_addContact: RscPicture
		{
			idc = -1;
			text = "images\smartphone\btn_add_user.paa";
			x = 0.554656 * safezoneW + safezoneX;
			y = 0.7189 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Smarphone_btn_Call: life_real_RscButton
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;createDialog 'Life_my_new_smartphone_create_contact'";
			x = 0.554656 * safezoneW + safezoneX;
			y = 0.7134 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
		};
	};
};

class Life_my_new_smartphone_Notruf {
	idd = 7000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes; [0,''] spawn life_fnc_smartphoneNotruf;";
	
	class controlsBackground
	{
		class Smartphone_bg: RscPicture
		{
			idc = 4230;
			text = bg_s_texture;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class Header: Life_RscText
		{
			idc = -1;
			text = "Notruf";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.37592 * safezoneH + safezoneY;
			w = 0.305927 * safezoneW;
			h = 0.0277735 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};
	
	class controls
	{
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.319222 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.0171837 * safezoneW;
			h = 0.0787021 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322316 * safezoneW + safezoneX;
			y = 0.57106 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.322006 * safezoneW + safezoneX;
			y = 0.38538 * safezoneH + safezoneY;
			w = 0.0116299 * safezoneW;
			h = 0.0256546 * safezoneH;
		};

		class Smarphone_msg_edit: Life_RscEdit
		{
			idc = 7003;
			style = 16;
			text = "..............";
			shadow = 0;
			onMouseEnter = "if ((ctrlText (_this select 0)) == '..............') then {(_this select 0) ctrlSetText ''};";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.40386 * safezoneH + safezoneY;
			w = 0.306334 * safezoneW;
			h = 0.184397 * safezoneH;
		};

		class Back: Life_RscButtonMenuSmartphone
		{
			idc = 7005;
			onButtonClick = "closeDialog 0;";
			text = "Zurück";
			x = 0.344797 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			color[] = {1,1,1,1};
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
		class pic_admin: RscPicture
		{
			idc = -1;
			text = "images\smartphone\msg_admin.paa";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.15)";
		};

		class Smarphone_btn_admin: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "";
			idc = 7006;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class pic_thr: RscPicture
		{
			idc = -1;
			text = "images\smartphone\msg_adac.paa";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.15)";
		};

		class Smarphone_thr: Life_RscButtonMenuSmartphone
		{
			tooltip = "An THR";
			onButtonClick = "";
			idc = 7008;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class pic_cop: RscPicture
		{
			idc = -1;
			text = "images\smartphone\msg_cop.paa";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.15)";
		};

		class Smarphone_cop: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "";
			idc = 7010;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {1,1,1,0};
		};

		class Pos_txt: Life_RscText
		{
			idc = -1;
			text = "Position"; //--- ToDo: Localize;
			x = 0.518 * safezoneW + safezoneX;
			y = 0.5976 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Pos_check: Life_Checkbox
		{
			idc = 7011;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class Life_my_new_smartphone_msg {
	idd = 7100;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes; ['contacts'] spawn life_fnc_smartphoneMsgView;";
	
	class controlsBackground
	{
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		
		class Smartphone_header: Life_RscText
		{
			idc = -1;

			text = "Kontakte"; //--- ToDo: Localize;
			x = 0.418 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.159875 * safezoneW;
			h = 0.0210741 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class Smartphone_header_huge: Life_RscStructuredText
		{
			idc = 7100;

			text = "<t size='1.2'>Lucian</t> <br/>Ziv"; //--- ToDo: Localize;
			x = 0.418 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.159875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,1};
			class Attributes {
				align = "center";
				valign = "middle";
			};
		};
		class Smartphone_header_search: Life_RscText
		{
			idc = 7099;
			text = "Suche:"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "";
			idc = 7108;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		class Search_Plist: Life_RscEdit
		{
			idc = 7098;
			onKeyDown = "['search'] spawn life_fnc_smartphoneMsgView;";
			onKeyUp = "['search'] spawn life_fnc_smartphoneMsgView;";
			text = "";
			style = 0x200;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Plist: Life_RscListBox
		{
			idc = 7101;
			onLBDblClick = "['write'] spawn life_fnc_smartphoneMsgView;";
			sizeEx = 0.0187 * safeZoneH;
			rowHeight = 0.033 * safeZoneH;

			x = 0.4175 * safezoneW + safezoneX;
			y = 0.33588 * safezoneH + safezoneY;
			w = 0.160875 * safezoneW;
			h = 0.423399 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class Msg_ctrl_grp: Life_RscControlsGroup
		{
			idc = 7102;

			x = 0.4175 * safezoneW + safezoneX;
			y = 0.347111 * safezoneH + safezoneY;
			w = 0.160875 * safezoneW;
			h = 0.353111 * safezoneH;
			colorBackground[] = {0,0,0,0};
			class Controls{};
		};
		
		class Edit: Life_RscEdit
		{
			idc = 7103;
			text = "";
			style = 16 + 0x200;
			x = 0.420431 * safezoneW + safezoneX;
			y = 0.706974 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
	
		class Send_btn: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			
			onButtonClick = "[] spawn life_fnc_send_msg;";
			idc = 7104;
			text = "";
			x = 0.554687 * safezoneW + safezoneX;
			y = 0.708111 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Send_pic: RscPicture
		{
			idc = 7105;
			text = "images\smartphone\btn_send.paa";
			x = 0.554687 * safezoneW + safezoneX;
			y = 0.708111 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Emoji_btn: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			
			onButtonClick = "call life_fnc_emoji";
			idc = 7106;
			text = "";
			x = 0.526562 * safezoneW + safezoneX;
			y = 0.707185 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Emoji: RscPicture
		{
			idc = 7107;
			text = "images\smartphone\btn_emoji.paa";
			x = 0.526562 * safezoneW + safezoneX;
			y = 0.707185 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};

class Life_my_new_smartphone_Archi {
	idd = 7200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes;_this spawn life_fnc_Achiv_setup;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class Smartphone_header: Life_RscText
		{
			idc = -1;
			text = "Erfolge";
			x = 0.418 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.159875 * safezoneW;
			h = 0.0210741 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};

	class controls {
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};

		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};

		class Smarphone_ArchiList: Life_RscTree
		{
			idc = 7203;
			onTreeSelChanged = "_this call life_fnc_Achiv_tree_changed";
			colorBackground[] = {0,0,0,0};
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.31476 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.2827 * safezoneH;
			sizeEx = 0.0187 * safeZoneH;
			rowHeight = 0.033 * safeZoneH;
		};

		class Smarphone_ArchiTxt: Life_RscStructuredText
		{
			idc = 7204;
			colorBackground[] = {0,0,0,0};
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.59724 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.131074 * safezoneH;
		};

		class Title_Btn: Life_RscButtonMenuSmartphone
		{
			idc = 7205;
			text = "Als Titel Festlegen";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.032296 * safezoneH;
			onButtonClick = "[] spawn life_fnc_SetTitle";
			color[] = {1,1,1,1};
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
	};
};

class Life_my_new_smartphone_Bank {
	idd = 8200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_LoadMobileBanking;_this spawn life_fnc_handleTimes;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		
		class De100_Banking_Logo: RscPicture
		{
			idc = -1;
			text = "images\smartphone\img_mbank.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.132 * safezoneH;
		};
	};

	class controls {
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};

		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Moneynfo: Life_RscStructuredText
		{
			idc = 6661;
			text= "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class Betrag_txt: Life_RscStructuredText
		{
			idc = -1;
			text = "Betrag:"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Betrag_edit: Life_RscEdit
		{
			idc = 6680;
			style = 0x00 + 0x200;
			colorBackground[] = {0.7,0.7,0.7,1};
			colorText[] = {0.1, 0.1, 0.1, 1};
			text = "1"; //--- ToDo: Localize;
			shadow = 0;
			onMouseEnter = "if ((ctrlText (_this select 0)) == '1') then {(_this select 0) ctrlSetText ''};";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Empfaenger_txt: Life_RscStructuredText
		{
			idc = -1;
			text = "Empfänger:"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Empfaenger_edit: Life_RscCombo
		{
			idc = 6682;
			colorText[] = {0.1, 0.1, 0.1, 1};
			colorSelect[] = {0, 0, 0, 1};
			colorBackground[] = {0.7,0.7,0.7,1};
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Verwendungszweck_txt: Life_RscStructuredText
		{
			idc = -1;
			text = "Verwendungszweck:"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Verwendungszweck_edit: Life_RscEdit
		{
			idc = 6684;
			style = 16 + 0x200;
			shadow = 0;
			text = "Maximal 80 Zeichen!"; //--- ToDo: Localize;
			onMouseEnter = "if ((ctrlText (_this select 0)) == 'Maximal 80 Zeichen!') then {(_this select 0) ctrlSetText ''};";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0.7,0.7,0.7,1};
			colorText[] = {0.1, 0.1, 0.1, 1};
		};
		
		class Ueberweisen_btn: Life_RscButtonMenuSmartphone
		{
			idc = 8203;
			text = "Überweisen"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.71648 * safezoneH + safezoneY;
			w = 0.159715 * safezoneW;
			h = 0.0424813 * safezoneH;
			onButtonClick = "[] call life_fnc_bankTransfer";
			color[] = {1,1,1,1};
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			size = 0.03 * safeZoneH;
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
	};
};

class Life_my_new_smartphone_Gamble {
	idd = 9200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_RefreshPot;_this spawn life_fnc_handleTimes;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		
		class De100_Jackpot_Logo: RscPicture
		{
			idc = -1;
			text = "images\smartphone\img_jackpot.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.132 * safezoneH;
		};
	};

	class controls {
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			text = "100%";
			size = 0.022 * safeZoneH;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			text = "12:20";
			style = "0x00";
			size = 0.022 * safeZoneH;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};

		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class CrntPotInfo: Life_RscStructuredText
		{
			idc = 8209;
			text = ""; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.176 * safezoneH;
		};
		
		class Betrag_edit: Life_RscEdit
		{
			idc = 8203;
			onMouseEnter = "";
			style = 0x00 + 0x200;
			text = "1"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.6881 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.7};
			colorText[] = {0.1, 0.1, 0.1, 1};
			shadow = 0;
		};

		class Timer_Progress: Life_RscProgress
		{
			idc = 8205;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Timer_Text: Life_RscText
		{
			idc = 8206;
			text = "Verbleibende Zeit:"; //--- ToDo: Localize;
			x = 0.420491 * safezoneW + safezoneX;
			y = 0.3889 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class LastwinTitel: Life_RscText
		{
			idc = 8207;
			text = "Vorheriger Gewinner:"; //--- ToDo: Localize;
			x = 0.420491 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lastwinner: Life_RscText
		{
			idc = 8208;
			text = "Lucian"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};		

		class Engage_btn: Life_RscButtonMenuSmartphone
		{
			idc = 8204;
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			onButtonClick = "[parseNumber(ctrlText 8203)] spawn life_fnc_bet";
			text = "Setzen"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.71648 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.0424813 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			size = 0.04 * safeZoneH;
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
	};
};

class Life_my_new_smartphone_call {
	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_smartphoneCall; _this spawn life_fnc_handleTimes;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
	};

	class controls {
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			idc = -1;
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			idc = -1;
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			size = 0.022 * safeZoneH;

			text = "100%"; //--- ToDo: Localize;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			size = 0.022 * safeZoneH;

			text = "12:20";
			style = "0x00"; //--- ToDo: Localize;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_st_ownNumber: Life_RscStructuredText
		{
			idc = 9499;
			text = ""; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.099 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
			};
		};
		
		class Smarphone_edit_Number: Life_RscEdit
		{
			idc = 9500;
			style = 0x00 + 0x200;
			text = "";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class Smarphone_btn_one: life_real_RscButton
		{
			idc = 9501;
			text = "1";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'1']";
			sizeEx = 0.0594 * safeZoneH;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
		};
		
		class Smarphone_btn_two: Smarphone_btn_one
		{
			idc = 9502;
			text = "2";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'2']";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_btn_three: Smarphone_btn_one
		{
			idc = 9503;
			text = "3";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'3']";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_four: Smarphone_btn_one
		{
			idc = 9504;
			text = "4";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'4']";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_five: Smarphone_btn_one
		{
			idc = 9505;
			text = "5";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'5']";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_six: Smarphone_btn_one
		{
			idc = 9506;
			text = "6";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'6']";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_seven: Smarphone_btn_one
		{
			idc = 9507;
			text = "7";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'7']";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_eight: Smarphone_btn_one
		{
			idc = 9508;
			text = "8";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'8']";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_nine: Smarphone_btn_one
		{
			idc = 9509;
			text = "9";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'9']";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_star: Smarphone_btn_one
		{
			idc = 9510;
			text = "*";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'*']";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_zero: Smarphone_btn_one
		{
			idc = 9511;
			text = "0";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'0']";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_hashtag: Smarphone_btn_one
		{
			idc = 9512;
			text = "#";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500)+'#']";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			
		};
		
		class Smarphone_btn_misc: Smarphone_btn_one
		{
			idc = 9513;
			text = "";
			onButtonClick = "closeDialog 0;createDialog 'Life_my_new_smartphone_contact';";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_pic_misc: RscPicture
		{
			idc = -1;
			text = "images\smartphone\btn_contact.paa";
			x = 0.430906 * safezoneW + safezoneX;
			y = 0.7013 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class Smarphone_btn_Call: Smarphone_btn_one
		{
			idc = 9514;
			text = "";
			onButtonClick = "[ctrlText((findDisplay 4000) displayCtrl 9500)] spawn life_fnc_callPlayer;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_pic_Call: RscPicture
		{
			idc = -1;
			text = "images\smartphone\btn_call.paa";
			x = 0.48515 * safezoneW + safezoneX;
			y = 0.7068 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_btn_delete: Smarphone_btn_one
		{
			idc = 9515;
			text = "";
			onButtonClick = "ctrlSetText [9500,(ctrlText 9500) select [0,count (ctrlText 9500)-1]]";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class Smarphone_pic_delete: RscPicture
		{
			idc = -1;
			text = "images\smartphone\btn_backspace.paa";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.7013 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class Life_my_new_smartphone_create_contact {
	idd = 9200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_smartphoneAddContact; _this spawn life_fnc_handleTimes;";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
		
		class Smartphone_header: Life_RscText
		{
			idc = -1;

			text = "Kontakt hinzufügen"; //--- ToDo: Localize;
			x = 0.418 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.159875 * safezoneW;
			h = 0.0210741 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
		
		class Numer_header: Life_RscText
		{
			idc = -1;
			text = "Nummer:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls {
		class Smarphone_btn_home: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.474734 * safezoneW + safezoneX;
			y = 0.77434 * safezoneH + safezoneY;
			w = 0.0437183 * safezoneW;
			h = 0.026783 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			idc = -1;
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			idc = -1;
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			size = 0.022 * safeZoneH;

			text = "100%"; //--- ToDo: Localize;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			size = 0.022 * safeZoneH;

			text = "12:20";
			style = "0x00"; //--- ToDo: Localize;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};

		class smartphone_number_edit: Life_RscEdit
		{
			idc = 9201;
			text = "Nummer eingeben";
			style = 0x00 + 0x200;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class info_text: Life_RscStructuredText
		{
			idc = 9202;
			text = ""; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class smartphone_create: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			color2[] = {1,1,1,1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			
			onButtonClick = "[] spawn life_fnc_addContact;";
			text = "Hinzufügen";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.7244 * safezoneH + safezoneY;
			w = 0.160875 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			size = 0.03 * safeZoneH;
			class Attributes {
				align = "center";
				valign = "bottom";
			};
		};
	};
};

class Life_my_new_smartphone_incomming_call {
	idd = 6200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this spawn life_fnc_handleTimes; _this spawn life_fnc_smartphoneincommingCall";
	
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4220;
			text = bg_h_texture;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
	};

	class controls {		
		class Smarphone_Akku_Perc: Life_RscStructuredText
		{
			idc = 6512;
			size = 0.022 * safeZoneH;

			text = "100%"; //--- ToDo: Localize;
			x = 0.522 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0176 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_Time: Life_RscStructuredText
		{
			idc = 6513;
			size = 0.022 * safeZoneH;

			text = "12:20";
			style = "0x00"; //--- ToDo: Localize;
			x = 0.547 * safezoneW + safezoneX;
			y = 0.27055 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {
				align = "left";
				valign = "middle";
			};
		};
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			idc = -1;
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		
		class Info_text: Life_RscStructuredText
		{
			idc = 6201;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.121 * safezoneH;
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
			};
		};
		
		class Call_denie: RscPicture
		{
			idc = 6202;
			text = "images\smartphone\btn_call_denie.paa";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class Call_btn_denie: Life_RscButtonMenuSmartphone
		{
			idc = 6203;
			onButtonClick = "['stop'] call life_fnc_end_call;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class call_accept: RscPicture
		{
			idc = 6204;
			text = "images\smartphone\btn_call_accept.paa";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class call_btn_accept: Life_RscButtonMenuSmartphone
		{
			idc = 6205;
			onButtonClick = "[] call life_fnc_send_answer;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class call_hangup: RscPicture
		{
			idc = 6206;
			text = "images\smartphone\btn_call_hangup.paa";
			x = 0.465969 * safezoneW + safezoneX;
			y = 0.6639 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		
		class call_btn_hangup: Life_RscButtonMenuSmartphone
		{
			idc = 6207;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "";
			x = 0.465969 * safezoneW + safezoneX;
			y = 0.6639 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};

class Life_smartphoneAkku {
	idd = 6200;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "if (profilenamespace getvariable ['DarkPhone',false]) then {((_this select 0) displayCtrl 4240) ctrlSetText 'images\smartphone\bg_h_noenergy_black.paa'; };";
	class controlsBackground {
		class Smartphone_bg: RscPicture
		{
			idc = 4240;
			text = "images\smartphone\bg_h_noenergy_white.paa";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.737 * safezoneH;
		};
	};

	class controls {
		
		class Smarphone_btn_back: Life_RscButtonMenuSmartphone
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.540631 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
		
		class Smarphone_btn_menu: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.436475 * safezoneW + safezoneX;
			y = 0.77852 * safezoneH + safezoneY;
			w = 0.0159494 * safezoneW;
			h = 0.0177538 * safezoneH;
		};
	};
};

