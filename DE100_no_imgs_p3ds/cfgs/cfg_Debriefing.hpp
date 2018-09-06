class CfgDebriefing
{
	class NotWhitelisted
	{
		title = "Auth-Fehler";
		subtitle = "Nicht gelistet";
		description = "Du musst gelistet sein, um diesen Slot benutzen zu können.";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class Permbanned
	{
		title = "Gebannt";
		subtitle = "Hausverbot";
		description = "Du hast Hausverbot auf DE100. Mehr Infos im Hauptmenü oder im Support. TS: TS3.DE100-ALTIS.LIFE:3227";
		pictureBackground = "images\logout.jpg";
		picture = "images\icons\ico_perm.paa";
		pictureColor[] = {0,0.3,0.6,1};
	};
	
	class Tempbanned
	{
		title = "Gebannt";
		subtitle = "Temporär gebannt";
		description = "Du hast Hausverbot auf DE100. Mehr Infos im Hauptmenü oder im Support. TS: TS3.DE100-ALTIS.LIFE:3227";
		pictureBackground = "images\logout.jpg";
		picture = "images\icons\ico_time.paa";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class Entbannt
	{
		title = "Entbannt";
		subtitle = "Du wurdest entbannt";
		description = "Dein Ban ist ausgelaufen und Du wurdest entbannt. Du wirst nun zurück in die Lobby geworfen. Danach kannst Du Dich ganz normal einloggen. Sollte es dennoch Probleme geben, kannst Du Dich im Support melden.";
		pictureBackground = "images\logout.jpg";
		picture = "images\icons\ico_unbanned.paa";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class Blacklisted
	{
		title = "Auth-Fehler";
		subtitle = "Blacklisted";
		description = "Du stehst auf der Blacklist der Polizei und darfst nicht mehr als Polizist spielen!";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class CharCheck
	{
		title = "Spielername";
		subtitle = "Unzulässige Zeichen im Spielernamen";
		description = "Mehr Informationen im Hauptmenü.";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class nameMatching
	{
		title = "Spielername";
		subtitle = "Spielername geändert";
		description = "Mehr Informationen im Hauptmenü.";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class uidCheck
	{
		title = "UID-Manipulation";
		subtitle = "Fehler beim lesen der Spieler-ID";
		description = "Bitte starte dein Spiel neu.";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class pingCheck
	{
		title = "Timeout";
		subtitle = "Keine Antwort vom Server";
		description = "Bitte logge dich erneut ein.";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class aborted
	{
		title = "Aufwiedersehen";
		subTitle = "Deine Daten wurden gespeichert";
		description = "Das De100-Team bedankt sich für deinen Besuch auf dem DE100-Altis-Life-Server und freut sich auf deinen nächsten Besuch. Besuche unsere Webseite: DE100-altis.life und Ts: ts3.de100-altis.life:3227";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};

	class abortedNoSync
	{
		title = "Aufwiedersehen";
		subTitle = "Fehler beim Speichern der Daten";
		description = "Das De100-Team bedankt sich für deinen Besuch auf dem DE100-Altis-Life-Server und freut sich auf deinen nächsten Besuch. Besuche unsere Webseite: DE100-altis.life und Ts: ts3.de100-altis.life:3227";
		pictureBackground = "images\logout.jpg";
		picture = "";
		pictureColor[] = {0,0.3,0.6,1};
	};
};