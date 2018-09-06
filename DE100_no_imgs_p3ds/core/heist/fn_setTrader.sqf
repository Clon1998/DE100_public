/*
Author: McKenzie
Description: Spawns in the Trader at a random Position to sell the objectofInterest. You´ll need 3 pre-defined Markers
*/

Private _number = floor (random 2);
params[
  ["_del",0],
  "_sub"
];

if (_del isEqualto 1) exitWith{
  _sub = fed_bank getVariable ["trader",objNull];
  "AtomicSell1" setMarkerAlpha 0;
  "AtomicSell2" setMarkerAlpha 0;
  "AtomicSell3" setMarkerAlpha 0;
  deleteVehicle _sub;
};


call {
  if (_number isEqualto 0) exitWith {
    _sub = "Submarine_01_F" createVehicle[22232.94,13159.158,0];
    _sub setDir 90;
    "AtomicSell1" setMarkerAlpha 1;
  };
  if (_number isEqualto 1) exitWith {
    _sub = "Submarine_01_F" createVehicle[3888.525,16594.719,0];
    _sub setDir 45;
    "AtomicSell2" setMarkerAlpha 1;
  };

  if (_number isEqualto 2) exitWith {
    _sub = "Submarine_01_F" createVehicle[13406.515,23298.664,0];
    _sub setDir 270;
    "AtomicSell3" setMarkerAlpha 1;
  };
};
_sub addAction["Ausländischer Kontakmann" , {_this call life_fnc_virt_menu}, "atomicTrader"];
_sub allowDammage false;
fed_bank setVariable ["trader",_sub,true];