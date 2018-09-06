class fuelstation_Dialog {
	idd = 29000;
	name= "fuelstation_dialog";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	onKeyDown = "if ((_this select 1) == 1) then { closeDialog 0; life_action_inUse = false; }";
	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.3;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.3 + (11 / 250);
			w = 0.8;
			h = 0.5 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			idc = 29001;
			text = "";
			x = 0.1;
			y = 0.3;
			w = 0.8;
			h = (1 / 25);
		};
		
		class TextVehicleInfo : Life_RscText
		{
			idc = -1;
			text = "Fahrzeuge";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.405; y = 0.36; 
			w = 0.485;
			h = (1 / 25);
		};
		
		class TextFuelstationGas : Life_RscText
		{
			idc = 29002;
			text = "Zapfsäule ($--.-- Liter)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11; y = 0.36; 
			w = 0.285;
			h = (1 / 25);
		};
		
		class AmountFitIn : life_RscText
		{
			idc = 29003;
			text = "";
			
			style=1;
			
			x = 0.11; y = 0.47;
			w = 0.285; h = (1 / 25);
		};
		
		class AmountCash : life_RscText
		{
			idc = 29004;
			text = "";
			
			style=1;
			
			x = 0.11; y = 0.52;  
			w = 0.285; h = (1 / 25);
		};
		
	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 29011;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "[_this] call life_fnc_fuelStationSelect;";
			
			//Position & height
			x = 0.405; y = 0.402;
			w = 0.485; h = 0.34;
		};
		
		class sliderAmount : life_RscXSliderH 
		{
			idc = 29012;
			text = "";
			onSliderPosChanged = "[_this] call life_fnc_fuelStationSliderChange;";
			tooltip = "Menge die getankt werden soll";
			x = 0.11;
			y = 0.37 + (1 / 25); 
			
			w = 0.285;
			h = (1 / 25);
		};
		
		class btnRefillVehicle : Life_RscButtonMenu
		{
			idc = 29021;
			text = "Tanken";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_fuelstationFill;";
			
			x = 0.11;
			y = 0.74 - (1 / 25);
			w = 0.285;
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			text = "Schliessen";
			onButtonClick = "closeDialog 0; life_action_inUse = false;";
			x = 0.1;
			y = 0.80 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};