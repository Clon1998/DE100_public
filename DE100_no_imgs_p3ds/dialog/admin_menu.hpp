class life_admin_menu {
	idd = 2900;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class TitleBackground: Life_RscStructuredText
		{
			idc = -1;
			x = -0.00015625 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,.9};
		};
		class Title: Life_RscStructuredText
		{
			idc = 1;
			text = "<t align='center'size='1.2'>Admin Menü - DE100";
			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.0016 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class TitlePlayers: Life_RscStructuredText
		{
			idc = -1;
			text = "Spieler";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,.9};
		};
		class TitleOptions: Life_RscStructuredText
		{
			idc = -1;
			text = "Optionen";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,.9};
		};		
	};
	
	class controls {
		class SearchBoxPlayers: Life_RscEdit
		{
			idc = 2;
			style="0x00 + 0x200";
			text = "";
			tooltip = "Spielerliste durchsuchen";
			onKeyDown = "['players']call life_fnc_searchArray;";
			onKeyUp = "['players']call life_fnc_searchArray;";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {.25,0,0,.7};
		};
		class SearchBoxOptions: Life_RscEdit
		{
			idc = 3;
			style="0x00 + 0x200";
			text = "";
			tooltip = "Optionen durchsuchen";
			onKeyDown = "['options']call life_fnc_searchArray;";
			onKeyUp = "['options']call life_fnc_searchArray;";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {.25,0,0,.7};
		};
		class PlayerList: Life_RscTree
		{
			idc = 4;
			onTreeSelChanged = "_this call life_fnc_treePlayer_SelChange;";
			sizeEx = 0.04;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.891 * safezoneH;
			colorBackground[] = {0,0,0,.7};
		};
		class OptionsList: Life_RscTree
		{
			idc = 5;
			sizeEx = 0.04;
			onTreeDblClick = "_this call life_fnc_executeOption;";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.891 * safezoneH;
			colorBackground[] = {0,0,0,.7};
		};
		class MapControl: Life_RscMapControl
		{
			idc = 6;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.946 * safezoneH;
		};
		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.940868 * safezoneW + safezoneX;
			y = 0.00280029 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonReturn: Life_RscButtonMenu
		{
			idc = -1;
			tooltip = "Startseite des Adminmenüs aufrufen";
			onButtonClick = "['none']call life_fnc_toggle_menu";
			x = 0.443281 * safezoneW + safezoneX;
			y = -0.0005 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		    colorBackground[] = {0,0,0,0};text = "";colorActive[] = {0,0,0,0};animTextureDefault = "";animTextureNormal = "";animTextureDisabled = "";animTextureOver = "";animTextureFocused = ""; 			
		};		

		//VEHICLE SPAWNER
		class VEH_Background: Life_RscBackground
		{
			idc = 1111;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class VEH_Title: Life_RscStructuredText
		{
			idc = 1112;
			text = "<t align='center'>Vehicle Spawner";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VEH_Title2: Life_RscStructuredText
		{
			idc = 1113;
			text = "Fahrzeuge";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VEH_Title3: Life_RscStructuredText
		{
			idc = 1114;
			text = "Karte";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VEH_Title4: Life_RscStructuredText
		{
			idc = 1115;
			text = "Skin";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VEH_VehicleList: Life_RscListbox
		{
			idc = 1116;
			sizeEx = 0.035;
			onLBSelChanged = "['vehspawnerlbChanged']call life_fnc_adminFunction";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.847 * safezoneH;
		};
		class VEH_Map: Life_RscMapControl
		{
			idc = 1117;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class VEH_ButtonSpawn: Life_RscButtonMenu
		{
			idc = 1118;
			text = "Vehicle Spawnen";
			onButtonClick = "['spawnvehicle']call life_fnc_adminFunction";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class VEH_SkinCombo: Life_RscXListbox
		{
			idc = 1119;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VEH_SearchVehicle: Life_RscEdit
		{
			idc = 1120;
			style = "0x00 + 0x200";
			text = "";
			onKeyDown = "['vehicles']call life_fnc_searchArray";
			onKeyUp = "['vehicles']call life_fnc_searchArray";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
			tooltip = "Vehicleliste durchsuchen";
		};		

		//ITEM SPAWNER
		class ITEM_Background: Life_RscBackground
		{
			idc = 2221;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class ITEM_Title: Life_RscStructuredText
		{
			idc = 2222;
			text = "<t align='center'>Item Spawner";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class ITEM_Title2: Life_RscStructuredText
		{
			idc = 2223;
			text = "Item";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class ITEM_Title3: Life_RscStructuredText
		{
			idc = 2224;
			text = "Karte";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class ITEM_Title4: Life_RscStructuredText
		{
			idc = 2225;
			text = "Anzahl";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class ITEM_ItemList: Life_RscListbox
		{
			idc = 2226;
			sizeEx = 0.035;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.847 * safezoneH;
		};
		class ITEM_Map: Life_RscMapControl
		{
			idc = 2227;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class ITEM_ButtonSpawn: Life_RscButtonMenu
		{
			idc = 2228;
			text = "Item Spawnen";
			onButtonClick = "['spawnitem']call life_fnc_adminFunction";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ITEM_ItemCount: Life_RscEdit
		{
			idc = 2229;
			text = "1";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ITEM_SearchItem: Life_RscEdit
		{
			idc = 2230;
			style = "0x00 + 0x200";
			text = "";
			onKeyDown = "['items']call life_fnc_searchArray";
			onKeyUp = "['items']call life_fnc_searchArray";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
			tooltip = "Itemliste durchsuchen";
		};		

		//DEBUG KONSOLE
		class DEBUG_Background: Life_RscBackground
		{
			idc = 3331;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class DEBUG_Title: Life_RscStructuredText
		{
			idc = 3332;
			text = "<t align='center'>Debug Konsole";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class DEBUG_Title2: Life_RscStructuredText
		{
			idc = 3333;
			text = "Code";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class DEBUG_Code: Life_RscEdit
		{
			idc = 3334;
			text = "";
            style = 16;
            autocomplete = "scripting";
            lineSpacing = 0.40;			
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.836 * safezoneH;
		};
		class DEBUG_ButtonLocal: Life_RscButtonMenu
		{
			idc = 3335;
			text = "Lokal ausführen";
			onButtonClick = "['executelocal']call life_fnc_adminFunction";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DEBUG_ButtonGlobal: Life_RscButtonMenu
		{
			idc = 3336;
			text = "Global ausführen";
			onButtonClick = "['executeglobal']call life_fnc_adminFunction";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DEBUG_ButtonTarget: Life_RscButtonMenu
		{
			idc = 3337;
			text = "Auf Spieler ausführen";
			onButtonClick = "['executeonplayer']call life_fnc_adminFunction";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DEBUG_ButtonServer: Life_RscButtonMenu
		{
			idc = 3338;
			text = "Auf Server ausführen";
			onButtonClick = "['executeonserver']call life_fnc_adminFunction";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		//Z-ITEM SPAWNER

		class VIRT_Background: Life_RscBackground
		{
			idc = 4441;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class VIRT_Title: Life_RscStructuredText
		{
			idc = 4442;
			text = "<t align='center'>Z-Item vergeben";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VIRT_Title2: Life_RscStructuredText
		{
			idc = 4443;
			text = "Z-Item";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VIRT_ZItemList: Life_RscListbox
		{
			idc = 4444;
			sizeEx = 0.035;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.803 * safezoneH;
		};
		class VIRT_ZItemCount: Life_RscEdit
		{
			idc = 4445;
			text = "1";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class VIRT_SearchZItem: Life_RscEdit
		{
			idc = 4446;
			style = "0x00 + 0x200";
			text = "";
			onKeyDown = "['zitems']call life_fnc_searchArray";
			onKeyUp = "['zitems']call life_fnc_searchArray";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
			tooltip = "Z-Itemliste durchsuchen";				
		};			
		class VIRT_ButtonGive: Life_RscButtonMenu
		{
			idc = 4447;
			text = "Z-Item vergeben";
			onButtonClick = "['spawnzitem']call life_fnc_adminFunction";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		//CLONE MENU
		class CLONE_Background: Life_RscBackground
		{
			idc = 5551;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class CLONE_Title: Life_RscStructuredText
		{
			idc = 5552;
			text = "Klon Menü";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class CLONE_Title2: Life_RscStructuredText
		{
			idc = 5553;
			text = "Gespeicherte Loadouts";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class CLONE_GearList: Life_RscListbox
		{
			idc = 5554;
			sizeEx = 0.035;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.814 * safezoneH;
		};
		class CLONE_GearSearch: Life_RscEdit
		{
			idc = 5555;
			style = "0x00 + 0x200";
			text = "";
			tooltip = "Gear-Einträge durchsuchen";
			onKeyDown = "['gear']call life_fnc_searchArray";
			onKeyUp = "['gear']call life_fnc_searchArray";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
		};		
		class CLONE_NameInput: Life_RscEdit
		{
			idc = 5556;
			style = "0x00 + 0x200";
			text = "";
			tooltip = "Name des Gears";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
		};
		class CLONE_ButtonClone: Life_RscButtonMenu
		{
			idc = 5557;
			text = "Klonen";
			onButtonClick = "['clonegear']call life_fnc_adminFunction";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CLONE_ButtonGear: Life_RscButtonMenu
		{
			idc = 5558;
			text = "Ausrüsten";
			onButtonClick = "['equipgear']call life_fnc_adminFunction";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CLONE_ButtonDelete: Life_RscButtonMenu
		{
			idc = 5559;
			text = "Löschen";
			onButtonClick = "['deletegear']call life_fnc_adminFunction";
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		//SERVERVERWALTUNG
		class VERWALTUNG_Background: Life_RscBackground
		{
			idc = 6661;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.0599999 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class VERWALTUNG_Title: Life_RscStructuredText
		{
			idc = 6662;
			text = "Serververwaltung";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VERWALTUNG_Title2: Life_RscStructuredText
		{
			idc = 6663;
			text = "Laufende Threads";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VERWALTUNG_Title3: Life_RscStructuredText
		{
			idc = 6664;
			text = "FPS:";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VERWALTUNG_Title4: Life_RscStructuredText
		{
			idc = 6665;
			text = "Auflösung:";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VERWALTUNG_Title5: Life_RscStructuredText
		{
			idc = 6666;
			text = "Arma-Laufzeit:";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class VERWALTUNG_ComboThreadType: Life_RscXListbox
		{
			idc = 6667;
			sizeEx = 0.035;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VERWALTUNG_ThreadList: Life_RscTree
		{
			idc = 6668;
			sizeEx = 0.035;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.781 * safezoneH;
		};
		class VERWALTUNG_ButtonPlayer: Life_RscButtonMenu
		{
			idc = 6669;
			text = "Spielerinfo anzeigen";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class VERWALTUNG_ButtonServer: Life_RscButtonMenu
		{
			idc = 6670;
			text = "Serverinfo anzeigen";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AIRDROP_Background: Life_RscBackground
		{
			idc = 7771;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.924 * safezoneH;
		};
		class AIRDROP_HEADER: Life_RscStructuredText
		{
			idc = 7772;

			text = "<t align='center'>AirDrop-Menü"; //--- ToDo: Localize;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class AIRDOP_MAP: Life_RscMapControl
		{
			idc = 7773;

			x = 0.407188 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class AIRDROP_SEARCH: Life_RscEdit
		{
			idc = 7774;
			text = "";
			style = "0x00 + 0x200";
			colorBackground[] = {0.25,0,0,0.7};
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AIRDROP_SAFES: Life_RscListbox
		{
			idc = 7775;
			sizeEx = 0.035;
			onLBDblClick="['aDc_load'] call life_fnc_adminFunction";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class AIRDROP_EDITSAFE: Life_RscEdit
		{
			idc = 7776;
			text = "";
			style = "0x00 + 0x200";
			colorBackground[] = {0.25,0,0,0.7};
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AIRDROP_SAFE: Life_RscButtonMenu
		{
			idc = 7777;
			onButtonClick="['aDc_safe']call life_fnc_adminFunction";
			text = "Speichern"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class AIRDROP_DELETE: Life_RscButtonMenu
		{
			idc = 7778;
			onButtonClick="['aDc_del']call life_fnc_adminFunction";
			text = "Löschen"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class AIRDROP_BOXINV: Life_RscListbox
		{
			idc = 7779;
			sizeEx = 0.035;
			onLBDblClick = "['aDc_remove_box']call life_fnc_adminFunction";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class AIRDROP_ARMAINV: Life_RscListbox
		{
			idc = 7780;
			sizeEx = 0.035;
			onLBDblClick = "['aDc_transfer_box']call life_fnc_adminFunction";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class AIRDROP_BUTTON: Life_RscButtonMenu
		{
			idc = 7781;
			onButtonClick="['aDc_call']call life_fnc_adminFunction";
			text = "RUFEN"; //--- ToDo: Localize;
			size = 0.032 * safeZoneH;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class AIRDROP_BOXSEARCH: Life_RscEdit
		{
			idc = 7782;
			text = "";
			style = "0x00 + 0x200";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
		};
		class AIRDROP_ARMASEARCH: Life_RscEdit
		{
			idc = 7783;
			text = "";
			style = "0x00 + 0x200";
			onKeyUp = "['armaInv']call life_fnc_searchArray";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.25,0,0,0.7};
		};
	};
};

