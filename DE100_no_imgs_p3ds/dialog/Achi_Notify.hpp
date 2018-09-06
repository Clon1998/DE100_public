/*
	File : Achi_Notify.hpp
	Date:   17.01.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
*/

class Achi_Notifyer {
	idd = 3000;
	movingEnable = 0;
	enableSimulation = 1;
	duration = 10;
	onLoad="uiNamespace setVariable ['Achi_Notifyer',_this select 0]";
	
	class controlsBackground
	{
	};
	
	class controls
	{
		class BG: RscPicture
		{
			idc = 3001;
			text = "images\dialog\bg_achievement_notifyer.paa";
			x = 0.329983 * safezoneW + safezoneX;
			y = -1 * safezoneH + safezoneY;
			w = 0.335033 * safezoneW;
			h = 0.121 * safezoneH;
		};

		class Text: Life_RscStructuredText
		{
			idc = 3002;
			text = "";
			x = 0.40499 * safezoneW + safezoneX;
			y = -1 * safezoneH + safezoneY;
			w = 0.240024 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};