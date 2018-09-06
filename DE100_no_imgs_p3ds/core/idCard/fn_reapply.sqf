/*
   File:    fn_reapply.sqf
   Date:    2017-10-14 10:03:15
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

private _price = getNumber(missionConfigFile >> "Life_Settings" >> "idCard_reapply_price");
if !([format["Möchtest du dir wirklich eine neue Identität für %1€ kaufen?<br/>Dabei wird nur dein Name und dein Personalausweis zurückgesetzt.",_price call life_fnc_numberText],"Fortfahren?","Weiter","Abbrechen"]call BIS_fnc_GUIMessage) exitWith {};
if (_price > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus.", false, "fast"] call life_fnc_notification_system;
};
if (_price+(call life_fnc_calcDebts) > de100_luciandjuli_bc) exitWith {
	["Deine Geldmittel reichen dafür nicht aus, da du ggef. noch Auktionen bezahlen musst.", true, "fast"] call life_fnc_notification_system;
};
de100_mSpace setVariable ["cT",diag_tickTime];
de100_luciandjuli_bc = de100_luciandjuli_bc - _price;
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
player setVariable ["idCard",[],true];
["IDCARD"] call SOCK_fnc_updatePartial;
["Dein Name und Personalausweis wurden zurückgesetzt.<br/>Du wirst nun ausgeloggt und hast danach die Möglichkeit mit einem neuen Namen zu verbinden und Deinen Personalausweis neu zu beantragen.","Erfolgreich zurückgesetzt","Weiter"]call BIS_fnc_GUIMessage;
call life_fnc_logout;