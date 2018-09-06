#include "\life_shared\script_macros.hpp"
/*
	File:	fn_load.sqf
	Date:   2017-03-22 19:09:30
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _result = 0;
private _return = true;
if (uiNamespace getVariable ["MYSQL_SOCKET",0] == 0) then {
	MYSQL_SOCKET = round random 9999;
	uiNamespace setVariable ["MYSQL_SOCKET",MYSQL_SOCKET];
	MYSQL_SOCKET = compileFinal str MYSQL_SOCKET;
	try {
        _result = parseSimpleArray ("extDB3" callExtension "9:ADD_DATABASE:DE100_Main_Server");
        if (_result select 0 isEqualTo 0) then {
        	throw "extDB3: Error with Database Connection";
        };

        _result = parseSimpleArray ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:DE100_Main_Server:SQL:%1:TEXT", call MYSQL_SOCKET]);
        
        if (_result select 0 isEqualTo 0) then {
        	throw "extDB3: Error with Database Connection";
        };
        "extDB3" callExtension "9:LOCK";
        diag_log format["extDB3 v%1 loaded","extDB3" callExtension "9:VERSION"];
    } catch {
        diag_log _exception;
        _return = false;
    };

} else {
	MYSQL_SOCKET = compileFinal str (uiNamespace getVariable ["MYSQL_SOCKET",0]);
	diag_log format["extDB3 v%1 was running","extDB3" callExtension "9:VERSION"];
};

_return;