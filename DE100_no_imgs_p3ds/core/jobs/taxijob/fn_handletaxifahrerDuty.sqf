/*
	File:	fn_handletaxifahrerDuty.sqf
	Date:   24.11.2015
	Author: Unkown
	
	Description:
	Take a look for yourself.
*/

private["_type"];
_type = _this select 3;
if(_type==1) then {	
	[1,getPlayerUID player,position player] remoteExec ["TON_fnc_handlealleTaxis",2];
	taxionduty=1;
	hint "Du bist nun im Taxidienst.";
} else {
	[2,getPlayerUID player] remoteExec ["TON_fnc_handlealleTaxis",2];
	taxionduty = 0;
	hint "Du bist nun aus dem Taxidienst.";
};