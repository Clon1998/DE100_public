class crimes {
	class blueprint {
		bounty = 1000;
		text = "";
		stackable = 1;
	};

	class hostagtaker:blueprint {
		bounty = 125000;
		text = "Geiselnahme";
	};

	class murder:blueprint {
		bounty = 175000;
		text = "Mord, an %1";
		stackable = 0;
		mapProtect = 1;
	};

	class murderVehicle:blueprint {
		bounty = 175000;
		text = "Mord mit Fahrzeug, an %1";
		stackable = 0;
	};

	class robbery:blueprint {
		bounty = 50000;
		text = "Schwerer Raub, an %1";
		stackable = 0;
	};

	class prisonBreak:blueprint {
		bounty = 50000;
		text = "Gefängnisausbruch";
	};

	class drugDealer:blueprint {
		bounty = 7000;
		text = "Drogenhandel";
	};

	class breakIn:blueprint {
		bounty = 80000;
		text = "Einbruch";
	};

	class carThief:blueprint {
		bounty = 30000;
		text = "Autodiebstahl";
	};

	class tryedCarThief:blueprint {
		bounty = 22000;
		text = "Versuchter Autodiebstahl";
	};

	class fuelThief:blueprint {
		bounty = 52000;
		text = "Kraftstoffdiebstahl";
	};
};