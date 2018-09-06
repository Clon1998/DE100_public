/*
	File: fn_threadControl.sqf
	Author: Anton
	
	Description:
	Thread der mehrere Sleepzeiten vertägt
*/

params[
	["_interval", {1}, [{1}]],
	["_time", time, [time]],
	["_code", {}, [{}]]
];

if(isNil'life_threads')then{life_threads=[];execFSM"core\fsm\ThreadControl.fsm"};

life_threads pushBack[_interval,_time,_code];