//By Patrick "Lucian" Schmidt
class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: ARRAY (This is for limiting items to certain things)
    *            0: Variable to read from
    *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
    *            2: What to compare to (-1 = Check Disabled)
    *

    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class kart_shop {
        vehicles[] = {
            { "C_Kart_01_Blu_F", { "", "", -1 } },
            { "C_Kart_01_Fuel_F", { "", "", -1 } },
            { "C_Kart_01_Red_F", { "", "", -1 } },
            { "C_Kart_01_Vrana_F", { "", "", -1 } }
        };
    };

    class taxi_center {
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } }
        };
    };

    class civ_car {
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
            { "C_Van_02_transport_F", { "", "", -1 } },
			      { "C_Van_02_vehicle_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } }
        };
    };

	class civ_truck {
        vehicles[] = {
            { "C_Van_01_box_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "O_Truck_02_fuel_F", { "", "", -1 } },
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } },
            { "O_Truck_03_fuel_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
            { "O_Truck_03_covered_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "B_Truck_01_covered_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } }
        };
    };

    class civ_air {
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "", "", -1 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "O_Heli_Transport_04_Fuel_F", { "", "", -1 } },
            { "O_Heli_Transport_04_covered_F", { "", "", -1 } },
            { "O_Heli_Transport_04_box_F", { "", "", -1 } },
           	{ "C_Plane_Civil_01_F", { "", "", -1 } },
           	{ "C_Plane_Civil_01_racing_F", { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "", "", -1 } },
            { "B_Heli_Transport_03_unarmed_F", { "", "", -1 } }
        };
    };

    class reb_car {
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
	          { "C_Heli_Light_01_civil_F", { "", "", -1 } },
	          { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
            { "B_T_LSV_01_unarmed_F", { "", "", -1 } },
            { "O_T_LSV_02_unarmed_F", { "", "", -1 } },
            { "O_T_VTOL_02_infantry_F", { "", "", -1 } },
            { "O_T_VTOL_02_vehicle_F", { "", "", -1 } },
            { "B_T_VTOL_01_infantry_F", { "", "", -1 } },
            { "B_T_VTOL_01_vehicle_F", { "", "", -1 } }
        };
    };

	class civ_ship {
        vehicles[] = {
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } }
        };
    };

	class job_2 {
        vehicles[] = {
            { "C_Offroad_01_F", { "life_coplevel", "SCALAR", 5 } },
            { "C_SUV_01_F", { "life_coplevel", "ARRAY", {5,13,14,15} } }
        };
    };

	class DankeVeh {
        vehicles[] = {
			{ "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_box_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "O_Truck_02_fuel_F", { "", "", -1 } },
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
            { "O_Truck_03_fuel_F", { "", "", -1 } },
            { "O_Truck_03_covered_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "C_Heli_Light_01_civil_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "B_Truck_01_ammo_F", { "", "", -1 } },
            { "B_Truck_01_covered_F", { "", "", -1 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "B_T_LSV_01_unarmed_F", { "", "", -1 } },
            { "O_T_LSV_02_unarmed_F", { "", "", -1 } },
            { "O_Heli_Transport_04_fuel_black_F", { "", "", -1 } },
            { "O_Heli_Transport_04_covered_black_F", { "", "", -1 } },
            { "O_Heli_Transport_04_box_black_F", { "", "", -1 } },
            { "O_Heli_Transport_04_black_F", { "", "", -1 } },
            { "B_MRAP_01_F", { "", "", -1 } },
            { "Land_Pod_Heli_Transport_04_box_black_F", { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "", "", -1 } },
            { "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
            { "O_T_VTOL_02_infantry_F", { "", "", -1 } },
            { "O_T_VTOL_02_vehicle_F", { "", "", -1 } },
            { "B_T_VTOL_01_infantry_F", { "", "", -1 } },
            { "B_T_VTOL_01_vehicle_F", { "", "", -1 } },
            { "B_Heli_Attack_01_F", { "", "", -1 } },
			{ "B_Plane_Fighter_01_F", { "", "", -1 } },
            { "O_Plane_Fighter_02_F", { "", "", -1 } }
        };
    };

    class cop_car {
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Offroad_01_F", { "life_coplevel", "SCALAR", 1 } },
            { "C_Offroad_02_unarmed_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 3 } },
            { "I_Truck_02_covered_F", { "life_coplevel", "SCALAR", 4 } },
            { "B_T_LSV_01_unarmed_F", { "life_coplevel", "SCALAR", 5 } },
            { "O_T_LSV_02_unarmed_F", { "life_coplevel", "SCALAR", 6 } },
            { "B_GEN_Van_02_vehicle_F", { "", "", -1 } },
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 8 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 6 } }
        };
    };

    class cop_air {
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "life_coplevel", "SCALAR", 3 } },
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 4 } },
            { "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 7 } },
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 7 } },
            { "O_T_VTOL_02_infantry_F", { "life_coplevel", "SCALAR", 6 } },
            { "O_T_VTOL_02_vehicle_F", { "life_coplevel", "SCALAR", 6 } },
            { "B_T_VTOL_01_infantry_F", { "life_coplevel", "SCALAR", 7 } },
            { "B_T_VTOL_01_vehicle_F", { "life_coplevel", "SCALAR", 7 } }
        };
    };

    class cop_ship {
        vehicles[] = {
            { "C_Boat_Civil_01_police_F", { "life_coplevel", "SCALAR", 5 } },
            { "B_Boat_Transport_01_F", { "life_coplevel", "SCALAR", 5 } },
            { "B_SDV_01_F", { "life_coplevel", "SCALAR", 5 } }
        };
    };

    class thr_shop {
        vehicles[] = {
            { "C_Van_01_box_F", { "", "", -1 } },
            { "C_Van_02_medevac_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "life_thrlevel", "SCALAR", 3 } },
            { "C_SUV_01_F", { "life_thrlevel", "SCALAR", 2 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "B_MRAP_01_F", { "life_thrlevel", "SCALAR", 4 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "life_thrlevel", "SCALAR", 2 } },
            { "B_Heli_Attack_01_F", { "life_thrlevel", "SCALAR", 4 } },
            { "I_Heli_light_03_unarmed_F", { "life_thrlevel", "SCALAR", 3 } }
        };
    };

    class nobody_car {
        vehicles[] = {
            { "C_SUV_01_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } }
        };
    };

    class nobody_air {
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } }
        };
    };
};

class lifeVehicles {
	class Default  {
		vItemSpace = -1;
		licenses[] = { "driver", "", "", ""};
		price = -1;
        Fuel = 100;
        fuelVeh = false;
        gasVeh = false;
		illegal = false;
		maxTrunkUpdate = 0;
		class TextureSources {};
        showInFAQ = true;
        sirenLights[] = {};
	};

	/*
	*
	*	Cars
	*	Tiers: tier(1-x)_(CIV,GUER,WEST)
	*
	*/

	class B_Quadbike_01_F : Default {
		vItemSpace = 25;
		licenses[] = { "driver", "", "", ""};
		price = 2500;
        Fuel = 25;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				materials[] = {};
				textures[] = {"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"};
			};

