/*
	File:	fn_build3dCache.sqf
	Date:   2017-05-25 14:23:35
	Author: Patrick "Lucian" Schmidt
	Inspired/Based on the CLIB 3dGraphics-System
	
	
	Description:
	Take a look for yourself.
*/

private _c = [];

{
	_c append (de100_3dNamespace getVariable [_x,[]]);
	nil;
} count (allVariables de100_3dNamespace);

de100_3dCache = +_c;