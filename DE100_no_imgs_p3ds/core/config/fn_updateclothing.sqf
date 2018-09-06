/*
	File:   fn_updateclothing.sqf
	Date:   08.02.2016	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/

params[
	["_unit", player]
];

private _u = uniform _unit;
private _b = backpack _unit;
private _su = profileNamespace getVariable [format["de100_skin_%1_%2", _u, playerSide], ""];
private _sb = profileNamespace getVariable [format["de100_skin_%1_%2", _b, playerSide], ""];

if (isClass (missionConfigFile >> "skins" >> _b) || isClass (missionConfigFile >> "skins" >> _u)) then {
	if (_su isEqualTo "") then {
		call {
			if (_unit getVariable["nobody",false] && _u isEqualTo "U_B_CombatUniform_mcam") exitWith {
				_su = "Nobody";
			};

			if (playerSide isEqualTo civilian) exitWith {
				if (_u isEqualTo "U_C_Poloshirt_stripped") exitWith {
					_su = "DE100";
				};
			};

			if (playerSide isEqualTo west) exitWith {
				private _clvl = (call life_coplevel);
				call {
					if (_u isEqualTo "U_Rangemaster") exitWith {
						_su = "Cop";
					};

					if (_u isEqualTo "U_B_GEN_Commander_F") exitWith {
						_su = "Cop";
					};

					if (_u isEqualTo "U_B_CTRG_Soldier_F") exitWith {
						if (_clvl >= 5) then {
							_su = "Cop5";
						};
					};

					if (_u in ["U_B_SpecopsUniform_sgg","U_B_CombatUniform_mcam"]) exitWith {
						if (_clvl >= 7) exitWith {
							_su = "Cop7";
						};
						_su = "Cop0";	
					};
				};
			};
			if (playerSide isEqualTo independent) exitWith {
				if (_u in ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest"]) then {
					_su = "THR";
				};

				if(_b isEqualTo "B_Bergen_mcamo") then {
					_sb = "THR";
				};
			};
		};
		if (call(missionNamespace getVariable["life_U_Ruck",{false}])) then {
			_sb = "Invis";
		};

		if !(_su isEqualTo "") then {
			profileNamespace setVariable [format["de100_skin_%1_%2", _u, playerSide], _su];
		};

		if !(_sb isEqualTo "") then {
			profileNamespace setVariable [format["de100_skin_%1_%2", _b, playerSide], _sb];
		};
	};

	if (_u isEqualTo getText(missionConfigFile >> "Life_Settings" >> "radiation_suit")) then {
		_su = "RadSuit";
	};

	if ((_unit getVariable ["admin",0]) > 0 && _u isEqualTo "U_I_HeliPilotCoveralls") then {
		_su = "Admin";
		_sb = "Invis";
	};

	if (_sb isEqualTo "Invis") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, ""];
	} else {
		(unitBackpack _unit) setObjectTextureGlobal [0, getText(missionConfigFile >> "skins" >> _b >> "TextureSources" >> _sb >> "texture")];
	};

	if !(_su isEqualTo "") then {
		player setObjectTextureGlobal [0,getText(missionConfigFile >> "skins" >> _u >> "TextureSources" >> _su >> "texture")];
	};
};


if (!call(missionNamespace getVariable["life_U_Ruck",{false}]) && (getObjectTextures (unitBackpack _unit)) isEqualTo [""]) then {
	_path = (getArray (configFile >> "CfgVehicles" >> _b >>"hiddenSelectionsTextures")) select 0;
	(unitBackpack _unit) setObjectTextureGlobal [0, _path];	
};
