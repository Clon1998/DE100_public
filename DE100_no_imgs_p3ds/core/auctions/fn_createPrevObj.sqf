/*
	File:	fn_createPrevObj.sqf
	Date:   2017-09-05 17:43:40
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Take a look for yourself.
*/
disableSerialization;

params[
	["_class", "", [""]],
	["_display",displayNull,[displayNull]],
	["_data",[]],
	"_obj"
];
private _oModel = _display getVariable ["crnt_obj",objNull];

if (!isNull _oModel) then {
	deleteVehicle _oModel;
};
if (_class isKindOf "Car" || _class isKindOf "Air" || _class isKindOf "Ship" || _class isKindOf "Pod_Heli_Transport_04_base_F") then {
	[2,_display] call life_fnc_handleCam;
	private _cam = _display getVariable ["preview_Vcam",objNull];
	private _helper = _display getVariable ["preview_Vhelper",objNull];
	_obj = _class createVehicleLocal [0,0,0];
	_obj attachTo [_helper,[0,0,0]];
	[_obj,_data,false] call life_fnc_colorVehicle;
	private _bb = boundingBox _obj;
	_helper setVariable ["center",getPos _obj];
	private _r = _bb select 1;
	_helper setVariable ["hight",(_r select 2) * 1.3];
	_r set [2,0];
	_helper setVariable ["radius",vectorMagnitude (_r vectorMultiply 1.2)];
} else {
	[1,_display] call life_fnc_handleCam;
	private _vhelper = _display getVariable ["preview_Vhelper",objNull];
	if (!isNull _vhelper) then {
		_vhelper setVariable ["exit",true];
	};
	private _cam = _display getVariable ["preview_cam",objNull];
	private _helper = _display getVariable ["preview_helper",objNull];
	private _type = [_class] call Bis_fnc_itemType;
	_cam camSetPos [8537,25095.6,4.7094];
	_cam camSetDir [-0.992105,0.0192381,-0.124865];
	_cam camCommit 0;
	call {
		if ((_type select 0) isEqualTo "Weapon") exitWith {
			_obj = format["%1_%2","Weapon",_class] createVehicleLocal [0,0,0];
			_obj attachTo [_helper, [0,0,0.4]];
			_obj setVectorDirAndUp [[0,0,1],[0,-1,0]];

			_cam camSetPos [8537,25095.6,4.7094];
			_cam camSetDir [-0.992105,0.0192381,-0.124865];
			_cam camCommit 0;
		};

		if ((_type select 0) isEqualTo "Item") exitWith {
			_obj = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			private _offSet = call {
				if ((_type select 1) isEqualTo "AccessoryMuzzle") exitWith {
					[[-0.25,0.005,0.9],[[0,1,0],[0,0,1]],[8536.54,25095.6,4.2],[-0.9948,0.0680716,-0.0763037]]
				};
				if ((_type select 1) isEqualTo "AccessoryPointer") exitWith {
					[[0.1,0.63,0.3],[[0,0,1],[0,1,0]],[8536.54,25095.6,4.2],[-0.9948,0.0680716,-0.0763037]]
				};
				if ((_type select 1) isEqualTo "AccessorySights") exitWith {
					[[0.15,0.62,0.3],[[0,0,1],[0,1,0]],[8536.54,25095.6,4.2],[-0.9948,0.0680716,-0.0763037]]
				};
				if ((_type select 1) isEqualTo "AccessoryBipod") exitWith {
					[[0.04,0.62,0.3],[[1,0,0],[0,1,0]],[8536.54,25095.6,4.2],[-0.9948,0.0680716,-0.0763037]]
				};
				if ((_type select 1) isEqualTo "NVGoggles") exitWith {
					[[0.1,0.63,-0.4],[[0,0,1],[0,1,0]],[8537,25095.6,4.71532],[-0.98544,-0.00400121,-0.170068]]
				};
				if ((_type select 1) in ["Binocular","LaserDesignator"]) exitWith {
					[[0.03,0.6,0.3],[[0,0,1],[0,1,0]],[8537,25095.6,4.71532],[-0.98544,-0.00400121,-0.170068]]
				};
				[[0.03,0.6,0.3],[[0,0,1],[0,1,0]],[8537,25095.6,4.71532],[-0.98544,-0.00400121,-0.170068]]
			};
			_obj addItemCargo [_class,1];
			_obj attachTo [_helper, _offSet select 0];
			_obj setVectorDirAndUp (_offSet select 1);

			_cam camSetPos (_offSet select 2);
			_cam camSetDir (_offSet select 3);
			_cam camCommit 0;
		};

		if ((_type select 1) isEqualTo "Vest") then {
			_obj = format["%1_%2","Vest",_class] createVehicleLocal [0,0,0];
			_obj attachTo [_helper, [0,0.5,0.6]];
			_obj setVectorDirAndUp [[0,0,-1],[0,1,0]];

			_cam camSetPos [8537.32,25095.7,5.42995];
			_cam camSetDir [-0.969063,0.00449719,-0.247183];
			_cam camCommit 0;
		};

		if ((_type select 1) isEqualTo "Headgear") then {
			_obj = format["%1_%2","Headgear",_class] createVehicleLocal [0,0,0];
			_obj attachTo [_helper, [0,0,0.2]];
			_obj setVectorDirAndUp [[0,1,0],[0,0,1]];

			_cam camSetPos [8536.76,25095.6,4.76788];
			_cam camSetDir [-0.913494,-0.00480188,-0.40709];
			_cam camCommit 0;
		};

		if ((_type select 1) isEqualTo "Uniform") then {
			_obj = format["%1_%2","Item",_class] createVehicleLocal [0,0,0];
			_obj attachTo [_helper, [0.1,0.6,0.6]];
			_obj setVectorDirAndUp [[0,1,0],[1,0,0]];

			_cam camSetPos [8537.62,25095.6,5.27528];
			_cam camSetDir [-0.967915,0.0119484,-0.251459];
			_cam camCommit 0;
		};

		if ((_type select 1) isEqualTo "Backpack") then {
			_obj = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			
			_obj addBackpackCargo [_class,1];

			_obj attachTo [_helper, [0.104,-0.53,0.2]];
			_obj setVectorDirAndUp [[0,0,-1],[0,-1,0]];

			_cam camSetPos [8537.25,25095.6,5.35];
			_cam camSetDir [-0.913665,0.00426248,-0.406731];
			_cam camCommit 0;
		};

		if ((_type select 1) isEqualTo "Glasses") then {
			_obj = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			
			_obj addItemCargo [_class,1];
			
			_obj attachTo [_helper, [0.102,0.608,-0.45]];
			_obj setVectorDirAndUp [[0,0,1],[0,1,0]];

			_cam camSetPos [8536.8,25095.6,4.5];
			_cam camSetDir [-0.962922,0.00862938,-0.269688];
			_cam camCommit 0;
		};

		if ((_type select 0) isEqualTo "Magazine") then {
			private _vector = call {
				if ((_type select 1) in ["Grenade","SmokeShell"]) exitWith {
					[[-0.105,0.005,0.8],[[0,1,0],[0,0,1]]];
				};
				[[0.102,0.635,0.3],[[0,0,1],[0,1,0]]];
			};

			_obj = "WeaponHolderSimulated" createVehicleLocal [0,0,0];
			
			_obj addItemCargo [_class,1];
		
			_obj attachTo [_helper, _vector select 0];
			_obj setVectorDirAndUp (_vector select 1);

			_cam camSetPos [8536.54,25095.6,4.35];
			_cam camSetDir [-0.9948,0.0680716,-0.0763037];
			_cam camCommit 0;
		};
		["Leider konnte kein 3D-Objekt zur Vorschau erstellt werden", false, "fast"] call life_fnc_notification_system;
	};

};
if (isNull _obj || isnil "_obj") then {
	["Leider konnte kein 3D-Objekt zur Vorschau erstellt werden", false, "fast"] call life_fnc_notification_system;
};
_display setVariable ["crnt_obj",_obj];