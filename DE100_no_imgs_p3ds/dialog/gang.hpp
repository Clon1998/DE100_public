class Life_Create_Gang {
	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.313067 * safezoneH + safezoneY;
			w = 0.216596 * safezoneW;
			h = 0.16494 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Header: Life_RscText
		{
			idc = -1;
			text = "Gang erstellen"; //--- ToDo: Localize;
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.291075 * safezoneH + safezoneY;
			w = 0.216596 * safezoneW;
			h = 0.0219921 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls {
		class InfoMSG: Life_RscStructuredText
		{
			idc = 4001;
			onLoad = "(_this select 0) ctrlSetStructuredText parseText format['Eine Gang zu erstellen kostet %1€.<br/>Der Gang-Name und das Gang-Tag müssen einzigartig sein.',[getNumber(missionConfigFile >> 'life_gang_config' >> 'levels' >> 'level_1' >> 'price')] call life_fnc_numberText];";

			text = "";
			x = 0.396859 * safezoneW + safezoneX;
			y = 0.324063 * safezoneH + safezoneY;
			w = 0.206282 * safezoneW;
			h = 0.10996 * safezoneH;
		};

		class Tag_edit: Life_RscEdit
		{
			idc = 4002;
			shadow = 2;
			maxChars = 4;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onChar = "_this call life_fnc_validNameTag;";
			onKeyUp = "_this call life_fnc_validNameTag;";
			onKeyDown = "_this call life_fnc_validNameTag;";
			onSetFocus = "private _c = _this select 0;if (toLower (ctrlText _c) isEqualTo 'tag') then {_c ctrlSetText '';};";
			text = "TAG"; //--- ToDo: Localize;
			x = 0.396859 * safezoneW + safezoneX;
			y = 0.44502 * safezoneH + safezoneY;
			w = 0.0309423 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Name_edit: Life_RscEdit
		{
			idc = 4003;
			shadow = 2;
			maxChars = 32;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onChar = "_this call life_fnc_validNameTag;";
			onKeyUp = "_this call life_fnc_validNameTag;";
			onKeyDown = "_this call life_fnc_validNameTag;";
			onSetFocus = "private _c = _this select 0;if (toLower (ctrlText _c) isEqualTo 'gang-name') then {_c ctrlSetText '';};";
			text = "GANG-NAME"; //--- ToDo: Localize;
			x = 0.438115 * safezoneW + safezoneX;
			y = 0.44502 * safezoneH + safezoneY;
			w = 0.165026 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Close: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.481311 * safezoneH + safezoneY;
			w = 0.0618846 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Create: Life_RscButtonMenu
		{
			idc = 4004;
			onLoad = "(_this select 0) ctrlEnable false;";
			text = "Erstellen"; //--- ToDo: Localize;
			onButtonClick = "_this call life_fnc_createGang;";
			x = 0.546413 * safezoneW + safezoneX;
			y = 0.481311 * safezoneH + safezoneY;
			w = 0.0618846 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
};

class Life_Rename_Gang {
	idd = 4000;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.434023 * safezoneH + safezoneY;
			w = 0.216596 * safezoneW;
			h = 0.0439841 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Header: Life_RscText
		{
			idc = -1;
			text = "Gang umbenennen"; //--- ToDo: Localize;
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.412032 * safezoneH + safezoneY;
			w = 0.216596 * safezoneW;
			h = 0.0219921 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls {
		class Tag_edit: Life_RscEdit
		{
			idc = 4002;
			shadow = 2;
			maxChars = 4;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onChar = "_this call life_fnc_validNameTag;";
			onKeyUp = "_this call life_fnc_validNameTag;";
			onKeyDown = "_this call life_fnc_validNameTag;";
			onLoad = "private _tag = (group player) getVariable ['gang_TAG',''];(_this select 0) ctrlSetText (_tag select [1,count _tag -3]);";
			text = ""; //--- ToDo: Localize;
			x = 0.396859 * safezoneW + safezoneX;
			y = 0.44502 * safezoneH + safezoneY;
			w = 0.0309423 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Name_edit: Life_RscEdit
		{
			idc = 4003;
			shadow = 2;
			maxChars = 32;
			colorDisabled[] = {0.95,0.95,0.95,1};
			onChar = "_this call life_fnc_validNameTag;";
			onKeyUp = "_this call life_fnc_validNameTag;";
			onKeyDown = "_this call life_fnc_validNameTag;";
			onLoad = "(_this select 0) ctrlSetText ((group player) getVariable ['gang_NAME','']);";
			text = ""; //--- ToDo: Localize;
			x = 0.438115 * safezoneW + safezoneX;
			y = 0.44502 * safezoneH + safezoneY;
			w = 0.165026 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Close: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.391702 * safezoneW + safezoneX;
			y = 0.481311 * safezoneH + safezoneY;
			w = 0.0618846 * safezoneW;
			h = 0.0219921 * safezoneH;
		};

		class Create: Life_RscButtonMenu
		{
			idc = 4004;
			onLoad = "(_this select 0) ctrlEnable false;";
			text = "Umbenennen"; //--- ToDo: Localize;
			onButtonClick = "_this call life_fnc_renameGang;";
			x = 0.536099 * safezoneW + safezoneX;
			y = 0.481311 * safezoneH + safezoneY;
			w = 0.0721987 * safezoneW;
			h = 0.0219921 * safezoneH;
		};
	};
};
class Life_Gang_System {
	idd = 2500;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0,'general'] call life_fnc_gangMenu;";
	onUnload = "if (life_gang_permission_update) then {life_gang_permission_update = false; if (life_HC_isActive) then {['Permission', (group player) getVariable['gang_ID', 0],[(group player) getVariable['gang_MEMBERS', []]]] remoteExec['HC_fnc_gangUpdatePartial', HC_Life]; } else {['Permission', (group player) getVariable['gang_ID', 0],[(group player) getVariable['gang_MEMBERS', []]]] remoteExec['TON_fnc_gangUpdatePartial', 2]; }; };";
	
	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class Header: Life_RscText
		{
			idc = 2499;
			text = "Section text here"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Picture_scroll_left: Life_RscPicture
		{
			idc = -1;
			text = "images\dialog\ico_left.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Btn_scroll_left: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[(findDisplay 2500),life_gangSliderReverse,'left'] call life_fnc_gangMenu;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
		};

		class Picture_scroll_right: Life_RscPicture
		{
			idc = -1;
			text = "images\dialog\ico_back.paa";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Btn_scroll_right: Btn_scroll_left
		{
			idc = -1;
			onButtonClick = "[(findDisplay 2500),life_gangSlider,'right'] call life_fnc_gangMenu;";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
	class controls {
		class Header_Slider: Life_RscText
		{
			idc = 2501;
			style = 0x02;
			text = "Allgemeine Informationen"; //--- ToDo: Localize;
			sizeEx = 0.03 * safeZoneH;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class Header_OMU: Life_RscText
		{
			idc = 2512;
			text = "Online-Mitglieder-Übersicht"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class OMU: Life_RscListbox
		{
			idc = 2502;
			onLBSelChanged = "_this call life_fnc_gangMenuLbChange;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.297 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
		};

		class Header_Info: Life_RscText
		{
			idc = 2513;
			text = "Another cool Text";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Info: Life_RscStructuredText
		{
			idc = 2503;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class Btn_Upgrade: Life_RscButtonMenu
		{
			idc = 2504;
			x = 0.448437 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.055 * safezoneH;
			size = 0.032 * safeZoneH;
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorBackgroundFocused[] = {0,0,0,0};
		};

		class Text_Upgrade: Life_RscText
		{
			idc = 2505;
			style = 0x02;
			text = "Upgrade: $100.000.000"; //--- ToDo: Localize;
			sizeEx = 0.03 * safeZoneH;
			x = 0.448437 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class Text_Bank: Life_RscText
		{
			idc = 2506;
			text = "Kontozugriff"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Cb_Bank: Life_Checkbox
		{
			idc = 2507;
			onCheckedChanged = "(_this pushBack 'BANK'); _this call life_fnc_gangMenuCbChange;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_User: Life_RscText
		{
			idc = 2508;
			text = "Mitgliederverwaltung"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Cb_User: Life_Checkbox
		{
			idc = 2509;
			onCheckedChanged = "(_this pushBack 'MEMBERMANAGER'); _this call life_fnc_gangMenuCbChange;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_Invite: Life_RscText
		{
			idc = 2510;
			text = "Einladeberechtigung"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Cb_Invite: Life_Checkbox
		{
			idc = 2511;
			onCheckedChanged = "(_this pushBack 'INVITE'); _this call life_fnc_gangMenuCbChange;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text_House: Life_RscText
		{
			idc = 2514;
			text = "Lagerhauszugriff"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Cb_House: Life_Checkbox
		{
			idc = 2515;
			onCheckedChanged = "(_this pushBack 'HOUSE'); _this call life_fnc_gangMenuCbChange;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Close: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.669333 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class BtnLeft: Life_RscButtonMenu
		{
			idc = 2516;
			text = ""; //--- ToDo: Localize;
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.669333 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
