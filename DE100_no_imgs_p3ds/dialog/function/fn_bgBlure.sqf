/*
	File:	fn_bgBlure.sqf
	Date:   2017-05-31 15:09:54
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_display", displayNull, [displayNull]]
];

if ((_display getVariable ["Blur",-1]) >= 0) then {
	private _handle = _display getVariable ["Blur",-1]; 
	_handle ppEffectForceInNVG true;
	_handle ppEffectEnable true; 
	_handle ppEffectAdjust [2.5]; 
	_handle ppEffectCommit 0;
} else {
	private _handle = ppEffectCreate ["DynamicBlur", 401]; 
	_handle ppEffectForceInNVG true;
	_handle ppEffectEnable true; 
	_handle ppEffectAdjust [2.5]; 
	_handle ppEffectCommit 0;
	_display setVariable ["Blur",_handle];
};

_display displayAddEventHandler["Unload",{
	private _b = (_this select 0) getVariable ['Blur',-1];
	if (_b >= 0) then {
		_b ppEffectEnable false;
		ppEffectDestroy _b;
	};
}];