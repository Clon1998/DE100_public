/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex","_cAdd"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {[localize "STR_NOTF_DeviceIsMining",true,"fast"] call life_fnc_notification_system;}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {[localize "STR_NOTF_DeviceFull",true,"fast"] call life_fnc_notification_system; life_action_inUse = false;};
_resourceZones = ["coal","apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","oil_2","rock_1","gold_1","silber","crystal_1"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 120) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	[localize "STR_NOTF_notNearResource",true,"fast"] call life_fnc_notification_system;
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
_item = switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {"apple"};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {"peach"};
	case (_zone in ["heroin_1"]): {"heroin_Unprocessed"};
	case (_zone in ["cocaine_1"]): {"cocaine_Unprocessed"};
	case (_zone in ["weed_1"]): {"cannabis"};
	case (_zone in ["lead_1"]): {"copper_Unrefined"};
	case (_zone in ["iron_1"]): {"iron_Unrefined"};
	case (_zone in ["salt_1"]): {"salt_Unrefined"};
	case (_zone in ["sand_1"]): {"sand"};
	case (_zone in ["diamond_1"]): {"diamond_Uncut"};
	case (_zone in ["oil_1","oil_2"]): {"oil_Unprocessed"};
	case (_zone in ["rock_1"]): {"rock"};
	case (_zone in ["coal"]): {"coal_unrefined"};
	case (_zone in ["gold_1"]): {"gold_unrefined"};
	case (_zone in ["silber"]): {"silver_unrefined"};
	case (_zone in ["crystal_1"]): {"meth_Unprocessed"};
	default {""};
};

if(_item == "") exitWith {["Fehler! Bitte beim Admin melden",true,"fast"] call life_fnc_notification_system; life_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

private _soundStart = time - 28.6;
while {true} do {
	if (time -_soundStart >= 28.6) then {
		[_vehicle,"Device_disassembled_loop"] remoteExec ["say3D",-2];
		_soundStart = time;
	};
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {[localize "STR_NOTF_MiningStopped",true,"fast"] call life_fnc_notification_system;};
	[localize "STR_NOTF_DeviceMining",false,"fast"] call life_fnc_notification_system;
	_time = time + 27;
	
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {[localize "STR_NOTF_MiningStopped",true,"fast"] call life_fnc_notification_system; true};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {[localize "STR_NOTF_MiningStopped",true,"fast"] call life_fnc_notification_system;};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call life_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_cAdd = [_item,10,_weight select 1,_weight select 0] call life_fnc_canAdd; //Get a sum base of the remaining weight.. 
	if(_cAdd < 1) exitWith {[localize "STR_NOTF_DeviceFull",true,"fast"] call life_fnc_notification_system;};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _cAdd;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_cAdd];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _cAdd]];
	};
	
	if(fuel _vehicle == 0) exitWith {[localize "STR_NOTF_OutOfFuel",true,"fast"] call life_fnc_notification_system;};
	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[_vehicle,(fuel _vehicle)-0.02] remoteExec ["setFuel",_vehicle];
	};
	
	if(fuel _vehicle == 0) exitWith {[localize "STR_NOTF_OutOfFuel",true,"fast"] call life_fnc_notification_system;};
	[format[localize "STR_NOTF_DeviceMined",_cAdd],false,"fast"] call life_fnc_notification_system;
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_cAdd = [_item,15,_weight select 1,_weight select 0] call life_fnc_canAdd; //Get a sum base of the remaining weight.. 
	if(_cAdd < 1) exitWith {[localize "STR_NOTF_DeviceFull",true,"fast"] call life_fnc_notification_system;};
	sleep 2;
};

_vehicle setVariable["mining",nil,true];