// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_STRUCTURED_TEXT  13
#define CT_LINEBREAK        98
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_ROUNDED1        128
#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20


class IcePicture
{
          access = 0;
          type = CT_STATIC;
          style = ST_PICTURE;
          idc = -1;
          colorBackground[] = {0,0,0,1};
          colorText[] = {1,1,1,1};
          font = "puristaMedium";
          sizeEx = 0;
          lineSpacing = 0;
          text = "";
          fixedWidth = 0;
          shadow = 0;
          x = 0;
          y = 0;
          w = 0.2;
          h = 0.15;
          moving = 1;
};

class IceLB
{ 
        
	
         type=CT_LISTBOX;
         style = ST_LEFT;
	 idc=-1;
	 font = "TahomaB";
	 sizeEx = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	 rowHeight=0.02;
   lineSpacing = 1;
	 idcRight = -1;
	 idcLeft = -1;
	 drawSideArrows = 1;
   columns[] = {0.937500,0.968750,1.000000,0.7};
   colorText[] = {1,1,1,1};
	 colorScrollbar[] = {1,1,1,1};
	 colorSelect[] = {0.937500,0.968750,1.000000,1};
	 colorSelect2[] = {0.937500,0.968750,1.000000,1};
	 colorSelectBackground[] = {0.937500,0.968750,1.000000,0.1};
	 colorSelectBackground2[] = {0.937500,0.968750,1.000000,0.1};
	 colorBackground[] = {1,1,1,0};
	 maxHistoryDelay = 1.0;
	 soundSelect[] = {"",0.1,1};
	 period = 1;
	 autoScrollSpeed = -1;
	 autoScrollDelay = 5;
	 autoScrollRewind = 0;
	 arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	 arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	 shadow = 0;
   moving = 1;
   colorDisabled[] = {1, 1, 1, 0.6};
        
       
	class ListScrollBar
	{
		 color[] = {1, 1, 1, 0};
		 colorActive[] = {1, 1, 1, 0};
		 colorDisabled[] = {1, 1, 1, 0};
		 arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
     arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
     thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
     soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
		 shadow = 1;
	};	
};

class IceButtonInvis
{
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {0,0,0,0};
    colorDisabled[] = {1,1,1,0};
    colorBackground[] = {0,0,0,0};
    colorBackgroundDisabled[] = {1,1,1,0};
    colorBackgroundActive[] = {1,1,1,0};
    colorFocused[] = {1,1,1,0};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0,0,0,0};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = 0.025;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.001;
    offsetPressedY = 0.001;
    borderSize = 0;
    moving = 1;
};
