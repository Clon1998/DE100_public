/*
	File:	fn_jobLBChange.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice"];
params[
	["_control", controlNull, [controlNull]],
	["_index", 0, [0]]
];
private _display = ctrlParent _control;
_control = _display displayCtrl 4803;

switch (_index) do {
	case 1: {_control ctrlSetStructuredText parseText format["Mit diesem Job bist du als Taxifahrer taetig.<br/>Du musst dir dein Taxiauto abholen.<br/>Bei dir kann eine Anfrage eingehen, die dann annehmen kannst oder nicht.<br/>Wenn angenommen wird dir derjenige auf der Karte angezeigt und du kannst ihn abholen<br/>Solange du fährst und der Kunde die Anfrage nicht abbricht verdienst du Geld.<br/>Gehalt:<br/>Abhängig von gefahrerener Strecke."];};
    case 0: {_control ctrlSetStructuredText parseText format["In diesem Job geht es darum die Tankstellen zu befüllen<br/>Bei der Tanklastfahrer Zentrale kannst du deine LKWs auftanken (HEMMT Fuel 25.000 L, Zamak fuel 14.000 L und VAN Fuel 5.000 L)<br/>Rot = Benzin dringend benötigt<br/>Gelb = Benzin geht langsam zu neige<br/>Grün = Kein Benzin benötigt<br/>Gehalt:<br/>Variiert zwischen 5k-700k"];};
    default {_control ctrlSetStructuredText parseText format["Dieser Job kann leider gerade nicht Angeboten werden! Er wird bald wieder zur Verfügung stehen"];};
};

ctrlShow [4803,true];
ctrlShow [4830,true];