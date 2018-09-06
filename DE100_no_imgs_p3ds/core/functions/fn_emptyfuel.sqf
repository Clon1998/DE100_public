/*
	File:	fn_emptyfuel.sqf
	Date:   15.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Fuel manipulator
*/

[{2},time,{
	scriptName "Vehicle-Fuel-System";
	private _vehicle = objectParent player;
	if (!isNull _vehicle) then {
		private _fuel = fuel _vehicle;
		private _fuelCapacity = getNumber(missionConfigFile >> "lifeVehicles" >> (typeOf _vehicle) >> "Fuel");
		if (local _vehicle && isEngineOn _vehicle && !isNull objectParent player && _fuel > 0 && _fuelCapacity > 0) then {

			private _velocity = speed _vehicle;
			if (_velocity < 0) then {_velocity = _velocity * -1;};
			private _newFuel = (_fuelCapacity * _fuel - (_velocity * 0.00045 + ([0.0075,0] select (isOnRoad _vehicle)) + count(crew _vehicle) * 0.005 + ((_vehicle getVariable ["Trunk",[0,0]]) select 1) * 0.0015)) / _fuelCapacity;

			if (_newFuel < 0) then {
				_newFuel = 0;
			};
			_vehicle setFuel _newFuel;
			if (!isNil "DE100_Diagnostic") then {
				systemChat format["Verbrauch in Litern %1",(_velocity * 0.00045 + ([0.0075,0] select (isOnRoad _vehicle)) + count(crew _vehicle) * 0.005 + ((_vehicle getVariable ["Trunk",[0,0]]) select 1) * 0.0015)];
		    };
		};
	};
}]call life_fnc_threadControl;