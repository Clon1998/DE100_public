waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitWith{};

player createDiarySubject ["regelbn","Serverregeln"];
player createDiarySubject ["controls","Steuerung"];
player createDiarySubject ["changelog","Änderungen"];

player createDiaryRecord
["regelbn",
	[
		"Serverregeln",
		"
		Die Allgemeinen Serverregeln findest du im Forum http://www.DE100-ALTIS.life<br/>
		Das Taxi darf nicht mißbraucht werden um leute zu kidnappen!<br/>
		Als Taxifahrer muss man sich an das Roleplay halten und seine Gäste an ziel bringen.<br/>
		"
	]
];
player createDiaryRecord
["changelog",
	[
		"Änderungen",
		"
		Den Changelog kannst du im Forum DE100-ALTIS.life finden!
		FEHLER BITTE SOFORT IM BUGTRACKER EINRAGEN :) <br/><br/><br/>
		"
	]
];

// Controls Section
player createDiaryRecord 
["controls",
	[
		"Hotkeys",
		"
		1: Fahndungsliste (Polizei)<br/>
		2: Redgull benutzen (Alle)<br/>
		3: Ohrstöpsel (Alle)<br/>
		4: Ergeben (Alle)<br/>
		5: GUI-Mode wechseln (Alle)<br/>
		Z: Virtuelles Inventar (Alle)<br/>
		U: Fahrzeug/Haus auf-/abschließen (Alle)<br/>
		F: Sirene (Polizei,THR)<br/>
		T: Fahrzeugkofferraum (Alle)<br/>
		Shift + R: Polizei-Durchsage (Polizei)<br/>
		Shift + L: Blaulicht  (Polizei,THR)<br/>
		Shift + R: Festnehmen (Ziv, Polizei)<br/>
		Shift + G: Niederschlagen (Ziv)<br/>
		Shift + H: Waffe holstern (Alle)<br/>
		STRG + H: Waffe entholstern (Alle)<br/>
		Windowstaste + ALT = Automatisch sammeln (Ziv)<br/>
		Windowstaste = Sammeln/Interaktionstaste (Alle)<br/>
		<br/>
		Funktionen neu belegen:<br/>
		Aktion 9  : Virtuelles Inventar<br/>
		Aktion 10 : Interaktionstaste<br/>
		Aktion 11 : Redgull benutzen<br/>
		Aktion 12 : Sirene<br/>
		"
	]
];