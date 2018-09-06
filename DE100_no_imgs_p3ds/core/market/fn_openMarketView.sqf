/*

	Open pack-up dlg

*/

//if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;



//waitUntil {!isnull (findDisplay 6600)};


//Refresh
[] spawn life_fnc_refreshMarketView;