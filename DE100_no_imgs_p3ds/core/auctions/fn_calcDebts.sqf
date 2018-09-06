/*
   File:    fn_calcDebts.sqf
   Date:    2017-9-28 14:38:27
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
private _uid = getPlayerUID player;
private _data = ((profileNamespace getVariable ["DE100_AUC_PA",[]])+(de100_ac_storage getVariable ["active_auctions",[]])) select {!((_x select 1 select 0) isEqualTo _uid) && (_x select 1 select 12) < 2};
private _debts = 0;

{
    private _hD = (de100_ac_storage getVariable [format["%1_auction_history",_x select 0],[]]);
    if !(_hD isEqualTo []) then {
        _hD = _hD select (count _hD -1);
        if ((_hD select 0) isEqualTo _uid) then {
            private _bet = _hD select 2;
            if (_bet < 0) then {
                _debts = _debts + ((_x select 1) select 7);
            } else {
                _debts = _debts + _bet;
            };
        };
    };
    nil;
} count _data;
_debts;