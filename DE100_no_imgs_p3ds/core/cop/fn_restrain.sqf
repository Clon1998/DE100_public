/*
	File:   fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
params[
	["_source", Objnull, [Objnull]]
];
if (isNull _source) exitwith {};

[_source] execFSM "core\fsm\restrain.fsm";