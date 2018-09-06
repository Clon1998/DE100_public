// by commy2

DE100_Core_ScrollWheelFrame = diag_frameno;

DE100_Core_onScrollWheel = {
	_scroll = _this select 1;

	if (DE100_Core_ScrollWheelFrame == diag_frameno) exitWith {};
	DE100_Core_ScrollWheelFrame = diag_frameno;

	if (!isNull (missionNamespace getVariable ["DE100_Fortifications_Setup", objNull])) then {
		DE100_Fortifications_TweakedAngle = DE100_Fortifications_TweakedAngle + _scroll min 240 max 120;
	};
};