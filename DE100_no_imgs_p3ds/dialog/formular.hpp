
class life_perso_formular {
	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this call life_fnc_setup_formular;";
	onKeyDown = "_this call life_fnc_escBlock";
	
	class controlsBackground {
		class bg: Life_RscText
		{
			idc = -1;
			onMouseEnter = "[_this select 0,''] call life_fnc_fillBox";

			x = 0.249811 * safezoneW + safezoneX;
			y = 0.236113 * safezoneH + safezoneY;
			w = 0.505382 * safezoneW;
			h = 0.648723 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class Header_Oben: Life_RscText
		{
			idc = -1;

			x = 0.249811 * safezoneW + safezoneX;
			y = 0.0465534 * safezoneH + safezoneY;
			w = 0.505382 * safezoneW;
			h = 0.0109953 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Header: Life_RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_formular.paa";
			x = 0.239003 * safezoneW + safezoneX;
			y = -0.268352 * safezoneH + safezoneY;
			w = 0.527577 * safezoneW;
			h = 0.820107 * safezoneH;
		};
		class Header_Unten: Life_RscText
		{
			idc = -1;

			x = 0.249811 * safezoneW + safezoneX;
			y = 0.225117 * safezoneH + safezoneY;
			w = 0.505382 * safezoneW;
			h = 0.0109953 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Infobox_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Infobox:"; //--- ToDo: Localize;
			x = 0.259818 * safezoneW + safezoneX;
			y = 0.510995 * safezoneH + safezoneY;
			w = 0.485367 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			sizeEx = "0.022 * safeZoneH";
		};
		class Alter_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Alter:"; //--- ToDo: Localize;
			x = 0.269826 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.0400303 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class Alter_Jahre: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Jahre"; //--- ToDo: Localize;
			x = 0.384913 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.0400303 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0308 * safeZoneH;
		};
		class Religion_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Religion:"; //--- ToDo: Localize;
			x = 0.515011 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.0550416 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class Stadt_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Stadt:"; //--- ToDo: Localize;
			x = 0.515011 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.0500378 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class adresse_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Adresse:"; //--- ToDo: Localize;
			x = 0.515011 * safezoneW + safezoneX;
			y = 0.258103 * safezoneH + safezoneY;
			w = 0.0600454 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class Hair_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Haarfarbe:"; //--- ToDo: Localize;
			x = 0.269826 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.0650492 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class eye_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Augenfarbe:"; //--- ToDo: Localize;
			x = 0.515011 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.070053 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class size_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Größe:"; //--- ToDo: Localize;
			x = 0.269826 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.0450341 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
		class CM_txt: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "CM"; //--- ToDo: Localize;
			x = 0.384913 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.0250189 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  0.0308 * safeZoneH;
		};
		class name_header: Life_RscText
		{
			idc = -1;
			shadow = 2;
			text = "Name:"; //--- ToDo: Localize;
			x = 0.269826 * safezoneW + safezoneX;
			y = 0.258103 * safezoneH + safezoneY;
			w = 0.0400303 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx = 0.0264 * safeZoneH;
		};
	};
	class controls {
		class Info_box: Life_RscControlsGroup
		{
			idc = 4001;
			x = 0.259818 * safezoneW + safezoneX;
			y = 0.532986 * safezoneH + safezoneY;
			w = 0.485367 * safezoneW;
			h = 0.296873 * safezoneH;
			class Controls
			{
				class Info_txt: Life_RscStructuredText
				{
					idc = 3;
					shadow = 2;
					colorDisabled[] = {0.95,0.95,0.95,1};
					text = "";
					x = 0;
					y = 0;
					w = 0.485367 * safezoneW;
					h = 0.296873 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class Alter_edit: Life_RscEdit
		{
			idc = 4002;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onSetFocus = "[_this select 0, 'Age'] call life_fnc_fillBox";
			onKillFocus = "[_this select 0, ''] call life_fnc_fillBox";
			text = "32";
			x = 0.35489 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.0300227 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class size_edit: Life_RscEdit
		{
			idc = 4003;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onSetFocus = "[_this select 0, 'Size'] call life_fnc_fillBox";
			onKillFocus = "[_this select 0, ''] call life_fnc_fillBox";
			text = "160";
			x = 0.35489 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.0300227 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class hair_lb: Life_RscCombo
		{
			idc = 4004;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			text = "";
			x = 0.35489 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.140106 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class adresse_edit: Life_RscEdit
		{
			idc = 4005;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onSetFocus = "[_this select 0, 'Adress'] call life_fnc_fillBox";
			onKillFocus = "[_this select 0, ''] call life_fnc_fillBox";
			text = "...";
			x = 0.595072 * safezoneW + safezoneX;
			y = 0.258103 * safezoneH + safezoneY;
			w = 0.140106 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class Stadt_edit: Life_RscEdit
		{
			idc = 4006;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onSetFocus = "[_this select 0, 'City'] call life_fnc_fillBox";
			onKillFocus = "[_this select 0, ''] call life_fnc_fillBox";
			text = "...";
			x = 0.595072 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.140106 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class religion_lb: hair_lb
		{
			idc = 4007;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			text = "";
			x = 0.595072 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.140106 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};

		class eye_lb: hair_lb
		{
			idc = 4008;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			text = "";
			x = 0.595072 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.140106 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};
		class name: Life_RscText
		{
			idc = 4009;
			shadow = 2;
			colorDisabled[] = {0.95,0.95,0.95,1};
			text = "";
			x = 0.35489 * safezoneW + safezoneX;
			y = 0.258103 * safezoneH + safezoneY;
			w = 0.160121 * safezoneW;
			h = 0.0329859 * safezoneH;
			sizeEx =  "0.029 * safeZoneH";
		};
		class Btn_Cnfrm: Life_RscButtonMenu
		{
			idc = 4010;
			onButtonClick = "_this call life_fnc_confirm_formular;";
			
			text = "Bestätigen"; //--- ToDo: Localize;
			x = 0.665125 * safezoneW + safezoneX;
			y = 0.840855 * safezoneH + safezoneY;
			w = 0.0750567 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = "0.024 * safeZoneH";
		};
		class Btn_Back: Life_RscButtonMenu
		{
			idc = 4011;

			text = "Trennen"; //--- ToDo: Localize;
			x = 0.264822 * safezoneW + safezoneX;
			y = 0.840855 * safezoneH + safezoneY;
			w = 0.0750567 * safezoneW;
			h = 0.0219906 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = "0.024 * safeZoneH";
		};
	};
};