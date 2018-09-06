/*
	File : prof_2.hpp
	Date:   23.09.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

 
class Life_Prof_2_Dialog
{
	idd = 7729;
	name = "Life_Prof_2_Dialog";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "_this call life_fnc_profSetup;";

	class controlsBackground 
	{
		class Main_bg: Life_RscText
		{
			idc = -1;

			x = -2 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 43.5 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	 
	class controls 
	{
		class Topic_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Erfahrungssystem";
			x = -2 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 43.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Topic_Colour: Life_RscText
		{
			idc = -1;

			text = "Erfahrungssystem";
			x = -2 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 43.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Typ_LB: Life_RscListbox
		{
			idc = 7730;
			onLBSelChanged = "_this call life_fnc_prof_LB_type_change;";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 0.0176 * safeZoneH;
		};
		
		class Typ_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Typ";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Typ_Colour: Life_RscText
		{
			idc = -1;

			text = "Bereich";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Art_LB: Life_RscListbox
		{
			idc = 7731;
			onLBSelChanged = "_this call life_fnc_prof_LB_art_change;";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 0.0176 * safeZoneH;
		};
		
		class Art_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Tätigkeit";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Art_Colour: Life_RscText
		{
			idc = -1;

			text = "Art";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Res_LB: Life_RscListbox
		{
			idc = 7732;
			onLBSelChanged = "_this spawn life_fnc_prof_LB_res_change;";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
			sizeEx = 0.0176 * safeZoneH;
		};
		
		class Res_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Fertigkeiten";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Res_Colour: Life_RscText
		{
			idc = -1;
			
			text = "Fertigkeiten";
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Info_StrkTxt: Life_RscStructuredText
		{
			idc = 7733;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
		
		class Info_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Info";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};	
		
		class Info_Colour: Life_RscText
		{
			idc = -1;

			text = "Info";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Akt_Vorteile_StrkTxt: Life_RscStructuredText
		{
			idc = 7734;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 2.1 * GUI_GRID_H;
		};
		
		class Akt_Vorteile_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Aktuelle Vorteile";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class Akt_Vorteile_Colour: Life_RscText
		{
			idc = -1;

			text = "Nächste Vorteile";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Next_Vorteile_StrkTxt: Life_RscStructuredText
		{
			idc = 7735;
			
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 2.1 * GUI_GRID_H;
		};
		
		class Next_Vorteile_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Nächsten Vorteile";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class Next_Vorteile_Colour: Life_RscText
		{
			idc = -1;

			text = "Aktuelle Vorteile";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Ben_xp_StrkTxt: Life_RscStructuredText
		{
			idc = 7736;
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2.1 * GUI_GRID_H;
		};
		
		class Ben_XP_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Benötigte XP";
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Ben_XP_Colour: Life_RscText
		{
			idc = -1;
			
			text = "Folgend";
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class Akt_lvl_StrkTxt: Life_RscStructuredText
		{
			idc = 7737;
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2.1 * GUI_GRID_H;
		};
		
		class Akt_lvl_txt: Life_RscText
		{
			idc = -1;
			
			//text = "Aktuelles Lvl";
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Akt_lvl_Colour: Life_RscText
		{
			idc = -1;
			text = "Aktuell";
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class Close_Btn: life_RscButtonMenu
		{
			idc = -1;
			
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = -2 * GUI_GRID_W + GUI_GRID_X;
			y = 22.19 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};




