class playerSettings {

	idd = 2001;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
	
		class life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.339984 * safezoneW + safezoneX;
			y = 0.335025 * safezoneH + safezoneY;
			w = 0.320031 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.339984 * safezoneW + safezoneX;
			y = 0.359221 * safezoneH + safezoneY;
			w = 0.320031 * safezoneW;
			h = 0.281558 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "$STR_PM_Title";
			x = 0.339984 * safezoneW + safezoneX;
			y = 0.335025 * safezoneH + safezoneY;
			w = 0.320031 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class moneyStatusInfo: Life_RscStructuredText
		{
			idc = 2015;

			x = 0.341985 * safezoneW + safezoneX;
			y = 0.390017 * safezoneH + safezoneY;
			w = 0.120012 * safezoneW;
			h = 0.32995 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class PlayersName: Title
		{
			idc = 2009;
			style = 1;

			x = 0.339984 * safezoneW + safezoneX;
			y = 0.335025 * safezoneH + safezoneY;
			w = 0.320031 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls {
		
		class itemHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_PM_cItems";
			x = 0.548005 * safezoneW + safezoneX;
			y = 0.36802 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class licenseHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_PM_Licenses";
			x = 0.434394 * safezoneW + safezoneX;
			y = 0.36802 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class moneySHeader: Life_RscText
		{
			idc = -1;

			text = "Geld Statistiken"; //--- ToDo: Localize;
			x = 0.343985 * safezoneW + safezoneX;
			y = 0.36802 * safezoneH + safezoneY;
			w = 0.0876086 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			SizeEx = 0.022 * safeZoneH;
		};
		
		class ProfButton: Life_RscButtonMenu
		{
			onButtonClick = "createdialog'Life_Prof_2_Dialog'";

			idc = -1;
			text = "Erfahrung"; //--- ToDo: Localize;
			x = 0.467423 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class itemList: Life_RscListBox
		{
			idc = 2005;

			onLBDblClick = "_this call life_fnc_itemMax;";
			x = 0.548005 * safezoneW + safezoneX;
			y = 0.390017 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.164975 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
		};
		
		class moneyEdit: Life_RscEdit
		{
			idc = 2018;
			onMouseEnter = "if ((ctrlText (_this select 0)) == '1') then {(_this select 0) ctrlSetText ''};";
			text = "1"; //--- ToDo: Localize;
			x = 0.347985 * safezoneW + safezoneX;
			y = 0.456007 * safezoneH + safezoneY;
			w = 0.0720071 * safezoneW;
			h = 0.0164975 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
		};
		
		class NearPlayers: Life_RscCombo
		{
			idc = 2022;

			x = 0.347985 * safezoneW + safezoneX;
			y = 0.478003 * safezoneH + safezoneY;
			w = 0.0720071 * safezoneW;
			h = 0.0164975 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};
		
		class moneyDrop: Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call life_fnc_giveMoney";

			text = "$STR_Global_Give";
			x = 0.353986 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0520051 * safezoneW;
			h = 0.019797 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			sizeEx = 0.013748 * safeZoneH;
			size = 0.022 * safeZoneH;
		};
		
		class AllBtn: Life_RscButtonMenu
		{
			onButtonClick = "ctrlSetText [2018, [de100_luciandjuli_mula] call life_fnc_number]";

			idc = -1;
			text = "Max."; //--- ToDo: Localize;
			x = 0.353986 * safezoneW + safezoneX;
			y = 0.521997 * safezoneH + safezoneY;
			w = 0.0520051 * safezoneW;
			h = 0.019797 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = 0.022 * safeZoneH;
		};
		
		class itemEdit: Life_RscEdit
		{
			idc = 2010;
			onMouseEnter = "if ((ctrlText (_this select 0)) == '1') then {(_this select 0) ctrlSetText ''};";
			text = "1"; //--- ToDo: Localize;
			x = 0.548005 * safezoneW + safezoneX;
			y = 0.560491 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.0164975 * safezoneH;
			sizeEx = 0.0164975 * safeZoneH;
		};
		
		class iNearPlayers: Life_RscCombo
		{
			idc = 2023;

			x = 0.548005 * safezoneW + safezoneX;
			y = 0.582488 * safezoneH + safezoneY;
			w = 0.110011 * safezoneW;
			h = 0.0164975 * safezoneH;
			sizeEx = 0.022 * safeZoneH;
		};
		
		class PersoButton: Life_RscButtonMenu
		{
			idc = 2223;
			style = 2;
			onButtonClick = "closeDialog 0;[0, player] call life_fnc_handleIDCard;";

			text = "Perso"; //--- ToDo: Localize;
			x = 0.341985 * safezoneW + safezoneX;
			y = 0.609983 * safezoneH + safezoneY;
			w = 0.0525051 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = 0.022 * safeZoneH;
		};
		
		class PersoPic: Life_RscPicture
		{
			idc = 2222;

			text = "images\icons\ico_noid.paa";
			x = 0.39999 * safezoneW + safezoneX;
			y = 0.597665 * safezoneH + safezoneY;
			w = 0.0250025 * safezoneW;
			h = 0.0439934 * safezoneH;
		};
		
		class DropButton: Life_RscButtonMenu
		{
			idc = 2002;
			onButtonClick = "[] call life_fnc_giveItem;";

			text = "$STR_Global_Give"; //--- ToDo: Localize;
			x = 0.60601 * safezoneW + safezoneX;
			y = 0.609983 * safezoneH + safezoneY;
			w = 0.0525051 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = 0.022 * safeZoneH;
		};
		
		class UseButton: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_useItem;";

			idc = -1;
			text = "$STR_Global_Use"; //--- ToDo: Localize;
			x = 0.548005 * safezoneW + safezoneX;
			y = 0.609983 * safezoneH + safezoneY;
			w = 0.0525051 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = 0.022 * safeZoneH;
		};
		
		class RemoveButton: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_removeItem;";

			idc = -1;
			text = "Entf."; //--- ToDo: Localize;
			x = 0.489999 * safezoneW + safezoneX;
			y = 0.609983 * safezoneH + safezoneY;
			w = 0.0525051 * safezoneW;
			h = 0.0219967 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			size = 0.022 * safeZoneH;
		};
		
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			text = "$STR_Global_Close"; //--- ToDo: Localize;
			x = 0.339984 * safezoneW + safezoneX;
			y = 0.642978 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonSettings: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_settingsMenu;";

			idc = -1;
			text = "$STR_Global_Settings"; //--- ToDo: Localize;
			x = 0.403654 * safezoneW + safezoneX;
			y = 0.642978 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonMyGang: Life_RscButtonMenu
		{
			idc = 2011;
			//onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";

			text = "$STR_PM_MyGang"; //--- ToDo: Localize;
			x = 0.467423 * safezoneW + safezoneX;
			y = 0.642978 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};

		class taxi: Life_RscButtonMenu
		{
			idc = 2046;
			onButtonClick = "closeDialog 0; createdialog ""taxi_central"";";

			text = "Taxi"; //--- ToDo: Localize;
			x = 0.53143 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class Licenses_Menu: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.435994 * safezoneW + safezoneX;
			y = 0.390017 * safezoneH + safezoneY;
			w = 0.112011 * safezoneW;
			h = 0.208968 * safezoneH;
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					size = 0.022 * safeZoneH;
					text = "";
					x = 0;
					y = 0;
					w = 0.1080105 * safezoneW;
					h = 0;
				};
			};
		};
	
		class ButtonKeys: Life_RscButtonMenu
		{
			idc = 2013;
			onButtonClick = "createDialog ""Life_key_management"";";

			text = "$STR_PM_KeyChain"; //--- ToDo: Localize;
			x = 0.53143 * safezoneW + safezoneX;
			y = 0.642978 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonCell: Life_RscButtonMenu
		{
			idc = 2014;
			onButtonClick = "closeDialog 0; [] call life_fnc_akkucheck;";

			text = "$STR_PM_CellPhone"; //--- ToDo: Localize;
			x = 0.595436 * safezoneW + safezoneX;
			y = 0.642978 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonAdminMenu: Life_RscButtonMenu
		{
			idc = 2021;
			onButtonClick = "";

			text = "$STR_PM_AdminMenu"; //--- ToDo: Localize;
			x = 0.403654 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonSyncData: Life_RscButtonMenu
		{
			onButtonClick = "[] call SOCK_fnc_syncData;";

			idc = -1;
			text = "$STR_PM_SyncData"; //--- ToDo: Localize;
			x = 0.339984 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
		
		class ButtonSquad: Life_RscButtonMenu
		{
			idc = 2521;
			onButtonClick = "";

			text = "Squadmanager"; //--- ToDo: Localize;
			x = 0.53143 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
	
		class Buttonhochstufung: Life_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "createDialog 'Life_Staff_Manager';";

			text = "Personal"; //--- ToDo: Localize;
			x = 0.595436 * safezoneW + safezoneX;
			y = 0.667725 * safezoneH + safezoneY;
			w = 0.0625061 * safezoneW;
			h = 0.0219967 * safezoneH;
			size = 0.022 * safeZoneH;
		};
	};
};