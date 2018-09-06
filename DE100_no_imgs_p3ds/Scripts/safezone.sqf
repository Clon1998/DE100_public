/*
    GrenadeStop v0.8 for ArmA 3 Alpha by Bake (tweaked slightly by Rarek)
    
    DESCRIPTION:
    Stops players from throwing grenades in safety zones.
    
    INSTALLATION:
    Move grenadeStop.sqf to your mission's folder. Then add the
    following line to your init.sqf file (create one if necessary):
    execVM "grenadeStop.sqf";
    
    CONFIGURATION:
    Edit the #defines below.
*/

waitUntil {!isNull player};
if(playerSide != west) then {
	player addEventHandler ["Fired", {
		if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count [["kvl_safezone_marker", 100],["respawn_civilian",500]] > 0 && (call life_adminlevel) <= 4) then
		{
			deleteVehicle (_this select 6);
			hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'>Du bist in einer<br/><t color='#FF0000'><t size ='2.5'<t align='center'>Safe Zone<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Keine Gewalt<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Nicht K.O Schlagen<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Keine Diebstähle<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Kein Trolling"];
			if (currentWeapon player != "") then {
				life_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
			};
		};
	}];  
};