class Respawn_Screen
{
	idd = 7000;
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "(_this + [0,0]) spawn life_fnc_deathScreen;";
	onKeyDown = "if((_this select 1) == 1) then {true;};";
	class controlsBackground
	{
		class logo: RscPicture
		{
			idc = 1;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			text = "images\ui\ui_logo_full.paa";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class BG: Life_RscText
		{
			idc = 2;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			colorBackground[] = {0.9,0.9,0.9,0.85};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	
	class Controls
	{
		class THR_COUNT: Life_RscText
		{
			idc = 3;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			colorText[] = {0, 0, 0, 1};
			colorShadow[] = {1, 1, 1, 0.2};
			shadow = 1;
			text = "THR-Mitglieder im Spiel: 1 Spieler"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.026 * safezoneH;
			sizeEx = 0.026 * safeZoneH;
		};
		class THR_REQ: THR_COUNT
		{
			idc = 4;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			text = "THR-Mitglied ist auf dem Weg: Nein"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.026 * safezoneH;
		};
		class RESPAWN_INFO: THR_COUNT
		{
			idc = 5;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			style = 0x02;
			text = "Respawn verfügbar in: 05:30"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.054 * safezoneH;
			sizeEx = 0.033 * safeZoneH;
		};
		class RESPAWN_BTN: Life_RscButtonMenu
		{
			onButtonClick = "[findDisplay 7000,1,0] spawn life_fnc_deathScreen;";
			idc = 6;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			text = "Neues Leben"; //--- ToDo: Localize;
			colorText[] = {0, 0, 0, 1};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.055 * safezoneH;
			size = 0.042 * safeZoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorDisabled[] = {0.5,0.5,0.5,1};
			color[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0.5,0.5,0.5,1)";
			class Attributes : Attributes {
				align = "center";
			};
		};
		class THR_REQ_BTN: RESPAWN_BTN
		{
			idc = 7;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			onButtonClick = "[0] spawn life_fnc_thrRequest;";
			text = "THR rufen"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class DISCONNECT: RESPAWN_BTN
		{
			idc = 8;
			onLoad = "(_this select 0) ctrlSetFade 1;(_this select 0) ctrlCommit 0;";
			onButtonClick = "[findDisplay 7000,1,1] spawn life_fnc_deathScreen;";
			text = "Verlassen"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};