/*
	File:	fn_customer_info.sqf
	Date:   2016-07-29 18:50:55
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;
params[
	["_customersListBox", controlNull, [controlNull]],
	["_index", -1, [0]]
];

private _display = findDisplay 13525;
private _infoText = _display displayCtrl 13529;
private _btnAccept = _display displayCtrl 13527;
private _btnAbored = _display displayCtrl 13528;

private _customer = objectFromNetId (_customersListBox lbData _index);

if(isNil "_customer") exitWith {};
if(isNull _customer) exitWith {};

if (_customer getvariable ["inTaxi",false]) then {
	_btnAccept ctrlShow false;
	_btnAbored ctrlShow false;
	private _taxiDriver = _customer getVariable ["TaxiDriver",""];
	if ((player call life_fnc_name) isEqualTo _taxiDriver) then {
		_btnAbored ctrlShow true;
	};
	_infoText ctrlSetStructuredText parseText format["<t size='1'><br/>Taxifahrer ist auf dem weg:<br/>%1 </t>",_taxiDriver];
} else {
	_btnAccept ctrlShow true;
	_btnAbored ctrlShow false;
	_infoText ctrlSetStructuredText parseText "";
};