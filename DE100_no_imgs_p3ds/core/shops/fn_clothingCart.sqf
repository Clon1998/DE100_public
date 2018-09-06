/*
   File:    fn_clothingCart.sqf
   Date:    2017-10-20 13:42:58
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:

*/

params[
	["_ctrl", controlNull, [controlNull]],
	["_sI", [], [[],1]],
	"_class",
	"_txt",
	"_pic",
	"_price"
];
scopeName "main";

private _display = ctrlParent _ctrl;
private _lb = _display displayCtrl 4003;

private _add = false;
if (ctrlType _ctrl == 12) then {
	_class = _ctrl tvData _sI;
	if (_class isEqualTo "exit") exitWith {breakOut "main"};
	_txt = _ctrl tvText _sI;
	_pic = _ctrl tvPicture _sI;
	_price = _ctrl tvValue _sI;
	_add = true;
} else {
	_class = _ctrl lbData _sI;
	if (_class isEqualTo "exit") exitWith {breakOut "main"};
};
private _cart = _display getVariable ["inCart",[]];
private _pObj = _display getVariable ["prevObj",objNull];
private _type = (_class call Bis_fnc_itemType) select 1;
private _fI = _cart find _type;

private _addItem = {
	call {
		if (_type isEqualTo "Uniform") exitWith {
			removeUniform _pObj;
			_pObj forceAddUniform _class;
		};
		if (_type isEqualTo "Vest") exitWith {
			removeVest _pObj;
			_pObj addVest _class;
		};
		if (_type isEqualTo "Backpack") exitWith {
			removeBackpack _pObj;
			_pObj addBackpack _class;
		};
		if (_type isEqualTo "Headgear") exitWith {
			removeHeadgear _pObj;
			_pObj addHeadgear _class;
		};
		if (_type isEqualTo "Glasses") exitWith {
			removeGoggles _pObj;
			_pObj addGoggles _class;
		};
	};
	_pObj call life_fnc_updateClothing;
};

if (_fI < 0) then {
	private _i = _lb lbAdd _txt;
	_lb lbSetPicture [_i,_pic];
	_lb lbSetData [_i,_class];
	_lb lbSetValue [_i,_price];
	_lb lbSetCurSel _i;
	_cart pushBackUnique _type;
	call _addItem;
} else {
	if (_add) then {
		_cart deleteAt _fI;
		_lb lbDelete _fI;
		
		private _i = _lb lbAdd _txt;
		_lb lbSetPicture [_i,_pic];
		_lb lbSetData [_i,_class];
		_lb lbSetValue [_i,_price];
		_lb lbSetCurSel _i;

		_cart pushBackUnique _type;
		_lb lbSetCurSel _i;
		call _addItem;
	} else {
		_cart deleteAt _fI;
		_lb lbDelete _fI;
		_lb lbSetCurSel (_fI -1);
		call {
			if (_type isEqualTo "Uniform") exitWith {removeUniform _pObj;};
			if (_type isEqualTo "Vest") exitWith {removeVest _pObj;};
			if (_type isEqualTo "Backpack") exitWith {removeBackpack _pObj;};
			if (_type isEqualTo "Headgear") exitWith {removeHeadgear _pObj;};
			if (_type isEqualTo "Glasses") exitWith {removeGoggles _pObj;};
		};
	};
};
_display setVariable ["inCart",_cart];
