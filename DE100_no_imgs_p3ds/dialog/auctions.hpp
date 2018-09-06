class auctions
{
    name = "auctions";
    onLoad = "_this call life_fnc_openView;";
    onUnload = "player setVariable ['auction_open',false,true];[-1,_this select 0] call life_fnc_handleCam;";
    idd = 4000;
    movingEnable = 0;
    enableSimulation = 1;
    class controlsBackground 
    {
    	class main_bg: Life_RscText
		{
			idc = -1;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.0821513 * safezoneH + safezoneY;
			w = 0.794062 * safezoneW;
			h = 0.66 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

    };
   	class controls
	{
		class map: Life_RscMapControl
		{
			idc = 1000;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.4699207 * safezoneH + safezoneY;
			w = 0.288751 * safezoneW;
			h = 0.25 * safezoneH;
			scaleDefault = 0.01;
		};
		class map_2: Life_RscMapControl
		{
			idc = 1100;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.159131 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.285893 * safezoneH;
			scaleDefault = 0.01;
		};
		class Section_Header: Life_RscButtonTextOnly
		{
			idc = 4000;
			style = "0x00+0xC0";
			onButtonClick = "_this call life_fnc_handleMenu;";
			text = "Auktionen Übersicht";
			shortcuts[] = {"0x12"};
			font = "TahomaB";
			shadow = 2;
			sizeEx = 0.03 * safezoneH;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0439841 * safezoneH;
		};
		class Menu_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4100;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0;
			h = 0.66 * safezoneH;
			class Controls
			{
				class bg: Life_RscText
				{
					idc = 4101;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					x = 0;
					y = 0;
					w = 0.242344 * safezoneW;
					h = 0.66 * safezoneH;
				};
				class Section_Header: Life_RscText
				{
					idc = 4102;
					text = "DE100-Auktionshaus";
					style = "0x02";
					font = "TahomaB";
					shadow = 2;
					x = 0;
					y = 0;
					w = 0.242344 * safezoneW;
					h = 0.0439841 * safezoneH;
					sizeEx = 0.03 * safezoneH;
				};
				class entry_1: Life_RscButtonTextOnly
				{
					idc = 4103;
					onButtonClick = "(_this+[0]) call life_fnc_openView";
					text = "Auktionen Übersicht"; 
					sizeEx = 0.03 * safezoneH;
					shadow = 2;
					x = 0;
					y = 0.08 * safezoneH;
					w = 0.242344 * safezoneW;
					h = 0.0439841 * safezoneH;
				};
				class entry_2: entry_1
				{
					idc = 4104;
					onButtonClick = "(_this+[3]) call life_fnc_openView";
					text = "Meine Auktionen"; 
					y = 0.1239841 * safezoneH;
				};
				class entry_3: entry_1
				{
					idc = 4105;
					onButtonClick = "(_this+[8]) call life_fnc_openView";
					text = "Gewonnene Auktionen"; 
					y = 0.1679682 * safezoneH;
				};
				class entry_4: entry_1
				{
					idc = 4106;
					onButtonClick = "(_this+[6]) call life_fnc_openView";
					text = "Watchliste"; 
					y = 0.2119523 * safezoneH;
				};
				class entry_5: entry_1
				{
					idc = 4107;
					onButtonClick = "(_this+[2]) call life_fnc_openView";
					text = "Auktion erstellen"; 
					y = 0.2559364 * safezoneH;
				};

				class entry_6: entry_1
				{
					idc = 4108;
					onButtonClick = "(_this+[4]) call life_fnc_openView";
					text = "Auktions Historie"; 
					y = 0.2999205 * safezoneH;
				};
			};
		};
		class Section_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4200;

			x = 0.108125 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class sec_btn_1 : Life_RscButtonPicture
				{
					idc = 4201;
					
					x = 0.00515599 * safezoneW;
					y = 0.0549803 * safezoneH;
					w = 0.0360937 * safezoneW;
					h = 0.0659762 * safezoneH;
					text = "";
				};
				class sec_btn_2: sec_btn_1
				{
					idc = 4202;

					x = 0.00515599 * safezoneW;
					y = 0.142948 * safezoneH;
				};
				class sec_btn_3: sec_btn_1
				{
					idc = 4203;

					x = 0.00515599 * safezoneW;
					y = 0.230916 * safezoneH;
				};
				class sec_btn_4: sec_btn_1
				{
					idc = 4204;

					x = 0.00515599 * safezoneW;
					y = 0.318885 * safezoneH;
				};
				class sec_btn_5: sec_btn_1
				{
					idc = 4205;

					x = 0.00515599 * safezoneW;
					y = 0.406853 * safezoneH;
				};
				class sec_btn_6: sec_btn_1
				{
					idc = 4206;

					x = 0.00515599 * safezoneW;
					y = 0.494821 * safezoneH;
				};
				class sec_btn_7: sec_btn_1
				{
					idc = 4207;

					x = 0.00515599 * safezoneW;
					y = 0.571793 * safezoneH;
				};
			};
		};
		class Auctions_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4300;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class search_txt: Life_RscText
				{
					idc = -1;
					style = "0x01";
					sizeEx = 0.03 * safezoneH;
					shadow = 2;
					text = "Suche:"; //--- ToDo: Localize;
					x = 0.520 * safezoneW;
					y = 0.01 * safezoneH;
					w = 0.043 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_ico: Life_RscText
				{
					idc = -1;
					text = "";
					shadow = 2;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.001 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.03583595 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_item: Life_RscButtonTextOnly
				{
					idc = -1;
					type = 1;
					style = "0x00";
					shadow = 2;
					
					onButtonClick = "(_this+[1]) call life_fnc_sortTable;";
					text = "Artikel-Name";
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					colorShadow[] = {1, 1, 1, 0};
					x = 0.03683595 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.216763345 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_seller: header_item
				{
					idc = -1;
					onButtonClick = "(_this+[2]) call life_fnc_sortTable;";
					text = "Verkäufer";

					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.253599295 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.108400705 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_amnt: header_item
				{
					idc = -1;
					onButtonClick = "(_this+[3,true]) call life_fnc_sortTable;";
					text = "Menge";

					x = 0.362 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.0716719 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_timer: header_seller
				{
					idc = -1;
					onButtonClick = "(_this+[4,true]) call life_fnc_sortTable;";
					text = "Laufzeit";

					x = 0.4336719 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.0713281 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_bet: header_item
				{
					idc = -1;
					onButtonClick = "(_this+[5,true]) call life_fnc_sortTable;";
					text = "Höchstgebot";

					x = 0.505 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.10750785 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class header_buyNow: header_seller
				{
					idc = -1;
					onButtonClick = "(_this+[6,true]) call life_fnc_sortTable;";
					
					text = "Sofortkauf";
					x = 0.61250785 * safezoneW;
					y = 0.053 * safezoneH;
					w = 0.104065 * safezoneW;
					h = 0.0329881 * safezoneH;
				};

				class bg_ico: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.8};
					x = 0.001 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.03583595 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_item: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.65};
					x = 0.03683595 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.216763345 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_seller: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.8};
					x = 0.253599295 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.108400705 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_amnt: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.65};
					x = 0.362 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.0716719 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_timer: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.8};
					x = 0.4336719 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.0713281 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_bet: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.65};
					x = 0.505 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.10750785 * safezoneW;
					h = 0.5627777 * safezoneH;
				};

				class bg_buyNow: Life_RscText
				{
					idc = -1;
					colorBackground[] = {1,1,1,0.8};
					x = 0.61250785 * safezoneW;
					y = 0.0859881 * safezoneH;
					w = 0.104065 * safezoneW;
					h = 0.5627777 * safezoneH;

				};

				class auction_view: Life_RscListNBox
				{
					idc = 4301;
					columns[] = {0,0.05,0.35,0.5,0.6,0.7,0.85};
					onLBDblClick = "if (((_this select 0) lnbValue [_this select 1,0]) >= 0) then {[_this select 0, 1, _this] call life_fnc_openView;}";
					x = 0 * safezoneW;
					y = 0.0859882 * safezoneH;
					w = 0.716719 * safezoneW;
					h = 0.562777 * safezoneH;
					rowHeight = 0.03 * safeZoneH;
					colorText[] = {0,0,0,1};
					colorPicture[] = {1,1,1,1};
					colorPictureSelected[] = {1,1,1,1};
					colorPictureDisabled[] = {1,1,1,1};
					colorSelectBackground[] = {1, 1, 1, 0.5};
					colorSelectBackground2[] = {1, 1, 1, 0.5};
					colorSelect[] = {0, 0, 0, 1};
					colorSelect2[] = {0, 0, 0, 1};
				};
				
				class edit_field: Life_RscEdit
				{
					idc = 4302;
					onKeyUp = "_this call life_fnc_searchTable;";
					onKeyDown = "_this call life_fnc_searchTable;";
					text = "";
					x = 0.562032 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.154687 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
			};
		};
		class ArticleData_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4400;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class header_pic: Life_RscText
				{
					idc = 4401;
					text = "WaffeXY von PersonXY";
					shadow = 2;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0 * safezoneW;
					y = 0.0549803 * safezoneH;
					w = 0.355781 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class header_desc: Life_RscText
				{
					idc = -1;
					text = "Produkt-Beschreibung";
					shadow = 2;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0 * safezoneW;
					y = 0.3628733 * safezoneH;
					w = 0.355781 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class header_betData: Life_RscStructuredText
				{
					idc = 4402;
					text = "Sofortkauf: xxx.xxx.xxx € Höchstgebot: xxx.xxx.xxx";
					shadow = 2;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.355781 * safezoneW;
					y = 0.0549803 * safezoneH;
					w = 0.360937 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class header_trend: Life_RscText
				{
					idc = -1;
					text = "Preis-Entwicklung";
					shadow = 2;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])*0.7","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.355781 * safezoneW;
					y = 0.3628733 * safezoneH;
					w = 0.360937 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class pic: Life_RscPicture
				{
					idc = 4403;
					text = "#(argb,512,512,1)r2t(auc_prev_pic,2)";
					x = 0 * safezoneW;
					y = 0.0769803 * safezoneH;
					w = 0.355781 * safezoneW;
					h = 0.285893 * safezoneH;
				};
				class desc: Life_RscControlsGroup
				{
					idc = 4404;
					x = 0 * safezoneW;
					y = 0.384873 * safezoneH;
					w = 0.355781 * safezoneW;
					h = 0.263893 * safezoneH;
					class VScrollBar : Life_RscScrollBar
					{
						width = 0.001 * safezoneW;
						autoScrollEnabled = 1;
					};
					class controls {
						class txt: Life_RscTextMulti {
							idc = 0;
							text = "";
							w = 0.354 * safezoneW;
							h = 0.263893 * safezoneH;
						}
					};
				};
				class hist: Life_RscTree
				{
					idc = 4405;
					sizeEx = 0.022 * safezoneH;
					x = 0.355781 * safezoneW;
					y = 0.0769803 * safezoneH;
					w = 0.360937 * safezoneW;
					h = 0.285893 * safezoneH;
				};
				class histroyInfo: Life_RscStructuredText
				{
					idc = 4406;
					x = 0.355782 * safezoneW;
					y = 0.384873 * safezoneH;
					w = 0.355781 * safezoneW;
					h = 0.186921 * safezoneH;
				};
				class bet_edit: Life_RscEdit
				{
					idc = 4407;
					text = "Gebot";
					onSetFocus = "private _c = _this select 0;if (toLower (ctrlText _c) isEqualTo 'gebot') then {_c ctrlSetText '';};";
					x = 0.360938 * safezoneW;
					y = 0.604782 * safezoneH;
					w = 0.139219 * safezoneW;
					h = 0.0219921 * safezoneH;
				};
				class btn_bet: Life_RscButtonPicture
				{
					idc = 4408;
					onButtonClick = "(_this + [1]) call life_fnc_buyArticle;";
					tooltip = "Gebot abgeben";
					text = "images\dialog\ico_bet.paa";
					x = 0.505313 * safezoneW;
					y = 0.58279 * safezoneH;
					w = 0.0360937 * safezoneW;
					h = 0.0659762 * safezoneH;
				};
				class btn_buy: Life_RscButtonPicture
				{
					idc = 4409;
					onButtonClick = "(_this + [0]) call life_fnc_buyArticle;";
					tooltip = "Sofortkauf";
					text = "images\dialog\ico_buyNow.paa";
					x = 0.546563 * safezoneW;
					y = 0.58279 * safezoneH;
					w = 0.0360937 * safezoneW;
					h = 0.0659762 * safezoneH;
				};
				class RscSlider_1900: life_RscXSliderH
				{
					idc = 4410;
					onLoad = "(_this select 0) sliderSetRange [1,31]";
					onSliderPosChanged = "[ctrlParentControlsGroup (_this select 0),round(_this select 1)] call life_fnc_calcHistory";
					x = 0.587813 * safezoneW;
					y = 0.604782 * safezoneH;
					w = 0.128906 * safezoneW;
					h = 0.0219921 * safezoneH;
				};
				class del_btn : Life_RscButtonPicture
				{
					idc = 4411;
					tooltip = "Auktion Zurückziehen";
					onButtonClick = "_this call life_fnc_deleteAuction";
					text = "images\dialog\ico_delAuc.paa";
					x = 0.661812 * safezoneW;
					y = 0.00549146 * safezoneH;
					w = 0.0257853 * safezoneW;
					h = 0.0439841 * safezoneH;
				};
				class fav_btn : Life_RscButtonPicture
				{
					idc = 4412;
					tooltip = "Beobachten";
					onButtonClick = "_this call life_fnc_favAuction";
					text = "images\dialog\ico_fav.paa";
					x = 0.690258 * safezoneW;
					y = 0.00549146 * safezoneH;
					w = 0.0257853 * safezoneW;
					h = 0.0439841 * safezoneH;
				};
			};
		};
		class CA_SellItem_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4500;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class Filter_1: Life_RscControlsGroup
				{
					idc = 4501;
					x = 0 * safezoneW;
					y = 0.0879683 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
					class Controls
					{
						class Image: Life_RscPicture
						{
							idc = 1;
							text = "";
							x = 0;
							y = 0;
							w = 0.0309375 * safezoneW;
							h = 0.0549802 * safezoneH;
						};

						class Selector: Life_RscPicture
						{
							idc = 2;
							text = "";
							colorText[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
							x = 0;
							y = 0;
							w = 0.0309375 * safezoneW;
							h = 0.0549802 * safezoneH;
						};

						class Btn: Life_RscButtonMenu
						{
							idc = 3;
							text = "";
							colorBackground[] = {0,0,0,0};
							colorBackground2[] = {0,0,0,0};
							colorBackgroundFocused[] = {0,0,0,0};
							x = 0;
							y = 0;
							w = 0.0309375 * safezoneW;
							h = 0.0549802 * safezoneH;
						};
					};
				};
				class Filter_2: Filter_1
				{
					idc = 4502;

					x = 0 * safezoneW;
					y = 0.142948 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_3: Filter_1
				{
					idc = 4503;

					x = 0 * safezoneW;
					y = 0.197929 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_4: Filter_1
				{
					idc = 4504;

					x = 0 * safezoneW;
					y = 0.252909 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_5: Filter_1
				{
					idc = 4505;

					x = 0 * safezoneW;
					y = 0.307889 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_6: Filter_1
				{
					idc = 4506;

					x = 0 * safezoneW;
					y = 0.362869 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_7: Filter_1
				{
					idc = 4507;

					x = 0 * safezoneW;
					y = 0.417849 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_8: Filter_1
				{
					idc = 4508;

					x = 0 * safezoneW;
					y = 0.472829 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_9: Filter_1
				{
					idc = 4509;

					x = 0 * safezoneW;
					y = 0.52781 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class Filter_10: Filter_1
				{
					idc = 4510;

					x = 0 * safezoneW;
					y = 0.58279 * safezoneH;
					w = 0.0309375 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class storage_lb_bg: Life_RscText
				{
					idc = -1;
					text = ""; //--- ToDo: Localize;
					x = 0.03609376 * safezoneW;
					y = 0.09 * safezoneH;
					w = 0.252656 * safezoneW;
					h = 0.51 * safezoneH;
					colorBackground[] = {1,1,1,0.8};
				};	
				class storage_lb: Life_RscListNBox
				{
					idc = 4511;
					onLBSelChanged = "(_this+[0]) call life_fnc_sellItemLbChange;";
					drawSideArrows = 0;
					columns[] = {-0.01,0.11,0.21};
					x = 0.03609376 * safezoneW;
					y = 0.09 * safezoneH;
					w = 0.252656 * safezoneW;
					h = 0.51 * safezoneH;
					sizeEx = 0.0164975 * safeZoneH;
					colorText[] = {0,0,0,1};
					colorPicture[] = {1,1,1,1};
					colorPictureSelected[] = {1,1,1,1};
					colorPictureDisabled[] = {1,1,1,1};
					colorSelectBackground[] = {1, 1, 1, 0.5};
					colorSelectBackground2[] = {1, 1, 1, 0.5};
					colorSelect[] = {0, 0, 0, 1};
					colorSelect2[] = {0, 0, 0, 1};
				};
				class edit_amnt: Life_RscEdit
				{
					idc = 4512;
					colorText[] = {0,0,0,1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200+0x02";
					text = "1"; //--- ToDo: Localize;
					x = 0.03609376 * safezoneW;
					y = 0.6047825 * safezoneH;
					w = 0.252656 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_storage: Life_RscText
				{
					idc = -1;
					text = "Spind-Lagerboxen-System"; //--- ToDo: Localize;
					x = 0 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.29390674 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class btn_header_wea: Life_RscButtonMenu
				{
					idc = 4513;
					text = "WAFFEN"; //--- ToDo: Localize;
					onButtonClick = "[_this select 0,0] call life_fnc_setupAucCategory;";
					size = 0.032 * safeZoneH;
					class Attributes : Attributes {
						align = "center";
					};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorBackground[] = {0,0,0,1};
					colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					
					colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					colorFocused[] = {0.761,0.761,0.761,1};
					x = 0 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_clo: btn_header_wea
				{
					idc = -1;
					onButtonClick = "[_this select 0,1] call life_fnc_setupAucCategory;";
					text = "KLEIDUNG"; //--- ToDo: Localize;
					x = 0.07218746 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_ite: btn_header_wea
				{
					idc = -1;
					onButtonClick = "[_this select 0,2] call life_fnc_setupAucCategory;";
					text = "ITEMS"; //--- ToDo: Localize;
					x = 0.14437526 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_son: btn_header_wea
				{
					idc = -1;
					onButtonClick = "[_this select 0,3] call life_fnc_setupAucCategory;";
					text = "SONSTIGES"; //--- ToDo: Localize;
					x = 0.21656226 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.07734424 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class header_side: Life_RscText
				{
					idc = -1;
					text = "";
					x = 0.293907 * safezoneW;
					y = 0.0109962 * safezoneH;
					w = 0.005156 * safezoneW;
					h = 0.626774 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class create_btn: life_RscButtonMenu
				{
					idc = 4514;
					text = "Auktion erstellen"; //--- ToDo: Localize;
					onButtonClick = "_this call life_fnc_createAuction;";
					x = 0.299063 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0549802 * safezoneH;
					colorText[] = {1, 1, 1, 1};
					size = 0.042 * safeZoneH;
					colorBackground[] = {0,0,0,0};
					colorBackgroundActive[] = {0,0,0,0};
					colorDisabled[] = {1,1,1,1};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
					animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
					class Attributes : Attributes {
						align = "center";
					};
				};
				class header_bet: Life_RscText
				{
					idc = -1;
					text = "Startgebot"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_bet: Life_RscEdit
				{
					idc = 4515;
					colorText[] = {0,0,0,1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_buy: Life_RscText
				{
					idc = -1;
					text = "Sofortkauf"; //--- ToDo: Localize;
					x = 0.505313 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.211406 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_buy: Life_RscEdit
				{
					idc = 4516;
					colorText[] = {0,0,0,1};
					colorDisabled[] = {0.7, 0.7, 0.7, 1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.510469 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class deac_cb: Life_Checkbox
				{
					idc = 4517;
					onCheckedChanged = "_this call life_fnc_buyNowCb;";
					x = 0.654844 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0154688 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_deac: Life_RscText
				{
					idc = -1;
					sizeEx = 0.019 * safezoneH;
					text = "Deaktivieren"; //--- ToDo: Localize;
					x = 0.665157 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0515625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_time: Life_RscText
				{
					idc = -1;
					text = "Laufzeit"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.142948 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class sel_time: Life_RscXListbox
				{
					idc = 4518;
					onLBSelChanged = "_this call life_fnc_timeLbChange;";
					colorSelect[] = {1,1,1,1};
					colorText[] = {1,1,1,1};
					colorActive[] = {1,1,1,1};
					
					x = 0.304219 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class text_time: Life_RscStructuredText
				{
					idc = 4519;
					x = 0.510469 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class edit_desc: Life_RscEdit
				{
					idc = 4520;
					colorBackground[] = {1,1,1,0.8};
					colorText[] = {0,0,0,1};
					onChar = "_this call life_fnc_saveDescEdit;";
					onKeyUp = "_this call life_fnc_saveDescEdit;";
					onKeyDown = "_this call life_fnc_saveDescEdit;";
					style = "16 + 0x200";
					shadow = 0;
					maxChars = 5120;
					text = "Beschreibung"; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.252909 * safezoneH;
					w = 0.4125 * safezoneW;
					h = 0.384861 * safezoneH;
				};
				class header_desc: Life_RscStructuredText
				{
					idc = 4521;
					text = "<t align='left'>Beschreibung</t><t align='right'>0/5120</t>"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.219921 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
			};
		};
		class CA_SellImo_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4600;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class header_storage: Life_RscText
				{
					idc = -1;
					text = "Immobilien-Übersicht"; //--- ToDo: Localize;
					x = 0 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.29390674 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class lb: Life_RscListBox
				{
					idc = 4611;
					onLBSelChanged = "(_this+[1]) call life_fnc_sellItemLbChange;";
					x = 0 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.288751 * safezoneW;
					h = 0.2778097 * safezoneH;
					sizeEx = 0.02 * safeZoneH;
					colorBackground[] = {1,1,1,0.8};
					colorText[] = {0,0,0,1};
					colorPicture[] = {1,1,1,1};
					colorPictureSelected[] = {1,1,1,1};
					colorPictureDisabled[] = {1,1,1,1};
					colorSelectBackground[] = {1, 1, 1, 0.5};
					colorSelectBackground2[] = {1, 1, 1, 0.5};
					colorSelect[] = {0, 0, 0, 1};
					colorSelect2[] = {0, 0, 0, 1};
				};
				class btn_header_houses: Life_RscButtonMenu
				{
					idc = 4610;
					text = "GEBÄUDE"; //--- ToDo: Localize;
					onButtonClick = "[_this select 0,0] call life_fnc_setupSellHouse;";
					size = 0.032 * safeZoneH;
					class Attributes : Attributes {
						align = "center";
					};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorBackground[] = {0,0,0,1};
					colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					
					colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					colorFocused[] = {0.761,0.761,0.761,1};
					x = 0 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.14437496 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_storehouses: btn_header_houses
				{
					idc = -1;
					onLoad = "(_this select 0) ctrlEnable false";
					tooltip = "Noch in Arbeit";
					onButtonClick = "[_this select 0,1] call life_fnc_setupSellHouse;";
					text = "LAGERHÄUSER"; //--- ToDo: Localize;
					x = 0.14437496 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.14953154 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class header_side: Life_RscText
				{
					idc = -1;
					text = "";
					x = 0.293907 * safezoneW;
					y = 0.0109962 * safezoneH;
					w = 0.005156 * safezoneW;
					h = 0.626774 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class create_btn: life_RscButtonMenu
				{
					idc = 4602;
					text = "Auktion erstellen"; //--- ToDo: Localize;
					onButtonClick = "_this call life_fnc_createAuction;";
					x = 0.299063 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0549802 * safezoneH;
					colorText[] = {1, 1, 1, 1};
					size = 0.042 * safeZoneH;
					colorBackground[] = {0,0,0,0};
					colorBackgroundActive[] = {0,0,0,0};
					colorDisabled[] = {1,1,1,1};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
					animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
					class Attributes : Attributes {
						align = "center";
					};
				};
				class header_bet: Life_RscText
				{
					idc = -1;
					text = "Startgebot"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_bet: Life_RscEdit
				{
					idc = 4615;
					colorText[] = {0,0,0,1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_buy: Life_RscText
				{
					idc = -1;
					text = "Sofortkauf"; //--- ToDo: Localize;
					x = 0.505313 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.211406 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_buy: Life_RscEdit
				{
					idc = 4616;
					colorText[] = {0,0,0,1};
					colorDisabled[] = {0.7, 0.7, 0.7, 1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.510469 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class deac_cb: Life_Checkbox
				{
					idc = 4605;
					onCheckedChanged = "_this call life_fnc_buyNowCb;";
					x = 0.654844 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0154688 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_deac: Life_RscText
				{
					idc = -1;
					sizeEx = 0.019 * safezoneH;
					text = "Deaktivieren"; //--- ToDo: Localize;
					x = 0.665157 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0515625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_time: Life_RscText
				{
					idc = -1;
					text = "Laufzeit"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.142948 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class sel_time: Life_RscXListbox
				{
					idc = 4618;
					onLBSelChanged = "_this call life_fnc_timeLbChange;";
					colorSelect[] = {1,1,1,1};
					colorText[] = {1,1,1,1};
					colorActive[] = {1,1,1,1};
					
					x = 0.304219 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class text_time: Life_RscStructuredText
				{
					idc = 4619;
					x = 0.510469 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class edit_desc: Life_RscEdit
				{
					idc = 4620;
					colorBackground[] = {1,1,1,0.8};
					colorText[] = {0,0,0,1};
					onChar = "_this call life_fnc_saveDescEdit;";
					onKeyUp = "_this call life_fnc_saveDescEdit;";
					onKeyDown = "_this call life_fnc_saveDescEdit;";
					style = "16 + 0x200";
					shadow = 0;
					maxChars = 5120;
					text = ""; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.252909 * safezoneH;
					w = 0.4125 * safezoneW;
					h = 0.384861 * safezoneH;
				};
				class header_desc: Life_RscStructuredText
				{
					idc = 4621;
					text = "<t align='left'>Beschreibung</t><t align='right'>0/5120</t>"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.219921 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
			};
		};
		class CA_SellVeh_GRP: Life_RscControlsGroupNoScrollbars
		{
			idc = 4700;
			onLoad = "(_this select 0) ctrlShow false;";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.0821507 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 0.648766 * safezoneH;
			class Controls
			{
				class header_storage: Life_RscText
				{
					idc = -1;
					text = "Fahrzeug-Übersicht"; //--- ToDo: Localize;
					x = 0 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.29390674 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class lb: Life_RscListBox
				{
					idc = 4711;
					onLBSelChanged = "(_this+[2]) call life_fnc_sellItemLbChange;";
					x = 0 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.288751 * safezoneW;
					h = 0.2778097 * safezoneH;
					sizeEx = 0.02 * safeZoneH;
					colorBackground[] = {1,1,1,0.8};
					colorText[] = {0,0,0,1};
					colorPicture[] = {1,1,1,1};
					colorPictureSelected[] = {1,1,1,1};
					colorPictureDisabled[] = {1,1,1,1};
					colorSelectBackground[] = {1, 1, 1, 0.5};
					colorSelectBackground2[] = {1, 1, 1, 0.5};
					colorSelect[] = {0, 0, 0, 1};
					colorSelect2[] = {0, 0, 0, 1};
				};
				class pic: Life_RscPicture
				{
					idc = 4701;
					text = "#(argb,8,8,3)color(0,0,0,1)";
					x = 0 * safezoneW;
					y = 0.38777 * safezoneH;
					w = 0.288751 * safezoneW;
					h = 0.25 * safezoneH;
				};
				class btn_header_land: Life_RscButtonMenu
				{
					idc = 4710;
					text = "LAND"; //--- ToDo: Localize;
					onButtonClick = "[_this select 0,0] call life_fnc_setupSellVeh;";
					size = 0.032 * safeZoneH;
					class Attributes : Attributes {
						align = "center";
					};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorBackground[] = {0,0,0,1};
					colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					
					colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					colorFocused[] = {0.761,0.761,0.761,1};
					x = 0 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0979688333 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_air: btn_header_land
				{
					idc = -1;
					onButtonClick = "[_this select 0,1] call life_fnc_setupSellVeh;";
					text = "LUFT"; //--- ToDo: Localize;
					x = 0.0979688333 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0979688333 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class btn_header_water: btn_header_land
				{
					idc = -1;
					onButtonClick = "[_this select 0,2] call life_fnc_setupSellVeh;";
					text = "WASSER"; //--- ToDo: Localize;
					x = 0.195937667 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.0979688333 * safezoneW;
					h = 0.0549802 * safezoneH;
				};
				class header_side: Life_RscText
				{
					idc = -1;
					text = "";
					x = 0.293907 * safezoneW;
					y = 0.0109962 * safezoneH;
					w = 0.005156 * safezoneW;
					h = 0.626774 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class create_btn: life_RscButtonMenu
				{
					idc = 4702;
					text = "Auktion erstellen"; //--- ToDo: Localize;
					onButtonClick = "_this call life_fnc_createAuction;";
					x = 0.299063 * safezoneW;
					y = 0.0109961 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0549802 * safezoneH;
					colorText[] = {1, 1, 1, 1};
					size = 0.042 * safeZoneH;
					colorBackground[] = {0,0,0,0};
					colorBackgroundActive[] = {0,0,0,0};
					colorDisabled[] = {1,1,1,1};
					color[] = {1,1,1,1};
					color2[] = {1,1,1,1};
					colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
					animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
					animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
					animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
					class Attributes : Attributes {
						align = "center";
					};
				};
				class header_bet: Life_RscText
				{
					idc = -1;
					text = "Startgebot"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_bet: Life_RscEdit
				{
					idc = 4715;
					colorText[] = {0,0,0,1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_buy: Life_RscText
				{
					idc = -1;
					text = "Sofortkauf"; //--- ToDo: Localize;
					x = 0.505313 * safezoneW;
					y = 0.0659762 * safezoneH;
					w = 0.211406 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class edit_buy: Life_RscEdit
				{
					idc = 4716;
					colorText[] = {0,0,0,1};
					colorDisabled[] = {0.7, 0.7, 0.7, 1};
					colorBackground[] = {1,1,1,0.8};
					shadow = 0;
					style = "0x200";
					text = ""; //--- ToDo: Localize;
					x = 0.510469 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class deac_cb: Life_Checkbox
				{
					idc = 4705;
					onCheckedChanged = "_this call life_fnc_buyNowCb;";
					x = 0.654844 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0154688 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_deac: Life_RscText
				{
					idc = -1;
					sizeEx = 0.019 * safezoneH;
					text = "Deaktivieren"; //--- ToDo: Localize;
					x = 0.665157 * safezoneW;
					y = 0.0989643 * safezoneH;
					w = 0.0515625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class header_time: Life_RscText
				{
					idc = -1;
					text = "Laufzeit"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.142948 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
				class sel_time: Life_RscXListbox
				{
					idc = 4718;
					onLBSelChanged = "_this call life_fnc_timeLbChange;";
					colorSelect[] = {1,1,1,1};
					colorText[] = {1,1,1,1};
					colorActive[] = {1,1,1,1};
					
					x = 0.304219 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.201094 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class text_time: Life_RscStructuredText
				{
					idc = 4719;
					x = 0.510469 * safezoneW;
					y = 0.175937 * safezoneH;
					w = 0.20625 * safezoneW;
					h = 0.0329881 * safezoneH;
				};
				class edit_desc: Life_RscEdit
				{
					idc = 4720;
					colorBackground[] = {1,1,1,0.8};
					colorText[] = {0,0,0,1};
					onChar = "_this call life_fnc_saveDescEdit;";
					onKeyUp = "_this call life_fnc_saveDescEdit;";
					onKeyDown = "_this call life_fnc_saveDescEdit;";
					style = "16 + 0x200";
					shadow = 0;
					maxChars = 5120;
					text = ""; //--- ToDo: Localize;
					x = 0.304219 * safezoneW;
					y = 0.252909 * safezoneH;
					w = 0.4125 * safezoneW;
					h = 0.384861 * safezoneH;
				};
				class header_desc: Life_RscStructuredText
				{
					idc = 4721;
					text = "<t align='left'>Beschreibung</t><t align='right'>0/5120</t>"; //--- ToDo: Localize;
					x = 0.299063 * safezoneW;
					y = 0.219921 * safezoneH;
					w = 0.417656 * safezoneW;
					h = 0.0219921 * safezoneH;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
				};
			};
		};
	};
};