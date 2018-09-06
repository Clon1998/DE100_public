/*
	File:	fn_refund.sqf
	Date:   2016-10-13 16:56:16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params[
	["_refundValue", 0, [0]],
	["_type", "ATM", [""]],
	["_msg", "", [""]]
];

de100_mSpace setVariable ["cT",diag_tickTime];
switch (_type) do { 
	case "ATM" : {
		de100_luciandjuli_bc = de100_luciandjuli_bc + _refundValue;
	}; 
	
	case "CASH" : {
		de100_luciandjuli_mula = de100_luciandjuli_mula + _refundValue;
	}; 
};
de100_mSpace setVariable ["cV",de100_luciandjuli_mula+de100_luciandjuli_bc];
[_msg,true,"slow"] call life_fnc_notification_system;