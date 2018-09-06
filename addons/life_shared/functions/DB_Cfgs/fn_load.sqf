/*
	File:	fn_load.sqf
	Date:   2017-08-14 15:38:33
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

private _s = ["SELECT id, class, text, allowed_site, needs_license FROM arma_cfgs.al_shops;",2,true] call DB_fnc_asyncCall;
private _o = [];
{
	private _d = [];
	private _as = [];
	{
		if (_x isEqualTo "1") then {
			_as pushBackUnique (["civ","cop","thr","nobody"] select _forEachIndex);
		};
	} forEach ((_x select 3) call str_fnc_toArray);

	["license",_d,_x select 4] call life_fnc_setDataAtKey;
	["title",_d,_x select 2] call life_fnc_setDataAtKey;
	["allowedSides",_d,_as] call life_fnc_setDataAtKey;

	private _i = [format["SELECT (SELECT classname FROM arma_cfgs.a3_items WHERE id = item_id),customName, price,(SELECT class FROM arma_cfgs.a3_types WHERE id = (SELECT type FROM arma_cfgs.a3_items WHERE id = item_id)), perm_var, perm_val, perm_type FROM arma_cfgs.al_shopitems WHERE shop_id='%1' ORDER BY price ASC;",_x select 0],2,true] call DB_fnc_asyncCall;

	{
		_x params[
			["_class", ""],
			["_customName", ""],
			["_price", 0],
			["_key", ""],
			["_permVar", ""],
			["_permVal", ""],
			["_permType", ""]
		];
		private _t = [_key,_d] call life_fnc_dataFromKey;
		if (_t isEqualTo false) then {
			_t = [];
		};

		_permVal = call {
			if (_permType isEqualTo "scalar" || _permType isEqualTo "equalInt") exitWith {
				parseNumber _permVal;
			};

			if (_permType isEqualTo "array") exitWith {
				parseSimpleArray _permVal;
			};
		
			_permVal;
		};

		_t pushBackUnique [_class,_customName,_price,[_permType,_permVar,_permVal]];
		[_key,_d,_t] call life_fnc_setDataAtKey;
		nil;
	} count _i;

	_o pushBackUnique [_x select 1,_d];
	nil;
} count _s;

de100_Shops = _o;
publicVariable "de100_Shops";