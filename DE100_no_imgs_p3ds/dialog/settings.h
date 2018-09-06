class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground : life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscMainBackground : life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.368 * safezoneH;
		};
		
		class PlayerTagsHeader: Life_RscText
		{
			idc = -1;
			shadow = 0;
			text = "Spielernamen"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class SideChatHeader: PlayerTagsHeader
		{
			text = "Sidechat Einstellungen"; //--- ToDo: Localize;
			y = 0.5605 * safezoneH + safezoneY;
		};

		class RevealNearestHeader: PlayerTagsHeader
		{
			text = "Reveal Nearest Objects"; //--- ToDo: Localize;
			y = 0.588 * safezoneH + safezoneY;
		};

		class SkipIntroHeader: PlayerTagsHeader
		{
			text = "Intro überspringen"; //--- ToDo: Localize;
			y = 0.6155 * safezoneH + safezoneY;		
		};

		class ScreenshotmodeHeader: PlayerTagsHeader
		{
			text = "Screenshotmode"; //--- ToDo: Localize;
			y = 0.643 * safezoneH + safezoneY;
		};

		class NotifyHeader: PlayerTagsHeader
		{
			text = "Benachrichtigungston"; //--- ToDo: Localize;
			y = 0.6705 * safezoneH + safezoneY;
		};

		class PhoneHeader: PlayerTagsHeader
		{
			text = "Dunkles Smartphone"; //--- ToDo: Localize;
			y = 0.698 * safezoneH + safezoneY;
		};

		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Einstellungen"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls
	{
		class VDonFoot: Life_RscText
		{
			idc = -1;

			text = "Zu Fuß:"; //--- ToDo: Localize;
			x = 0.42575 * safezoneW + safezoneX;
			y = 0.3669 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VDinCar: Life_RscText
		{
			idc = -1;

			text = "Im Auto:"; //--- ToDo: Localize;
			x = 0.42575 * safezoneW + safezoneX;
			y = 0.39286 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VDinAir: Life_RscText
		{
			idc = -1;

			text = "In der Luft:"; //--- ToDo: Localize;
			x = 0.42575 * safezoneW + safezoneX;
			y = 0.42036 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VD_onfoot_slider: life_RscXSliderH
		{
			idc = 2901;
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.467 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite zu Fuß"; //--- ToDo: Localize;
		};
		class VD_onfoot_value: Life_RscText
		{
			idc = 2902;

			x = 0.5825 * safezoneW + safezoneX;
			y = 0.3669 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VD_car_slider: life_RscXSliderH
		{
			idc = 2911;
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.467 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite in Fahrzeugen"; //--- ToDo: Localize;
		};
		class VD_car_value: Life_RscText
		{
			idc = 2912;

			x = 0.5825 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VD_air_slider: life_RscXSliderH
		{
			idc = 2921;
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.467 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.111375 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite in Helikoptern"; //--- ToDo: Localize;
		};
		class VD_air_value: Life_RscText
		{
			idc = 2922;

			x = 0.5825 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Btn_resetClo: Life_RscButtonMenu
		{
			onButtonClick = "createDialog 'cloSkinSettings';";

			idc = -1;
			text = "Skin-Menü"; //--- ToDo: Localize;
			tooltip = "Skin-Menü zum einstellen der Skin Präferenz";
			x = 0.422644 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			sizeEx = 0.05 * GUI_GRID_H;
		};

		class Btn_NotifycCords: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0; createDialog 'notify_cCords';";

			idc = -1;
			text = "Benach. Pos."; //--- ToDo: Localize;
			tooltip = "Bearbeite die Position des Benachrichtigungssystems";
			x = 0.546413 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			sizeEx = 0.05 * GUI_GRID_H;
		};

		class ts3_btn: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "createDialog 'ts_verify';";
			text = "TS³"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.0412564 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
		class PlayerTagsONOFF: Life_Checkbox
		{
			idc = 2970;
			onCheckedChanged = "['tags',_this select 1] call life_fnc_s_onCheckedChange;";

			x = 0.561875 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.012375 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Regelt, ob Spieler Namensschilder über dem Kopf haben."; //--- ToDo: Localize;
		};

		class SideChatONOFF: PlayerTagsONOFF
		{
			idc = 2971;
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.5605 * safezoneH + safezoneY;
			tooltip = "Soll der Sidechat angezeigt werden oder nicht?"; //--- ToDo: Localize;
		};

		class RevealONOFF: PlayerTagsONOFF
		{
			idc = 2972;
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.588 * safezoneH + safezoneY;
			tooltip = "Zeigt automatisch nächstgelegene Objekte innerhalb von 15m an, deaktiviere es, wenn du FPS Probleme hast."; //--- ToDo: Localize;
		};

		class SkipIntro: PlayerTagsONOFF
		{
			idc = 2973;
			onCheckedChanged = "['intro',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.6155 * safezoneH + safezoneY;	
			tooltip = "Soll das Intro übersprungen werden?"; //--- ToDo: Localize;
		};

		class Screenshotmode: PlayerTagsONOFF
		{
			idc = 2974;
			onCheckedChanged = "['screenshot',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.643 * safezoneH + safezoneY;
			tooltip = "Soll die Gui ausgeblendet werden?"; //--- ToDo: Localize;
		};

		class Notif: PlayerTagsONOFF
		{
			idc = 2975;
			onCheckedChanged = "['notify',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.6705 * safezoneH + safezoneY;
			tooltip = "Soll ein Benachrichtigungston abgespielt werden?"; //--- ToDo: Localize;
		};

		class Phone: PlayerTagsONOFF
		{
			idc = 2976;
			onCheckedChanged = "['phone',_this select 1] call life_fnc_s_onCheckedChange;";

			y = 0.698 * safezoneH + safezoneY;
			tooltip = "Möchtest du ein dunkles Smartphone haben?"; //--- ToDo: Localize;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class ts_verify
{
	idd = 4000;
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class background : life_RscText
		{
			idc = -1;
			text = "";
			colorBackground[] = {0,0,0,0.7};
			x = 0.432958 * safezoneW + safezoneX;
			y = 0.412032 * safezoneH + safezoneY;
			w = 0.134083 * safezoneW;
			h = 0.0659762 * safezoneH;
		};
		
		class header : life_RscText
		{
			idc = -1;
			text = "TS3-Verifizieren";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.432958 * safezoneW + safezoneX;
			y = 0.39004 * safezoneH + safezoneY;
			w = 0.134083 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
	
	class controls
	{
		class edit_header: life_RscText
		{
			idc = -1;
			text = "TeamSpeak-Token:"; //--- ToDo: Localize;
			x = 0.432958 * safezoneW + safezoneX;
			y = 0.423028 * safezoneH + safezoneY;
			w = 0.128926 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class edit: life_RscEdit
		{
			idc = 4001;
			text = "";
			maxChars = 8;
			x = 0.438115 * safezoneW + safezoneX;
			y = 0.44502 * safezoneH + safezoneY;
			w = 0.123769 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class send: life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "_this call life_fnc_verifyts;";
			text = "Abschicken"; //--- ToDo: Localize;
			x = 0.432958 * safezoneW + safezoneX;
			y = 0.48021 * safezoneH + safezoneY;
			w = 0.134083 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
};

class cloSkinSettings
{
	idd = 4000;
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "_this call life_fnc_clothingSkinsMenu;";
	class controlsBackground
	{
		class background : life_RscText
		{
			idc = -1;
			text = "";
			colorBackground[] = {0,0,0,0.7};
			x = 0.01008 * safezoneW + safezoneX;
			y = 0.0711547 * safezoneH + safezoneY;
			w = 0.268167 * safezoneW;
			h = 0.351873 * safezoneH;
		};
		
		class header : life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Skin Einstellungen"; //--- ToDo: Localize;
			x = 0.01008 * safezoneW + safezoneX;
			y = 0.0491626 * safezoneH + safezoneY;
			w = 0.268167 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
	
	class controls
	{
		class clothingList: Life_RscTree
		{
			idc = 4001;
			text = "";
			onTreeDblClick = "_this call life_fnc_setClothingSkin";
			x = 0.0152371 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.257853 * safezoneW;
			h = 0.329881 * safezoneH;
		};

		class ButtonClose: life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.01008 * safezoneW + safezoneX;
			y = 0.427432 * safezoneH + safezoneY;
			w = 0.0670417 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
};