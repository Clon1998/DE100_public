/*
   File:    fn_setClothingSkin.sqf
   Date:    2018-4-29 12:22:11
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/

disableSerialization;
params[
	["_ctrl", controlNull, [controlNull]],
	["_sI", [], [[],1]]
];
if (count _si != 3) exitWith {};
private _class = _ctrl tvData (_si select [0,2]);
private _color = _ctrl tvData _si;
private _oI = _ctrl getVariable [format["de100_%1_index",_class],[]];

_ctrl tvSetColor [_oI,[1,1,1,1]];
_ctrl tvSetColor [_si,[0,0.569,0.102,1]];

profileNamespace setVariable [format["de100_skin_%1_%2", _class, playerSide],_color];
_ctrl setVariable [format["de100_%1_index",_class],_si];

if (backpack player isEqualTo _class || uniform player isEqualTo _class) then {
    player call life_fnc_updateClothing;
};