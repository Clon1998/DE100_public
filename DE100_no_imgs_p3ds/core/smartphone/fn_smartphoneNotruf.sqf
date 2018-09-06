/*
	
	file: fn_smartphoneNotruf.sqf
	Author: GamerDF
	Made for Nameless-Gaming Altis Life
*/

private["_to","_type","_playerData","_msg","_isonline","_btnAdmin","_btnCop","_btnThr"];
disableSerialization;

params[
	["_type", 0, [0]],
	["_msg", "", [""]]
];
private _addZero = {
	params[
		["_number", 0, [0]]
	];
	if (_number < 10) exitWith {
		format ["0%1",_number];
	};
	_number;
};

private _pos = if (cbChecked ((findDisplay 7000) displayCtrl 7011)) then {
	getPos player;
} else {
	false;
};

switch(_type) do
{
	//Spieler Deaktivieren ADM MSG ALL // Admin Deaktivieren ADM MSG zu mir selbst
	case 0:
	{
		private _display = findDisplay 7000;
		_btnAdmin = _display displayCtrl 7006;
		_btnThr = _display displayCtrl 7008;
		_btnCop = _display displayCtrl 7010;

		if(((call life_adminlevel) > 0)) then
		{
			_btnAdmin buttonSetAction "[4,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnAdmin ctrlSetTooltip "Admin Nachricht";
		} else {
			_btnAdmin buttonSetAction "[3,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnAdmin ctrlSetTooltip "An Admin";
		};

		if(((call life_coplevel) >= 10)) then
		{
			_btnCop buttonSetAction "[5,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnCop ctrlSetTooltip "An Bewohner";
		} else {
			_btnCop buttonSetAction "[1,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnCop ctrlSetTooltip "An Polizei";
		};
		if ((call life_thrlevel) >= 5) then {
			_btnThr buttonSetAction "[6,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnThr ctrlSetTooltip "An Bewohner";
		} else {
			_btnThr buttonSetAction "[2,(ctrlText 7003)] call life_fnc_smartphoneNotruf;";
			_btnThr ctrlSetTooltip "An THR";
		};
	};
	
	//Nachricht an Polizei
	case 1:
	{
		if ((west countSide allPlayers) == 0) exitWith {
			["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal.",true,"slow"] call life_fnc_notification_system;
		};
		
		ctrlShow[7010,false];
		
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
			ctrlShow[7010,true];
		};
		if !(_pos isEqualTo false) then {
			private _req = bank_obj getVariable ["Requests",[]];
			private _i = [netId player, _req] call life_fnc_index;

			if (_i >= 0) then {
				_r = (_req select _i) select 1;
				_r pushBack [format["%1:%2",(life_real_Time select 3) call _addZero,(life_real_Time select 4) call _addZero],_pos,_msg];
				_req set [_i,[netId player,_r]];
			} else {
				_req pushBack [netId player,[[format["%1:%2",(life_real_Time select 3) call _addZero,(life_real_Time select 4) call _addZero],_pos,_msg]]];
			};
			bank_obj setVariable ["Requests",_req,true];
		};
		[_msg,name player,1,_pos] remoteExecCall ["life_fnc_clientMessage",west];
		_to = "der Polizei";
		[format["Du hast %1 folgende Nachricht gesendet:<br/><br/> %2",_to,_msg],false,"slow"] call life_fnc_notification_system;
		ctrlShow[7010,true];
		closeDialog 0;
	};
	
	//Nachricht an Medic
	case 2:
	{
		if((independent countSide allPlayers) == 0) exitWith 
		{
			["Zurzeit ist kein THR-Mitglied im Dienst. Bitte probiere es später nochmal.",true,"slow"] call life_fnc_notification_system;
		};
		
		ctrlShow[7009,false];
		
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
			ctrlShow[7009,true];
		};
		[_msg,name player,5,_pos] remoteExecCall ["life_fnc_clientMessage",independent];
		_to = "dem THR Team";
		[format["Du hast %1 folgende Nachricht gesendet:<br/><br/> %2",_to,_msg],false,"slow"] call life_fnc_notification_system;
		ctrlShow[7009,true];
		closeDialog 0;
	};
	
	//Nachricht an Admin
	case 3:
	{
		ctrlShow[7007,false];
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
			ctrlShow[7007,true];
		};
		[_msg,name player,2,_pos] remoteExecCall ["life_fnc_clientMessage",allPlayers select {_x getVariable["isAdmin",0] > 0}];
		_to = "einem Admin";
		[format["Du hast %1 folgende Nachricht gesendet:<br/><br/> %2",_to,_msg],false,"slow"] call life_fnc_notification_system;
		ctrlShow[7007,true];
		closeDialog 0;
	};
	
	//Nachricht vom Admin an alle
	case 4:
	{
		if((call life_adminlevel) < 1) exitWith 
		{
			["Du bist kein Admin!",true,"fast"] call life_fnc_notification_system;
		};
		
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
		};
		[_msg,name player,4] remoteExecCall ["life_fnc_clientMessage",-2];
		[format["Admin Nachricht an alle:<br/><br/> %1",_msg],false,"slow"] call life_fnc_notification_system;
		closeDialog 0;
	};

	case 5:
	{	
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
		};
		[_msg,name player,3] remoteExecCall ["life_fnc_clientMessage",-2];
		[format["Polizei Mitteilung an alle:<br/><br/> %1",_msg],false,"slow"] call life_fnc_notification_system;
		closeDialog 0;
	};

	case 6:
	{	
		if(_msg in ["..............",""]) exitWith 
		{
			["Du musst etwas Schreiben!",true,"fast"] call life_fnc_notification_system;
		};
		[_msg,name player,6] remoteExecCall ["life_fnc_clientMessage",-2];
		[format["THR Mitteilung an alle:<br/><br/> %1",_msg],false,"slow"] call life_fnc_notification_system;
		closeDialog 0;
	};
};