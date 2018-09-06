/*
	File : bank.hpp
	Date:   22.09.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
*/

// Control types
#define CT_STATIC	0
// Static styles
#define ST_PICTURE	48

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class Life_atm_new_management {
	idd = 6600;
	name= "Life_atm_new_management";
	onLoad = "if(animationState player=='Incapacitated')then{closeDialog 0}";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Bank_Bg : RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_bank.paa";
			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8 * GUI_GRID_H + GUI_GRID_Y;
			w = 50.5 * GUI_GRID_W;
			h = 40.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_1: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_2: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_3: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_4: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_Close: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};

	class controls {

		class Bankl_Btn_1: Life_RscButtonMenuSmartphone
		{
			idc = 6601;
			onButtonClick = "closeDialog 0; [1]  spawn life_fnc_atmMenu; ";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_2: Life_RscButtonMenuSmartphone
		{
			idc = 6602;
			onButtonClick = "closeDialog 0; [3] spawn life_fnc_atmMenu;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_3: Life_RscButtonMenuSmartphone
		{
			idc = 6603;
			onButtonClick = "closeDialog 0; [2]  spawn life_fnc_atmMenu; ";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_4: Life_RscButtonMenuSmartphone
		{
			idc = 6604;
			onButtonClick = "if((group player) getVariable ['gang_ID',-1] >= 0) then {closeDialog 0; [5]  spawn life_fnc_atmMenu; } else {['Du gehörst keiner Gang an',true,'fast'] call life_fnc_notification_system; };";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_Close: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		// Texte
		class Bankl_txt_1: Life_RscStructuredText
		{
			idc = 6605;
			text = "Einzahlung / Auszahlung";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_2: Life_RscStructuredText
		{
			idc = 6606;
			text = "Kontoübersicht";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_3: Life_RscStructuredText
		{
			idc = 6607;
			text = "Überweisung";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_4: Life_RscStructuredText
		{
			idc = 6608;
			text = "Gangkonto";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_close: Life_RscStructuredText
		{
			idc = -1;
			text = "Schließen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
	};
};

class Life_atm_CASH_management {
	idd = 6650;
	//onLoad = "[1]  spawn life_fnc_atmMenu;";
	name= "Life_atm_CASH_management";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Bank_Bg: RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_bank.paa";
			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8 * GUI_GRID_H + GUI_GRID_Y;
			w = 50.5 * GUI_GRID_W;
			h = 40.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_1: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_2: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_3: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		/*
		class Bankl_Pic_4: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		*/
		class Bankl_Pic_Close: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};

	class controls {
		class Bankl_Btn_1: Life_RscButtonMenuSmartphone
		{
			idc = 6651;
			onButtonClick = "[] call life_fnc_bankDeposit";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_2: Life_RscButtonMenuSmartphone
		{
			idc = 6652;
			onButtonClick = "[] call life_fnc_bankWithdraw";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_3: Life_RscButtonMenuSmartphone
		{
			idc = 6653;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "ctrlSetText [6659, [de100_luciandjuli_mula] call life_fnc_number]";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		/*
		class Bankl_Btn_4: Life_RscButtonMenuSmartphone
		{
			idc = 6654;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};*/
		class Bankl_Btn_Close: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_new_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		// Texte
		class Bankl_txt_1: Life_RscStructuredText
		{
			idc = 6655;
			text = "Einzahlen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_2: Life_RscStructuredText
		{
			idc = 6656;
			text = "Auszahlen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		class Bankl_txt_3: Life_RscStructuredText
		{
			idc = 6657;
			text = "Alles-Bar";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		/*
		class Bankl_txt_4: Life_RscStructuredText
		{
			idc = 6658;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		*/
		class Bankl_txt_close: Life_RscStructuredText
		{
			idc = -1;
			text = "Zurück";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		class Bankl_amount_field: Life_RscEdit
		{
			idc = 6659;
			colorBackground[] = {1, 1, 1, 0.7};
			text = "1"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_txt_Betrag: Life_RscStructuredText
		{
			idc = -1;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			text = "Bitte geben Sie den einzuzahlenden bzw. auszuzahlenden Betrag ein:"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			class Attributes {
			align = "center";
			valign = "bottom";
		  };
		};
		
		class Bankl_txt_Crnt_Stats: Life_RscStructuredText
		{
			idc = 6661;
			text= "";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
		};
	};
};

class Life_atm_Transfer_management {
	idd = 6670;
	//onLoad = "[2] spawn life_fnc_atmMenu;";
	name= "Life_atm_Transfer_management";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Bank_Bg: RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_bank.paa";
			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8 * GUI_GRID_H + GUI_GRID_Y;
			w = 50.5 * GUI_GRID_W;
			h = 40.5 * GUI_GRID_H;
		};
		/*
		class Bankl_Pic_1: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_2: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_3: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		*/
		class Bankl_Pic_4: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_Close: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};

	class controls {
		/*
		class Bankl_Btn_1: Life_RscButtonMenuSmartphone
		{
			idc = 6671;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_2: Life_RscButtonMenuSmartphone
		{
			idc = 6672;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_3: Life_RscButtonMenuSmartphone
		{
			idc = 6673;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};*/
		class Bankl_Btn_4: Life_RscButtonMenuSmartphone
		{
			idc = 6674;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "[] call life_fnc_bankTransfer";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_Close: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_new_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		// Texte
		class Bankl_txt_1: Life_RscStructuredText
		{
			idc = 6675;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_2: Life_RscStructuredText
		{
			idc = 6676;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_3: Life_RscStructuredText
		{
			idc = 6677;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_4: Life_RscStructuredText
		{
			idc = 6678;
			text = "Überweisen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_close: Life_RscStructuredText
		{
			idc = -1;
			text = "Zurück";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_Betrag: Life_RscStructuredText
		{
			idc = 6679;

			text = "Betrag:"; //--- ToDo: Localize;
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_amount_field: Life_RscEdit
		{
			idc = 6680;
			colorBackground[] = {1, 1, 1, 0.7};
			text = "1"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_txt_Empf: Life_RscStructuredText
		{
			idc = 6681;

			text = "Empfänger:"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_Empfaenger_field: Life_RscCombo
		{
			idc = 6682;
			colorText[] = {0.1, 0.1, 0.1, 1};
			colorSelect[] = {0, 0, 0, 1};
			colorBackground[] = {1,1,1,0.7};
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_txt_Ver: Life_RscStructuredText
		{
			idc = 6683;

			text = "Verwendungszweck:"; //--- ToDo: Localize;
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_Ver_field: Life_RscEdit
		{
			idc = 6684;
			style = "16";
			text = "Maximal 80 Zeichen!"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 34.5 * GUI_GRID_W;
			h = 4.5 * GUI_GRID_H;
			colorBackground[] = {1,1,1,0.7};
		};
		
		class Bankl_txt_Crnt_Stats: Life_RscStructuredText
		{
			idc = 6661;
			text= "";
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
	};
};

class Life_atm_auzug_management {
	idd = 6900;
	//onLoad = "[3] spawn life_fnc_atmMenu;";
	name= "Life_atm_auzug_management";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Bank_Bg: RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_bank.paa";
			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8 * GUI_GRID_H + GUI_GRID_Y;
			w = 50.5 * GUI_GRID_W;
			h = 40.5 * GUI_GRID_H;
		};
		/*
		class Bankl_Pic_1: RscPicture
		{
			idc = -1;
			text = "Bank_Btn.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_2: RscPicture
		{
			idc = -1;
			text = "Bank_Btn.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_3: RscPicture
		{
			idc = -1;
			text = "Bank_Btn.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_4: RscPicture
		{
			idc = -1;
			text = "Bank_Btn.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		*/
		class Bankl_Pic_Close: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};

	class controls {
		/*
		class Bankl_Btn_1: Life_RscButtonMenuSmartphone
		{
			idc = 6601;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_CASH_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_2: Life_RscButtonMenuSmartphone
		{
			idc = 6602;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_3: Life_RscButtonMenuSmartphone
		{
			idc = 6603;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_Transfer_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Btn_4: Life_RscButtonMenuSmartphone
		{
			idc = 6604;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		*/
		class Bankl_Btn_Close: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_new_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		/*
		// Texte
		class Bankl_txt_1: Life_RscStructuredText
		{
			idc = 6605;
			text = "Einzahlung / Auszahlung";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_2: Life_RscStructuredText
		{
			idc = 6606;
			text = "Kontoübersicht";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_3: Life_RscStructuredText
		{
			idc = 6607;
			text = "Überweisung";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_4: Life_RscStructuredText
		{
			idc = 6608;
			text = "Gangkonto";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		*/
		class Bankl_txt_close: Life_RscStructuredText
		{
			idc = -1;
			text = "Zurück";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};

		class Bankl_auzugs_lb_title: Life_RscStructuredText
		{
			idc = -1;
			text = "Angegebener Verwendungszweck:"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};		

		class Bankl_auzugs_lb: Life_RscListbox
		{
			idc = 6901;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			colorBackground[] = {1, 1, 1, 0.7};
			colorText[] = {0.1, 0.1, 0.1, 1};
			colorSelect[] = {0.1, 0.1, 0.1, 1};
			colorSelect2[] = {0.604,0.604,0.604, 1};
			onLBSelChanged = "[(lbCurSel 6901)] spawn life_fnc_bankLbChange";
			
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 31 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};

		class Bankl_Transaktionsverlauf_title: Life_RscStructuredText
		{
			idc = -1;
			text = "Transaktionsverlauf:"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_Transaktionsverlauf: Life_RscStructuredText
		{
			idc = 6902;
			text = "";
			colorBackground[] = {1, 1, 1, 0.7};
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 31 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
		};
	};
};


class Life_atm_gang_management {
	idd = 6950;
	//onLoad = "[1]  spawn life_fnc_atmMenu;";
	name= "Life_atm_gang_management";
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "if (!life_dupe_protection) then {group player setVariable ['gang_atm_active',nil,true]};";

	class controlsBackground {
		class Bank_Bg: RscPicture
		{
			idc = -1;

			text = "images\dialog\bg_bank.paa";
			x = -5.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8 * GUI_GRID_H + GUI_GRID_Y;
			w = 50.5 * GUI_GRID_W;
			h = 40.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_1: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		/*
		class Bankl_Pic_3: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class Bankl_Pic_4: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		*/
		class Bankl_Pic_Close: RscPicture
		{
			idc = -1;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};

	class controls {
		class Bankl_Btn_1: Life_RscButtonMenuSmartphone
		{
			idc = 6951;
			onButtonClick = "[] call life_fnc_gangDeposit";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Pic_2: RscPicture
		{
			idc = 6953;
			text = "images\dialog\btn_bank.paa";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_2: Life_RscButtonMenuSmartphone
		{
			idc = 6952;
			onButtonClick = "[] call life_fnc_gangWithdraw";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		/*
		class Bankl_Btn_3: Life_RscButtonMenuSmartphone
		{
			idc = 6653;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Bankl_Btn_4: Life_RscButtonMenuSmartphone
		{
			idc = 6654;
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};*/
		class Bankl_Btn_Close: Life_RscButtonMenuSmartphone
		{
			idc = -1;
			onButtonClick = "closeDialog 0;createdialog ""Life_atm_new_management""";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.1)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		// Texte
		class Bankl_txt_1: Life_RscStructuredText
		{
			idc = 6955;
			text = "Einzahlen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.98 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
			
		class Bankl_txt_2: Life_RscStructuredText
		{
			idc = 6956;
			text = "Auszahlen";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.97 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
/*
		class Bankl_txt_3: Life_RscStructuredText
		{
			idc = 6657;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		
		class Bankl_txt_4: Life_RscStructuredText
		{
			idc = 6658;
			text = "";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.84 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		*/
		class Bankl_txt_close: Life_RscStructuredText
		{
			idc = -1;
			text = "Zurück";
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 30 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5)";
			class Attributes {
			align = "left";
			valign = "bottom";
			font = "TahomaB";
		  };
		};
		class Bankl_amount_field: Life_RscEdit
		{
			idc = 6959;
			colorBackground[] = {1, 1, 1, 0.7};
			text = "1"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Bankl_txt_Betrag: Life_RscStructuredText
		{
			idc = -1;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			text = "Bitte geben Sie den einzuzahlenden bzw. auszuzahlenden Betrag ein:"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			class Attributes {
			align = "center";
			valign = "bottom";
		  };
		};
		
		class Bankl_txt_Crnt_Stats: Life_RscStructuredText
		{
			idc = 6961;
			text= "";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
		};
	};
};
