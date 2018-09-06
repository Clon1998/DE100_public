/*
	File : fn_profsetup.sqf
	Date:   26.10.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];
setMousePosition [0.5, 0.5];
_tLB = _display displayCtrl 7730;
_aLB = _display displayCtrl 7731;
_rLB = _display displayCtrl 7732;
_iTxt = _display displayCtrl 7733;


lbClear _tLB;
lbClear _aLB;
lbClear _rLB;


_iTxt ctrlSetStructuredText parseText format["<t size='1.05' align='left'>Das hier ist das Erfahrungsmenü.<br/>Hier werden dir deine aktuellen Level und die daraus folgenden Vorteile für deine einzelnen Fertigkeiten angezeigt. <br/>Erfahrung erhältst du durch das Farmen bzw. durch das Verarbeiten von Ressourcen. <br/><br/>Das maximale Level für alle Fertigkeiten ist 10. </t>"];

switch(playerSide) do {
	case west: {
		_tLB lbSetData [_tLB lbAdd format ["Charakter"], "Character"];
	}; 
	case civilian: {
		_tLB lbSetData [_tLB lbAdd format ["Charakter"], "Character"];
		_tLB lbSetData [_tLB lbAdd format ["Sammeln / Abbauen"], "Gather"];
		_tLB lbSetData [_tLB lbAdd format ["Verarbeiten"], "Process"];
	}; 
	case independent: {
		_tLB lbSetData [_tLB lbAdd format ["Charakter"], "Character"];
	};	
};

_tLb lbSetCurSel 0;