/*
	File:	fn_dynMarketChangePrice.sqf
	Date:   01.08.16 21:38
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	Description:
	Take a look for yourself.
*/


params [
	["_mode", "ERROR", [""]],
	["_VItem", "ERROR", [""]],
	["_Amount", -1, [0]],
	"_RelatedItems",
	"_Factor",
	"_index",
	"_blah"
];
if ((_mode isEqualTo "ERROR") || (_VItem isEqualTo "ERROR")) exitWith {
	if (life_HC_isActive) then {
		[["######################## DYNAMIC MARKET ERROR ########################","DynMarket couldnt Update the Price of a VirtItem. Here are the Params:",format["_mode :  %1",_mode],format["_VItem :  %1",_VItem],format["_PriceDiff :  %1",_PriceDiff],"########################  DYNAMIC MARKET END  ########################"],"DynMarketLog"] remoteExec ["A3Log",HC_Life];
	} else {
		[["######################## DYNAMIC MARKET ERROR ########################","DynMarket couldnt Update the Price of a VirtItem. Here are the Params:",format["_mode :  %1",_mode],format["_VItem :  %1",_VItem],format["_PriceDiff :  %1",_PriceDiff],"########################  DYNAMIC MARKET END  ########################"],"DynMarketLog"] remoteExec ["A3Log",2];
	};
};
if (!DYN_Ready) exitWith {
	if (life_HC_isActive) then {
		["######################## DYNAMIC MARKET NOTREADY ########################","DynMarketLog"] remoteExec ["A3Log",HC_Life];
	} else {
		["######################## DYNAMIC MARKET NOTREADY ########################","DynMarketLog"] remoteExec ["A3Log",2];
	};
};

_RelatedItems = getArray(missionConfigFile >> "VirtualItems" >> _VItem >> "relatedItems");
_Factor = (count _RelatedItems) * 4;
call {
	if (_mode isEqualTo "BUY") exitWith {
		_Factor = _Factor * 1;
		_blah = -1 * 4;
	};

	if (_mode isEqualTo "SELL") exitWith {
		if (life_HC_isActive) then {
			[_VItem,_Amount] remoteExec ["MSC_fnc_itemTracker",HC_Life];
		} else {
			[_VItem,_Amount] remoteExec ["MSC_fnc_itemTracker",2];
		};
		_Factor = _Factor * (-1);
		_blah = 1 * 4;
	};
};	

//Update the Item
_index = [_VItem,DYN_Last_Update_Price] call life_fnc_index;
_newPrice = ((DYN_Last_Update_Price select _index) select 1) + (_Factor * _Amount);
//CHECKS NEED TO BE ADDED

DYN_Last_Update_Price set [_index,[_VItem,_newPrice]];

//Update the RelatedItems
{
	_index = [_x,DYN_Last_Update_Price] call life_fnc_index;
	_newPrice = ((DYN_Last_Update_Price select _index) select 1) + (_blah * _Amount);
	//CHECKS NEED TO BE ADDED

	DYN_Last_Update_Price set [_index,[_x,_newPrice]];
} forEach _RelatedItems;

publicVariable "DYN_Last_Update_Price";