/*
	File:	fn_deCrypt.sqf
	Date:   2017-06-04 18:12:12
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Did you realy thought you could find the decrypt here ?
	Lmao, stop trying it.
*/

//make sure no one compiles those shared Lib Fncs
{
	missionNamespace setVariable [configName _x,compileFinal ""];
	nil;
} count ("getNumber(_x >> 'clientCompile') isEqualTo 1" configClasses (missionconfigfile >> "CfgRemoteExec" >> "Functions"));


if (missionNamespace getVariable ["de100_compiled",false]) exitwith {};

{
	private _fnc = format["%1_fnc_%2",getText(_x >> "tag"),configName _x];
	missionNamespace setVariable [_fnc,compile format['
		private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
		private _fnc_scriptName = "BIS_fnc_diagAAR";
		scriptName _fnc_scriptName;

		if (isNil "Exec_After") then {
			Exec_After = [];
		};
		Exec_After pushBack [_this,"%1",canSuspend];
	',_fnc]];
	nil;
} count ("true" configClasses (missionconfigfile >> "LucianCryptSys"));
diag_log "PreCompiled Fncs";