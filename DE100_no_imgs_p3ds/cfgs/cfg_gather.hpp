class resourceFields {
	class default {
		item = "";
		zones[] = {};
		radius = 0;
		mineral = false;
	};

	class apple: default {
		item = "apple";
		zones[] = {"apple_1","apple_2"};
		radius = 40;
	};

	class peach: apple {
		item = "peach";
		zones[] = {"peaches_2"};
	};

	class heroin: apple {
		item = "heroin_Unprocessed";
		zones[] = {"heroin_1"};
	};

	class cocaine: apple {
		item = "cocaine_Unprocessed";
		zones[] = {"cocaine_1"};
	};

	class weed: apple {
		item = "cannabis";
		zones[] = {"weed_1"};
	};

	class meth: apple {
		item = "meth_Unprocessed";
		zones[] = {"crystal_1"};
	};

	class gas: apple {
		item = "gas_Unrefined";
		zones[] = {"Erdgas_1","Erdgas_2","Erdgas_3"};
		radius = 130;
	};

	class grapes: apple {
		item = "grapes";
		zones[] = {"grapes_1"};
	};

	class sugarCane: apple {
		item = "sugarCane";
		zones[] = {"sugarCane_1","sugarCane_2"};
	};

	class trigger: apple {
		item = "trigger";
		zones[] = {"trigger_1"};
	};

	class tomato: apple {
		item = "tomato";
		zones[] = {"tomato_1"};
	};

	class corn: apple {
		item = "corn";
		zones[] = {"corn_1"};
	};

	class rock: default {
		item = "rock";
		zones[] = {"rock_1"};
		radius = 50;
		mineral = true;
	};

	class coal: rock {
		item = "coal_unrefined";
		zones[] = {"coal"};
	};

	class gold: rock {
		item = "gold_unrefined";
		zones[] = {"gold_1"};
	};

	class silver: rock {
		item = "silver_unrefined";
		zones[] = {"silber"};
	};

	class oil: rock {
		item = "oil_Unprocessed";
		zones[] = {"oil_1","oil_2"};
	};

	class copper: rock {
		item = "copper_Unrefined";
		zones[] = {"lead_1"};
	};

	class iron: rock {
		item = "iron_Unrefined";
		zones[] = {"iron_1"};
	};

	class salt: rock {
		item = "salt_Unrefined";
		zones[] = {"salt_1"};
		radius = 120;
	};

	class sand: rock {
		item = "sand";
		zones[] = {"sand_1"};
	};

	class diamond: rock {
		item = "diamond_Uncut";
		zones[] = {"diamond_1"};
	};

	class sulfuric: rock {
		item = "sulfuric";
		zones[] = {"sulfuric_1"};
	};

	class silicium: rock {
		item = "silicium";
		zones[] = {"silicium_1"};
	};
};