			class DonatorBlue {
				displayName = "Donator Blue";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\quad_blue.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};
			};

      class DonatorCyan {
				displayName = "Donator Cyan";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\quad_cyan.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};
			};

      class DonatorOrange {
				displayName = "Donator Orange";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\quad_orange.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};
			};

      class DonatorPurple {
				displayName = "Donator Purple";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\quad_pink.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"};
			};

			class Blufor {
				displayName = "Olive";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_co.paa"};
			};

			class Opfor {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_OPFOR_CO.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_OPFOR_CO.paa"};
			};

			class Indep {
				displayName = "Grün Digital";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_INDP_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_INDP_CO.paa"};
			};

			class Guerrilla_01 {
				displayName = "FIA 1";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"};
			};

			class Guerrilla_02 {
				displayName = "FIA 2";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Quadbike_01\Data\Quadbike_01_ghex_CO.paa","\A3\Soft_F_Exp\Quadbike_01\Data\Quadbike_01_wheel_ghex_CO.paa"};
			};

            class Cop {
                displayName = "Polizei";
                factions[] = {"cop"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\cop\quad.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"};
            };
		};
	};
	class C_Quadbike_01_F : B_Quadbike_01_F {showInFAQ = false;};
	class I_Quadbike_01_F : B_Quadbike_01_F {showInFAQ = false;};
	class I_G_Quadbike_01_F : B_Quadbike_01_F {showInFAQ = false;};
	class O_Quadbike_01_F : B_Quadbike_01_F {showInFAQ = false;};

	class C_Offroad_01_F : Default {
		vItemSpace = 65;
		maxTrunkUpdate = 1;
		licenses[] = { "driver", "", "", ""};
        sirenLights[] = {
            {1,1,{0.345, 0, 0.525}},
            {1,1,{-0.645, -2.95, -0.77}},
            {1,0,{-0.695, 2.2825, -0.355}},
            {0,0,{0.61, 2.2825, -0.355}},
            {0,1,{0.575, -2.95, -0.77}},
            {0,1,{-0.44, 0, 0.525}}
        };
		price = 45500;
        Fuel = 95;
		class TextureSources {
			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"};
			};

			class Beige {
				displayName = "Beige";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"};
			};

			class Blue {
				displayName = "Blau";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"};
			};

			class Darkred {
				displayName = "Dunkelrot";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"};
			};

			class Bluecustom {
				displayName = "Custom-Blau";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"};
			};

			class Guerilla_01 {
				displayName = "Guerilla 01";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};
			};

			class Guerilla_02 {
				displayName = "Guerilla 02";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};
			};

			class Guerilla_03 {
				displayName = "Guerilla 03";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};
			};

			class Guerilla_04 {
				displayName = "Guerilla 04";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",1},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};
			};

			class Guerilla_05 {
				displayName = "Guerilla 05";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",0},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};
			};

			class Guerilla_06 {
				displayName = "Guerilla 06";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",0},{"HideDoor3",1},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};
			};

			class Guerilla_07 {
				displayName = "Guerilla 07";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",0},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};
			};

			class Guerilla_08 {
				displayName = "Guerilla 08";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",0},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",1},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};
			};

			class Guerilla_09 {
				displayName = "Guerilla 09";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",0},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};
			};

			class Guerilla_10 {
				displayName = "Guerilla 10";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",0},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",0},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};
			};

			class Guerilla_11 {
				displayName = "Guerilla 11";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",0},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",0},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};
			};

			class Guerilla_12 {
				displayName = "Guerilla 12";
				factions[] = {"reb"};
				animations[] = {{"HideBumper1",0},{"HideBumper2",1},{"HideDoor3",1},{"HideDoor2",1},{"HideDoor1",1},{"HideGlass2",1}};
				textures[] = {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};
			};

			class Gendarmerie {
				displayName = "Gendarmerie";
				factions[] = {"cop"};
				animations[] = {{"HidePolice",0},{"HideBumper1",1},{"HideBumper2",0},{"HideGlass2",1},{"HideDoor3",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa","\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa"};
			};

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {{"HidePolice",0},{"HideBumper1",1},{"HideBumper2",0},{"HideGlass2",1},{"HideDoor3",0}};
				textures[] = {"images\vehicles\ground\cop\cop_offroad.paa","images\vehicles\ground\cop\cop_offroad.paa"};
			};

			class Cyan {
				displayName = "Cyan";
				factions[] = {"civ"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
				textures[] = {"images\vehicles\ground\civ\civ_OffroadCyan.paa","images\vehicles\ground\civ\civ_OffroadCyan.paa"};
			};

            class Twitch {
                displayName = "Twitch";
                factions[] = {"civ"};
                animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideDoor3",0},{"HideDoor2",0},{"HideDoor1",0}};
                textures[] = {"images\vehicles\ground\civ\civ_OffroadTwitch.paa","images\vehicles\ground\civ\civ_OffroadTwitch.paa"};
            };

			class Taxi {
				displayName = "Taxi";
				factions[] = {"taxi"};
				animations[] = {{"HideBumper1",1},{"HideBumper2",1},{"HideGlass2",0}};
				textures[] = {"images\vehicles\ground\civ\taxi_offroad.paa","images\vehicles\ground\civ\taxi_offroad.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {{"HidePolice",0},{"HideBumper1",1},{"HideBumper2",1},{"HideGlass2",1}};
				textures[] = {"images\vehicles\ground\thr\offroader_01.paa","images\vehicles\ground\thr\offroader_01.paa"};
			};
		};
	};
	class C_Offroad_01_PA_F : C_Offroad_01_F {showInFAQ = false;};
	class C_Offroad_01_RP_F : C_Offroad_01_F {showInFAQ = false;};
	class I_G_offroad : C_Offroad_01_F {showInFAQ = false;};
	class c_offroad_01_armed : C_Offroad_01_F {showInFAQ = false;};
	class B_G_Offroad_01_F : C_Offroad_01_F {showInFAQ = false;};

	class C_Offroad_02_unarmed_F : Default {
		vItemSpace = 70;
        sirenLights[] = {
            {1,1,{-0.75,-1.64,-0.35}},
            {1,0,{-0.75,-1.64,-0.35}},
            {1,1,{0.94,0.61,-0.05}},
            {1,0,{-0.545,2.07,-0.6}},
            {0,0,{0.47,2.07,-0.6}},
            {0,1,{0.65,-1.64,-0.35}},
            {0,0,{0.65,-1.64,-0.35}},
            {0,1,{-1.02,0.61,-0.05}}
        };
		licenses[] = { "driver", "", "", ""};
		price = 55300;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"};
			};

			class BlackOpen {
				displayName = "Schwarz Offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"};
			};

			class Blue {
				displayName = "Blau";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"};
			};

			class BlueOpen {
				displayName = "Blau Offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"};
			};

			class Green {
				displayName = "Grün";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"};
			};

			class GreenOpen {
				displayName = "Grün Offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"};
			};

			class Orange {
				displayName = "Orange";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"};
			};

			class OrangeOpen {
				displayName = "Orange Offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"};
			};

			class RedOpen {
				displayName = "Rot Offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"};
			};

			class WhiteOpen {
				displayName = "Weiß offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"};
			};

			class Brown {
				displayName = "Braun";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"};
			};

			class BrownOpen {
				displayName = "Braun offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"};
			};

			class Olive {
				displayName = "Oliv";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
			};

			class OliveOpen {
				displayName = "Oliv offen";
				factions[] = {"civ"};
				animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
				textures[] = {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
			};

            class THR {
                displayName = "THR";
                factions[] = {"thr"};
                animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
                textures[] = {"images\vehicles\ground\thr\offroader_02.paa","images\vehicles\ground\thr\offroader_02.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
            };

            class THROpen {
                displayName = "THR offen";
                factions[] = {"thr"};
                animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
                textures[] = {"images\vehicles\ground\thr\offroader_02.paa","images\vehicles\ground\thr\offroader_02.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
            };

            class SchutzPolizei {
                displayName = "Polizei";
                factions[] = {"cop"};
                animations[] = {{"hideBullbar",0},{"hideRollcage",0},{"hideFenders",0}};
                textures[] = {"images\vehicles\ground\cop\cop_offroad02.paa","images\vehicles\ground\cop\cop_offroad02.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
            };

            class SchutzPolizeiOpen {
                displayName = "Polizei offen";
                factions[] = {"cop"};
                animations[] = {{"hideBullbar",1},{"hideRollcage",1},{"hideFenders",1}};
                textures[] = {"images\vehicles\ground\cop\cop_offroad02.paa","images\vehicles\ground\cop\cop_offroad02.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
            };
		};
	};

	class C_Hatchback_01_F : Default {
		vItemSpace = 40;
        sirenLights[] = {
            {1,1,{-0.03, -0, 0.2}},
            {1,1,{0.78, -2.25, -0.3}},
            {1,0,{-0.8, 1.615, -0.525}},
            {0,0,{0.75, 1.615, -0.52}},
            {0,1,{-0.03, -0, 0.2}},
            {0,1,{-0.8, -2.25, -0.3}}
        };
		licenses[] = { "driver", "", "", ""};
		price = 25000;
        Fuel = 65;
		class TextureSources {
            class Lore {
                displayName = "Dragon Lore";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HatchbackDLore.paa"};
            };

            class Crown_blue {
                displayName = "Crown Blue";
                factions[] = {"tier2_CIV"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_CrownHTB_b.paa"};
            };

            class Crown_purple {
                displayName = "Crown Purple";
                factions[] = {"tier2_CIV"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_CrownHTB_p.paa"};
            };

            class Fake_Cop {
                displayName = "Fake Cop";
                factions[] = {"tier2_CIV"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_FakeCoplimo.paa"};
            };

            class Sticker {
                displayName = "Sticker";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HatchbackSticker.paa"};
            };

            class Soa {
                displayName = "SWORD ART";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HatchbackSAO.paa"};
            };

			class Beige {
				displayName = "Beige";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"};
			};

			class Green {
				displayName = "Grün";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"};
			};

			class Blue {
				displayName = "Blau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"};
			};

			class Bluecustom {
				displayName = "Custom-Blau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"};
			};

			class Beigecustom {
				displayName = "Custom-Beige";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"};
			};

			class Yellow {
				displayName = "Gelb";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"};
			};

			class Grey {
				displayName = "Grau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"};
			};

			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"};
			};

			class Dark {
				displayName = "Dunkel";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"};
			};

			class Wave {
				displayName = "Welle";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_HatchbackWave.paa"};
			};

			class Xmas {
				displayName = "Weihnachten";
				factions[] = {""};
				textures[] = {"images\vehicles\ground\civ\civ_HatchbackXmas.paa"};
			};
		};
	};

	class C_Hatchback_01_sport_F : C_Hatchback_01_F {
		vItemSpace = 45;
		licenses[] = { "driver", "", "", ""};
		price = 110000;
        Fuel = 85;
		class TextureSources : TextureSources {
			class SportRed {
				displayName = "Sport Rot";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};
			};

			class SportBlue {
				displayName = "Sport Blau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa"};
			};

      class Crown_blue {
          displayName = "Crown Blue";
          factions[] = {"tier2_CIV"};
          animations[] = {};
          textures[] = {"images\vehicles\ground\civ\civ_CrownHTB_b.paa"};
      };

      class Crown_purple {
          displayName = "Crown Purple";
          factions[] = {"tier2_CIV"};
          animations[] = {};
          textures[] = {"images\vehicles\ground\civ\civ_CrownHTB_p.paa"};
      };

      class Fake_Cop {
          displayName = "Fake Cop";
          factions[] = {"tier2_CIV"};
          animations[] = {};
          textures[] = {"images\vehicles\ground\civ\civ_FakeCoplimo.paa"};
      };

			class SportOrange {
				displayName = "Sport Orange";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa"};
			};

			class SportWhite {
				displayName = "Sport Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa"};
			};

			class SportBeige {
				displayName = "Sport Beige";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa"};
			};

			class SportGreen {
				displayName = "Sport Grün";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa"};
			};

			class Interstellar {
				displayName = "Interstellar";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_HatchbackInterstellar.paa"};
			};

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_hatchback.paa"};
			};

			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_hatchback_sek.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
                textures[] = {"images\vehicles\ground\thr\hatchback.paa"};
			};

            class Xmas {
                displayName = "Weihnachten";
                factions[] = {""};
                textures[] = {"images\vehicles\ground\civ\civ_HatchbackXmas.paa"};
            };
		};
	};

    class C_Van_02_transport_F : Default {
        vItemSpace = 80;
        licenses[] = { "driver", "", "", ""};
        price = 50000;
        Fuel = 150;
        class TextureSources {
            class IDAP {
                displayName = "IDAP";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_IdapTrans_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_transport_dirty_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_dirty_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_IdapTrans_CO.paa"};
            };

            class Syndikat {
                displayName = "Braun";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"};
            };

            class FIA1 {
                displayName = "Guerilla 01";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"};
            };

            class FIA2 {
                displayName = "Guerilla 02";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"};
            };

            class FIA2U {
                displayName = "Guerilla 02 (unfertig)";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa"};
            };

            class FIA3 {
                displayName = "Guerilla 03";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_03_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_03_CO.paa"};
            };

            class Masked {
                displayName = "Maskiert";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"};
            };

            class Vrana {
                displayName = "Schwarz Rot";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa"};
            };

            class BluePearl {
                displayName = "Blau Weiß";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa"};
            };

            class BattleBus {
                displayName = "Kampfbus";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"};
            };

            class Green {
                displayName = "Grün";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"};
            };

            class Black {
                displayName = "Schwarz";
                factions[] = {"civ","cop"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa"};
            };

            class Red {
                displayName = "Rot";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"};
            };

            class Blue {
                displayName = "Blau";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Blue_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Blue_CO.paa"};
            };

            class Orange {
                displayName = "Orange";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Orange_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Orange_CO.paa"};
            };

            class White {
                displayName = "Weiß";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa"};
            };

            class AAN {
                displayName = "AAN World News";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"};
            };
        };
    };

    class C_Van_02_service_F : Default {
        vItemSpace = 130;
        licenses[] = { "driver", "", "", ""};
        price = 50000;
        Fuel = 150;
        class TextureSources {
            class IDAP {
                displayName = "IDAP";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_IdapCargo_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_dirty_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_utility_service_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_IdapCargo_CO.paa"};
            };

            class Redstone {
                displayName = "Redstone";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_Redstone_CO.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa"};
            };

            class CivService {
                displayName = "Insel-Hafenbehörde";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_dirty_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_CivService_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa"};
            };

            class Syndikat {
                displayName = "Braun";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"};
            };

            class FIA1 {
                displayName = "Guerilla 01";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"};
            };

            class FIA2 {
                displayName = "Guerilla 02";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"};
            };

            class FIA2U {
                displayName = "Guerilla 02 (unfertig)";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa"};
            };

            class FIA3 {
                displayName = "Guerilla 03";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_03_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_03_CO.paa"};
            };

            class Masked {
                displayName = "Maskiert";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"};
            };

            class Daltgreen {
                displayName = "Daltgreen";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"};
            };

            class Vrana {
                displayName = "Vrana";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa"};
            };

            class BluePearl {
                displayName = "Blue Pearl";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa"};
            };

            class Fuel {
                displayName = "Fuel";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa"};
            };

            class BattleBus {
                displayName = "Kampfbus";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"};
            };

            class Green {
                displayName = "Grün";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"};
            };

            class Black {
                displayName = "Schwarz";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Black_CO.paa"};
            };

            class Red {
                displayName = "Rot";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"};
            };

            class Blue {
                displayName = "Blau";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Blue_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Blue_CO.paa"};
            };

            class Orange {
                displayName = "Orange";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_Orange_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Orange_CO.paa"};
            };

            class White {
                displayName = "Weiß";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_White_CO.paa"};
            };

            class Swifd {
                displayName = "Swifd";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa"};
            };

            class AAN {
                displayName = "AAN";
                factions[] = {"civ"};
                animations[] = {{"beacon_front_hide",1},{"beacon_rear_hide",1},{"LED_lights_hide",1},{"reflective_tape_hide",1}};
                textures[] = {"\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"};
            };

			class Cop {
                displayName = "Polizei";
                factions[] = {"cop"};
                animations[] = {{"lights_em_hide",0},{"ladder_hide",1},{"spare_tyre_holder_hide",0},{"spare_tyre_hide",0},{"reflective_tape_hide",0},{"roof_rack_hide",1},{"LED_lights_hide",0},{"sidesteps_hide",0},{"rearsteps_hide",0},{"side_protective_frame_hide",1},{"front_protective_frame_hide",0},{"beacon_front_hide",0},{"beacon_rear_hide",0}};
                textures[] = {"images\vehicles\ground\cop\cop_van_polizei.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\soft_f_orange\van_02\data\van_glass_gen_CA.paa","images\vehicles\ground\cop\cop_van_polizei.paa"};
            };

			class Justiz {
                displayName = "Justiz";
                factions[] = {"cop"};
                animations[] = {{"lights_em_hide",0},{"ladder_hide",1},{"spare_tyre_holder_hide",0},{"spare_tyre_hide",0},{"reflective_tape_hide",0},{"roof_rack_hide",1},{"LED_lights_hide",0},{"sidesteps_hide",0},{"rearsteps_hide",0},{"side_protective_frame_hide",1},{"front_protective_frame_hide",0},{"beacon_front_hide",0},{"beacon_rear_hide",0}};
                textures[] = {"images\vehicles\ground\cop\cop_van_justiz.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\soft_f_orange\van_02\data\van_glass_gen_CA.paa","images\vehicles\ground\cop\cop_van_polizei.paa"};
            };

			class CopEK {
                displayName = "Einsatz Kommando";
                factions[] = {"cop"};

                animations[] = {{"lights_em_hide",0},{"ladder_hide",0},{"spare_tyre_holder_hide",0},{"spare_tyre_hide",0},{"reflective_tape_hide",0},{"roof_rack_hide",0},{"LED_lights_hide",0},{"sidesteps_hide",1},{"rearsteps_hide",1},{"side_protective_frame_hide",0},{"front_protective_frame_hide",0},{"beacon_front_hide",0},{"beacon_rear_hide",0}};
                textures[] = {"images\vehicles\ground\cop\cop_van_ek.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\soft_f_orange\van_02\data\van_glass_gen_CA.paa","images\vehicles\ground\cop\cop_van_polizei.paa"};
            };
        };
    };

	class C_Van_02_vehicle_F:C_Van_02_service_F {
		class TextureSources : TextureSources{};
	};

	class B_GEN_Van_02_vehicle_F : C_Van_02_service_F {
		class TextureSources : TextureSources{};
	};

    class C_Van_02_medevac_F : Default {
        vItemSpace = 60;
        licenses[] = { "driver", "", "", ""};
        price = 50000;
        Fuel = 400;
        class TextureSources {
		 	class ThrAmbulance {
                displayName = "THR";
                factions[] = {"thr"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\thr\van_01.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_transport_dirty_CO.paa","a3\soft_f_orange\van_02\data\van_glass_medevac_dirty_ca.paa","a3\soft_f_orange\van_02\data\van_ambulance_monitors_co.paa","A3\Soft_F_Orange\Van_02\Data\van_body_IdapAmbulance_CO.paa"};
            };

            class IdapAmbulance {
                displayName = "Weiß";
                factions[] = {"thr"};
                animations[] = {};
                textures[] = {"A3\Soft_F_Orange\Van_02\Data\van_body_IdapAmbulance_CO.paa","a3\Soft_F_Orange\Van_02\Data\van_wheel_Red_CO.paa","a3\soft_f_orange\van_02\data\van_glass_medevac_dirty_ca.paa","a3\soft_f_orange\van_02\data\van_ambulance_monitors_co.paa","A3\Soft_F_Orange\Van_02\Data\van_body_IdapAmbulance_CO.paa"};
            };

            class CivAmbulance {
                displayName = "Gelb";
                factions[] = {"thr"};
                animations[] = {};
                textures[] = {"A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa","a3\Soft_F_Orange\Van_02\Data\van_wheel_Red_CO.paa","a3\soft_f_orange\van_02\data\van_glass_CivAmbulance_CA.paa","a3\soft_f_orange\van_02\data\van_ambulance_monitors_co.paa","A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa"};
            };
        };
    };

	class C_SUV_01_F : Default {
		vItemSpace = 50;
        sirenLights[] = {
            {1,1,{0.38, 2.28, -0.52}},
            {1,1,{0.86, -2.75, -0.18}},
            {1,0,{-0.8, 1.95, -0.48}},
            {0,0,{0.8, 1.95, -0.48}},
            {0,1,{-0.39, 2.28, -0.52}},
            {0,1,{-0.86, -2.75, -0.18}}
        };
		licenses[] = { "driver", "", "", ""};
		price = 35000;
        Fuel = 80;
		class TextureSources {
            class Red {
                displayName = "Rot";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};
            };

			class Nyan {
				displayName = "Nyan Cat is Love";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_suvNyan.paa"};
			};

			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"};
			};

      class JeanRoyce {
        displayName = "JeanRoyce";
        factions[] = {"tier2_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_SuvJR.paa"};
      };

      class Ice {
        displayName = "Ice";
        factions[] = {"tier2_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_SuvIce.paa"};
      };

      class Gold {
        displayName = "Gold";
        factions[] = {"tier2_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_SuvGold.paa"};
      };

			class Grey {
				displayName = "Grau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa"};
			};

			class Orange {
				displayName = "Orange";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa"};
			};

			class NeoGreen {
				displayName = "Neon Grün";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvNeoGruen.paa"};
			};

			class Yellow {
				displayName = "Gelb";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvYellow.paa"};
			};

			class Oxygen {
				displayName = "Crown (Blau)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvCrownBlue.paa"};
			};

			class Tiger {
				displayName = "Tiger";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvTiger.paa"};
			};

			class Bevel {
				displayName = "Bevel";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvBevel.paa"};
			};

			class Particle {
				displayName = "Particle";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvParticle.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvWhite.paa"};
			};

            class DETarb {
                displayName = "Braun Digital";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvDe.paa"};
            };

            class LoveDE {
                displayName = "I <3 DE100";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvLoveDE.paa"};
            };

            class BlueBlack {
                displayName = "Blau-Fleck";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvBlueBlack.paa"};
            };

            class CrownRed {
                displayName = "Crown (Rot)";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvCrownRed.paa"};
            };

			class Taxi {
				displayName = "Taxi";
				factions[] = {"taxi"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\taxi_suv.paa"};
			};

			class Xmas_01 {
				displayName = "Weihnachten by Sev";
				factions[] = {""};
				textures[] = {"images\vehicles\ground\civ\civ_SuvXmas01.paa"};
			};

			class Xmas_02 {
				displayName = "Weihnachten by Tom";
				factions[] = {""};
				textures[] = {"images\vehicles\ground\civ\civ_SuvXmas02.paa"};
			};


			class Xmas_03 {
				displayName = "Weihnachten by Randy";
				factions[] = {""};
				textures[] = {"images\vehicles\ground\civ\civ_SuvXmas03.paa"};
			};

			class OnePiece {
				displayName = "OnePiece";
				factions[] = {""};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvOnePiece.paa"};
			};

			class Revolution {
				displayName = "Revolution";
				factions[] = {""};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_SuvRevolution.paa"};
			};

            class Bullet {
                displayName = "Geschoss";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvBullet.paa"};
            };

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_suv.paa"};
			};

			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_suv_sek.paa"};
			};

			class Admin {
				displayName = "Admin";
				factions[] = {"admin"};
				textures[] = {"images\vehicles\ground\cop\admin_suv.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\thr\suv.paa"};
			};

            class Nobody {
                displayName = "Nobody";
                factions[] = {"nobody"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_SuvNobody.paa"};
            };
		};
	};

	class C_Kart_01_Blu_F : Default {
		licenses[] = { "driver", "", "", ""};
		price = 25000;
        Fuel = 15;
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {};
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {};
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {};
	/*
	*
	*	MRAPS
	*
	*/

	class B_MRAP_01_F : Default {
		vItemSpace = 70;
        sirenLights[] = {
            {1,1,{0.85, -0.9, 0.6}},
            {1,1,{-0.93, -2.8, 0.6}},
            {1,0,{-0.85, 1.475, -0.75}},
            {0,0,{0.85, 1.475, -0.75}},
            {0,1,{-0.85, -0.9, 0.6}},
            {0,1,{0.93, -2.8, 0.6}}
        };
		licenses[] = { "driver", "", "", ""};
		price = 8000000;
        Fuel = 200;
		class TextureSources {
			class Default {
				displayName = "A3-Standart";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_F\MRAP_01\Data\mrap_01_base_co.paa","\a3\soft_F\MRAP_01\Data\mrap_01_adds_co.paa"};
			};

            class SchutzPolizei {
                displayName = "Polizei";
                factions[] = {"cop"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\cop\cop_hunter_front.paa","images\vehicles\ground\cop\cop_hunter_back.paa"};
            };

			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_hunter_sek_front.paa","images\vehicles\ground\cop\cop_hunter_sek_back.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\thr\hunter_front.paa","images\vehicles\ground\thr\hunter_back.paa"};
			};

			class HelloKitty {
				displayName = "HelloKitty";
				factions[] = {"tyShop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_HunterKitty_front.paa","images\vehicles\ground\civ\civ_HunterKitty_back.paa"};
			};

            class Crown {
                displayName = "Crown (Rot)";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HunterCrown_front.paa","images\vehicles\ground\civ\civ_HunterCrown_back.paa"};
            };

			     class CrownB {
                displayName = "Crown (Blau)";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HunterCrownB_front.paa","images\vehicles\ground\civ\civ_HunterCrownB_back.paa"};
            };

            class Neon {
                displayName = "Neon";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_HunterNeon_front.paa","images\vehicles\ground\civ\civ_HunterNeon_back.paa"};
            };
		};
	};

	class O_MRAP_02_F : Default {
		vItemSpace = 65;
		licenses[] = { "driver", "", "", ""};
		price = 5500000;
        Fuel = 200;
		class TextureSources {
			class Hex {
				displayName = "Hex";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\A3\soft_F\MRAP_02\data\MRAP_02_ext_01_CO.paa","\A3\soft_F\MRAP_02\data\MRAP_02_ext_02_CO.paa","\A3\Data_F\Vehicles\turret_opfor_co.paa"};
			};

			class GreenHex {
				displayName = "Green Hex";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_01_ghex_CO.paa","\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_02_ghex_CO.paa","\A3\Data_F_Exp\Vehicles\Turret_ghex_CO.paa"};
			};

			class Dark {
				displayName = "Dunkel";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritForest_front.paa","images\vehicles\ground\civ\civ_IfritForest_back.paa"};
			};

			class Black {
				displayName = "Schwarz";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritSchwarzFront.paa","images\vehicles\ground\civ\civ_IfritSchwarzBack.paa"};
			};

			class DE100 {
				displayName = "DE100";
				factions[] = {"tyShop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritDE100_front.paa","images\vehicles\ground\civ\civ_IfritDE100_back.paa"};
			};

			class Toxic {
				displayName = "Toxic";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritGreen_front.paa","images\vehicles\ground\civ\civ_IfritGreen_back.paa"};
			};

			class Ocean {
				displayName = "Ocean";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritOcean_front.paa","images\vehicles\ground\civ\civ_IfritOcean_back.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_IfritRed_front.paa","images\vehicles\ground\civ\civ_IfritRed_back.paa"};
			};

            class Nobody {
                displayName = "Nobody";
                factions[] = {"nobody"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\nobody_Ifrit_front.paa","images\vehicles\ground\civ\civ_IfritSchwarzBack.paa"};
            };
		};
	};

	class I_MRAP_03_F : Default {
		vItemSpace = 70;
		licenses[] = { "driver", "", "", ""};
		price = 2000000;
        showInFAQ = false;
        Fuel = 200;
		class TextureSources {
			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_strider.paa"};
			};
		};
	};

	class B_T_LSV_01_unarmed_F : Default {
		vItemSpace = 45;
		licenses[] = { "driver", "", "", ""};
		price = 3570000;
        Fuel = 150;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ","cop"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"};
			};

      class HaZe {
				displayName = "HaZe";
				factions[] = {"tier4_Civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_ProwlerHaze.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"};
			};

			class Olive {
				displayName = "Olive";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};
			};

			class Sand {
				displayName = "Sand";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};
			};

			class Dazzle {
				displayName = "Chaos";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};
			};

			class Cop_b {
				displayName = "Polizei Schwarz";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_prowler_front.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"};
			};

			class Cop_g {
				displayName = "Polizei Grün";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_prowler_front.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};
			};
		};
	};

	class O_T_LSV_02_unarmed_F : Default {
		vItemSpace = 45;
		licenses[] = { "driver", "", "", ""};
		price = 3570000;
        Fuel = 150;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ","cop"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"};
			};

			class Arid {
				displayName = "Sand";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"};
			};

			class Cop {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_quilin.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"};
			};
		};
	};

	/*
	*
	*	TRUCKS
	*
	*/
	class C_Van_01_transport_F : Default {
		vItemSpace = 100;
		maxTrunkUpdate = 1;
		licenses[] = { "driver", "", "", ""};
		price = 75000;
        Fuel = 150;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_01 {
				displayName = "Guerilla 01";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_02 {
				displayName = "Guerilla 02";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_03 {
				displayName = "Guerilla 03";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_04 {
				displayName = "Guerilla 04";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_05 {
				displayName = "Guerilla 05";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_06 {
				displayName = "Guerilla 06";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_07 {
				displayName = "Guerilla 07";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Guerilla_08 {
				displayName = "Guerilla 08";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa","\a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"};
			};

			class Brown {
				displayName = "Braun";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_brn_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_2_CO.paa"};
			};

			class Olive {
				displayName = "Oliv";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_oli_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"};
			};
		};
	};
	class I_G_Van_01_transport_F : C_Van_01_transport_F {showInFAQ = false;};

	class C_Van_01_box_F : C_Van_01_transport_F {
		vItemSpace = 150;
		licenses[] = { "driver", "", "", ""};
        sirenLights[] = {
            {1,1,{0.65, -3.5, 1.3}},
            {1,1,{-0.8, -0.15, 1.4}},
            {1,0,{0.2, 2.05, -0.5}},
            {0,0,{-0.2, 2.05, -0.5}},
            {0,1,{0.8, -0.15, 1.4}},
            {0,1,{-0.65, -3.5, 1.3}}
        };
		maxTrunkUpdate = 0;
		price = 175000;
        Fuel = 85;
		class TextureSources : TextureSources {
			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
                textures[] = {"images\vehicles\ground\thr\van_front.paa","images\vehicles\ground\thr\van_back.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"};
			};

            class FFarm {
                displayName = "Fürstenhofer";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"images\vehicles\ground\civ\civ_TruckBoxerHof_front.paa","images\vehicles\ground\civ\civ_TruckBoxerHof_back.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"};
            };
		};
	};

	class C_Van_01_fuel_F : Default {
		vItemSpace = 200;
        fuelVeh = true;
		licenses[] = { "driver", "", "", ""};
		price = 215000;
        Fuel = 90;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};
			};

			class White {
				displayName = "Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};
			};

			class Black_v2 {
				displayName = "Schwarz (Roter Zisternenrahmen)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"};
			};

			class White_v2 {
				displayName = "Weiß (Roter Zisternenrahmen)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"};
			};

			class Red_v2 {
				displayName = "Rot (Roter Zisternenrahmen)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_red_CO.paa"};
			};

			class Guerilla_01 {
				displayName = "Guerrilla 01";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa"};
			};

			class Guerilla_02 {
				displayName = "Guerrilla 02";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_02_CO.paa"};
			};

			class Guerilla_03 {
				displayName = "Guerrilla 03";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"};
			};
		};
	};
	class I_G_Van_01_fuel_F : C_Van_01_fuel_F {showInFAQ = false;};

	class I_Truck_02_covered_F : Default {
		vItemSpace = 250;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 325000;
        Fuel = 550;
		class TextureSources {
			class Indep {
				displayName = "Grün Digital";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_indp_co.paa"};
			};

			class Opfor {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_OPFOR_co.paa"};
			};

			class Orange {
				displayName = "Orange";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
			};

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\cop\cop_zamak_teil2.paa","images\vehicles\ground\cop\cop_zamak_teil1.paa"};
			};

			class Xmas01 {
				displayName = "Altis Coke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_ZamakXmas_front.paa","images\vehicles\ground\civ\civ_ZamakXmas_back.paa"};
			};
		};
	};

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
		vItemSpace = 225;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 275000;
	};

	class B_Truck_01_mover_F : Default {
		licenses[] = { "truck", "", "", ""};
		price = 25000;
        showInFAQ = false;
        Fuel = 600;
		class TextureSources {
			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\adac\adac_truck.paa"};
			};
		};
	};

	class B_Truck_01_covered_F : Default {
		vItemSpace = 450;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 1010000;
        Fuel = 1000;
		class TextureSources {
			class Default {
				displayName = "A3-Standart";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"};
			};

      class Schwarz {
				displayName = "Schwarz";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_hemt_black3.paa","images\vehicles\ground\civ\civ_hemt_black1.paa"};
			};

      class Nester {
				displayName = "Nester";
				factions[] = {"tier4_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_nester_hmm_1_2.paa","images\vehicles\ground\civ\civ_nester_hmm_2_1.paa"};
			};

      class Castor {
				displayName = "Castor";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Uran_3.paa","images\vehicles\ground\civ\civ_Uran_2.paa"};
			};

      class Haze {
				displayName = "Haze";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Hemt_Haze_1.paa","images\vehicles\ground\civ\civ_Hemt_Haze_2.paa"};
			};

      class RedEx {
				displayName = "RedEx";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_fedex_hmm_4_1.paa","images\vehicles\ground\civ\civ_fedex_hmm_3_2.paa"};
			};
		};
	};

	class B_Truck_01_transport_F : B_Truck_01_covered_F {
		vItemSpace = 325;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 900000;
        Fuel = 1500;
	};

	class B_Truck_01_box_F : Default {
		vItemSpace = 450;
		licenses[] = { "truck", "", "", ""};
		price = 805000;
        Fuel = 1500;
		class TextureSources {
			class Default {
				displayName = "A3-Standart";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"};
			};

      class Schwarz {
				displayName = "Schwarz";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_hemt_black3.paa","images\vehicles\ground\civ\civ_hemt_black1.paa"};
			};

      class Nester {
				displayName = "Nester";
				factions[] = {"tier4_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_nester_hmm_1_2.paa","images\vehicles\ground\civ\civ_nester_hmm_2_1.paa"};
			};

      class Castor {
				displayName = "Castor";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Uran_3.paa","images\vehicles\ground\civ\civ_Uran_2.paa"};
			};

      class Haze {
				displayName = "Haze";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Hemt_Haze_1.paa","images\vehicles\ground\civ\civ_Hemt_Haze_2.paa"};
			};

      class RedEx {
				displayName = "RedEx";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_fedex_hmm_4_1.paa","images\vehicles\ground\civ\civ_fedex_hmm_3_2.paa"};
			};
		};
	};

	class B_Truck_01_ammo_F : Default {
		vItemSpace = 500;
		licenses[] = { "truck", "", "", ""};
		price = 942857;
        Fuel = 1500;
		class TextureSources {
			class Default {
				displayName = "A3-Standart";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"};
			};
      class Schwarz {
				displayName = "Schwarz";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_hemt_black3.paa","images\vehicles\ground\civ\civ_hemt_black1.paa","images\vehicles\ground\civ\civ_hemt_black2.paa"};
			};

      class Nester {
				displayName = "Nester";
				factions[] = {"tier4_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_nester_hmm_1_2.paa","images\vehicles\ground\civ\civ_nester_hmm_2_1.paa","images\vehicles\ground\civ\civ_nester_hmm_ammo_1.paa"};
			};

      class Haze {
				displayName = "Haze";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Hemt_Haze_1.paa","images\vehicles\ground\civ\civ_Hemt_Haze_2.paa","images\vehicles\ground\civ\civ_Hemt_Haze_3.paa"};
			};

      class RedEx {
				displayName = "RedEx";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_fedex_hmm_4_1.paa","images\vehicles\ground\civ\civ_fedex_hmm_3_2.paa","images\vehicles\ground\civ\civ_fedex_hmm_ammo_3.paa"};
			};
		};
	};

	class B_Truck_01_fuel_F : Default {
		vItemSpace = 550;
        fuelVeh = true;
		licenses[] = { "truck", "", "", ""};
		price = 400000;
        Fuel = 800;
		class TextureSources {
			class Default {
				displayName = "A3-Standart";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_Fuel_CO.paa"};
			};

      class Schwarz {
				displayName = "Schwarz";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_hemt_black3.paa","images\vehicles\ground\civ\civ_hemt_black1.paa","images\vehicles\ground\civ\civ_hemt_black2.paa"};
			};

      class Nester {
				displayName = "Nester";
				factions[] = {"tier4_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_nester_hmm_1_2.paa","images\vehicles\ground\civ\civ_nester_hmm_2_1.paa","images\vehicles\ground\civ\civ_nester_hmm_tank_2.paa"};
			};

      class Haze {
				displayName = "Haze";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Hemt_Haze_1.paa","images\vehicles\ground\civ\civ_Hemt_Haze_2.paa","images\vehicles\ground\civ\civ_Hemt_Haze_3.paa"};
			};

      class RedEx {
				displayName = "RedEx";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_fedex_hmm_4_1.paa","images\vehicles\ground\civ\civ_fedex_hmm_3_2.paa","images\vehicles\ground\civ\civ_fedex_hmm_tank_2.paa"};
			};
		};
	};

	class O_Truck_02_fuel_F : Default {
		vItemSpace = 400;
        fuelVeh = true;
		licenses[] = { "truck", "", "", ""};
		price = 275000;
        Fuel = 450;
		class TextureSources {
			class Indep {
			 displayName = "Grün Digital";
			 factions[] = {"civ"};
				animations[] = {};
			 textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_indp_co.paa"};
			};

			class Opfor {
			 displayName = "Sechsecke";
			 factions[] = {"civ"};
				animations[] = {};
			 textures[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_OPFOR_co.paa"};
			};

			class Orange {
			 displayName = "Orange";
			 factions[] = {"civ"};
				animations[] = {};
			 textures[] = {"\a3\soft_f_beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"};
			};
		};
	};

	class O_Truck_03_covered_F : Default {
		vItemSpace = 375;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 600000;
        Fuel = 550;
		class TextureSources {
			class Hex {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cover_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cover_ghex_CO.paa"};
			};

      class CrownBlue {
				displayName = "Crown Blue";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_blue_1.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_2.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_3.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_4.paa"};
			};

      class CrownOrange {
				displayName = "Crown Orange";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_orange_1.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_2.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_3.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_4.paa"};
			};

      class DE100 {
				displayName = "De100";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\ground\civ\civ_Tempest_DE100_1.paa","images\vehicles\ground\civ\civ_Tempest_DE100_2.paa","images\vehicles\ground\civ\civ_Tempest_DE100_3.paa","images\vehicles\ground\civ\civ_Tempest_DE100_4.paa"};
			};
		};
	};

	class O_Truck_03_transport_F : Default {
		vItemSpace = 350;
		maxTrunkUpdate = 3;
		licenses[] = { "truck", "", "", ""};
		price = 550000;
        Fuel = 550;
		class TextureSources {
			class Hex {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"};
			};

      class CrownBlue {
        displayName = "Crown Blue";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_blue_1.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_2.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_3.paa"};
      };

      class CrownOrange {
        displayName = "Crown Orange";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_orange_1.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_2.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_3.paa"};
      };

      class DE100 {
        displayName = "De100";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_Tempest_DE100_1.paa","images\vehicles\ground\civ\civ_Tempest_DE100_2.paa","images\vehicles\ground\civ\civ_Tempest_DE100_3.paa"};
      };
		};
	};

	class O_Truck_03_device_F : Default {
		vItemSpace = 350;
		licenses[] = { "truck", "", "", ""};
		price = 1500000;
        Fuel = 550;
		class TextureSources {
			class Hex {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"};
			};

      class CrownBlue {
        displayName = "Crown Blue";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_blue_1.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_2.paa","images\vehicles\ground\civ\civ_crown_tempest_blue_3.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"};
      };

      class CrownOrange {
        displayName = "Crown Orange";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_crown_tempest_orange_1.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_2.paa","images\vehicles\ground\civ\civ_crown_tempest_orange_3.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"};
      };

      class DE100 {
        displayName = "De100";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\ground\civ\civ_Tempest_DE100_1.paa","images\vehicles\ground\civ\civ_Tempest_DE100_2.paa","images\vehicles\ground\civ\civ_Tempest_DE100_3.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"};
      };
		};
	};

	class O_Truck_03_fuel_F : Default {
		vItemSpace = 675;
        fuelVeh = true;
		licenses[] = { "truck", "", "", ""};
		price = 550000;
        Fuel = 550;
		class TextureSources {
			class Hex {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_fuel_CO.paa"};
			};

			class GreenHex {
				displayName = "Grüne Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_fuel_ghex_CO.paa"};
			};
		};
	};

	/*
	*
	*	AIR
	*
	*/

	class C_Heli_Light_01_civil_F : Default {
		vItemSpace = 45;
		licenses[] = { "air", "", "", ""};
		price = 875000;
        Fuel = 600;
		class TextureSources {
			class Blue {
				displayName = "Blau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
			};

			class Red {
				displayName = "Rot";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
			};

			class Ion {
				displayName = "Ion";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
			};

			class BlueLine {
				displayName = "BlueLine";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueLine_co.paa"};
			};

			class Digital {
				displayName = "Digital";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
			};

			class Elliptical {
				displayName = "Elliptisch";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
			};

			class Furious {
				displayName = "Furious";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
			};

			class Graywatcher {
				displayName = "Graywatcher";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};
			};

			class Jeans {
				displayName = "Jeans";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
			};

			class Light {
				displayName = "Hell";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};
			};

			class Shadow {
				displayName = "Shadow";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};
			};

			class Sheriff {
				displayName = "Sheriff";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};
			};

			class Speedy {
				displayName = "Speedy";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
			};

			class Sunset {
				displayName = "Sunset";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
			};

			class Vrana {
				displayName = "Vrana";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
			};

			class Wasp {
				displayName = "Wespe";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};
			};

			class Wave {
				displayName = "Welle";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
			};

      class RedRocket {
				displayName = "Red Rocket";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_mh9_redrocket.paa"};
			};

      class Crown {
				displayName = "Crown";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_crown_humming.paa"};
			};

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\air\cop\cop_bird.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
                textures[] = {"images\vehicles\air\thr\bird.paa"};
			};

			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\air\cop\cop_bird_sek.paa"};
			};

            class Nobody {
                displayName = "Nobody";
                factions[] = {"nobody"};
                animations[] = {};
                textures[] = {"images\vehicles\air\civ\civ_BirdNobody.paa"};
            };
		};
	};

	class B_Heli_Light_01_F : C_Heli_Light_01_civil_F {
		licenses[] = { "air", "", "", ""};
		price = 1175000;
        Fuel = 600;
	};

	class B_Heli_Transport_01_F : Default {
		licenses[] = { "air", "", "", ""};
		price = 4600000;
        showInFAQ = false;
        Fuel = 800;
		class TextureSources {
			class Green {
				displayName = "Grün";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"};
			};

			class Black {
				displayName = "Schwarz";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_CO.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_CO.paa"};
			};

			class Sand {
				displayName = "Sand";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_sand_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_sand_CO.paa"};
			};

			class Olive {
				displayName = "Oliv";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_tropic_CO.paa","\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_tropic_CO.paa"};
			};

			class SonderEinsatzKommando {
				displayName = "SEK";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\air\cop\cop_ghosth_sek_front.paa","\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_CO.paa"};
			};

			class cop {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\air\cop\cop_ghosth_front.paa","images\vehicles\air\cop\cop_ghosth_back.paa"};
			};
		};
	};

	class B_Heli_Attack_01_F : Default {
		vItemSpace = 250;
		licenses[] = { "air", "", "", ""};
        Fuel = 1700;
		price = 21428571;
        class TextureSources {
            class Olive {
                displayName = "Blau";
                factions[] = {"civ"};
                textures[] = {"\a3\air_f_beta\heli_attack_01\data\heli_attack_01_co.paa"};
            };

            class THR {
                displayName = "THR";
                factions[] = {"thr"};
                textures[] = {"images\vehicles\air\thr\blackfoot.paa"};
            };
        };
	};

	class B_Heli_Transport_03_unarmed_F : Default {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 16000000;
        Fuel = 4000;
        class TextureSources {
    			class Crown {
    				displayName = "Crown";
    				factions[] = {"tier4_CIV"};
    				textures[] = {"images\vehicles\air\civ\civ_crown_huron_002_1.paa","images\vehicles\air\civ\civ_crown_huron_002_2.paa"};
    			};
	       };
       };

	class B_T_VTOL_01_infantry_F : Default {
		vItemSpace = 180;
		licenses[] = { "air", "", "", ""};
		price = 18400000;
        Fuel = 6000;
		class TextureSources {
			class Blue {
				displayName = "Blau";
				factions[] = {"reb","cop"};
				textures[] = {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"};
			};

			class Olive {
				displayName = "Oliv";
				factions[] = {"reb","cop"};
				textures[] = {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"};
			};

			class Eagle {
				displayName = "Eagle";
				factions[] = {"tier3_CIV"};
				textures[] = {"images\vehicles\air\civ\civ_blackfish_eagle_1.paa","images\vehicles\air\civ\civ_blackfish_eagle_2.paa","images\vehicles\air\civ\civ_blackfish_eagle_3.paa","images\vehicles\air\civ\civ_blackfish_eagle_4.paa"};
			};

			class RedRocket {
				displayName = "Red Rocket";
				factions[] = {"tier3_CIV"};
				textures[] = {"images\vehicles\air\civ\civ_blackfish_rr_1.paa","images\vehicles\air\civ\civ_blackfish_rr_2.paa","images\vehicles\air\civ\civ_blackfish_rr_3.paa","images\vehicles\air\civ\civ_blackfish_rr_4.paa"};
			};
		};
	};

	class B_T_VTOL_01_vehicle_F : B_T_VTOL_01_infantry_F {
		vItemSpace = 140;
		licenses[] = { "air", "", "", ""};
		price = 21300000;
	};

	class O_Heli_Light_02_unarmed_F : Default {
		vItemSpace = 120;
		licenses[] = { "air", "", "", ""};
		price = 3500000;
        Fuel = 1600;
		class TextureSources {
			class Opfor {
				displayName = "Sechsecke";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"};
			};

			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
			};

			class Blackcustom {
				displayName = "Schwarz-Weiß";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};
			};

			class Blue {
				displayName = "Blau";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
			};

			class Indep {
				displayName = "Grün Digital";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
			};

     		class Viper {
				displayName = "Viper";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_orca_viper.paa"};
			};

      		class Crown {
				displayName = "Crown";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_orca_Crown.paa"};
			};

      		class Blood {
				displayName = "Blood Rain";
				factions[] = {"tier2_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_orca_blood_rain.paa"};
			};

      		class DarkIce {
				displayName = "Dark Ice";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_orca_dark_ice.paa"};
			};

            class THR {
                displayName = "THR";
                factions[] = {"thr"};
                animations[] = {};
                textures[] = {"images\vehicles\air\thr\orca.paa"};
            };

            class Nobody {
                displayName = "Nobody";
                factions[] = {"nobody"};
                animations[] = {};
                textures[] = {"images\vehicles\air\civ\civ_OrcaNobody.paa"};
            };
		};
	};

	class O_Heli_Attack_02_black_F : Default {
		vItemSpace = 250;
		licenses[] = { "air", "", "", ""};
		price = 21300000;
        Fuel = 1500;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Beta\Heli_Attack_02\Data\Heli_Attack_02_body1_black_CO.paa","A3\Air_F_Beta\Heli_Attack_02\Data\Heli_Attack_02_body2_black_CO.paa"};
			};

			class Opfor {
				displayName = "OPFOR";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Beta\Heli_Attack_02\Data\Heli_Attack_02_body1_CO.paa","A3\Air_F_Beta\Heli_Attack_02\Data\Heli_Attack_02_body2_CO.paa"};
			};
		};
	};

	class O_Heli_Transport_04_covered_black_F : Default {
		vItemSpace = 120;
		licenses[] = { "air", "", "", ""};
		price = 4200000;
        showInFAQ = false;
        Fuel = 3000;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_Black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_Black_CO.paa"};
			};

      class CrownBlue {
				displayName = "Crown Blue";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2B.paa","images\vehicles\air\civ\civ_crown_taru_3.paa","images\vehicles\air\civ\civ_crown_taru_4.paa"};
			};

      class CrownBraunCam {
				displayName = "Crown BraunCam";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2BR.paa","images\vehicles\air\civ\civ_crown_taru_3.paa","images\vehicles\air\civ\civ_crown_taru_4.paa"};
			};

      class CrownRed {
				displayName = "Crown Red";
				factions[] = {"tier3_CIV"};
				animations[] = {};
				textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2R.paa","images\vehicles\air\civ\civ_crown_taru_3.paa","images\vehicles\air\civ\civ_crown_taru_4.paa"};
			};
		};
	};

	class O_Heli_Transport_04_box_black_F : O_Heli_Transport_04_covered_black_F {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 6848571;
        Fuel = 3000;
	};

	class O_Heli_Transport_04_fuel_black_F : O_Heli_Transport_04_box_black_F {
		vItemSpace = 580;
        gasVeh = true;
		licenses[] = { "air", "", "", ""};
		price = 3591428;
        Fuel = 3000;
        class TextureSources {
            class Black {
                displayName = "Schwarz";
                factions[] = {"civ"};
                animations[] = {};
                textures[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"};
            };

            class CrownBlue {
              displayName = "Crown Blue";
              factions[] = {"tier3_CIV"};
              animations[] = {};
              textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2B.paa","images\vehicles\air\civ\civ_crown_taru_3.paa"};
            };

            class CrownBraunCam {
              displayName = "Crown BraunCam";
              factions[] = {"tier3_CIV"};
              animations[] = {};
              textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2BR.paa","images\vehicles\air\civ\civ_crown_taru_3.paa"};
            };

            class CrownRed {
              displayName = "Crown Red";
              factions[] = {"tier3_CIV"};
              animations[] = {};
              textures[] = {"images\vehicles\air\civ\civ_crown_taru_1.paa","images\vehicles\air\civ\civ_crown_taru_2R.paa","images\vehicles\air\civ\civ_crown_taru_3.paa"};
			};
        };
     };

	class O_Heli_Transport_04_black_F : O_Heli_Transport_04_box_black_F {
		vItemSpace = 200;
		licenses[] = { "air", "", "", ""};
		price = 4591428;
        Fuel = 3000;
	};

	class O_Heli_Transport_04_box_F : Default {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 4591428;
        Fuel = 3000;
	};

	class O_Heli_Transport_04_fuel_F : Default {
		vItemSpace = 580;
        gasVeh = true;
		licenses[] = { "air", "", "", ""};
		price = 4190000;
        Fuel = 3000;
	};

	class O_T_VTOL_02_infantry_F : Default {
		vItemSpace = 120;
		licenses[] = { "air", "", "", ""};
		price = 12400000;
        Fuel = 4000;
		class TextureSources {
			class Hex {
				displayName = "Sechsecke";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_bhex_CO.paa"};
			};

			class GreenHex {
				displayName = "Grün Sechsecke";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_ghex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_ghex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_ghex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_ghex_CO.paa"};
			};

			class Grey {
				displayName = "Grau";
				factions[] = {"reb","cop"};
				textures[] = {"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_CO.paa"};
			};
		};
	};

	class O_T_VTOL_02_vehicle_F : O_T_VTOL_02_infantry_F {
		vItemSpace = 85;
		licenses[] = { "air", "", "", ""};
		price = 14100000;
	};

	class I_Heli_Transport_02_F : Default {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 14100000;
        Fuel = 1900;
		class TextureSources {
			class GreenHex {
				displayName = "Grün Sechsecke";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"};
			};

			class Grey {
				displayName = "Grau";
				factions[] = {"reb"};
				animations[] = {};
				textures[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"};
			};
		};
	};

	class I_Heli_light_03_unarmed_F : Default {
		vItemSpace = 35;
		licenses[] = { "air", "", "", ""};
		price = 3000000;
        showInFAQ = false;
        Fuel = 1600;
		class TextureSources {
			class Green {
				displayName = "Grün";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"};
			};

			class Indep {
				displayName = "Grün Digital";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa"};
			};

			class SchutzPolizei {
				displayName = "Polizei";
				factions[] = {"cop"};
				animations[] = {};
				textures[] = {"images\vehicles\air\cop\cop_hellcat.paa"};
			};

			class THR {
				displayName = "THR";
				factions[] = {"thr"};
				animations[] = {};
				textures[] = {"images\vehicles\air\thr\hellcat.paa"};
			};
		};
	};

	class O_Heli_Transport_04_bench_F : Default {
		vItemSpace = 45;
		licenses[] = { "air", "", "", ""};
		price = 6000000;
        Fuel = 3000;
	};

	class O_Heli_Transport_04_covered_F : Default {
		vItemSpace = 120;
		licenses[] = { "air", "", "", ""};
		price = 4200000;
        Fuel = 3000;
	};

	class C_Plane_Civil_01_F : Default {
		vItemSpace = 140;
		licenses[] = { "air", "", "", ""};
		price = 3000000;
        Fuel = 300;
		class TextureSources {
			class Racer_1 {
				displayName = "Rennen (Hellbrauner Innenraum)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};

			class Racer_2 {
				displayName = "Rennen";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};

			class RedLine_1 {
				displayName = "Rote Linie (Hellbrauner Innenraum)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};

			class RedLine_2 {
				displayName = "Rote Linie";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};

			class Wave_1 {
				displayName = "Blaue Welle (Hellbrauner Innenraum)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};

			class Wave_2 {
				displayName = "Blaue Welle";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};

			class Tribal_1 {
				displayName = "Stamm (Hellbrauner Innenraum)";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};

			class Tribal_2 {
				displayName = "Stamm";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};

      class DiamondPolygon {
        displayName = "Diamond Polygon";
        factions[] = {"tier3_CIV"};
        animations[] = {};
        textures[] = {"images\vehicles\air\civ\civ_ceasar_dp_1.paa","images\vehicles\air\civ\civ_ceasar_dp_2.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
      };
		};
	};

	class C_Plane_Civil_01_racing_F : C_Plane_Civil_01_F {
		licenses[] = { "air", "", "", ""};
		price = 4500000;
	};

	class B_Plane_Fighter_01_F : Default {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 142857152;
        Fuel = 300;
		class TextureSources {
			class DarkGrey {
				displayName = "Dunkelgrau";
				factions[] = {"civ"};
				textures[] = {"a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_03_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_05_co.paa"};
			};

			class DarkGreyCamo {
				displayName = "Dunkelgrau [Tarn]";
				factions[] = {"civ"};
				textures[] = {"a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_Camo_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_Camo_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_03_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_05_co.paa"};
			};
		};
	};

	class O_Plane_Fighter_02_F : Default {
		vItemSpace = 300;
		licenses[] = { "air", "", "", ""};
		price = 142857152;
        Fuel = 300;
		class TextureSources {
			class CamoAridHex {
				displayName = "Arid Hex [Tarn]";
				factions[] = {"civ"};
				textures[] = {"a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_02_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_00_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_01_co.paa","a3\data_f\clear_empty.paa"};
			};

			class CamoGreyHex {
				displayName = "Grau Hex [Tarn]";
				factions[] = {"civ"};
				textures[] = {"a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Grey_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_02_Grey_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Grey_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_02_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_00_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_01_co.paa","a3\data_f\clear_empty.paa"};
			};

			class CamoBlue {
				displayName = "Blau";
				factions[] = {"civ"};
				textures[] = {"a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Blue_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_02_Blue_co.paa","a3\air_f_jets\plane_fighter_02\data\Fighter_02_fuselage_01_Blue_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_02_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_00_co.paa","a3\air_f_jets\plane_fighter_02\data\Numbers\Fighter_02_number_01_co.paa","a3\data_f\clear_empty.paa"};
			};
		};
	};
	/*
	*
	*	Water
	*
	*/

	class C_Boat_Civil_01_F : Default {
		vItemSpace = 85;
		licenses[] = { "boat", "cg", "", ""};
		price = 22000;
        Fuel = 100;
	};

	class C_Boat_Civil_01_police_F : C_Boat_Civil_01_F {
		licenses[] = { "boat", "cg", "", ""};
        showInFAQ = false;
	};

	class C_Boat_Civil_01_rescue_F : C_Boat_Civil_01_F {
		licenses[] = { "boat", "cg", "", ""};
        showInFAQ = false;
	};

	class C_Rubberboat : Default {
		vItemSpace = 45;
		licenses[] = { "boat", "cg", "", ""};
		price = 5000;
        Fuel = 45;
	};

	class B_Boat_Transport_01_F : Default {
		vItemSpace = 45;
		licenses[] = { "boat", "cg", "", ""};
		price = 1500000;
	};

	/*
	*
	*	TANKS/OTHER
	*
	*/

	class B_APC_Wheeled_01_cannon_F : Default {
		vItemSpace = 580;
		licenses[] = { "truck", "", "", ""};
		price = 300;
        showInFAQ = false;
	};

	class Land_Pod_Heli_Transport_04_box_black_F : Default {
		vItemSpace = 200;
		licenses[] = { "truck", "", "", ""};
		price = 10000000;
        showInFAQ = false;
		class TextureSources {
			class Black {
				displayName = "Schwarz";
				factions[] = {"civ"};
				animations[] = {};
				textures[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_black_CO.paa"};
			};
		};
	};
};
