class life_progress
{
	name = "life_progress";
	idd = 38200;
	fadein=0;
	duration = 1e+011;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class background : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		class ProgressBar : Life_RscProgress
		{
			idc = 38201;
			x = 0.38140 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.65; h = 0.05;
		};
		
		class ProgressText : Life_RscText
		{
			idc = 38202;
			text = "Servicing Chopper (50%)...";
			x = 0.386 * safezoneW + safezoneX;
			y = 0.0635 * safezoneH + safezoneY;
			w = 0.65; h = (1 / 25);
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 1e+011;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class life_progress_adv
{
    name = "life_progress_adv";
    idd = 38200;
    fadein=0.2;
    duration = 1e+011;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['life_progress_adv',_this select 0]";
    objects[]={};

    class controlsBackground 
    {
        class background : Life_RscText
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.38 * safezoneW + safezoneX;
            y = 0.057 * safezoneH + safezoneY;
            w = 0.272 * safezoneW;
            h = 0.034 * safezoneH;
        };
        class ProgressBar : Life_RscText
        {
            idc = 38201;
            onLoad = "private _c = _this select 0; private _p = ctrlPosition _c; _c setVariable ['iniPos',ctrlPosition _c];_p set [2,0];_c ctrlSetPosition _p;_c ctrlCommit 0;";
            colorBackground[] = {1, 0, 0, 1};
            x = 0.38140 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.0275 * safezoneH;
        };
        
        class ProgressText : Life_RscText
        {
            idc = 38202;
            text = "Servicing Chopper (50%)...";
            x = 0.386 * safezoneW + safezoneX;
            y = 0.0635 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};