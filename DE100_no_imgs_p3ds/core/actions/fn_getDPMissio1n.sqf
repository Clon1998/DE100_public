/*
	File:	fn_getDPMissio1n.sqf
	Date:   2017-06-14 18:15:22
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

["Die Liefermissionen sind im Moment leider nicht verfügbar.", false, "fast"] call life_fnc_notification_system;

/*
private["_dp","_target"];
_target = param [0,objNull,[objNull]];
if(str(_target) in life_dp_point1s) then
{
	private["_point"];
	_point = life_dp_point1s - [(str(_target))];
	_dp = selectRandom _point;
}
	else
{
	_dp = selectRandom life_dp_point1s;
};

life_dp_start = _target;

life_delivery_in_progress = true;
life_dp_punkt = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_punkt]];
life_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;


[format [localize "STR_NOTF_DPTask",toUpper _dp],false,"fast"] call life_fnc_notification_system; 
[] spawn
{
	waitUntil {!life_delivery_in_progress or !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		[format [localize "STR_NOTF_DPFailed"],true,"fast"] call life_fnc_notification_system; 
		life_delivery_in_progress = false;
		life_dp_punkt = nil;
	};
};*/