/*
	File:	fn_PlayerTags.sqf
	Date:   22.08.16
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/

[
	{2},
	time,
	{
		private _camPosAGL = positionCameraToWorld [0, 0, 0];
		private _camPosASL = AGLtoASL _camPosAGL;

		private _tracked = _camPosAGL nearObjects ["CAManBase", 100];

		if (call(missionNamespace getVariable ["life_adminlevel",{0}]) > 0) then {
			if (!isNull objectParent player && cameraView isEqualTo "INTERNAL") then {
				_tracked append (crew vehicle player);
			};
		} else {
			call {
				if (playerSide isEqualTo civilian) exitWith {
					_tracked = _tracked select {!isPlayer _x || (_x getVariable ["newBee",false]) || !(_x getVariable ["isAlive",true]) || (_x getVariable ["admin",0]) > 0};
					_tracked append ((units group player) select {isNull objectParent _x});
					if (!isNull objectParent player && cameraView isEqualTo "INTERNAL") then {
						_tracked append ((units group player) select {!isNull objectParent _x});
					};
				};
			
				if (playerSide isEqualTo west) exitWith {
					_tracked = _tracked select {!isPlayer _x || side _x isEqualTo west || (_x getVariable ["newBee",false]) || !(_x getVariable ["isAlive",true]) || (_x getVariable ["admin",0]) > 0};
					if (!isNull objectParent player && cameraView isEqualTo "INTERNAL") then {
						_tracked append ((crew vehicle player) select {side _x isEqualTo west});
					};
				};

				if (playerSide isEqualTo independent) exitWith {
					_tracked = _tracked select {!isPlayer _x || side _x isEqualTo independent || (_x getVariable ["newBee",false]) || !(_x getVariable ["isAlive",true]) || (_x getVariable ["admin",0]) > 0};
					if (!isNull objectParent player && cameraView isEqualTo "INTERNAL") then {
						_tracked append ((crew vehicle player) select {side _x isEqualTo independent});
					};
				};
			};	

			_tracked append (((missionNamespace getVariable ["life_perso_seen",[]]) select {isNull objectParent _x}) - _tracked);
			if (!isNull objectParent player && cameraView isEqualTo "INTERNAL") then {
				_tracked append (((missionNamespace getVariable ["life_perso_seen",[]]) select {!isNull objectParent _x}) - _tracked);
			};
		};
		_tracked = _tracked select {
			!(_x isEqualTo player) &&
			!isObjectHidden _x &&
			!isNull _x
		};
		private _data = [];
		{
			private _color = [1,1,1,1];
			private _text = _x call life_fnc_name;
			private _icon = "";
			if (side _x isEqualTo independent) then {
				_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa";
			};
			call {
				if ((side _x) isEqualTo civilian) exitWith {
					if !((_x getVariable ["life_crnt_title_de100",""]) isEqualTo "") then {
						_text = format["[%1] %2",_x getVariable ["life_crnt_title_de100",""],_text];
					};
					if (_x in (units group player)) then {
						_color = [0,0.729,0.047,1]; 
					};
					if (_x getVariable ["newBee",false]) then {
						_color = [0.78,0.231,0.808,1];
						_icon = format["%1images\icons\ico_perm.paa",MISSION_ROOT];
					};
				};
			
				if ((side _x) isEqualTo west) exitWith {
					_text = format["[Polizei] %1",_text];
				};
				
				if ((side _x) isEqualTo independent) exitWith {
					_text = format["[THR] %1",_text];
				};
			};	
			if ((_x getVariable ["admin",0]) > 0) then {
				_icon = "A3\3den\Data\CfgWaypoints\seekAndDestroy_ca.paa";
				_text = "DE100-Admin";
				_color = [0.71,0,0.094,1];
			};
			if !(_x getVariable ["isAlive",true]) then {
				_color = [0.447,0.471,0.51,1];
				_text = "";
				_icon = "a3\ui_f\data\GUI\Cfg\Hints\Death_ca.paa";
			};

			_data pushBackUnique ["ICON", _icon, _color, [_x, "pilot", [0, 0, 0.5]], 1, 1, 0, _text, 2, 0.05, "RobotoCondensed", "center", false, {
                private _unit = (_position select 0);
                private _cameraPosASL = AGLToASL (_cameraPosition);
                private _facePositionAGL = _unit modelToWorldVisual (_unit selectionPosition "pilot");
                private _facePositionASL = AGLToASL _facePositionAGL;

                if (!((lineIntersectsSurfaces [_cameraPosASL, _facePositionASL, player, _unit]) isEqualTo [])) exitWith {false};

                private _distance = _cameraPosASL vectorDistance _facePositionASL;

                if (_distance > 100 || _distance == 0) exitWith {false};

                private _size = 1;
                private _alpha = 1;
                private _offset = [0, 0, 0.5];

                if (_distance < 7) then {
                    _offset set [2, (_offset select 2) * ((3 + _distance) / 10)];
                } else {
                    _size = (7 / _distance) ^ 0.7;
                    _alpha = _size;

                    _offset set [2, (_offset select 2) * (1 / _size) ^ 0.3];

                    if (_distance >= 30) then {
                        // linear fade out
                        _alpha = (1 - (_distance - 30) / 20) * _alpha;
                    };

                    private _currentTime = time;
                    if (_unit == cursorTarget) then {
                        _unit setVariable ["lastTimeInFocus", _currentTime];
                    };

                    private _diffTime = _currentTime - (_unit getVariable ["lastTimeInFocus", 0]);

                    if (_diffTime < 3) then {
                        private _tempAlpha = 1 - sqrt (_diffTime / 3);
                        if (_alpha < _tempAlpha) then {
                            _alpha = _tempAlpha;
                        };
                    };
                };

                if (_alpha <= 0) exitWith {false};

                _size = _size * _fov;
                _width = _size * _width;
                _height = _size * _height;
                _textSize = _size * _textSize;
                _position set [2, _offset];
                _color set [3, _alpha];
                if (_unit getVariable ["VoN_Talking",false]) then {
                    _texture = format["%1images\icons\soundwave\ico_talk_0%2.paa",MISSION_ROOT,floor random 10];
                };
                true;
            }];
			nil;
		} count _tracked;
		["playerTags",_data] call life_fnc_add3dGraphics;
	}
] call life_fnc_threadControl;

[
	{5},
	time,
	{
		private _camPosAGL = positionCameraToWorld [0, 0, 0];
		private _camPosASL = AGLtoASL _camPosAGL;

		private _tracked = _camPosAGL nearObjects ["Land_InfoStand_V2_F", 100];
		_tracked append (_camPosAGL nearObjects ["Land_Device_assembled_F", 100]); 
		_tracked append life_newBought;
		
		_tracked = _tracked select {
			!(_x isEqualTo player) &&
			!isObjectHidden _x &&
			!isNull _x
		};
		private _data = [];
		{
			private _color = [1,1,1,1];
			private _text = _x getVariable ["realname",""];//No need to use call life_fnc_name since this is just for mapObjects
			private _icon = if (_x getVariable ["spawnIndicator",false]) then {
				format["%1images\icons\ico_new.paa",MISSION_ROOT];
			} else {
				"";
			};
			private _offSet = call {
				if ((typeOf _x) isEqualTo "Land_InfoStand_V2_F") exitWith {[0,0.17,1.1];};
				if ((typeOf _x) isEqualTo "Land_Device_assembled_F") exitWith {[0,0,1.2];};
				[0,0,0];
			};

			_data pushBackUnique ["ICON", _icon, _color, [_x,_offSet], 1, 1, 0, _text, 2, 0.05, "RobotoCondensed", "center", false, {
                private _unit = _position select 0;
                private _cameraPosASL = AGLToASL (_cameraPosition);
                private _facePositionAGL = _unit modelToWorldVisual [0,0,0];
                private _facePositionASL = AGLToASL _facePositionAGL;

                if (!((lineIntersectsSurfaces [_cameraPosASL, _facePositionASL, player, _unit]) isEqualTo [])) exitWith {false};

                private _distance = _cameraPosASL vectorDistance _facePositionASL;

                if (_distance > 100 || _distance == 0) exitWith {false};

                private _size = 1;
                private _alpha = 1;
                private _offset = [0, 0, (_position select 1) select 2];

                if (_distance < 7) then {
                	_offset set [2, (_offset select 2) * (1 / ((7 / _distance) ^ 0.7)) ^ 0.3];
                } else {
                    _size = (7 / _distance) ^ 0.7;
                    _alpha = _size;

                    _offset set [2, (_offset select 2) * (1 / _size) ^ 0.3];

                    if (_distance >= 30) then {
                        // linear fade out
                        _alpha = (1 - (_distance - 30) / 20) * _alpha;
                    };

                    private _currentTime = time;
                    if (_unit == cursorTarget) then {
                        _unit setVariable ["lastTimeInFocus", _currentTime];
                    };

                    private _diffTime = _currentTime - (_unit getVariable ["lastTimeInFocus", 0]);

                    if (_diffTime < 3) then {
                        private _tempAlpha = 1 - sqrt (_diffTime / 3);
                        if (_alpha < _tempAlpha) then {
                            _alpha = _tempAlpha;
                        };
                    };
                };

                if (_alpha <= 0) exitWith {false};

                _size = _size * _fov;
                _width = _size * _width;
                _height = _size * _height;
                _textSize = _size * _textSize;
                _position set [2, _offset];
                _color set [3, _alpha];
                true;
            }];
			nil;
		} count _tracked;
		["objectTags",_data] call life_fnc_add3dGraphics;
	}
] call life_fnc_threadControl;