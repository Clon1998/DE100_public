private["_modus","_guid","_posi","_false","_array","_i","_posi1","_myCount","_myCount1"];

_modus = [_this,0,0,[0]] call BIS_fnc_param;
_guid = [_this,1,"",[""]] call BIS_fnc_param;
_posi = [_this,2,[],[[]]] call BIS_fnc_param;

switch (_modus) do {
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
case 1: {

_array = [];
_array pushback _guid;
_false = false;
_array pushback _false;
_array pushback _posi;
alleTaxifahreronDuty pushback _array;
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
//diag_log format["anmelden: %1",alleTaxifahreronDuty];

};

case 2: {
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
for "_i" from 0 to count alleTaxifahreronDuty do {
	if(alleTaxifahreronDuty select _i select 0 == _guid) exitWith {
			
		
				alleTaxifahreronDuty set [_i,objNull];
				alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
	};	
};
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
//diag_log format["abmelden: %1",alleTaxifahreronDuty];
};
case 3: {
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
for "_i" from 0 to count alleTaxifahreronDuty do {
				if(alleTaxifahreronDuty select _i select 0 == _guid) exitWith {	
						alleTaxifahreronDuty set [_i,objNull];
						alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
			};		
};
_posi1 = [15000,15000,0];
_array = [];
_array pushback _guid;
_false = true;
_array pushback _false;
_array pushback _posi1;
alleTaxifahreronDuty pushback _array;
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
//diag_log format["Kunde: %1",alleTaxifahreronDuty];
};
case 4: {
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
for "_i" from 0 to count alleTaxifahreronDuty do {
				if(alleTaxifahreronDuty select _i select 0 == _guid) exitWith {	
						alleTaxifahreronDuty set [_i,objNull];
						alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
			};		
};
_posi1 = [15000,15000,0];
_array = [];
_array pushback _guid;
_false = false;
_array pushback _false;
_array pushback _posi1;
alleTaxifahreronDuty pushback _array;
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
//diag_log format["Fertig mit der fahrt: %1",alleTaxifahreronDuty];
};
case 5: {
alleTaxifahreronDuty = alleTaxifahreronDuty - [objNull];
_array = alleTaxifahreronDuty; // wollen ja local bleiben
//diag_log format["besetzte aussortieren: %1",_array];
for "_i" from 0 to count _array do {
				if(_array select _i select 1) then {	
						_array set [_i,objNull];
						_array = _array - [objNull];
						//diag_log format["löschung: %1",_array];
			};		
};
_array = _array - [objNull];
//if (count _array == 1) then && _array select 0 select 1) then {_array = []; diag_log format["arraycount ==1 : %1",_array];};
//diag_log format["liste: %1",_array];
[_array] remoteExec ["life_fnc_setTaxisArray",_guid];
};
};
 