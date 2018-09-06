#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


class GJoiner
{
    idd = 3000;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['myDisplay', (_this select 0)]"; 

    class Controls
    {
		class ICE_JoinerBG: IcePicture
		{
			idc = -1;

			text = "images\dialog\bg_group_monitor.paa";
			x = -9.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 60 * GUI_GRID_W;
			h = 41 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
		};

		class ICE_Joiner_LBA: IceLB
		{
			idc = 6100;

			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			colorText[] = {1,1,1,0.7};
			colorBackground[] = {1,1,1,0};
		};
		class ICE_Joiner_LBB: IceLB
		{
			idc = 6101;

			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			colorText[] = {1,1,1,0.7};
			colorBackground[] = {1,1,1,0};
		};
		class ICE_Joiner_LBC: IceLB
		{
			idc = 6102;

			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			colorText[] = {1,1,1,0.7};
			colorBackground[] = {1,1,1,0};
		};
		class ICE_Joiner_LBD: IceLB
		{
			idc = 6103;

			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			colorText[] = {1,1,1,0.7};
			colorBackground[] = {1,1,1,0};
		};
		class ICE_Button_A: IceButtonInvis
		{
			idc = -1;
			action = "[] spawn GrpAlpha";

			x = -4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class ICE_Button_B: IceButtonInvis
		{
			idc = -1;
			action = "[] spawn GrpBravo";

			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class ICE_Button_C: IceButtonInvis
		{
			idc = -1;
			action = "[] spawn GrpCharlie";

			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.41 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class ICE_Button_D: IceButtonInvis
		{
			idc = -1;
			action = "[] spawn GrpDelta";

			x = 37 * GUI_GRID_W + GUI_GRID_X;
			y = 0.41 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class ICE_Button_LW: IceButtonInvis
		{
			idc = -1;
			action = "[] spawn GrpLoneWolf";

			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.86 * GUI_GRID_H + GUI_GRID_Y;
			w = 22 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class ICE_Button_Exit: IceButtonInvis
		{
			idc = -1;
			action = "closeDialog 0";
			colorBackgroundActive[] = {1,1,1,0};
			colorFocused[] = {1,1,1,0};

			x = 37 * GUI_GRID_W + GUI_GRID_X;
			y = 22.14 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Tablet schließen"; //--- ToDo: Localize;
		};
	};
};