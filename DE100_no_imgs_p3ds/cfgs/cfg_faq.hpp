//By Patrick "Lucian" Schmidt
class frequently_asked_questions
{
	class Default  {
		displayname = "";
		description = "";
		type = "";
		params[] = {};
	};

	class LandVehicle : Default  {
		displayname = "Landfahrzeuge";
		description = "'(getNumber(_x >> ""price"") > 0) && getNumber(_x >> ""showInFAQ"") == 1 && (configName _x) isKindOf ""Car""' configClasses (missionConfigFile >> 'lifeVehicles')";
		type = "cfgVehicle";
		params[] = {};
	};

	class AirVehicle : Default  {
		displayname = "Luftfahrzeuge";
		description = "'(getNumber(_x >> ""price"") > 0) && getNumber(_x >> ""showInFAQ"") == 1 && (configName _x) isKindOf ""Air""' configClasses (missionConfigFile >> 'lifeVehicles')";
		type = "cfgVehicle";
		params[] = {};
	};

	class Licenses : Default  {
		displayname = "Lizenzen";
		description = "'(getNumber(_x >> ""price"") > 0) && getNumber(_x >> ""showInFAQ"") == 1' configClasses (missionConfigFile >> 'Licenses')";
		type = "cfgLicenses";
		params[] = {};
	};

	class vItems : Default  {
		displayname = "Virtuelle Items";
		description = "'(getNumber(_x >> ""buyPrice"") > 0) && getNumber(_x >> ""showInFAQ"") == 1' configClasses (missionConfigFile >> 'VirtualItems')";
		type = "cfgvItems";
		params[] = {};
	};

	class DE100 : Default  {
		displayname = "DE100";
		description = "Willkommen auf <t font='TahomaB'>DE100</t><t font='PuristaMedium'><br/>Viele kennen uns vielleicht noch aus der Zeit als DE100 noch unter der Flagge von Arma2 stand. Nach dem damaligen Release von Altis Life hatten wir uns dazu entschlossen, den nächsten Schritt zu wagen und gründeten einen Altis Life – Server.<br/><br/>Kurzzeitig gab es auch Abschweifungen in der Arma 3 Mod-Szene.<br/>Wie Chernarus – Life: auf YouTube auch bekannt als „GTA Life, GTA Mod für Altis Life“. Damit konnten wir auch Let´s Play Legenden wie Moondye7 für unser Projekt begeistern.<br/><br/>Nach dem großen Andrang  haben wir uns dazu entschlossen, unseren durchaus erfolgreichen Altis Life – Server einzustellen und uns voll auf dieses Projekt zu konzentrieren. Doch leider waren es die Arma3 Richtlinien, die uns dazu gezwungen haben dieses Projekt wieder einzustellen.<br/><br/>Nach diesem herben Rückschlag für das Projekt Chernarus – Life wurde schnell klar, dass wir an alte Erfolge anknüpfen wollen. Und eröffneten erneut unseren alt bekannten Altis Life – Server.<br/><br/>Unsere Community umfasst alle Altersklassen, wir sind stets bemüht ein Spielerlebnis für Jung und Alt zu erschaffen. Ohne unsere helfenden Hände wie: Scripter, Admins, Helper, Supporter und Designer, wäre ein seit mehr als 5-Jähriges Bestehen niemals möglich gewesen. Auch nicht ohne all den vielen Mitspielern, die nicht nur uns mit Ihrer Anwesenheit belohnten. Es waren auch die Spenden, ohne die es nicht möglich gewesen wäre die Technik weiter zu finanzieren.<br/><br/>Wir würden uns freuen auch Dich bald an Board zu sehen und heißen Euch alle herzlich Willkommen.<br/><br/>Dein DE100 – Team.";
		type = "text";
		params[] = {};
	};

	class PayCheck : Default  {
		displayname = "Gehaltscheck";
		description = "<t font='TahomaB' size='1.3'>Gehaltscheck</t><t font='PuristaMedium' size='1'><br/><br/>Der Gehaltscheck generiert sich aus deinen Verarbeitungsleveln und deinen Erfolgen.<br/>Jedes Verarbeitungslevel bringen dir zusätslich $25 und jeder Erfolg bringt dir zusätslich $50. Mit diesem System belohnen wir Spieler, welche länger auf unserem Server spielen und unserem Server treu bleiben.<br/><br/>Das absolute Grundgehalt beträgt $475.<br/>Das maximal Gehalt beträgt $6,050.";
		type = "text";
		params[] = {};
	};

	/*class GangSystem : Default  {
		displayname = "Gang System";
		description = "<t font='TahomaB' size='1.3'>Gehaltscheck</t><t font='PuristaMedium' size='1'><br/><br/>Der Gehaltscheck generiert sich aus deinen Verarbeitungsleveln und deinen Erfolgen.<br/>Jedes Verarbeitungslevel bringen dir zusätslich $25 und jeder Erfolg bringt dir zusätslich $50. Mit diesem System belohnen wir Spieler, welche länger auf unserem Server spielen und unserem Server treu bleiben.<br/><br/>Das absolute Grundgehalt beträgt $475.<br/>Das maximal Gehalt beträgt $6,050.";
		type = "text";
		params[] = {};
	};*/
};