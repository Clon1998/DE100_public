#include "\life_shared\script_macros.hpp"
/*
	File:	fn_asyncCall.sqf
	Date:   2017-03-22 17:42:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

params [
	["_queryStmt", "", [""]],
	["_mode", 1, [0]],
	["_multiarr", false],
	"_queryResult",
	"_key",
	"_return",
	"_loop"
];

_key = "extDB3" callExtension format["%1:%2:%3",_mode,(call MYSQL_SOCKET),_queryStmt];
if(_mode == 1) exitWith {true};
 
_key = parseSimpleArray format["%1",_key];
_key = _key select 1;

_queryResult = "";
_loop = true;
for "_i" from 0 to 1 step 0 do {
	if (!_loop) exitwith {};
    _queryResult = "extDB3" callExtension format["4:%1", _key];
    if (_queryResult isEqualTo "[5]") then {
		_queryResult = "";
		for "_j" from 0 to 1 step 0 do {
			_pipe = "extDB3" callExtension format["5:%1", _key];
			if(_pipe isEqualTo "") exitWith {_loop = false;};
        	_queryResult = _queryResult + _pipe;
        };
    } else {
		if !(_queryResult isEqualTo "[3]") then {
			_loop = false;
		};
	};
};

if (isNil "_queryResult") then {
	_queryResult = "[]";
};
_queryResult = parseSimpleArray _queryResult;
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Protocol Error: %1", _queryResult]; [];};
_return = (_queryResult select 1);
 
if(!_multiarr && count _return > 0) then {
    _return = _return select 0;
};
 
_return;