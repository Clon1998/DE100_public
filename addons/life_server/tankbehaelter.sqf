/*
	File:	tankbehaelter.sqf
	Date:   2016-07-15 13:50:45
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/


private _queryResult = ["SELECT shop, tankvolumen FROM tankstellen",2,true] call DB_fnc_asyncCall;

tankstellen = [];
{
	tankstellen pushback [_x select 0,_x select 1,getmarkerpos( _x select 0)];
} foreach _queryresult;

publicVariable "tankstellen";