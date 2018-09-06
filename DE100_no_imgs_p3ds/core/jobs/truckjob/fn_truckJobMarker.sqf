private["_fuelstations","_setmarker","_fuel","_name","_marker","_Pos","_markers"];

_setmarker = false;
_delmarker = false;
_markers = [];
while {true} do
{
	waitUntil {sleep 3; (life_civjob == 1)};
	{
		//hint "TankJob: Du bekommst die Benzinladung zum betanken der Tankstellen beim OilTrader";
		_Pos = _x select 2;
		_name = format["tank_%1",_x select 0];
		_marker = createMarkerLocal [_name, _Pos]; 
		_markers set[count _markers,_name];
	}foreach tankstellen;

	
	while {life_civjob == 1} do
    {
       	{
			_name = format["tank_%1",_x select 0];
			_text = format["Tankstand: %1L",_x select 1];
			_fuel = _x select 1;
			if(_fuel > 40000)then{
				_name setMarkerColorLocal "ColorGreen";
			};
			if(_fuel < 40000)then{
				_name setMarkerColorLocal "ColorYellow";
			};
			if(_fuel < 10000)then{
				_name setMarkerColorLocal "ColorRed";
			};
			_name setMarkerTextLocal _text;
			_name setMarkerTypeLocal "mil_dot";	
			
		}foreach tankstellen;
        if(life_civjob != 1) exitWith {};
        sleep 20;
    };
	//{_x setMarkerAlphaLocal 0} forEach tankstellen;
	{
		_name = format["tank_%1",_x select 0];
		deleteMarkerLocal _name;
	} foreach tankstellen;
	

	
	sleep 30;
};