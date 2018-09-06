class lockpick_system {
    name = "lockpick_system";
    idd = 5000;
    movingEnable = 0;
    onLoad="_this call lpick_fnc_prepare;";
    onMouseMoving = "_this call lpick_fnc_moveLPick;";
    onMouseButtonDown = "_this call lpick_fnc_mBtnDown;";
    onMouseButtonUp = "_this call lpick_fnc_mBtnUp;";
    onKeyDown = "_this call lpick_fnc_keyDown;";
    onKeyUp = "_this call lpick_fnc_keyUp;";

    class controlsBackground 
    {
		class Base: RscPicture
		{
			idc = -1;
			text = "images\dialog\lock.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.407 * safezoneH;
		};
    };
   	class controls
	{
		class TurnMe: RscPicture
		{
			idc = 5001;
			onLoad = "(_this select 0) setVariable ['iniPos',ctrlPosition (_this select 0)];";
			text = "images\dialog\keyhole.paa";
			x = 0.46535 * safezoneW + safezoneX;
			y = 0.3482 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
};