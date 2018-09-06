//By Patrick "Lucian" Schmidt
class Marker
{
	class Default  {
		displayname = "";
		defaultColor[] = {0,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {};
	};

	class Resource_Fields_legal : Default  {
		displayname = "Legale Rohstoffe";
		factions[] = {"civ","cop","thr","nobody"};
		defaultColor[] = {0.7,0.6,0,1};
		markers[] = {
			"apple_1",
			"apple_2",
			"coal",
			"diamond_1",
			"Erdgas_1",
			"Erdgas_2",
			"gold_1",
			"grapes_1",
			"iron_1",
			"lead_1",
			"oil_1",
			"oil_2",
			"peaches_2",
			"rock_1",
			"salt_1",
			"sand_1",
			"silber",
			"sugarCane_1",
			"sugarCane_2",
			"sulfuric_1",
			"tomato_1",
			"silicium_1",
			"corn_1"
		};
	};

	class Resource_Fields_illegal : Default  {
		displayname = "Illegale Rohstoffe";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"cocaine_1",
			"coke_area",
			"crystal_1",
			"heroin_1",
			"heroin_area",
			"weed_1",
			"weed_area_1",
			"trigger_1"
		};
	};

	class Processing_legal : Default  {
		displayname = "Legale Verarbeiter";
		defaultColor[] = {0.85,0.4,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"battery",
			"Betonmischer_1",
			"copper_mine_1",
			"copper_mine_1_1",
			"dimond_1",
			"dimond_1_1",
			"dimond_2",
			"dimond_3",
			"dimond_4",
			"Erdgas",
			"Fsalad Prod",
			"Goldverarbeiter_2",
			"iron_processing",
			"OelUndErdgas",
			"OilP",
			"OilP_1",
			"OilP_1_2",
			"rock_proc",
			"Salt",
			"Stahlschmiede_1",
			"sugarCane_prod",
			"sugarCane_prod_1",
			"tomatoP",
			"wine:destille",
			"wine:destille_3"
		};
	};

	class Processing_illegal : Default  {
		displayname = "Illegale Verarbeiter";
		defaultColor[] = {0.5,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"battery_1",
			"cocaine processing",
			"heroin_p",
			"meth_normal",
			"Walter_White",
			"Weed_p_1",
			"wine:destille_1",
			"wine:destille_2"
		};
	};

	class Dealer_legal : Default  {
		displayname = "Legale Händler";
		defaultColor[] = {0,0.8,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"Gas_trader_1",
			"oil_trader1",
			"oil_trader1_1_2",
			"oil_trader1_1_3",
			"oil_trader1_2",
			"oil_trader_1",
			"oil_trader_2",
			"oil_trader_3",
			"oil_trader_3_1",
			"oil_trader_4",
			"oil_trader_4_1",
			"oil_trader_4_2",
			"oil_trader_4_3",
			"oil_trader_4_4",
			"oil_trader_5",
			"tomatoP_trader",
			"wine_trader",
			"wine_trader_3"
		};
	};

	class Dealer_illegal : Default  {
		displayname = "Illegale Händler";
		defaultColor[] = {0.5,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"gold_bar_dealer",
			"Marker_Dealer_1",
			"Marker_Dealer_2",
			"Marker_Dealer_3",
			"turle_dealer",
			"turle_dealer_1",
			"turle_dealer_2",
			"wine_trader_1",
			"wine_trader_2"
		};
	};

	class Delivery_Point : Default  {
		displayname = "Liefermissionen";
		defaultColor[] = {0.85,0.85,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"dp_1_1",
			"dp_1_10",
			"dp_1_11",
			"dp_1_12",
			"dp_1_13",
			"dp_1_14",
			"dp_1_14_1",
			"dp_1_15",
			"dp_1_15_1",
			"dp_1_16",
			"dp_1_17",
			"dp_1_18",
			"dp_1_18_1",
			"dp_1_18_2",
			"dp_1_19",
			"dp_1_2",
			"dp_1_20",
			"dp_1_21",
			"dp_1_3",
			"dp_1_4",
			"dp_1_5",
			"dp_1_6",
			"dp_1_7",
			"dp_1_8",
			"dp_1_9",
			"dp_missions",
			"dp_missions_1"
		};
	};

	class Fuelstations : Default  {
		displayname = "Tankstellen";
		defaultColor[] = {1,1,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"TankMarker_0",
			"TankMarker_1",
			"TankMarker_2",
			"TankMarker_3",
			"TankMarker_4",
			"TankMarker_5",
			"TankMarker_6",
			"TankMarker_7",
			"TankMarker_8",
			"TankMarker_9",
			"TankMarker_10",
			"TankMarker_11",
			"TankMarker_12",
			"TankMarker_13",
			"TankMarker_14",
			"TankMarker_15",
			"TankMarker_16",
			"TankMarker_17",
			"TankMarker_18",
			"TankMarker_19",
			"TankMarker_20",
			"TankMarker_21",
			"TankMarker_22",
			"TankMarker_23",
			"TankMarker_24",
			"TankMarker_25",
			"TankMarker_26",
			"TankMarker_27",
			"TankMarker_28",
			"TankMarker_29",
			"TankMarker_30",
			"TankMarker_31"
		};
	};

