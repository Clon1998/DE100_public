/*
	File : spawnSelection.hpp
	Date:   25.10.2014	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


class life_spawn_selection
{
	idd = 38500;
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		
		class MainBackground : RscPicture
		{
			idc = -1;
			text = "images\dialog\bg_spawn_menu.paa";
			x = -8.5 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 56 * GUI_GRID_W;
			h = 41.5 * GUI_GRID_H;
		};
		
		class Title: Life_RscTitle
		{
			idc = 38501;

			text = ""; //--- ToDo: Localize;
			x = 14.3 * GUI_GRID_W + GUI_GRID_X;
			y = 0.18 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class Spawn_txt: Life_RscStructuredText
		{
			idc = -1;

			text = "Spawnpunkt auswählen:"; //--- ToDo: Localize;
			x = -2.18 * GUI_GRID_W + GUI_GRID_X;
			y = 0.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};

		class MapView: Life_RscMapControl
		{
			idc = 38502;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;

			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 27 * GUI_GRID_W;
			h = 22.9 * GUI_GRID_H;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			coloumns[] = {0,0,0.9};
			drawSideArrows = "false";
			colorText[] = {0.05,0.05,0.05,1};
			rowHeight = 0.05;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
			color[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.9};
			//colorPicture[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.9};
			x = -2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_spawnConfirm";
			idc = 1006;
			text = "-- Spawnen --"; //--- ToDo: Localize;
			x = -1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.7);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.7);
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			class Attributes
			{
				font = "PuristaMedium";
				align = "center";
				valign = "middle";
			};
			class TextPos
			{
				left = 0.005;
				top = 0.005;
				right = 0.005;
				bottom = 0.005;
			};
		};
	};
};