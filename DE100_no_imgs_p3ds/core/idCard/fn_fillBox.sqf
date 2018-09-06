/*
	File:	fn_fillBox.sqf
	Date:   18.02.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;
params[
	["_display", displayNull, [displayNull,controlNull]],
	["_type", "", [""]]
];

if (_display isEqualType controlNull) then {
	_display = ctrlParent _display;
};

private _iTxt = (_display displayCtrl 4001) controlsGroupCtrl 3;
private _txt = call {
	if (_type isEqualTo "Age") exitWith {
		"<t>Bitte trage eine Alter zwischen 10 Jahren und 120 Jahren ein.</t>";
	};
	if (_type isEqualTo "City") exitWith {
		"<t>Bitte trage eine fiktive Stadt ein.<br/>Minimal 4 Zeichen.<br/>Maximal 12 Zeichen.<br/><br/></t><t color='#ff0000'>Fäkal-Ausdrücke und Vulgärsprache wird bei uns nicht toleriert.</t>";
	};
	if (_type isEqualTo "Adress") exitWith {
		"<t>Bitte trage einen fiktiven Straßennamen und eine Hausnummer ein.<br/>Minimal 7 Zeichen.<br/>Maximal 17 Zeichen.</t><br/><br/><t color='#ff0000'>Fäkal-Ausdrücke und Vulgärsprache wird bei uns nicht toleriert.</t>";
	};
	if (_type isEqualTo "Size") exitWith {
		"<t>Bitte trage eine Größe zwischen 100 CM und 220 CM ein.</t>";
	};
	if (_type isEqualTo "Erfolg") exitWith {
		"<t>Alle Angaben entsprachen den Vorgaben. <br/>Bitte bestätige deine Angaben nochmal, indem du auf Bestätigen drückst.<br/>Solltest du die Angaben nochmal ändern wollen, kannst du einfach auf Zurück drücken.</t>";
	};
	format ["<t>Hallo und herzlich willkommen auf dem De100-Server %1.<br/>Wir heißen Sie in der Republik Altis willkommen und hoffen, dass Sie ein angenehmes und friedliches Leben hier führen können. Damit Sie sich ausweisen können, benötigen wir aber noch einige Daten von ihnen, welche sie bitte oben im Formular eintragen.<br/><t color='#ff0000'>Bitte trage NUR fiktive Daten ein, also NUR ausgedachte Daten.</t><br/>Bitte beachte, dass Sie eine <t color='#ff0000'>feste Identität</t> haben und somit nur gegen eine Gebühr beim Einwohnermeldeamt ihren Namen und die Daten ändern können. Desweiteren sollte ihr Name einen Vor- und Nachnamen enthalten. Sollte dies nicht der Fall sein, bitten wir Sie dies zu ändern. <br/><br/><br/>Das De100-Team ist nicht für die eingegebenen Daten zuständig und behält sich das Recht vor, jemanden aufgrund der eingegebenen Daten permanent des Servers zu verweisen (Ban).</t>", player call life_fnc_name];
};

_iTxt ctrlSetStructuredText parseText _txt;
private _pos = ctrlPosition _iTxt;
_pos set [3,ctrlTextHeight _iTxt];
_iTxt ctrlSetPosition _pos;