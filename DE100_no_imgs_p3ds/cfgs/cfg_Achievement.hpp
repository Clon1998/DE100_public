//By Patrick "Lucian" Schmidt
class Achievements
{
	class Default {
		variable = "";
		side = "";
		titel = "";
		description = "";
		class Titels {};
	};

	class Fruit : Default
	{
		variable = "Archi_Frucht";
		titel = "Obst";
		side = "civ";
		description = "<t size='1'>Sammel: %2 Früchte <br/>Gesammelt: %1 Früchte</t>";
		class Titels {
			class Level_1 {
				displayName = "Obstpflücker";
				needed = 30;
			};

			class Level_2 {
				displayName = "Obstbauer";
				needed = 100;
			};

			class Level_3 {
				displayName = "Plantagenbesitzer";
				needed = 500;
			};
		};
	};

	class Kill : Default
	{
		variable = "Archi_Killer";
		titel = "Abschüsse";
		side = "civ";
		description = "<t size='1'>Töte: %2 Spieler<br/>Getötet: %1 Spieler</t>";
		class Titels {
			class Level_1 {
				displayName = "Trittbrettfahrer";
				needed = 15;
			};

			class Level_2 {
				displayName = "Ganove";
				needed = 50;
			};

			class Level_3 {
				displayName = "Serienkiller";
				needed = 100;
			};

			class Level_4 {
				displayName = "Terrorist";
				needed = 500;
			};
		};
	};

	class Money : Default
	{
		variable = "Archi_Money";
		titel = "Geld";
		side = "civ";
		description = "<t size='1'>Benötigter Kontostand: %2 $<br/>Höchster Kontostand: %1 $</t>";
		class Titels {
			class Level_1 {
				displayName = "Tellerwäscher";
				needed = 100000;
			};

			class Level_2 {
				displayName = "Millionär";
				needed = 1000000;
			};

			class Level_3 {
				displayName = "Rich Bitch";
				needed = 100000000;
			};

			class Level_4 {
				displayName = "König von Kavala";
				needed = 250000000;
			};
		};
	};

	class Drugs : Default
	{
		variable = "Archi_Drugs";
		titel = "Drogen";
		side = "civ";
		description = "<t size='1'>Sammel: %2 Drogen<br/>Gesammelt: %1 Drogen</t>";
		class Titels {
			class Level_1 {
				displayName = "Grünschnabel";
				needed = 10;
			};

			class Level_2 {
				displayName = "Lieferjunge";
				needed = 100;
			};

			class Level_3 {
				displayName = "Dealer";
				needed = 500;
			};

			class Level_4 {
				displayName = "Schmuggler";
				needed = 3000;
			};

			class Level_5 {
				displayName = "Bandenführer";
				needed = 10000;
			};

			class Level_6 {
				displayName = "Drogenbaron";
				needed = 50000;
			};

			class Level_7 {
				displayName = "Pate";
				needed = 100000;
			};
		};
	};

	class fissileMaterial : Default
	{
		variable = "Archi_BankRaub";
		titel = "Beschaffungskünstler";
		side = "civ";
		description = "<t size='1'>Verkaufe: %2 spaltbares Material <br/>Verkauft: %1 spaltbares Material</t>";
		class Titels {
			class Level_1 {
				displayName = "Back to the Future";
				needed = 5;
			};

			class Level_2 {
				displayName = "Strahlenkranker";
				needed = 10;
			};

			class Level_3 {
				displayName = "Fallout-Boy";
				needed = 25;
			};
		};
	};

	class Mining : Default
	{
		variable = "Archi_BergBau";
		titel = "Bergbau";
		side = "civ";
		description = "<t size='1'>Baue: %2 Erz ab <br/>Bereits: %1 Erz abgebaut</t>";
		class Titels {
			class Level_1 {
				displayName = "Schürfer";
				needed = 30;
			};

			class Level_2 {
				displayName = "Bergarbeiter";
				needed = 100;
			};

			class Level_3 {
				displayName = "Wettermann";
				needed = 500;
			};

			class Level_4 {
				displayName = "Schichtmeister";
				needed = 1000;
			};

			class Level_5 {
				displayName = "Grubenbesitzer";
				needed = 10000;
			};
		};
	};

	class Restrain : Default
	{
		variable = "Archi_Restrain";
		titel = "Festnahmen";
		side = "cop";
		description = "<t size='1'>Fessel: %2 Spieler<br/>Bereits: %1 Spieler gefesselt</t>";
		class Titels {
			class Level_1 {
				displayName = "Dorfpolizist";
				needed = 10;
			};

			class Level_2 {
				displayName = "Kaufhaus Cop";
				needed = 50;
			};

			class Level_3 {
				displayName = "Ordnungshüter";
				needed = 100;
			};

			class Level_4 {
				displayName = "Gesetzeshüter";
				needed = 250;
			};

			class Level_5 {
				displayName = "Bulle von Kavala";
				needed = 500;
			};
		};
	};

	class Revived : Default
	{
		variable = "Archi_Revived";
		titel = "Reanimierung";
		side = "thr";
		description = "<t size='1'>Reanimiere: %2 Spieler<br/>Bereits: %1 Spieler reanimiere</t>";
		class Titels {
			class Level_1 {
				displayName = "Schulsanitäter";
				needed = 10;
			};

			class Level_2 {
				displayName = "Ersthelfer";
				needed = 50;
			};

			class Level_3 {
				displayName = "Schutzengel";
				needed = 150;
			};

			class Level_4 {
				displayName = "Gott in rot";
				needed = 350;
			};
		};
	};

	class Repair : Default
	{
		variable = "Archi_Repair";
		titel = "Werkstatt";
		side = "thr";
		description = "<t size='1'>Repariere: %2 Fahrzeuge<br/>Bereits: %1 Fahrzeuge repariert</t>";
		class Titels {
			class Level_1 {
				displayName = "Schrauber";
				needed = 10;
			};

			class Level_2 {
				displayName = "Werkstatt Udo";
				needed = 50;
			};

			class Level_3 {
				displayName = "Gelber Engel";
				needed = 150;
			};

			class Level_4 {
				displayName = "Werkzeug-Fetischist";
				needed = 300;
			};
		};
	};

	class Donator : Default
	{
		variable = "Archi_Donator";
		titel = "Spender";
		side = "civ";
		description = "Diesen Erfolg erhältst du, wenn du ein ingame Spenden Feature kaufst!";
		class Titels {
			class Level_1 {
				displayName = "DE100-Spender";
				needed = 1;
			};
		};
	};

	class Custom : Default
	{
		variable = "Archi_Custom";
		titel = "Sonstiges";
		side = "civ";
		description = "Diese Erfolge erhältst man nur, zu besonderen Anlässen!";
		class Titels {
			class Level_1 {
				displayName = "DE100-Veteran";
				needed = 1;
			};
			class Level_2 {
				displayName = "Ehm. DE100-Team";
				needed = 2;
			};
		};
	};
};
