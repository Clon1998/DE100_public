/*
	File:	fn_load_Customers.sqf
	Date:   2016-07-29 18:43:36
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_display", displayNull, [displayNull]]
];

private _customersListBox = _display displayCtrl 13526;

{
	private _customer = _x select 0;
	private _customerName = _x select 1;
	if (!isNull _customer) then {
		_customersListBox lbAdd _customerName;
		_customersListBox lbSetData [(lbSize _customersListBox)-1, netId _customer];
	} else {
		life_taxi_customers set [_forEachIndex,[objNull,""]];
	};
} forEach life_taxi_customers;

life_taxi_customers = life_taxi_customers - [objNull,""];