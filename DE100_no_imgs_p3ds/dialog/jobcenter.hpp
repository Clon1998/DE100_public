class Life_jobcenter
{
	idd = 4800;
	name="life_jobcenter";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			idc = 4801;
			text = "Job Center";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class TitleBox : Life_RscText
		{
			idc = -1;
			text = "Verfügbare Jobs";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11; y = 0.26;
			w = 0.3;
			h = (1 / 25);
		};
		
		class InfoHeader : Life_RscText
		{
			idc = 4830;
			text = "Information";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.42; y = 0.26;
			w = 0.46;
			h = (1 / 25);
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "Abbruch";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AcceptBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "Annehmen";
			onButtonClick = "[] call life_fnc_jobAccept;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AborBtn : life_RscButtonMenu 
		{
			idc = -1;
			text = "Kündigen";
			onButtonClick = "[] call life_fnc_jobLeave;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class JobList : Life_RscListBox
		{
			idc = 4802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_jobLBChange;";
			
			//Position & height
			x = 0.11; y = 0.302;
			w = 0.303; h = 0.49;
		};
		
		class JobInfomationList : Life_RscStructuredText
		{
			idc = 4803;
			text = "";
			sizeEx = 0.03;
			
			x = 0.41; y = 0.3;
			w = 0.5; h = 0.5;
		};
	};
};