/*
	File:   fn_bag.sqf
	Date:   11.03.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/



if !(player getVariable ["SackDrauf",false]) then {
	player setVariable ["SackDrauf",true,true];
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0.2,0.2,0.2,0], [0.01,0.01,0.01,0]];
	"colorCorrections" ppEffectCommit 1;

	"FilmGrain" ppEffectEnable true;
	"FilmGrain" ppEffectAdjust [0.14, 1.5,1.7, 0.2, 1.0,true];
	"FilmGrain" ppEffectCommit 1;

	"RadialBlur" ppEffectEnable true;
	"RadialBlur" ppEffectAdjust [0.01, 0.01, 0.06, 0.06];
	"RadialBlur" ppEffectCommit 1;
} else {
	player setVariable ["SackDrauf",false,true];
	"colorCorrections" ppEffectEnable false;
	"FilmGrain" ppEffectEnable false;
	"RadialBlur" ppEffectEnable false;
};
