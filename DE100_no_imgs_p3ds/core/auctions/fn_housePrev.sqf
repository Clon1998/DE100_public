/*
   File:    fn_housePrev.sqf
   Date:    2017-9-14 21:01:21
   Author: Patrick "Lucian" Schmidt
   Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.

   Description:
   Take a look for yourself.
*/
disableSerialization;
params[
    ["_b", objNull, [objNull]],
    ["_display", displayNull, [displayNull]],
    ["_pic", controlNull, [controlNull]]
];

private _map = _display displayCtrl 1100;
private _cam = _display getVariable ["preview_cam",objNull];
private _vhelper = _display getVariable ["preview_Vhelper",objNull];
if (!isNull _vhelper) then {
    _vhelper setVariable ["exit",true];
};
[_b,_cam,_pic,_map,_display] spawn {
    disableSerialization;
    private _checkLeaveCam = {
        if (isNull _display || isNull _cam) exitWith {
            true
        };
        camCommitted _cam || (_display getVariable ["crntView",-1]) != 1;
    };
    params[
        ["_b", objNull, [objNull]],
        ["_cam", objNull, [objNull]],
        ["_pic", controlNull, [controlNull]],
        ["_map", controlNull, [controlNull]],
        ["_display", displayNull, [displayNull]]
    ];

    _marker = createMarkerLocal [format["auc_house_%1",netId _b],getPosATL _b];
    _marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> (typeOf _b) >> "displayName"));
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "loc_Ruin";

    for "_i" from 0 to 1 step 0 do {
        if (isNull _display || (_display getVariable ["crntView",-1]) != 1) exitWith {};
        _pic ctrlShow true;
        _map ctrlShow false;
        private _arr = call {
            private _type = typeOf _b;
            if (_type in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]) exitWith {[[[-6.84692,12.717,4.90823],139.295,-28.0809],[[0.533081,6.75684,-1.29179],194.655,-2.67041],[[-2.62695,2.93701,-1.29179],120.043,-2.40008],[[-1.74695,-0.272949,-1.29179],152.103,3.27673],[[-3.547,-3.72314,-2.09178],71.4001,19.4962],[[4.13306,-3.35303,0.308212],285.535,7.87225],[[-3.88696,-3.10303,2.10822],49.7403,-1.85943],[[-1.46692,-0.743164,2.10822],20.3171,-3.48138],[[-4.62695,3.96704,2.10822],113.879,-0.507809],[[-3.177,5.41699,2.10822],63.61,0.843811],[[-6.84692,12.717,4.90823],139.295,-28.0809]];};
            if (_type in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]) exitWith {[[[-8.97803,-10.3882,-1.15648],47.8494,5.78015],[[-1.54785,-5.95801,-1.15648],45.593,-0.70764],[[4.35205,-5.45801,-2.05647],334.906,19.026],[[4.45215,2.63184,-0.0564852],237.869,21.459],[[1.01221,1.95215,1.94353],215.6,-5.84382],[[-4.23779,-5.80811,3.04354],47.0561,-15.8458],[[-1.81787,3.35205,2.24353],61.3479,-1.78899],[[5.29199,5.54199,2.24353],58.8849,-2.87028],[[14.0322,10.6421,4.64353],232.163,-18.5491],[[11.3823,-16.6479,8.84353],325.525,-36.1202],[[-14.3379,-9.67822,6.14355],53.3682,-22.3337]];};
            if (_type in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) exitWith {[[[-9.23389,0.151367,0.0627151],90.4938,21.8963],[[-9.23389,0.151367,0.0627151],90.4938,21.8963],[[4.74609,0.401367,1.76271],267.039,-0.270301],[[11.416,3.03125,4.56272],248.449,-26.2214],[[-13.1436,-5.91846,5.96273],68.8336,-20.2743]];};
            if (_type in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]) exitWith {[[[-4.8457,-10.792,2.17479],32.0721,-7.02844],[[3.46387,-4.43164,0.874785],346.922,-10.2723],[[1.48389,0.588379,-0.225215],233.746,7.56907],[[-5.0459,-0.531738,0.374785],327.514,-0.540671],[[-8.92578,8.8584,3.3748],132.575,-18.6524],[[-3.95605,4.67822,0.174785],122.962,-4.59554],[[8.81396,9.56836,4.4748],222.859,-19.7337],[[-4.8457,-10.792,2.17479],32.0721,-7.02844]];};
            if (_type in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]) exitWith {[[[-8.68018,-5.94971,2.69328],55.561,-14.8678],[[-7.70996,6.47021,2.69328],133.991,-17.0304],[[-1.52002,3.02002,0.293278],159.913,3.78452],[[1.04004,1.88037,-0.606723],124.553,19.7337],[[4.18994,-3.50977,0.593278],125.77,4.32518],[[14.0698,-6.63965,5.59329],307.627,-26.7621],[[-8.68018,-5.94971,2.69328],55.561,-14.8678]];};
            if (_type in ["Land_i_House_Small_03_V1_F"]) exitWith {[[[-6.41064,-9.35791,4.08429],41.8089,-15.8227],[[-3.86084,-2.35791,0.984292],42.8232,3.37037],[[-1.37061,4.71216,0.484288],212.175,16.0756],[[1.5293,0.531982,2.48428],327.843,-23.3917],[[0.839355,5.24219,1.28429],297.566,8.50656],[[6.0791,10.8521,4.48429],219.733,-20.4182],[[4.01904,4.82202,0.384288],186.636,7.15492],[[4.08936,-6.92798,1.78428],237.71,3.37038],[[6.5293,-12.5579,3.78429],321.061,-13.6601]];};
            if (_type in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]) exitWith {[[[11.1133,-3.30908,1.25594],298.301,-1.89228],[[-9.56689,-2.6792,0.855942],69.6582,-2.1626],[[-8.30713,2.71094,3.15595],99.4773,-27.5731],[[0.843262,1.79102,-0.0440583],91.712,12.9756],[[8.09326,-0.329102,-0.444058],307.276,20.815],[[6.07324,5.15088,0.755942],326.069,5.67681],[[-11.7969,9.78125,3.25595],132.804,-21.8963],[[-8.95703,-7.69873,5.25596],34.9414,-25.4105]];};
            [];
        };
        {
            if (isNull _display || (_display getVariable ["crntView",-1]) != 1) exitWith {};
            _x params[
				["_pos", [], [[]]],
				["_dir", 0, [0]],
				["_pitch", 0, [0]]
			];
            _dir = _dir + getDir _b;
			_cam camSetPos (_b modelToWorld _pos);
			_cam camSetDir [sin _dir,cos _dir,sin _pitch];
			_cam camCommit ([3,0] select (_foreachIndex == 0));
			waitUntil {call _checkLeaveCam};
        } forEach _arr;
        if (isNull _display || (_display getVariable ["crntView",-1]) != 1) exitWith {};
        uiSleep 2;
        if (isNull _display || (_display getVariable ["crntView",-1]) != 1) exitWith {};
        _pic ctrlShow false;
        _map ctrlShow true;
        ctrlMapAnimClear _map;
        _map ctrlMapAnimAdd [0,0.5,getPosATL _b];
        ctrlMapAnimCommit _map;
        _map ctrlMapAnimAdd [8,0.001,getPosATL _b];
        ctrlMapAnimCommit _map;
        waitUntil {ctrlMapAnimDone _map || isNull _display || (_display getVariable ["crntView",-1]) != 1};
        if (isNull _display || (_display getVariable ["crntView",-1]) != 1) exitWith {};
        uiSleep 2;
    };
    deleteMarkerLocal format["auc_house_%1",netId _b];
};