/*
	File:	fn_tazed.sqf
	Date:   2016-08-15 02:47:25
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
params[
	["_unit", objNull, [objNull]],
	["_shooter", objNull, [objNull]]
];
closeDialog 0;
if(isNull _unit or isNull _shooter) exitWith {};
private _fnc = {
	_this setUnconscious false;
	disableUserInput false;
	_this allowDamage true;
	[_this,"UnconsciousOutProne"] spawn life_fnc_doAnimation;
	life_istazed = false;
};
if(_shooter isKindOf "Man" && alive player && !life_istazed) then {
	life_istazed = true;
	life_interrupted = true;
	disableUserInput true;
	[_unit,"Tazersound"] remoteExec ["say3D",-2];
	
	player setUnconscious true;
	player allowDamage false;
	[0,"STR_NOTF_Tazed",true,[player call life_fnc_name, _shooter call life_fnc_name]] remoteExecCall ["life_fnc_broadcast",-2];
	if (life_HC_isActive) then {
		[getPlayerUID player, 14, [format["%1 wurde von %2 getazert",player call life_fnc_nameUID, _shooter call life_fnc_nameUID],[getPlayerUID _shooter,15,format["%2 hat %1 getazert",player call life_fnc_nameUID, _shooter call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",HC_Life];
	} else {
		[getPlayerUID player, 14, [format["%1 wurde von %2 getazert",player call life_fnc_nameUID, _shooter call life_fnc_nameUID],[getPlayerUID _shooter,15,format["%2 hat %1 getazert",player call life_fnc_nameUID, _shooter call life_fnc_nameUID]]]] remoteExecCall ["MSC_fnc_log",2];
	};
	life_interrupted = false;
	[30,"Du wurdest getazert",{false},player,_fnc,_fnc] spawn life_fnc_progressBar;
};