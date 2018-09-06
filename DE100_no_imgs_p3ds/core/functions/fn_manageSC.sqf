/*
	File:	fn_manageSC.sqf
	Date:   2017-04-10 16:57:48
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

call {
	private _pSide = player getVariable ["side",playerSide];
	if (_pSide isEqualTo civilian) exitWith {
		if (life_sidechat) then {
			life_radio_civ radioChannelAdd [player];
		} else {
			life_radio_civ radioChannelRemove [player];
		};
	};
	if (_pSide isEqualTo blufor) exitWith {
		if (life_sidechat) then {
			life_radio_west radioChannelAdd [player];
		} else {
			life_radio_west radioChannelRemove [player];
		};
	};
	if (life_sidechat) then {
		life_radio_indep radioChannelAdd [player];
	} else {
		life_radio_indep radioChannelRemove [player];
	};
};