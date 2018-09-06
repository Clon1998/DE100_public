/*
	File:	fn_openLPick.sqf
	Date:   2017-05-31 23:25:53
	Author: Patrick "Lucian" Schmidt (DE100) & - RamBob(Team ELAN)
	Disclaimer: This script was developted as a result of a co-operation betwen DE100-Altis.Life and Team-Elan.de.
				No one besides the two mentioned communitys is allowed to use and/or edit the script.
	
	Description:
	tolerance = Tolleranz zum Abstand des Target Winkels
	perc = 	Beeinflusst, wie Stark die abweichung beim Drehen des Schlosses ist. Kleinere Werte -> Beim drehen des Schlosses muss der Winkel des Lpicks
			öfters angepasst werden als bei großen werten.
*/
disableSerialization;

params[
	["_tolerance", getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_tolerance")],
	["_perc", getNumber(missionConfigFile >> "Life_Settings" >> "lpick_sys_perc")],
	["_params", []],
	["_onSuccess",{}]
];

hintSilent parseText "<t><t size='1.45' color='#a86400'>Hinweis</t><br/><t align='center'>Durch Drücken der Maustaste und Bewegen der Maus wird der Dietrich ausgerichtet.<br/>Mit der Taste E kannst du das Schloss bewegen.";

uiNamespace setVariable ["de100_lPickSys_tol",_tolerance];
uiNamespace setVariable ["de100_lPickSys_perc",_perc];
uiNamespace setVariable ["de100_lPickSys_params",_params];
uiNamespace setVariable ["de100_lPickSys_code",_onSuccess];
createDialog "lockpick_system";