/*

	filename: fn_surrender.sqf
	Description: places player into a surrendered state!
*/

player setVariable ["surrendered", true, true]; //Set surrender to true

while {player getVariable ["surrendered", false];}  do {
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; //Animation in
	
	// Check if player is alive.
	if (!alive player) then {
		player setVariable ["surrendered", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; //Animation out