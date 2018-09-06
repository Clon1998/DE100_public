/*
	File:	fn_garageLBChange.sqf
	Date:   2017-01-01 15:15:51
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

disableSerialization;

params[
	["_vehList", controlNull, [controlNull]],
	["_index", 0, [0]]
];

private _display = findDisplay 2800;
private _descCtrl = _display displayCtrl 2803; 
private _dtype = _display getVariable ["Type",0];
private _data = parseSimpleArray format["%1",_vehList lbData _index];
if (_dtype == 0) then {
	_data params[
		["_className", "", [""]],
		["_color", "", [""]],
		["_trunk", "", [""]]
	];
	private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

	_trunk = [_trunk] call life_fnc_clientMresToArray;
	if (count _trunk == 0) then {
		_trunk = [[],0];
	};


	_space = if (isClass (missionConfigFile >> "lifeVehicles" >> _className)) then {
		getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "vItemSpace");
	} else {
		0;
	};
	if (_space < 0) then {
		_space = 0;
	};
	private _retrievePrice = switch (playerSide) do { 
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_garage_multiplier_THR");
	    };
	};

	private _buyMultiplier = switch (playerSide) do {
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
	    };
	};

	private _basePrice = round (getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * _buyMultiplier);
	_retrievePrice = round (_basePrice * _retrievePrice);
	private _sellPrice = round( _basePrice * getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_sell_multiplier"));

	private _items = "";
	if (count (_trunk select 0) > 0) then {
		{
			if((_x select 1) > 0 && ((getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "safeToDB")) isEqualTo 1)) then {
				private _c = if (((getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "illegal")) isEqualTo 1)) then {
					format["color='%1'",getText(missionConfigFile >> "Life_Settings" >> "dialog_illegal_color_hex")];
				} else {
					"";
				};
				_items = _items + format["<t %3>[%1] - %2 </t><br/>",(_x select 1),localize (getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName")),_c];
			};
		} foreach (_trunk select 0);
	} else {
		_items = "Keine Ladung";
	};
	_descCtrl ctrlSetStructuredText parseText format[
		""+(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>€%1</t><br/>"
		+(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>€%2</t><br/>"
		+(localize "STR_Shop_Veh_UI_Color")+ " %8<br/>"
		+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>"
		+(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>"
		+(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" 
		+(localize "STR_Shop_Veh_UI_Trunk")+ " %10/%6<br/>" 
		+(localize "STR_Shop_Veh_UI_Fuel")+ " %7 Liter<br/>"
		+ "%11<br/>"
		+"Ladung:<br/>%9",
	[_retrievePrice] call life_fnc_numberText,
	[_sellPrice] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_space,
	(getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "Fuel")),
	[_className,_color] call life_fnc_vehicleColorStr,
	_items,
	_trunk select 1,
	if (count _data == 4) then {if ((_data select 3) - time > 0) then {format["Abklingzeit: %1 Minuten<br/>",[((_data select 3) - time),"MM:SS"] call BIS_fnc_secondsToString];} else {"";};} else {"";}
	];


	_descCtrl ctrlSetPosition [0,0,0.180469 * safezoneW,ctrlTextHeight _descCtrl];
	_descCtrl ctrlCommit 0;
	ctrlShow [2803,true];
	ctrlShow [2830,true];
	if (count _data == 4) then {
		if ((_data select 3) - time > 0) then {
			ctrlEnable [1006, false];
		} else {
			ctrlEnable [1006, true];
			ctrlEnable [2842, true];
			_control lbSetData [_index, str (_data select [0,3])];
			_control lbSetColor [_index, [1, 1, 1, 1]];
		};
	} else {
		ctrlEnable [2842, true];
		ctrlEnable [1006, true];
	};
} else {
	_data params[
		["_className", "", [""]],
		["_color", "", [""]]
	];
	private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;


	_space = if (isClass (missionConfigFile >> "lifeVehicles" >> _className)) then {
		getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "vItemSpace");
	} else {
		0;
	};

	if (_space < 0) then {
		_space = 0;
	};
	
	private _retrievePrice = switch (playerSide) do { 
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_depo_multiplier_THR");
	    };
	};

	private _buyMultiplier = switch (playerSide) do {
	    case civilian: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN");
	    };
	    case west: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP");
	    };
	    case independent: {
	        getNumber(missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_THR");
	    };
	};

	private _basePrice = round (getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "price") * _buyMultiplier);
	_retrievePrice = round (_basePrice * _retrievePrice);

	_descCtrl ctrlSetStructuredText parseText format[
		"Kaution <t color='#8cff9b'>€%1</t><br/>"
		+(localize "STR_Shop_Veh_UI_Color")+ " %7<br/>"
		+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>"
		+(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>"
		+(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" 
		+(localize "STR_Shop_Veh_UI_Trunk")+ " 0/%5<br/>" 
		+(localize "STR_Shop_Veh_UI_Fuel")+ " %6 Liter<br/>"
		+"Ladung:<br/> Keine Ladung",
	[_retrievePrice] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_space,
	(getNumber(missionConfigFile >> "lifeVehicles" >> _className >> "Fuel")),
	[_className,_color] call life_fnc_vehicleColorStr
	];


	_descCtrl ctrlSetPosition [0,0,0.180469 * safezoneW,ctrlTextHeight _descCtrl];
	_descCtrl ctrlCommit 0;
	ctrlShow [2803,true];
	ctrlShow [2830,true];
	ctrlEnable [1006, true];
};
