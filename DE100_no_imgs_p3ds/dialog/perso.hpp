/*
	File : perso.hpp
	Date:   31.08.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/

class Life_civ_idCard {
	idd = 9400;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class background_main: Life_RscPicture
		{
			idc = -1;
			text = "images\dialog\bg_perso_civ.paa";
			x = 0.484527 * safezoneW + safezoneX;
			y = 0.291012 * safezoneH + safezoneY;
			w = 0.451307 * safezoneW;
			h = 0.756208 * safezoneH;

		};
		class header_name: Life_RscText
		{
			idc = -1;
			text = "Name:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.400 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
			font = "puristaBold";
			colorShadow[] = {0, 0, 0, 0.8};
		};
		class header_age: header_name
		{
			idc = -1;
			text = "Alter:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.440 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_hair_colour: header_name
		{
			idc = -1;
			text = "Haarfarbe:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.480 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_eys_colour: header_name
		{
			idc = -1;
			text = "Augenfarbe:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.520 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_size: header_name
		{
			idc = -1;
			text = "Größe:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.560 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_adress: header_name
		{
			idc = -1;
			text = "Adresse:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.600 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_zoll: header_name
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.745 * safezoneW + safezoneX;
			y = 0.003 + 0.400 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
	};
	class controls {
		class Close: Life_RscButton
		{
			idc = 9401;
			type = 1;
			style = 2;
			onButtonClick = "closeDialog 0;";
			text = "X"; //--- ToDo: Localize;
			x = 0.861712 * safezoneW + safezoneX;
			y = 0.373927 * safezoneH + safezoneY;
			w = 0.0103156 * safezoneW;
			h = 0.0219988 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
			font = "puristaBold";
			colorBackground[] = {0,0.95,0.95,0};
			colorBackgroundActive[] = {0,0.95,0.95,0};
			colorBackgroundDisabled[] = {0,0.95,0.95,0};
			colorFocused[] = {0,0.95,0.95,0};	
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
		};
		class Name: Life_RscText
		{
			idc = 9402;
			text = "XXXXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.003 + 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.418 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
			font = "puristaBold";
			colorShadow[] = {0, 0, 0, 0.8};
		};
		//Abstand Header und Daten 0.018
		//Abstand Block  0.022
		class Age: Name
		{
			idc = 9403;
			text = "XXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.458 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class Hair_colour: Name
		{
			idc = 9404;
			text = "XXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.498 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class Eys_colour: Name
		{
			idc = 9405;
			text = "XXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.538 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class Size: Name
		{
			idc = 9406;
			text = "XXX CM"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.578 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class City: Name
		{
			idc = 9407;
			text = "Kavala"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.618 * safezoneH + safezoneY;
			w = 0.173 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class Adresse: Name
		{
			idc = 9408;
			text = "XXXXXXXXXXXXXXXXA"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.655 * safezoneW + safezoneX;
			y = 0.003 + 0.636 * safezoneH + safezoneY;
			w = 0.174 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class zoll_id: Name
		{
			idc = 9409;
			text = ""; //--- ToDo: Localize;
			x = 0.745 * safezoneW + safezoneX;
			y = 0.418 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.021 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
	};
};

class perso_accept
{
	idd = 9401;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Perso anschauen";
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 9402;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: Life_RscButtonMenu {
			idc = 9403;
			text = "Ja";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseTicket : Life_RscButtonMenu {
			idc = -1;
			text = "Nein";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class life_state_idCard {
	idd = 9300;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class background_main: Life_RscPicture
		{
			idc = -1;
			text = "images\dialog\bg_perso_staate.paa";
			x = 0.484488 * safezoneW + safezoneX;
			y = 0.291089 * safezoneH + safezoneY;
			w = 0.451307 * safezoneW;
			h = 0.756209 * safezoneH;

		};
		class header_name: Life_RscText
		{
			idc = -1;
			font = "puristaBold";
			colorShadow[] = {0,0,0,0.8};

			text = "Name:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.401042 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};

		class header_dienstgrade: header_name
		{
			idc = -1;

			text = "Dienstgrad:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_Dienststelle: header_name
		{
			idc = -1;

			text = "Dienststelle:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.510995 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class header_id: header_name
		{
			idc = -1;

			text = "Dienstnummer:"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.580061 * safezoneW + safezoneX;
			y = 0.620948 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
	};
	class controls {
		class Close: Life_RscButton
		{
			idc = 9301;
			type = 1;
			style = 2;
			onButtonClick = "closeDialog 0;";
			text = "X"; //--- ToDo: Localize;
			x = 0.861712 * safezoneW + safezoneX;
			y = 0.373927 * safezoneH + safezoneY;
			w = 0.0103156 * safezoneW;
			h = 0.0219988 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
			font = "puristaBold";
			colorBackground[] = {0,0.95,0.95,0};
			colorBackgroundActive[] = {0,0.95,0.95,0};
			colorBackgroundDisabled[] = {0,0.95,0.95,0};
			colorFocused[] = {0,0.95,0.95,0};	
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
		};
		class Name: Life_RscText
		{
			idc = 9302;
			font = "puristaBold";
			colorShadow[] = {0,0,0,0.8};

			text = "XXXXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.423033 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};

		class Dienstgrade: Name
		{
			idc = 9303;

			text = "XXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.478009 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};

		class Dienststelle: Name
		{
			idc = 9304;

			text = "XXXXX"; //--- ToDo: Localize;
			shadow = 0;
			x = 0.660121 * safezoneW + safezoneX;
			y = 0.532986 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
		class Dienstnummer: Name
		{
			idc = 9305;
			text = "76561198038336608";
			shadow = 0;
			x = 0.580061 * safezoneW + safezoneX;
			y = 0.642939 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.02726 * safeZoneH;
		};
	};
};