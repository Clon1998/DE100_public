//By Patrick "Lucian" Schmidt
class life_gang_config {
	gang_storeRoom_price = 25000000;
	gang_storeRoom_slots = 10;
	gang_rename_price = 25000000;
	class levels {
		class level_1 {
			price = 75000;
			maxMember = 8;
			tooltip = "";
			storehouses = 0;
		};

		class level_2: level_1 {
			price = 500000;
			maxMember = 12;
			tooltip = "-Maximale Gangmitglieder: 12";
		};

		class level_3: level_1 {
			price = 5000000;
			maxMember = 18;
			tooltip = "-Maximale Gangmitglieder: 18\n-Lizenz für ein Lagerhaus";
			storehouses = 1;
		};

		class level_4: level_3 {
			price = 20000000;
			maxMember = 22;
			tooltip = "-Maximale Gangmitglieder: 22\n-Lagerhäuser als Spawnpunkte";
		};

		class level_5: level_3 {
			price = 42500000;
			maxMember = 24;
			tooltip = "-Maximale Gangmitglieder: 24\n-Rebellen Markt Erweiterung\n-Lizenz für ein weiteres Lagerhaus";
			storehouses = 2;
		};

		class level_6: level_5 {
			price = 60000000;
			maxMember = 28;
			tooltip = "-Maximale Gangmitglieder: 28\n-Rebellen Klediungsladen Erweiterung";
		};

		class level_7: level_6 {
			price = 100000000;
			maxMember = 40;
			tooltip = "-Maximale Gangmitglieder: 35\n-Rebellen Waffenladen Erweiterung";
		};
	};

	class storehouslevels {
		class level_1 {
			price = 75000;
			neededGanglevel = 3;
			storehouses = 0;
		};

		class level_2: level_1 {
			price = 8000000;
			neededGanglevel = 3;
			tooltip = "-Helikopter Garage\n-Benötigtes Ganglevel: 3";
		};

		class level_3: level_1 {
			price = 16500000;
			neededGanglevel = 5;
			tooltip = "-Rebellen Markt und Bankautomat\n-Benötigtes Ganglevel: 5";
		};

		class level_4: level_3 {
			price = 24000000;
			neededGanglevel = 6;
			tooltip = "-Rebellen Kleidungsladen\n-Benötigtes Ganglevel: 6";
		};

		class level_5: level_3 {
			price = 35000000;
			neededGanglevel = 7;
			tooltip = "-Rebellen Waffenladen\n-Benötigtes Ganglevel: 7";		
		};
	};
};