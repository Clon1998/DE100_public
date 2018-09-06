class life_taxirufen {

	idd = playersys_DIALOG;
	movingEnable = 1;
	enableSimulation = 1;
	
		class controls {
		
			class jl_taxifahrer: Life_RscListBox
			{
				idc = 2100;
				text="";
				x = 1 * GUI_GRID_W + GUI_GRID_X;
				y = 3 * GUI_GRID_H + GUI_GRID_Y;
				w = 37.5 * GUI_GRID_W;
				h = 18 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
			class jl_taxianrfragenbtn: Life_RscButtonMenu
			{
				idc = 2400;
				text = "Taxifahrer anfragen"; 
				x = 8 * GUI_GRID_W + GUI_GRID_X;
				y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 11 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
			class jl_abbrechen: Life_RscButtonMenu
			{
				idc = 2401;
				text = "Abbrechen"; 
				x = 21.5 * GUI_GRID_W + GUI_GRID_X;
				y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
			class jl_titel: Life_RscText
			{
				idc = 1001;
				text = "Taxi rufen: Wenn der Taxifahrer die Anfrage angenommen hat kostet es schon."; 
				x = 1 * GUI_GRID_W + GUI_GRID_X;
				y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 37.5 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
	};
};