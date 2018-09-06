class farmingSim
{
    name = "test";
    idd = 4000;
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "_this call life_fnc_fs_prepare;";
    class controlsBackground 
    {
		class Background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class Header: Life_RscText
		{
			idc = -1;
			text = "Farmingsimulator";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
    };
   	class controls
	{
		class ListBox: Life_RscListBox
		{
			idc = 1;
			onLBSelChanged = "_this call life_fnc_fs_LbSelChanged;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.418 * safezoneH;

			sizeEx = 0.0164975 * safeZoneH;
		};

		class Desc_Box: Life_RscControlsGroup
		{
			idc = 2;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.176 * safezoneH;
			class Controls
			{
				class MoreInfo: Life_RscStructuredText
				{
					idc = 0;
					text = ""; //--- ToDo: Localize;
					x = 0;
					y = 0;
					w = 0.252656 * safezoneW;
					h = 0.055 * safezoneH;
				};
			};
		};

		class Next_Grp: Life_RscControlsGroup
		{
			idc = 3;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			class Controls
			{
				class Btn: Life_RscButtonTextOnly
				{
					idc = 0;
					x = 0;
					y = 0;
					w = 0.0154688 * safezoneW;
					h = 0.022 * safezoneH;

					colorBackground[] = {0,0,0,0};
				};

				class Pic: Life_RscPicture
				{
					idc = 0;
					text = "a3\3den\Data\Displays\Display3DEN\ToolBar\redo_ca.paa";
					x = 0;
					y = 0;
					w = 0.0154688 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};

		class Section_text: Life_RscText
		{
			idc = 4;
			style = "0x02";
			text = "Items"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Prev_Grp: Life_RscControlsGroup
		{
			idc = 5;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			class Controls
			{
				class Btn: Life_RscButtonTextOnly
				{
					idc = 0;
					x = 0;
					y = 0;
					w = 0.0154688 * safezoneW;
					h = 0.022 * safezoneH;

					colorBackground[] = {0,0,0,0};
				};

				class Pic: Life_RscPicture
				{
					idc = 0;
					text = "a3\3den\Data\Displays\Display3DEN\ToolBar\undo_ca.paa";
					x = 0;
					y = 0;
					w = 0.0154688 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};

		class Map: Life_RscMapControl
		{
			idc = 6;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.253 * safezoneH;
		};

		class Map_Desc: Life_RscText
		{
			idc = 7;
			style = "0x01";
			text = "MapGrid: 000000";
			sizeEX = 0.018 * safeZoneH;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Output_Box: Life_RscControlsGroup
		{
			idc = 8;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.176 * safezoneH;
			class Controls
			{
				class Person_header: Life_RscStructuredText
				{
					idc = -1;
					text = "<t size='1'>Spieler:</t>"; //--- ToDo: Localize;
					x = 0;
					y = 0;
					w = 0.0515625 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class Boxen_header: Life_RscStructuredText
				{
					idc = -1;
					text = "<t size='1'>Kisten:</t>"; //--- ToDo: Localize;
					x = 0;
					y = 0.033 * safezoneH;
					w = 0.0515625 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class Info_txt: Life_RscStructuredText
				{
					idc = 1;
					text = ""; //--- ToDo: Localize;
					onLoad = "(_this select 0) ctrlEnable false;";
					x = 0;
					y = 0.066 * safezoneH;
					w = 0.252656 * safezoneW;
					h = 0.11 * safezoneH;
				};

				class Person_slider: life_RscXSliderH
				{
					idc = 2;
					onLoad = "(_this select 0) sliderSetRange [1,20]";
					onSliderPosChanged = "_this call life_fnc_fs_sliderPosChange;";
					x = 0.0464057 * safezoneW;
					y = 0;
					w = 0.198 * safezoneW;
					h = 0.022 * safezoneH;
				};

				class Boxen_slider: life_RscXSliderH
				{
					idc = 3;
					onSliderPosChanged = "_this call life_fnc_fs_sliderPosChange;";
					x = 0.0464057 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.198 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};

		class Close_Btn: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.7574 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
