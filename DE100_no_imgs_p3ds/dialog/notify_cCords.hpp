#define true 1
#define false 0

class notify_cCords
{
	idd = 333;
	movingEnabled = 1;
	onUnload = "_this call life_fnc_notification_system_cCords;";
	class controlsBackground {};
	
	class Controls
	{
		class Header: Life_RscText
		{
			moving = true; 
			idc = 1;
			text = "Ziehe hier";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = "(profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_HEADER',[0.005 * safezoneW + safezoneX, 0.01 * safezoneH + safezoneY]]) select 0";
			y = "(profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_HEADER',[0.005 * safezoneW + safezoneX, 0.01 * safezoneH + safezoneY]]) select 1";
			w = 0.2 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.02 * safeZoneH;
		};

		class Text: Life_RscStructuredText
		{
			moving = true; 
			idc = 2;
			text = "Verschiebe das Benachrichtigungsfeld an den gewünschten Ort des Bildschirms.<br/>Zum verschieben Klicke auf den Header und halte die Maustaste gedrückt.<br/>Wenn du fertig bist, klicke auf diesen Text oder drücke ESC.";
			colorBackground[] = {0, 0, 0, 0.85};
			x = "(profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_TEXT',[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]]) select 0";
			y = "(profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_TEXT',[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]]) select 1";
			w = 0.2 * safezoneW;
			h = 0.5;
		};

		class Reset: life_RscButtonMenu
		{
			idc = 3;
			onButtonClick = "(findDisplay 333) setVariable ['reset',true]; closeDialog 0;";
			moving = false; 
			text = "Standard";
			x = "(profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_TEXT',[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]]) select 0";
			y = "((profilenamespace getVariable ['DE100_NOTIFY_CUSTOM_TEXT',[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]]) select 1) + 0.504";
			w = 0.2 * safezoneW;
			h = 0.025 * safezoneH;

			class Attributes : Attributes {
				align = "center";
			};
		};
	};
};