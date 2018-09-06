/*
	File:	fn_toArray.sqf
	Date:   2017-08-02 11:23:41
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Sadly we cant use arams SplitString since this command is simply broken with non ASCII chars ;(
*/

private _in = param[0,"",[""]];

(toArray _in) apply {toString [_x];};