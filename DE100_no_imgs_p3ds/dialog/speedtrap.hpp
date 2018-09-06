class life_speedtrap {
	idd = 8000;
	name= "life_speedtrap";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Speedtrap";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
        class SpeedlimitEditText : Life_RscStructuredText
		{
			idc = -1;
			text = "Limit:";
			x = 0.12;
            y = 0.4;
			w = 0.2;
			h = 0.1;
		};

		class SpeedlimitEdit : Life_RscEdit
        {
            idc = 8001;
            text = "";
            sizeEx = 0.04;
            x = 0.275; 
            y = 0.4;
            w = 0.4; 
            h = 0.04;	
		};

        class SpeedlimitDescription : Life_RscStructuredText
		{
			idc = -1;
			text = "Eine Toleranz von 10km/h wird automatisch berücksichtigt.";
			x = 0.12;
            y = 0.5;
			w = 0.5;
			h = 0.1;
		};       
        
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SaveButtonKey : Life_RscButtonMenu {
			idc = 8005;
			text = "Speichern";
			onButtonClick = "[] call life_fnc_setSpeedtrapLimit;closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};