	class Fuelstations_Heli : Default  {
		displayname = "Helikopter-Tankstellen";
		defaultColor[] = {1,1,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"copair1",
			"kerosin1",
			"kerosin2",
			"Kerosin3",
			"Kerosin4",
			"kerosin5"
		};
	};

	class ATM : Default  {
		displayname = "Bankautomaten";
		defaultColor[] = {0,0.8,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"atm_1_3_11_5_4",
			"atm_marker_1",
			"atm_marker_1_1",
			"atm_marker_2",
			"atm_marker_2_1",
			"atm_marker_2_10",
			"atm_marker_2_10_1",
			"atm_marker_2_10_3",
			"atm_marker_2_2",
			"atm_marker_2_3",
			"atm_marker_2_4",
			"atm_marker_2_6",
			"atm_marker_2_7",
			"atm_marker_2_8",
			"atm_marker_2_9",
			"atm_marker_3",
			"atm_marker_4_1",
			"atm_marker_4_1_1",
			"atm_marker_5"
		};
	};

	class Cop : Default  {
		displayname = "Polizei";
		defaultColor[] = {0,0,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"cop_spawn_3",
			"cop_spawn_4",
			"cop_spawn_5",
			"Correctional Facility",
			"depo_marker_visible",
			"Kontrolle 1_1_1",
			"marker_465",
			"Police HQ_1",
			"police_hq_1",
			"polizeihauptquartier_kavala",
		};
	};

	class THR : Default  {
		displayname = "THR";
		defaultColor[] = {0.85,0.85,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"ADAC_1_1",
			"hospital_marker",
			"medic_spawn_3"
		};
	};

	class GarageCar : Default  {
		displayname = "Fahrzeug-Garagen";
		defaultColor[] = {0,0.3,0.6,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"civ_gar_1",
			"civ_gar_1_2",
			"civ_gar_1_3_1",
			"civ_gar_1_3_1_1"
		};
	};

	class GarageAir : Default  {
		displayname = "Helikopter-Garagen";
		defaultColor[] = {0,0.3,0.6,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"civ_gar_1_1",
			"civ_gar_1_1_1",
			"civ_gar_1_1_1_1"
		};
	};

	class GarageBoat : Default  {
		displayname = "Boots-Garagen";
		defaultColor[] = {0.5,0.5,0.5,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"civ_ship_1",
			"civ_ship_2",
			"civ_ship_3"
		};
	};

	class VehicleTrades : Default  {
		displayname = "Fahrzeug-Händler";
		defaultColor[] = {1,1,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"car1_1",
			"car1_1_1",
			"car1_1_2",
			"car1_1_2_1",
			"civ_truck_shop1",
			"civ_truck_shop1_1",
			"kart_shop_text_1",
			"airshop",
			"boat_2",
			"airshop_1",
			"boat_2_1",
			"boat_2_1_1"
		};
	};

	class Markets : Default  {
		displayname = "Märkte";
		defaultColor[] = {0,0.8,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"fish_market_1",
			"Gen_3_1_1",
			"Gen_3_1_1_1",
			"Gen_3_1_1_2",
			"Gen_5"
		};
	};

	class ClothingShops : Default  {
		displayname = "Kleidungs-Händler";
		defaultColor[] = {0,0.8,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"dive_shop",
			"dive_shop_1",
			"Gen_3",
			"Gen_3_3",
			"Gen_3_4",
			"Gen_3_4_1",
			"Gen_3_1_1_3"
		};
	};

	class Store : Default  {
		displayname = "Läden";
		defaultColor[] = {0,0.8,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"Gen",
			"Gen_2",
			"Gen_2_1",
			"Gen_4"
		};
	};

	class WeaponShops : Default  {
		displayname = "Waffen-Händler";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"gun_store_1",
			"gun_store_1_1",
			"gun_store_1_2_4"
		};
	};

	class RebelShops : Default  {
		displayname = "Rebellen-Anlagen";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"dsw",
			"Rebellenlager_1",
			"Rebelop",
			"Rebelop_2",
			"Uebungsgel'nde"
		};
	};

	class Licenses : Default  {
		displayname = "Lizenzämter";
		defaultColor[] = {0,0,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"license_shop",
			"license_shop_1",
			"license_shop_2",
			"license_shop_2_1"
		};
	};

	class ChopShop : Default  {
		displayname = "Gebrauchtwagen-Händler";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"chop_shop_1",
			"chop_shop_2",
			"chop_shop_3",
			"chop_shop_4"
		};
	};

	class Misc : Default  {
		displayname = "Sonstiges";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"asdasd",
			"Derby",
			"Einwohnermeldeamt",
			"fed_reserve",
			"fzglackierer",
			"Gen_3_1_2",
			"kvl_safezone_marker",
			"oil_trader_5_1",
			"Puzzles",
			"taxizstandkavalla"
		};
	};

	class fedReserve : Default  {
		displayname = "Staatsbank";
		defaultColor[] = {0.9,0,0,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"fed_reserve",
			"marker_scientist",
			"marker_476",
			"marker_ConstructionWorker",
			"marker_ellipseConstruction"
		};
	};

	class Houses : Default  {
		displayname = "Immobilien";
		defaultColor[] = {0,0,1,1};
		factions[] = {"civ","cop","thr","nobody"};
		markers[] = {
			"house_*"
		};
	};
};
