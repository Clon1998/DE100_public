#include "\life_hc\hc_macros.hpp"
/*
	File:	fn_dynMarketInit.sqf
	Date:   16.04.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private ["_query","_queryResult","_dbData","_VarName","_price","_checkForErrors","_VItem","_tmp"];
if (isNil "DYN_Ready") then {
	DYN_Ready = true;
	_query = format["SELECT Item, Price FROM dynmarkt"];
	_dbData = [_query,2,true] call DB_fnc_asyncCall;
	//Checks for new VirtItems
	if (count _dbData != count DYN_ITEM_TO_TRACK) then {
		{
			_VarName = configName(_x);
			//Make sure item is new
			if (([_VarName,_dbData] call life_fnc_index) == -1 && DYN_ITEM_MAXPRICE(_VarName) > 0) then {
				_price = DYN_ITEM_AVGPRICE(_VarName);
				_query = format["INSERT INTO dynmarkt (Item, Price) VALUES('%1','%2')",_VarName,_price];
				[_query,1] call DB_fnc_asyncCall;
				_dbData pushBack [_VarName,_price];
				[format["New Item %1 was added to the DB",_VarName],"DynMarketLog"] call A3Log;
			};
		} forEach (DYN_ITEM_TO_TRACK);
	};


	//Check for Config errors
	_checkForErrors = [];
	{
		_VItem = configName(_x);
		_tmp = DYN_ITEM_GET_RELATED_ITEMS(_VItem);
		{
			if !(_VItem in DYN_ITEM_GET_RELATED_ITEMS(_x)) then {
				_checkForErrors pushBack format["%2 in RelatedItems of %1 but %1 not in RelatedItems of %2. Check RelatedItems array in Config_vItems / %2",_VItem,_x];
			};
		} forEach _tmp;
	} forEach (DYN_ITEM_TO_TRACK);


	//Some error Logging
	if (count _checkForErrors > 0) then {
		{
			call {
				if (_forEachIndex isEqualTo 0) exitWith {
					[["######################## DYNAMIC MARKET ERROR ########################",_x],"DynMarketLog"] call A3Log;
				};
			
				if (_forEachIndex isEqualTo (count _checkForErrors -1)) exitWith {
					[[_x,"########################  DYNAMIC MARKET END  ########################"],"DynMarketLog"] call A3Log;
				};
				
				[_x,"DynMarketLog"] call A3Log;
			};	
		} forEach _checkForErrors;
		DYN_Ready = false;
	};


	//Some logging
	if (DYN_Ready) then {
		[["######################## DYNAMIC MARKET STARTED ########################","------------------------ Generated Price List!  ------------------------","------------------------  HeadlessClient Side!  ------------------------"],"DynMarketLog"] call A3Log;
		{
			[format["%1 generated with €%2",_x select 0, _x select 1],"DynMarketLog"] call A3Log;
		} forEach _dbData;
		["########################  DYNAMIC MARKET Ended  ########################","DynMarketLog"] call A3Log;
	};


	//
	DYN_Price_array = [];
	DYN_Last_Update_Price = [];
	{
		_VarName = _x select 0;
		_price = _x select 1;
		DYN_Price_array pushBack [_VarName,_price,_price,0];
		DYN_Last_Update_Price pushBack [_VarName,_price];
	} forEach _dbData;;
	PVAR_ALL("DYN_Price_array");
	PVAR_ALL("DYN_Last_Update_Price");
	PVAR_ALL("DYN_Ready");
};


while {true} do {
	private["_item","_price","_crntInfo","_query","_changed","_msg"];
	sleep 300;
	_changed = false;
	_msg = ["######################## DYNAMIC MARKET UPDATE  ########################","------------------------  Updated Prices List!  ------------------------","------------------------  HeadlessClient Side!  ------------------------"];
	{
		_item = _x select 0;
		_price =  _x select 1;
		_index = [_item,DYN_Price_array] call life_fnc_index;
		_crntInfo = DYN_Price_array select _index;

		if (_price != (_crntInfo select 1)) then {
			if (_price > DYN_ITEM_MAXPRICE(_item)) then {_price = DYN_ITEM_MAXPRICE(_item);};
			if (_price < DYN_ITEM_MINPRICE(_item)) then {_price = DYN_ITEM_MINPRICE(_item);};
			DYN_Price_array set [_index,[_item,_price,_crntInfo select 2,(_price - (_crntInfo select 1))]];
			_query = format["UPDATE dynmarkt SET Price='%1' WHERE Item='%2'",_price,_item];
			[_query,1] call DB_fnc_asyncCall;

			_msg pushBack (format["%1 updated Newprice €%2",_item,_price]);
			if (!_changed) then {_changed = true;};
		};
	} forEach DYN_Last_Update_Price;
	if (_changed) then {
		_msg pushBack "########################  DYNAMIC MARKET Ended  ########################";
		[_msg,"DynMarketLog"] call A3Log;
	};
	PVAR_ALL("DYN_Price_array");
};