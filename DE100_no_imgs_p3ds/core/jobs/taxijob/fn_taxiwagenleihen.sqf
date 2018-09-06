private ["_standort"];

_standort = _this select 3;

switch(_standort) do {
	
	case 1: {
	
		["job_2",civilian,"taxizstandkavalla","civ","Taxiwagen Vermietung",true] call life_fnc_vehicleShopMenu;
	};

};
