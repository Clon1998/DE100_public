/*
	File : debug.sqf
	Date:   06.12.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Just a place to save sth for InGame-Console
*/


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Performancetests Ergebnisse:
--------------------------------------------------------------------------------------------------

Operator "-" VS "select" bei Arrays mit einem Check (isNull)


ExecTime bei "-":
4.000 mal ausgeführt mit random array(25 Elemente): 0.000686005 pro ausführung Schleife;
code:
############################

_array = _array - [objNull];

############################


ExecTime bei "select":
4.000 mal ausgeführt mit random array(25 Elemente): 0.000932999 pro ausführung Schleife;
code:
############################

_array = _array select {!isNull _x}

############################

Operator "-" 36% schneller als "select"


--------------------------------------------------------------------------------------------------

Operator "-/foreach" VS "select" bei Arrays mit richtigen conditions und isNull check.


ExecTime bei "-/foreach":
4.000 mal ausgeführt mit random array(25 Elemente): 0.00204205 pro ausführung Schleife;
code:
############################

{
	if (!isNull _x && {_x isKindOf "House"}) then {
		_array pushBack _x; 
	};
} forEach _dataArray;

############################


ExecTime bei "select":
4.000 mal ausgeführt mit random array(25 Elemente): 0.00126801 pro ausführung Schleife;
code:
############################

_array = _array select {!isNull _x && {_x isKindOf "House"}}

############################

Operator "select" 61% schneller als "-/foreach"

--------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



res = diag_codePerformance [
{_this isEqualTo ""},
"",
4000
]

[0.0005,4000]



res = diag_codePerformance [
{count _this isEqualTo 0},
"",
4000
]

[0.00075,4000]


------------------------------------------------------------------------------------
-----------------------------         NEW BOOL         -----------------------------
------------------------------------------------------------------------------------
test = {
	params[
	    ["_in", 0, [0,true]]
	];

	if (_in isEqualType true) exitWith {
	    [0,1] select _in;
	};

	if (_in isEqualType 0) exitWith {
	    [false,true] select _in;
	};
};
res = diag_codePerformance [
{(selectRandom [0,false]) call test},
"",
10000
];
######################
Result:[0.0052,10000]
######################


------------------------------------------------------------------------------------
-----------------------------         OLD BOOL         -----------------------------
------------------------------------------------------------------------------------
test = {
	private ["_bool","_mode"];
	_bool = [_this,0,0,[false,0]] call BIS_fnc_param;
	_mode = [_this,1,0,[0]] call BIS_fnc_param;

	switch (_mode) do {
	    case 0: {
	        if (_bool isEqualType 0) exitWith {0};
	        if (_bool) then {1} else {0};
	    };

	    case 1: {
	        if (!(_bool isEqualType 0)) exitWith {false};
	        switch (_bool) do {
	            case 0: {false};
	            case 1: {true};
	        };
	    };
	};
};

res = diag_codePerformance [
{(selectRandom [0,false]) call test},
"",
10000
];
######################
Result:[0.0313,10000]
######################


------------------------------------------------------------------------------------
-----------------------------         NEW ARRAY         -----------------------------
------------------------------------------------------------------------------------
test = {
	params[
		["_in", "", ["",[],0,true]]
	];

	if (_in isEqualType []) exitWith {
		str toString(toArray(str _in) apply {if (_x == 34) then {96;} else {_x;};});
	};

	if (_in isEqualType "") exitWith {
		toString(toArray _in - toArray "'/\`:|;,{}-""<>");
	};

	if (_in isEqualType true) exitWith {
		[0,1] select _in;
	};

	if (_in isEqualType 0) exitWith {
		[false,true] select _in;
	};
};
res = diag_codePerformance [
{[["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","DMR_01_base_F","srifle_DMR_01_ACO_F","srifle_DMR_01_MRCO_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_DMR_01_DMS_snds_F","srifle_DMR_01_ARCO_F","EBR_base_F","srifle_EBR_ACO_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_ARCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_snds_F","srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F","srifle_EBR_DMS_pointer_snds_F","GM6_base_F","srifle_GM6_F","srifle_GM6_SOS_F","srifle_GM6_LRPS_F","srifle_GM6_camo_F","srifle_GM6_camo_SOS_F","srifle_GM6_camo_LRPS_F","LRR_base_F","srifle_LRR_F","srifle_LRR_SOS_F","srifle_LRR_LRPS_F","srifle_LRR_camo_F","srifle_LRR_camo_SOS_F","srifle_LRR_camo_LRPS_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","LMG_Zafir_F","LMG_Zafir_pointer_F","LMG_Zafir_ARCO_F","hgun_ACPC2_snds_F","hgun_P07_snds_F","hgun_Pistol_heavy_01_snds_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F","hgun_Rook40_snds_F","arifle_Katiba_Base_F","arifle_Katiba_C_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_C_ACO_F","arifle_Katiba_ACO_F","arifle_Katiba_pointer_F","arifle_Katiba_ACO_pointer_F","arifle_Katiba_ARCO_F","arifle_Katiba_ARCO_pointer_F","arifle_Katiba_GL_ACO_F","arifle_Katiba_GL_ARCO_pointer_F","arifle_Katiba_GL_ACO_pointer_F","arifle_Katiba_GL_Nstalker_pointer_F","arifle_Katiba_GL_ACO_pointer_snds_F","arifle_Katiba_C_ACO_pointer_snds_F","arifle_Katiba_ACO_pointer_snds_F","arifle_Katiba_ARCO_pointer_snds_F","mk20_base_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20C_ACO_F","arifle_Mk20C_ACO_pointer_F","arifle_Mk20_pointer_F","arifle_Mk20_Holo_F","arifle_Mk20_ACO_F","arifle_Mk20_ACO_pointer_F","arifle_Mk20_MRCO_F","arifle_Mk20_MRCO_plain_F","arifle_Mk20_MRCO_pointer_F","arifle_Mk20_GL_MRCO_pointer_F","arifle_Mk20_GL_ACO_F","arifle_MX_Base_F","arifle_MX_GL_F","arifle_MXM_F","arifle_MX_pointer_F","arifle_MX_Holo_pointer_F","arifle_MX_Hamr_pointer_F","arifle_MX_ACO_pointer_F","arifle_MX_ACO_F","arifle_MX_GL_ACO_F","arifle_MX_GL_ACO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_MXC_Holo_F","arifle_MXC_Holo_pointer_F","arifle_MX_SW_pointer_F","arifle_MX_SW_Hamr_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXC_ACO_F","arifle_MXC_Holo_pointer_snds_F","arifle_MXC_SOS_point_snds_F","arifle_MXC_ACO_pointer_snds_F","arifle_MXC_ACO_pointer_F","arifle_MX_ACO_pointer_snds_F","arifle_MX_RCO_pointer_snds_F","arifle_MX_GL_Holo_pointer_snds_F","arifle_MXM_SOS_pointer_F","arifle_MXM_RCO_pointer_snds_F","arifle_MXM_DMS_F","arifle_MX_GL_Black_Hamr_pointer_F","arifle_MX_Black_Hamr_pointer_F","arifle_MX_SW_Black_Hamr_pointer_F","SDAR_base_F","Tavor_base_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_ACO_Flash_F","arifle_TRG20_ACO_F","arifle_TRG21_ACO_pointer_F","arifle_TRG21_ARCO_pointer_F","arifle_TRG21_MRCO_F","arifle_TRG21_GL_MRCO_F","arifle_TRG21_GL_ACO_pointer_F","pdw2000_base_F","hgun_PDW2000_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F","SMG_01_Base","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F","SMG_02_base_F","SMG_02_ACO_F","SMG_02_ARCO_pointg_F","FakeWeapon_moduleTracers_F","hgun_Pistol_Signal_F","DMR_02_base_F","DMR_03_base_F","DMR_04_base_F","DMR_05_base_F","DMR_06_base_F","MMG_01_base_F","MMG_02_base_F","srifle_DMR_01_DMS_BI_F","srifle_DMR_01_DMS_snds_BI_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_02_ACO_F","srifle_DMR_02_MRCO_F","srifle_DMR_02_SOS_F","srifle_DMR_02_DMS_F","srifle_DMR_02_sniper_AMS_LP_S_F","srifle_DMR_02_camo_AMS_LP_F","srifle_DMR_02_ARCO_F","srifle_DMR_03_ACO_F","srifle_DMR_03_MRCO_F","srifle_DMR_03_SOS_F","srifle_DMR_03_DMS_F","srifle_DMR_03_tan_AMS_LP_F","srifle_DMR_03_DMS_snds_F","srifle_DMR_03_ARCO_F","srifle_DMR_03_AMS_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_04_ACO_F","srifle_DMR_04_MRCO_F","srifle_DMR_04_SOS_F","srifle_DMR_04_DMS_F","srifle_DMR_04_ARCO_F","srifle_DMR_04_NS_LP_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_05_ACO_F","srifle_DMR_05_MRCO_F","srifle_DMR_05_SOS_F","srifle_DMR_05_DMS_F","srifle_DMR_05_KHS_LP_F","srifle_DMR_05_DMS_snds_F","srifle_DMR_05_ARCO_F","srifle_DMR_06_camo_khs_F","srifle_EBR_MRCO_LP_BI_F","LMG_Mk200_LP_BI_F","LMG_Mk200_BI_F","MMG_01_hex_F","MMG_01_tan_F","MMG_01_hex_ARCO_LP_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","MMG_02_sand_RCO_LP_F","MMG_02_black_RCO_BI_F","arifle_MXM_DMS_LP_BI_snds_F","arifle_MXM_Hamr_LP_BI_F","arifle_MX_khk_F","arifle_MX_khk_ACO_Pointer_F","arifle_MX_khk_Holo_Pointer_F","arifle_MX_khk_Hamr_Pointer_F","arifle_MX_khk_Hamr_Pointer_Snds_F","arifle_MX_khk_Pointer_F","arifle_MX_khk_ACO_Pointer_Snds_F","arifle_MX_GL_khk_F","arifle_MX_GL_khk_ACO_F","arifle_MX_GL_khk_Hamr_Pointer_F","arifle_MX_GL_khk_Holo_Pointer_Snds_F","arifle_MX_SW_khk_F","arifle_MX_SW_khk_Pointer_F","arifle_MXC_khk_F","arifle_MXC_khk_Holo_Pointer_F","arifle_MXC_khk_ACO_F","arifle_MXC_khk_ACO_Pointer_Snds_F","arifle_MXM_khk_F","arifle_MXM_khk_MOS_Pointer_Bipod_F","srifle_LRR_tna_F","srifle_LRR_tna_LRPS_F","srifle_GM6_ghex_F","srifle_GM6_ghex_LRPS_F","hgun_P07_khk_F","hgun_P07_khk_Snds_F","launch_RPG32_ghex_F","launch_RPG7_F","launch_B_Titan_tna_F","launch_B_Titan_short_tna_F","launch_O_Titan_ghex_F","launch_O_Titan_short_ghex_F","DMR_07_base_F","srifle_DMR_07_blk_DMS_F","srifle_DMR_07_blk_DMS_Snds_F","LMG_03_base_F","LMG_03_F","hgun_Pistol_01_F","arifle_AK12_base_F","arifle_AK12_GL_base_F","arifle_AKM_base_F","arifle_AKM_FL_F","arifle_AKS_base_F","arifle_ARX_base_F","arifle_ARX_hex_ARCO_Pointer_Snds_F","arifle_ARX_ghex_ARCO_Pointer_Snds_F","arifle_ARX_hex_ACO_Pointer_Snds_F","arifle_ARX_ghex_ACO_Pointer_Snds_F","arifle_ARX_hex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_ghex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_Viper_F","arifle_ARX_Viper_hex_F","arifle_CTAR_base_F","arifle_CTAR_GL_base_F","arifle_CTAR_blk_ACO_Pointer_F","arifle_CTAR_blk_Pointer_F","arifle_CTAR_blk_ACO_F","arifle_CTAR_GL_blk_ACO_F","arifle_CTAR_GL_blk_ARCO_Pointer_F","arifle_CTAR_blk_ARCO_Pointer_F","arifle_CTAR_blk_ACO_Pointer_Snds_F","arifle_CTAR_GL_blk_ACO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_F","arifle_CTARS_base_F","arifle_CTARS_blk_Pointer_F","arifle_SPAR_01_base_F","arifle_SPAR_01_GL_base_F","arifle_SPAR_01_blk_ERCO_Pointer_F","arifle_SPAR_01_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ERCO_Pointer_F","arifle_SPAR_02_base_F","arifle_SPAR_02_blk_Pointer_F","arifle_SPAR_02_blk_ERCO_Pointer_F","arifle_SPAR_03_base_F","arifle_SPAR_03_blk_MOS_Pointer_Bipod_F","SMG_05_base_F"]] call test},
"",
10000
];
######################
Result:[12.5875,80]
######################

------------------------------------------------------------------------------------
-----------------------------         OLD ARRAY         -----------------------------
------------------------------------------------------------------------------------
test = {
	private ["_array"];
	_array = [_this,0,[],[[]]] call BIS_fnc_param;
	_array = str _array;
	_array = toArray(_array);

	for "_i" from 0 to (count _array)-1 do
	{
	    _sel = _array select _i;
	    if (!(_i isEqualTo 0) && !(_i isEqualTo ((count _array)-1))) then
	    {
	        if (_sel isEqualTo 34) then
	        {
	            _array set[_i,96];
	        };
	    };
	};

	str(toString(_array));
};

res = diag_codePerformance [
{[["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","DMR_01_base_F","srifle_DMR_01_ACO_F","srifle_DMR_01_MRCO_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_DMR_01_DMS_snds_F","srifle_DMR_01_ARCO_F","EBR_base_F","srifle_EBR_ACO_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_ARCO_pointer_F","srifle_EBR_SOS_F","srifle_EBR_ARCO_pointer_snds_F","srifle_EBR_DMS_F","srifle_EBR_Hamr_pointer_F","srifle_EBR_DMS_pointer_snds_F","GM6_base_F","srifle_GM6_F","srifle_GM6_SOS_F","srifle_GM6_LRPS_F","srifle_GM6_camo_F","srifle_GM6_camo_SOS_F","srifle_GM6_camo_LRPS_F","LRR_base_F","srifle_LRR_F","srifle_LRR_SOS_F","srifle_LRR_LRPS_F","srifle_LRR_camo_F","srifle_LRR_camo_SOS_F","srifle_LRR_camo_LRPS_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","LMG_Zafir_F","LMG_Zafir_pointer_F","LMG_Zafir_ARCO_F","hgun_ACPC2_snds_F","hgun_P07_snds_F","hgun_Pistol_heavy_01_snds_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F","hgun_Rook40_snds_F","arifle_Katiba_Base_F","arifle_Katiba_C_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_C_ACO_F","arifle_Katiba_ACO_F","arifle_Katiba_pointer_F","arifle_Katiba_ACO_pointer_F","arifle_Katiba_ARCO_F","arifle_Katiba_ARCO_pointer_F","arifle_Katiba_GL_ACO_F","arifle_Katiba_GL_ARCO_pointer_F","arifle_Katiba_GL_ACO_pointer_F","arifle_Katiba_GL_Nstalker_pointer_F","arifle_Katiba_GL_ACO_pointer_snds_F","arifle_Katiba_C_ACO_pointer_snds_F","arifle_Katiba_ACO_pointer_snds_F","arifle_Katiba_ARCO_pointer_snds_F","mk20_base_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20C_ACO_F","arifle_Mk20C_ACO_pointer_F","arifle_Mk20_pointer_F","arifle_Mk20_Holo_F","arifle_Mk20_ACO_F","arifle_Mk20_ACO_pointer_F","arifle_Mk20_MRCO_F","arifle_Mk20_MRCO_plain_F","arifle_Mk20_MRCO_pointer_F","arifle_Mk20_GL_MRCO_pointer_F","arifle_Mk20_GL_ACO_F","arifle_MX_Base_F","arifle_MX_GL_F","arifle_MXM_F","arifle_MX_pointer_F","arifle_MX_Holo_pointer_F","arifle_MX_Hamr_pointer_F","arifle_MX_ACO_pointer_F","arifle_MX_ACO_F","arifle_MX_GL_ACO_F","arifle_MX_GL_ACO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_MXC_Holo_F","arifle_MXC_Holo_pointer_F","arifle_MX_SW_pointer_F","arifle_MX_SW_Hamr_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXC_ACO_F","arifle_MXC_Holo_pointer_snds_F","arifle_MXC_SOS_point_snds_F","arifle_MXC_ACO_pointer_snds_F","arifle_MXC_ACO_pointer_F","arifle_MX_ACO_pointer_snds_F","arifle_MX_RCO_pointer_snds_F","arifle_MX_GL_Holo_pointer_snds_F","arifle_MXM_SOS_pointer_F","arifle_MXM_RCO_pointer_snds_F","arifle_MXM_DMS_F","arifle_MX_GL_Black_Hamr_pointer_F","arifle_MX_Black_Hamr_pointer_F","arifle_MX_SW_Black_Hamr_pointer_F","SDAR_base_F","Tavor_base_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_ACO_Flash_F","arifle_TRG20_ACO_F","arifle_TRG21_ACO_pointer_F","arifle_TRG21_ARCO_pointer_F","arifle_TRG21_MRCO_F","arifle_TRG21_GL_MRCO_F","arifle_TRG21_GL_ACO_pointer_F","pdw2000_base_F","hgun_PDW2000_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F","SMG_01_Base","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F","SMG_02_base_F","SMG_02_ACO_F","SMG_02_ARCO_pointg_F","FakeWeapon_moduleTracers_F","hgun_Pistol_Signal_F","DMR_02_base_F","DMR_03_base_F","DMR_04_base_F","DMR_05_base_F","DMR_06_base_F","MMG_01_base_F","MMG_02_base_F","srifle_DMR_01_DMS_BI_F","srifle_DMR_01_DMS_snds_BI_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_02_ACO_F","srifle_DMR_02_MRCO_F","srifle_DMR_02_SOS_F","srifle_DMR_02_DMS_F","srifle_DMR_02_sniper_AMS_LP_S_F","srifle_DMR_02_camo_AMS_LP_F","srifle_DMR_02_ARCO_F","srifle_DMR_03_ACO_F","srifle_DMR_03_MRCO_F","srifle_DMR_03_SOS_F","srifle_DMR_03_DMS_F","srifle_DMR_03_tan_AMS_LP_F","srifle_DMR_03_DMS_snds_F","srifle_DMR_03_ARCO_F","srifle_DMR_03_AMS_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_04_ACO_F","srifle_DMR_04_MRCO_F","srifle_DMR_04_SOS_F","srifle_DMR_04_DMS_F","srifle_DMR_04_ARCO_F","srifle_DMR_04_NS_LP_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_05_ACO_F","srifle_DMR_05_MRCO_F","srifle_DMR_05_SOS_F","srifle_DMR_05_DMS_F","srifle_DMR_05_KHS_LP_F","srifle_DMR_05_DMS_snds_F","srifle_DMR_05_ARCO_F","srifle_DMR_06_camo_khs_F","srifle_EBR_MRCO_LP_BI_F","LMG_Mk200_LP_BI_F","LMG_Mk200_BI_F","MMG_01_hex_F","MMG_01_tan_F","MMG_01_hex_ARCO_LP_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","MMG_02_sand_RCO_LP_F","MMG_02_black_RCO_BI_F","arifle_MXM_DMS_LP_BI_snds_F","arifle_MXM_Hamr_LP_BI_F","arifle_MX_khk_F","arifle_MX_khk_ACO_Pointer_F","arifle_MX_khk_Holo_Pointer_F","arifle_MX_khk_Hamr_Pointer_F","arifle_MX_khk_Hamr_Pointer_Snds_F","arifle_MX_khk_Pointer_F","arifle_MX_khk_ACO_Pointer_Snds_F","arifle_MX_GL_khk_F","arifle_MX_GL_khk_ACO_F","arifle_MX_GL_khk_Hamr_Pointer_F","arifle_MX_GL_khk_Holo_Pointer_Snds_F","arifle_MX_SW_khk_F","arifle_MX_SW_khk_Pointer_F","arifle_MXC_khk_F","arifle_MXC_khk_Holo_Pointer_F","arifle_MXC_khk_ACO_F","arifle_MXC_khk_ACO_Pointer_Snds_F","arifle_MXM_khk_F","arifle_MXM_khk_MOS_Pointer_Bipod_F","srifle_LRR_tna_F","srifle_LRR_tna_LRPS_F","srifle_GM6_ghex_F","srifle_GM6_ghex_LRPS_F","hgun_P07_khk_F","hgun_P07_khk_Snds_F","launch_RPG32_ghex_F","launch_RPG7_F","launch_B_Titan_tna_F","launch_B_Titan_short_tna_F","launch_O_Titan_ghex_F","launch_O_Titan_short_ghex_F","DMR_07_base_F","srifle_DMR_07_blk_DMS_F","srifle_DMR_07_blk_DMS_Snds_F","LMG_03_base_F","LMG_03_F","hgun_Pistol_01_F","arifle_AK12_base_F","arifle_AK12_GL_base_F","arifle_AKM_base_F","arifle_AKM_FL_F","arifle_AKS_base_F","arifle_ARX_base_F","arifle_ARX_hex_ARCO_Pointer_Snds_F","arifle_ARX_ghex_ARCO_Pointer_Snds_F","arifle_ARX_hex_ACO_Pointer_Snds_F","arifle_ARX_ghex_ACO_Pointer_Snds_F","arifle_ARX_hex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_ghex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_Viper_F","arifle_ARX_Viper_hex_F","arifle_CTAR_base_F","arifle_CTAR_GL_base_F","arifle_CTAR_blk_ACO_Pointer_F","arifle_CTAR_blk_Pointer_F","arifle_CTAR_blk_ACO_F","arifle_CTAR_GL_blk_ACO_F","arifle_CTAR_GL_blk_ARCO_Pointer_F","arifle_CTAR_blk_ARCO_Pointer_F","arifle_CTAR_blk_ACO_Pointer_Snds_F","arifle_CTAR_GL_blk_ACO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_F","arifle_CTARS_base_F","arifle_CTARS_blk_Pointer_F","arifle_SPAR_01_base_F","arifle_SPAR_01_GL_base_F","arifle_SPAR_01_blk_ERCO_Pointer_F","arifle_SPAR_01_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ERCO_Pointer_F","arifle_SPAR_02_base_F","arifle_SPAR_02_blk_Pointer_F","arifle_SPAR_02_blk_ERCO_Pointer_F","arifle_SPAR_03_base_F","arifle_SPAR_03_blk_MOS_Pointer_Bipod_F","SMG_05_base_F"]] call test},
"",
10000
];
######################
Result:[25.55,40]
######################

------------------------------------------------------------------------------------
-----------------------------         NEW STRING         -----------------------------
------------------------------------------------------------------------------------
test = {
	params[
		["_in", "", ["",[],0,true]]
	];

	if (_in isEqualType []) exitWith {
		str toString(toArray(str _in) apply {if (_x == 34) then {96;} else {_x;};});
	};

	if (_in isEqualType "") exitWith {
		toString(toArray _in - toArray "'/\`:|;,{}-""<>");
	};

	if (_in isEqualType true) exitWith {
		[0,1] select _in;
	};

	if (_in isEqualType 0) exitWith {
		[false,true] select _in;
	};
};
res = diag_codePerformance [
{["THIS IS A VERRRY VERRRY LONG STRING WHICH WILL CONTAIN ALL OF THIS FUCKING REMOVALS MULTIPLE TIMES JUST TO SHOW HOW SHITTY THIS FNC IS'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>"] call test},
"",
10000
];
######################
Result:[0.0938,10000]
######################

------------------------------------------------------------------------------------
-----------------------------         OLD STRING         -----------------------------
------------------------------------------------------------------------------------
test = {
	private ["_string","_filter"];
	_string = [_this,0,"",[""]] call BIS_fnc_param;
	_filter = "'/\`:|;,{}-""<>";

	_string = toArray _string;
	_filter = toArray _filter;

	{
	    if (_x in _filter) then {
	        _string deleteAt _forEachIndex;
	    };
	} forEach _string;

	toString _string;
};

res = diag_codePerformance [
{["THIS IS A VERRRY VERRRY LONG STRING WHICH WILL CONTAIN ALL OF THIS FUCKING REMOVALS MULTIPLE TIMES JUST TO SHOW HOW SHITTY THIS FNC IS'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>'/\`:|;,{}-""<>"] call test},
"",
10000
];
######################
Result:[0.506586,1974]
######################





test = {
	private _i = _this select 0;
	private _s = _this select 1;
	private _r = -1;

	if (count _s == 0) exitwith {_r};
	{
		if(_i in _x) exitWith {
			_r = true;
		};
		nil
	} count _s;

	_r;
};

res = diag_codePerformance [
{["ÏÈąąĨiÁc¡m",tArray] call test},
"",
10000
];

[0.0092,10000]
[0.1984,5000]


test = {
private _i = _this select 0;
private _s = _this select 1;
private _r = -1;

if (count _s == 0) exitwith {_r};

{
	if(_i in _x) exitWith {
		_r = _forEachIndex;
	};
} foreach _s;

_r;
};

res = diag_codePerformance [
{["ÏÈąąĨiÁc¡m",tArray] call test},
"",
10000
];

[0.0084,10000]
[0.128999,7752]




















fastban : 


{ 
 _query = "INSERT INTO bans (name, playerid, von, datum, status, grund) VALUES ((Select name From players Where playerid='"+_x+"'), '"+_x+"', 'Lucian', '-1', 'true', 'Ausnutzen der Spielmechanik');"; 
 [_query,1] call DB_fnc_asyncCall; 
} forEach ["76561198123726861", "76561198079322013", "76561198095083430", "76561198138641665", "76561198059838489", "76561198106985482", "76561198041701603", "76561198037824240", "76561198064111272", "76561198143034333", "76561198098275134", "76561198211832248", "76561198125593641", "76561198067440997", "76561198224300420", "76561198269246463", "76561198256496256", "76561197991171802", "76561198093886069", "76561198165685611", "76561198123283314", "76561198204137461", "76561198124182168", "76561198122335670", "76561198067546656", "76561198138741105", "76561198236323434", "76561198139844008", "76561198023436478", "76561198083895709"]


[] spawn { 
	_banner = "LUC";
	_reason = "Luciasm sist ein egeile fkt sader dich einfahac nicht mag und disach ashast "
	_text = format["<t size='2'align='center'> Hausverbot auf DE100! </t> <br/> <br/> <t size='1'> Du wurdest von %1 permanent gebannt. </t> <br/> <t size='1'color='#FFFFFF'> <br/> Grund:<br/>%2 </t>",_banner,_reason];
	((finddisplay 0) displayCtrl 769) ctrlSetStructuredText parseText _text;
	for "_i" from 1 to 101 do {
		(finddisplay _i) closeDisplay 0;
	};
};

getText (missionConfigFile >> "lifeVehicles" >> "C_Hatchback_01_sport_F" >> "TextureSources" >> "Red" >> "displayName")

count (allGroups select {side _x == civilian && count (units _x) == 0})

("true" configClasses (missionConfigFile >> "lifeVehicles" >> "C_Hatchback_01_sport_F" >> "TextureSources"))

configProperties [
	 (missionConfigFile >> "lifeVehicles" >> "C_Hatchback_01_sport_F" >> "TextureSources"), 
	"true", 
	true
];


[] spawn {
	_br = toString [13,10];
	_out = "";
	{
		systemChat str _x;
		_tex = "";
		_array = (getArray (_x >> "textures"));
		{
			_tex = _tex + """" + _x + """";
			if (_forEachIndex < (count _array -1)) then {
				_tex = _tex + ","; 
			};
		} forEach _array;
		_out = _out + _br + _br + "class " + (configName _x) + " {" + _br + " displayName = """ + (getText (_x >> "displayName")) + """;" + _br + " factions[] = {""civ""};" + _br + " textures[] = {" + _tex + "};" + _br + "};";
	} forEach ("true" configClasses (configfile >> "CfgVehicles" >> "O_Truck_03_fuel_F" >> "TextureSources"));
	copyToClipboard str _out;
};


[] spawn {

	_br = toString [13,10];
	_out = "";
	{
		systemChat str _x;
		_heli = (configName _x) createVehicleLocal (player getRelPos [10, 0]);
		_pos = getPosWorld _heli;
		_p1 = getPosAsl _heli;
		deleteVehicle _heli;

		_out = _out + _br + format["<tr>%1<th>%2</th>%1<th>%3</th>%1<th>%4</th>%1</tr>",_br,getText (_x >> "displayName"),format["<code>(createSimpleObject [""%1"", (getPosAsl this)vectorAdd [0,0,%2]])setDir (getDirVisual this);</code>",(getText (_x >> "model")),(_pos select 2)-(_p1 select 2)],format["<img src=""previews/%1.jpg"">",configName _x]];
	} forEach(configProperties [   (configfile >> "CfgVehicles"),    "(configName _x) isKindOf 'Eden_Exended_Object'",    true  ]);
	copyToClipboard _out;
}



/////////////////
MAKE BE FILTER
/////////////////
private _br = toString [13,10];
private _out = "";
private _lf = [];
private _sock = [];
private _hc = [];
private _bis = [];
private _ton = [];
private _cs = [];
private _msc = [];
private _pl = [];
private _veh = [];
private _tmp = "";

private _exit = false;
{
	_exit = false;
	if (((toLower(configName _x))find (toLower"life_fnc_")) >= 0) then {
		_lf pushBackUnique ([(configName _x),9] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"SOCK_fnc_")) >= 0) then {
		_sock pushBackUnique ([(configName _x),9] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"HC_fnc_")) >= 0) then {
		_hc pushBackUnique ([(configName _x),7] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"CS_fnc_")) >= 0) then {
		_cs pushBackUnique ([(configName _x),7] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"PL_fnc_")) >= 0) then {
		_pl pushBackUnique ([(configName _x),7] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"TON_fnc_")) >= 0) then {
		_ton pushBackUnique ([(configName _x),8] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"MSC_fnc_")) >= 0) then {
		_msc pushBackUnique ([(configName _x),8] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"VEH_fnc_")) >= 0) then {
		_veh pushBackUnique ([(configName _x),8] call BIS_fnc_trimString);
		_exit = true;
	};

	if (((toLower(configName _x))find( toLower"BIS_fnc_")) >= 0) then {
		_bis pushBackUnique ([(configName _x),8] call BIS_fnc_trimString);
		_exit = true;
	};
	if (!_exit) then {
		_out = _out + format["!%1 ",(configName _x)];
	};
} foreach ("true" configClasses (missionconfigfile >> "CfgRemoteExec" >> "Functions"));

{
	_tmp = format["%2!%1(",_x select 1,_br];
	private _var = _x select 1;
	private _count = count(_x select 0) -1;
	private _cc = 0;
	private _cc2 = 1;
  {

    if (_cc != _count && _cc2 != 8) then {
    	_tmp = _tmp + format["%1|",_x];
    } else {
	  	if (_cc2 == 8) then {
	  		_tmp = _tmp + format["%1)%3!%2(",_x,_var,_br];
	  		_cc2 = 0;
	  	} else {
    		_tmp = _tmp + format["%1",_x];
	  	};
	};
	_cc =_cc+1;
	_cc2 = _cc2 +1;
  } forEach (_x select 0);
  _out = _out +_tmp + ") ";
} forEach [[_lf,"life_fnc_"],[_sock,"SOCK_fnc_"],[_hc,"HC_fnc_"],[_bis,"BIS_fnc_"],[_ton,"TON_fnc_"],[_cs,"CS_fnc_"],[_msc,"MSC_fnc_"],[_pl,"PL_fnc_"],[_veh,"VEH_fnc_"]];

copyToClipboard tolower str _out;
////////////////////



["SELECT playerid FROM arma_main_server.players WHERE adminlevel > '0';",2] call DB_fnc_asyncCall;



private _wh = ["SMG_02_F","srifle_DMR_01_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_olive_F","arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20_plain_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F","hgun_P07_F","hgun_PDW2000_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","SMG_01_F","arifle_MXC_Black_F","arifle_MXM_Black_F","arifle_MX_Black_F","arifle_MX_GL_Black_F","arifle_MX_SW_Black_F","hgun_P07_snds_F","hgun_Pistol_Signal_F","srifle_DMR_02_camo_F","srifle_DMR_03_F","srifle_EBR_F","hgun_P07_khk_F","hgun_Pistol_01_F","SMG_05_F","LMG_03_F","arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_02_blk_F","arifle_SPAR_03_blk_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F","srifle_DMR_07_blk_F","srifle_DMR_07_ghex_F","hgun_ACPC2_F","arifle_SPAR_01_khk_F","arifle_CTAR_hex_F","arifle_MXC_F","arifle_MX_F","arifle_MXM_F","srifle_DMR_07_hex_F","arifle_MX_SW_F","srifle_DMR_03_khaki_F","arifle_SPAR_03_khk_F","srifle_DMR_05_blk_F","LMG_Mk200_F"];

_out = [];
{
	if !(configName _x in _wh) then {
		if (configName _x isKindOf ["Pistol", configFile >> "CfgWeapons"] || configName _x isKindOf ["Rifle", configFile >> "CfgWeapons"] || configName _x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
			_out pushBackUnique (configName _x)
		};
	};
} forEach ("true" configClasses (configfile >> "CfgWeapons"));
copyToClipboard str _out;


_out = [];
{

	if (configName _x isKindOf ["Pistol", configFile >> "CfgWeapons"] || configName _x isKindOf ["Rifle", configFile >> "CfgWeapons"] || configName _x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
		_out pushBackUnique (configName _x)
	};
} forEach ("true" configClasses (missionConfigFile >> "lyl"));
copyToClipboard str _out;


private _wh = ["SMG_02_F","srifle_DMR_01_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_olive_F","arifle_Katiba_C_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20_plain_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F","arifle_TRG21_GL_F","hgun_P07_F","hgun_PDW2000_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","SMG_01_F","arifle_MXC_Black_F","arifle_MXM_Black_F","arifle_MX_Black_F","arifle_MX_GL_Black_F","arifle_MX_SW_Black_F","hgun_P07_snds_F","hgun_Pistol_Signal_F","srifle_DMR_02_camo_F","srifle_DMR_03_F","srifle_EBR_F","hgun_P07_khk_F","hgun_Pistol_01_F","SMG_05_F","LMG_03_F","arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_02_blk_F","arifle_SPAR_03_blk_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F","srifle_DMR_07_blk_F","srifle_DMR_07_ghex_F","hgun_ACPC2_F","arifle_SPAR_01_khk_F","arifle_CTAR_hex_F","arifle_MXC_F","arifle_MX_F","arifle_MXM_F","srifle_DMR_07_hex_F","arifle_MX_SW_F","srifle_DMR_03_khaki_F","arifle_SPAR_03_khk_F"];

{
	private _arr = getArray (_x >> "items");
	{
		private _class = _x select 0;
		if (_class isKindOf ["Pistol", configFile >> "CfgWeapons"] || _class isKindOf ["Rifle", configFile >> "CfgWeapons"] || _class isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {
			_wh pushBackUnique (configName _x)
		};
	} forEach _arr;
} forEach ("true" configClasses (missionConfigFile >> "lylw"));
copyToClipboard str _wh;









_colorArray = configProperties [
	(missionConfigFile >> "VirtualItems"), 
	"true", 
	true
];


[] spawn {
	diag_log"[";
	{
		_classname = configName _x;
		diag_log format ["'%1' => [",_classname];
		diag_log format ["'Default' => 'Arma3-Standart',",_classname];
		_endcount = count ("true" configClasses (_x >> "TextureSources")) -1;
		{
			if (_forEachIndex == _endcount) then {
				diag_log format ["'%1' => '%2'",configName _x,getText(_x >> "displayName")];
			} else {
				diag_log format ["'%1' => '%2',",configName _x,getText(_x >> "displayName")];
			};
		} forEach ("true" configClasses (_x >> "TextureSources"));
		diag_log format ["],"];
	} forEach ("true" configClasses (missionConfigFile >> "lifeVehicles"));	
	diag_log"]";;
};

[] spawn {
	private _classnames = [];
	{
		{
			_classnames pushBackUnique (_x select 0);
		} forEach (getArray(_x >> "uniforms") + getArray(_x >> "headgear") + getArray(_x >> "goggles") + getArray(_x >> "vests") + getArray(_x >> "backpacks"));
	} forEach ("true" configClasses (missionConfigFile >> "Clothing"));


	diag_log"[";

	{
		private _disply = [_x] call life_fnc_fetchCfgDetails;
		diag_log format ["'%1' => '%2',",_x,_disply select 1];
	} forEach _classnames;
	diag_log"]";
};


[] spawn {
	private _br = toString [13,10];
	_str = "["+_br;
	{
		_classname = configName _x;
		_displayName = getText (_x >> "displayName");
		_str = format ["%3'%1' => '%2',%4",_classname,localize _displayName,_str,_br];
	} forEach ("true" configClasses (missionConfigFile >> "Licenses"));	
	copyToClipboard (_str+"]");
};

[] spawn {
	private _br = toString [13,10];
	_str = "["+_br;
	{
		_classname = configName _x;
		_displayName = getText (_x >> "displayName");
		_str = format ["%3'%1' => '%2',%4",_classname,localize _displayName,_str,_br];
	} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
	copyToClipboard (_str+"]");
};




[] spawn {
	private _t = "";
	private _br = toString [13,10];
	{
		_displayName = localize (getText(_x >> "displayName"));
		_maxPrice = str getNumber (_x >> "maxPrice");
		_minPrice = str getNumber (_x >> "minPrice");
		_gew = str getNumber (_x >> 'weight');
		_atcj = str getArray (_x >> 'relatedItems');
		_t = _t + format ["%1(%6) | MaxPreis %2 | MinPreis %3 | Gewicht %4 | relatedItems %5%7",_displayName,_maxPrice,_minPrice,_gew,_atcj,configName _x,_br];
	} forEach (configProperties [(missionConfigFile >> "VirtualItems"), "getNumber (_x >> 'dynTracker')  isEqualTo 1",	true]);
	copyToClipboard _t;
};



// PAYCHECK
private _profs = "getText(_x >> 'flag') isEqualTo 'civ' && getText(_x >> 'skilltype') isEqualTo 'Process'" configClasses (missionConfigFile >> "ProfSys");
private _Achivments = "getText(_x >> 'side') isEqualTo 'civ' && !(getText(_x >> 'variable') isEqualTo '')" configClasses (missionConfigFile >> "Achievements");

private _paycheck = 0;
{
	private _variable = getText(_x  >> "variable");
	private _data = missionNamespace getVariable [(_variable),[1,0]];
	_paycheck = _paycheck + (25 * _data select 0);
} forEach _profs;

{
	private _variable = getText(_x  >> "variable");
	private _data = missionNamespace getVariable [(_variable),[0,0]];
	_paycheck = _paycheck + (25 * _data select 1);
} forEach _Achivments;




guid = "";
_guid = "76561198065259095";
_guid = [_guid] call KRON_StrToArray;
_guid = _guid select [10,7];
{
	guid = guid + _x;
} forEach _guid;

guid = "01337" + guid;


#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)
(ctrlPosition (_TextField)) select 1


(findDisplay 7100) displayCtrl 988;
cooler_array = [["send","Hallo ich würde gerne vonhiektioniert es ?","16:00 27.10.16"],["recive","Hallo ich würde gerne von ihenne wissen, ob das hier funktioniert. Funktioniert es ?","16:00 27.10.16"],["recive","Hallo ich würde gerne von ihenne wissen, ob das hier funktioniert. Funktioniert es ?","16:00 27.10.16"],["send","Hallo ich würde gerne von ihenne wissen, ob das hier funktioniert. Funktioniert es ?","16:00 27.10.16"],["send","123456","16:00 27.10.16"],["send","Test","16:00 27.10.16"]];
createDialog "Life_my_new_smartphone_msg";
[] spawn {
private _display = findDisplay 7100;
private _ctrlGrp = _display displayCtrl 7102;
private _footerPos = 0;
private _footerHigh = 0.005 * safezoneH;

	{
		private _type = _x select 0;
		private _msg = _x select 1;
		private _timeStamp = _x select 2;

		private _textField = _display ctrlCreate ["RscStructuredText",100 +_forEachIndex,_ctrlGrp];
		private _footer = _display ctrlCreate ["RscStructuredText",200 +_forEachIndex,_ctrlGrp];
		private _offset = if (_type isEqualTo "recive") then {
			0.01 * safezoneW;
		} else {
			0.06 * safezoneW;
		};

		_textField ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.5,0.093917 * safezoneW,0];
		_footer ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.5,0.093917 * safezoneW,0];
		_textField ctrlSetBackgroundColor [0,0,0,0.7];
		_footer ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
		_textField ctrlCommit 0;
		_footer ctrlCommit 0;


		_textField ctrlSetStructuredText parseText _msg;
		_footer ctrlSetStructuredText parseText (format["<t align='center'>%1</t>",_timeStamp]);

		_textField ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.3,0.093917 * safezoneW,ctrlTextHeight _textField];
		_footer ctrlSetPosition [_offset,_footerPos + _footerHigh * 1.3 + ctrlTextHeight _textField,0.093917 * safezoneW,ctrlTextHeight _footer];
		_textField ctrlCommit 0;
		_footer ctrlCommit 0;


		_footerPos = _footerPos + _footerHigh * 1.3 + ctrlTextHeight _textField;
		_footerHigh = (ctrlPosition _footer select 3);

	} forEach cooler_array;
};

hint "Hallo WELT!!!";

createDialog "virt_houseMenu";

lnbAddArray [1100,[[["","[999]","Dummer Hut"],[0,1,1],["","[75]","BumBum Gun"]],[["","[75]","BumBum Gun"],[2,2,2],["","","#2"]],[["","","#3"],[3,3,3],["","","#3"]],[["#4"],[4],["#4"]]]];
lnbSetPicture [1100, [0, 0], "\A3\weapons_F\Rifles\Khaybar\Data\UI\gear_Khaybar_X_CA.paa"];
lnbSetPicture [1100, [1, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_04\Data\UI\gear_DMR_04_X_CA.paa"];
lnbSetPicture [1100, [2, 0], "\A3\Weapons_F_EPA\Pistols\Pistol_Heavy_01\data\UI\gear_pistol_heavy_01_X_ca.paa"];

lnbAddArray [1200,[[["","[999]","Raketen"],[0,1,1],["","[9]","Kartoffeln"]],[["","","#2"],[2,2,2],["","","#2"]],[["","","#3"],[3,3,3],["","","#3"]],[["#4"],[4],["#4"]]]];
lnbSetPicture [1200, [0, 0], "images\items\ico_golderz.paa"];





"" spawn {
	
	while {test} do {
	private _vehicle = (vehicle player);
	if (!isNull _vehicle) then {
		private _fuel = fuel _vehicle;
		if (local _vehicle && isEngineOn _vehicle && !isNull objectParent player && _fuel > 0) then {

			private _velocity = speed _vehicle;
			private _newFuel = (80 * _fuel - _velocity * 0.00025 - count(crew _vehicle) * 0.005 - ((_vehicle getVariable ["Trunk",[0,0]]) select 1) * 0.0025) / 80;

			if (_newFuel < 0) then {
				_newFuel = 0;
			};
			_vehicle setFuel _newFuel;
			systemChat format["OldFuel %1",_fuel];
			systemChat format["NewFuel %1",_newFuel];
			systemChat format["Verbrauch in Litern %1", (_velocity * 0.00025 + count(crew _vehicle) * 0.005 + ((_vehicle getVariable ["Trunk",[0,0]]) select 1) * 0.0025)];
		};
	};
	};
	systemChat "out";
}



[] spawn {
	private _startFrame = diag_tickTime;
	for "_i" from 0 to 1000 step 1 do {
		private _array2 = [];
		private _array = [objNull,objNull,objNull,player,objNull,player,player,player,objNull,objNull,player,player,objNull,player, objNull, player,player,player,player,player,objNull,objNull,objNull,player,objNull] call BIS_fnc_arrayShuffle;
        {
            if(!isNull _x && {!(_x isKindOf "House")}) then {
                _array2 pushBack _x;
            };
		} forEach _array;
		_array2 = _array2 - [objNull];
	};
	systemChat format["execTime time: %1",(diag_tickTime - _startFrame)/1000];
	gay = format["execTime time: %1",(diag_tickTime - _startFrame)/1000]
};


-----------------------------
CHECK FOR NEW AND OLD MARKERS
-----------------------------
[] spawn {
	new = [];
	crnt = [];

	{
		crnt append (getArray(_x >> "markers"));
	} forEach ("true" configClasses (missionConfigFile >> "Marker"));

	{
	  if (markerAlpha _x > 0 && markerText _x != "" && (getMarkerPos _x) distance [0,0,0] > 8000) then {
	  	if !(_x in crnt) then {
	  		new pushBack _x
	  	} else {
	  		crnt deleteAt (crnt find _x);
	  	};
	  } else {
	  	if (_x in crnt) then {
	  		crnt deleteAt (crnt find _x);
	  	};
	};
	} forEach allMapMarkers;
}








[] spawn {

	_marker = getArray(missionconfigfile >> "Marker" >> "Resource_Fields_legal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Resource_Fields_illegal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Processing_legal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Processing_illegal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Dealer_legal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Dealer_illegal" >> "markers");
	_marker append getArray(missionconfigfile >> "Marker" >> "Delivery_Point" >> "markers");
	_marker append     ["TankMarker_0",
	    "TankMarker_1",
	    "TankMarker_2",
	    "TankMarker_3",
	    "TankMarker_4",
	    "TankMarker_5",
	    "TankMarker_6",
	    "TankMarker_7",
	    "TankMarker_8",
	    "TankMarker_9",
	    "TankMarker_10",
	    "TankMarker_11",
	    "TankMarker_12",
	    "TankMarker_13",
	    "TankMarker_14",
	    "TankMarker_15",
	    "TankMarker_16",
	    "TankMarker_17",
	    "TankMarker_18",
	    "TankMarker_19",
	    "TankMarker_20",
	    "TankMarker_21",
	    "TankMarker_22",
	    "TankMarker_23",
	    "TankMarker_24",
	    "TankMarker_25",
	    "TankMarker_26",
	    "TankMarker_27",
	    "TankMarker_28",
	    "TankMarker_29",
	    "TankMarker_30",
	    "TankMarker_31"];

	{
	  _x setMarkerAlpha 0;
	} forEach _marker;

};

findDisplay 12 setVariable ["MarkerSystemBOX", (findDisplay 12 ctrlCreate ["RscTree", -1])];
private _BOX = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];
_BOX ctrlSetPosition [1.005156 * safezoneW + safezoneX, 0.087 * safezoneH + safezoneY, 0.221719 * safezoneW, 0.836 * safezoneH];
_BOX ctrlCommit 1;

cool_fnc = {
params[
	["_ctrl", controlNull, [controlNull]],
	["_path", [], [[]]],
	"_shown"
];

if (count _path == 1) exitwith {
	_ctrl tvExpand [_path select 0,1];
	_ctrl tvExpand [_path select 0,2];
};
private _green = [0,0.8,0,1];
private _red = [0.8,0,0,1];

private _mainScope = _ctrl tvData [_path select 0];
private _type = _ctrl tvData [_path select 0,_path select 1];
switch (_type) do { 
	case "show" : {
		if (findDisplay 12 getVariable [format["%1_shown",_mainScope],true]) then {
			_ctrl tvSetPictureColor [_path, _red];
			_ctrl tvSetPictureColorSelected [_path, _red];
			_shown = 0;
		} else {
			_ctrl tvSetPictureColor [_path, _green];
			_ctrl tvSetPictureColorSelected [_path, _green];
			_shown = 1;
		};

		{
		  _x setMarkerAlphaLocal _shown;
		} forEach (getArray(missionConfigFile >> "Marker" >> _mainScope >> "markers"));
		profileNamespace setVariable [format["%1_shown", _mainScope],!(findDisplay 12 getVariable [format["%1_shown",_mainScope],true])];
		findDisplay 12 setVariable [format["%1_shown",_mainScope],!(findDisplay 12 getVariable [format["%1_shown",_mainScope],true])];
	};

	case "color" : {
		if (count _path < 3) exitwith {};
		private _infoArray = call compile format["%1",_ctrl tvData _path];
		private _colorMarker = _infoArray select 0;
		private _colorArray = _infoArray select 1;

		{
			if (markerType _x != "Empty") then {
				_x setMarkerColorLocal _colorMarker;
			};
		} forEach (getArray(missionConfigFile >> "Marker" >> _mainScope >> "markers"));
		_ctrl tvSetPictureColor [[_path select 0,_path select 1], _colorArray];
		profileNamespace setVariable [format["%1_color", _mainScope],_infoArray];
	};

	case "size" : {
		if (count _path < 3) exitwith {};
		private _sizeInfo = _ctrl tvData _path;
		profileNamespace setVariable [format["%1_size", _mainScope],_sizeInfo];
		_sizeInfo = switch (_sizeInfo) do { 
			case "big" : {[2,2]}; 
			case "default" : {[1,1]};
			case "small" : {[0.5,0.5]}; 
		};

		{
			if (markerType _x != "Empty") then {
				_x setMarkerSizeLocal _sizeInfo;
			};
		} forEach (getArray(missionConfigFile >> "Marker" >> _mainScope >> "markers"));
	};

	default {}; 
};
};

coolV2 = {
	params[
		["_ctrl", controlNull, [controlNull]],
		["_path", [], [[]]],
		"_shown"
	];
	if (count _path == 1) then {
			_ctrl tvCollapse [_path select 0,1];
			_ctrl tvCollapse [_path select 0,2];
	};
};


private _box = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];

gay = _box tvData [0];


_box tvExpand [0];
_box tvSort [ [], false];

_box ctrlAddEventHandler ["TreeDblClick",{_this call cool_fnc}];

_box ctrlAddEventHandler ["TreeCollapsed",{_this call coolV2}];

tvClear _BOX;
_box tvAdd [[],"Legale Rohstoffe"];
_box tvSetData [[0], "Resource_Fields_legal"];

_index = _box tvAdd [[0],"Zeigen"];
_box tvSetData [[0,_index], "show"];
_box tvSetPicture [[0,_index] ,"images\icons\ico_switchDefault.paa"];
_box tvSetPictureColor [[0,_index], [0.8,0,0,1]];
_box tvSetPictureColorSelected  [[0,_index], [0.8,0,0,1]];

_index = _box tvAdd [[0],"Farbe"];
_box tvSetPicture [[0,_index] ,"images\icons\ico_switchDefault.paa"];
_box tvSetPictureColor [[0,_index], [0.8,0,0,1]];
_box tvSetPictureColorSelected  [[0,_index], [0.8,0,0,1]];

_index = _box tvAdd [[0,1],"Rot"];
_box tvSetPicture [[0,1,_index] ,"images\icons\ico_switchDefault.paa"];
_box tvSetPictureColor [[0,1,_index], [1,0,0,1]];
_box tvSetPictureColorSelected  [[0,1,_index], [1,0,0,1]];

_index = _box tvAdd [[0,1],"Grün"];
_box tvSetPicture [[0,1,_index] ,"images\icons\ico_switchDefault.paa"];
_box tvSetPictureColor [[0,1,_index], [0,1,0,1]];
_box tvSetPictureColorSelected  [[0,1,_index], [0,1,0,1]];

_index = _box tvAdd [[0,1],"Blau"];
_box tvSetPicture [[0,1,_index] ,"images\icons\ico_switchDefault.paa"];
_box tvSetPictureColor [[0,1,_index], [0,0,1,1]];
_box tvSetPictureColorSelected  [[0,1,_index], [0,0,1,1]];

_index = _box tvAdd [[0],"Größe"];
_index = _box tvAdd [[0,2],"Groß"];
_index = _box tvAdd [[0,2],"Mittel"];
_index = _box tvAdd [[0,2],"Klein"];


private _Background = findDisplay 12 getVariable ["MarkerSystemBackGround",controlNull];
_Background ctrlSetBackgroundColor [0,0,0,0.1];

private _BOX = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];
for "_i" from 0 to 32 do {
	_box tvAdd [[],str _i];
};

private _BOX = findDisplay 12 getVariable ["MarkerSystemBOX",controlNull];
for "_i" from 0 to 32 do {
	_box lbAdd str _i;
};


[
	["Schwarz","ColorBlack",[0,0,0,1]],
	["Grau","ColorGrey",[0.5,0.5,0.5,1]],
	["Rot","ColorRed",[0.9,0,0,1]],
	["Braun","ColorBrown",[0.5,0.25,0,1]],
	["Orange","ColorOrange",[0.85,0.4,0,1]],
	["Geld","ColorYellow",[0.85,0.85,0,1]],
	["Khaki","ColorKhaki",[0.5,0.6,0.4,1]],
	["Grün","ColorGreen",[0,0.8,0,1]],
	["Blau","ColorBlue",[0,0,1,1]],
	["Pink","ColorPink",[1,0.3,0.4,1]],
	["Weiß","ColorWhite",[1,1,1,1]],
	["BLUEFOR","ColorWEST",[0,0.3,0.6,1]],
	["OPFOR","ColorEAST",[0.5,0,0,1]],
	["INDEPENDENT","ColorGUER",[0,0.5,0,1]],
	["ZIVILIST","ColorCIV",[0.4,0,0.5,1]],
	["UNBEKANNT","ColorUNKNOWN",[0.7,0.6,0,1]]
]



gay = [];

{
	if (markerAlpha _x isEqualTo 1 && markerText _x != "") then {
		gay pushBack [_x,markerText _x, markerPos _x];
	};
} forEach allMapMarkers;


[["U_B_CombatUniform_mcam","images\clothing\clan_ds_u.paa"],["B_Kitbag_cbr","images\clothing\clan_ds_b.paa"]]





deleteVehicle gay;
gay = "C_Offroad_01_F" createVehicle (getPosATL (nearestObject [player, "Land_Pier_Box_F"])); 
gay setPosATL ((getPosATL (nearestObject [player, "Land_Pier_Box_F"])) vectorAdd [0,0,1]);
gay setDir (getDir (nearestObject [player, "Land_Pier_Box_F"]));

deleteVehicle gay;
gay = "C_Offroad_01_F" createVehicle (getPosATL (nearestObject [player, "Land_Pier_Box_F"])); 
gay setPosATL ((getPosATL (nearestObject [player, "Land_Hospital_side2_F"])) vectorAdd [0,0,1]);
gay setDir (getDir (nearestObject [player, "Land_Hospital_side2_F"]));


_pos = player getRelPos [10, 0];
_3d = (str missionConfigFile select [0, count str missionConfigFile - 15]) + "present.p3d";
_tank = createSimpleObject [_3d, AGLtoASL _pos]; 
_tank setObjectTexture [0, "data\present_co.paa"]; 



life_fnc_deathScreen = {
	disableSerialization;
	params[
		["_display", displayNull, [displayNull]]
	];
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach allControls _display;
	_display spawn {
		disableSerialization;
		sleep 1;
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 1;
			uiSleep 0.25;
		} forEach allControls _this;
	}
};

life_fnc_deathScreen_off = {
	disableSerialization;
	params[
		["_display", displayNull, [displayNull]]
	];

	private _handle = _display getVariable "deathBlur";
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};

life_fnc_deathScreen_fadeOut = {
	disableSerialization;
	params[
		["_display", displayNull, [displayNull]],
		"_arr"
	];
	_arr = allControls _display;
	{
		_x ctrlEnable false;
	} forEach _arr;
	reverse _arr;
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 1;
		uiSleep 0.35;
	} forEach _arr;
	waitUntil {ctrlCommitted (_arr select (count _arr -1))};
	_display closeDisplay 1;
};




life_fnc_thrCentral = {
	disableSerialization;
	params[
		["_display", displayNull, [displayNull]]
	];
	for "_i" from 3 to 8 do {
		(_display displayCtrl _i) ctrlSetFade 1;
		(_display displayCtrl _i) ctrlCommit 0;
		(_display displayCtrl _i) ctrlEnable false;
	};
	(_display displayCtrl 1) ctrlShow true;
	(_display displayCtrl 2) ctrlShow true;
	(_display displayCtrl 9) ctrlShow true;
	private _text = "";
	for "_i" from 0 to (6 + round(random 12)) do {
		if (isNull _display) exitwith {};
		if (_text isEqualTo "...") then {
			_text = "";
		};
		_text = _text + ".";
		(_display displayCtrl 1) ctrlSetText format["Verbinde mit der THR-Zentrale%1",_text];
		(_display displayCtrl 2) ctrlSetText format["Verbinde mit der THR-Zentrale%1",_text];
		uiSleep 0.4;
	};
	if (isNull _display) exitwith {};
	(_display displayCtrl 1) ctrlSetText "Verbunden mit der THR-Zentrale";
	(_display displayCtrl 2) ctrlSetText "";
	for "_i" from 3 to 8 do {
		(_display displayCtrl _i) ctrlEnable true;
		(_display displayCtrl _i) ctrlSetFade 0;
		(_display displayCtrl _i) ctrlCommit 1;
		uiSleep 0.25;
	};
};



life_open_notifications = [];
test2 = {
params[
	"_text",
	["_error",false,[false]],
	["_speed","",[""]]
];

disableSerialization;
_display = finddisplay 46;
if (profilenamespace getVariable["de100_notify",true]) then {
	if (_error) then {
		playSound "3DEN_notificationWarning";
	} else {
		playSound "HintExpand";
	};
};
private _headerColor = if (_error) then {
	[0.538433,0,0,0.8];
} else {
	[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])];
};
if (_text isEqualType "") then {
	_text = parseText _text;
};

private _HeaderCords = profilenamespace getVariable["DE100_NOTIFY_CUSTOM_HEADER",[0.005 * safezoneW + safezoneX, 0.01 * safezoneH + safezoneY]];
private _Header = _display ctrlCreate ["RscText", -1];
_Header ctrlSetPosition [_HeaderCords select 0, _HeaderCords select 1, 0.2 * safezoneW, 0.011 * safezoneH];
_Header ctrlSetBackgroundColor _headerColor;
_Header ctrlSetFade 1;
_Header ctrlCommit 0;
_Header ctrlSetFade 0;
_Header ctrlCommit 0.4;

private _TextFieldCords = profilenamespace getVariable["DE100_NOTIFY_CUSTOM_TEXT",[0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY]];
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText _text;
_TextField ctrlSetPosition [_TextFieldCords select 0, _TextFieldCords select 1,0.2 * safezoneW, 0.5];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [_TextFieldCords select 0, _TextFieldCords select 1,0.2 * safezoneW, ((ctrlTextHeight _TextField) + (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0,0,0,0.85];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;

[_TextField,_Header,_speed] spawn {
	disableSerialization;
	if (_this select 2 isEqualTo "fast") then {
		uiSleep 5;
	} else {
		uiSleep 15;
	};
	private _TextField = _this select 0;
	private _Header = _this select 1;
	_TextField ctrlSetFade 1;
	_TextField ctrlCommit 0.3;
	_Header ctrlSetFade 1;
	_Header ctrlCommit 0.3;
	uiSleep 0.3;
	ctrlDelete _Header;
	ctrlDelete _TextField;
};

private _posText = (ctrlPosition (_TextField)) select 1;
private _posHeader = (ctrlPosition (_Header)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;
private _minus = if (_posText < (0.5 * safezoneH + safezoneY)) then {
	1;
} else {
	-1;
};
if (count life_open_notifications > 0) then {
	private _activeNotifications = 0;
	{
		private _ctrlHeader = _x select 0;
		private _ctrlText = _x select 1;
		if (!isNull _ctrlHeader && !isNull _ctrlText) then {
			_ctrlHeader ctrlSetPosition [_HeaderCords select 0, _posHeader + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus];
			_ctrlText ctrlSetPosition [_TextFieldCords select 0, _posText + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus];
			_ctrlHeader ctrlCommit 0.25;
			_ctrlText ctrlCommit 0.25;

			_posText = _posText + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus;
			_posHeader = _posHeader + (_textHigh + 1.5*(0.011 * safezoneH)) * _minus;
			_textHigh = (ctrlPosition (_ctrlText)) select 3;
			if (_activeNotifications > 3) then {
				_ctrlText ctrlSetFade 1;
				_ctrlHeader ctrlSetFade 1;
				_ctrlText ctrlCommit 0.2;
				_ctrlHeader ctrlCommit 0.2;
			};
			_activeNotifications = _activeNotifications + 1;
		};
	} forEach life_open_notifications;
};
life_open_notifications = ([[_Header,_TextField]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};
};
test = {
	disableSerialization;
	params[
		["_display", displayNull, [displayNull]],
		["_exitCode", 0, [0]],
		"_headerPos",
		"_textPos"
	];
	if (_display getVariable ["reset",false]) then {
		_headerPos = nil;
		_textPos = nil;
	} else {
		_headerPos = ctrlPosition (_display displayCtrl 1);
		_textPos = ctrlPosition (_display displayCtrl 2);
	};
	profilenamespace setVariable ["DE100_NOTIFY_CUSTOM_HEADER",_headerPos select [0,2]];
	profilenamespace setVariable ["DE100_NOTIFY_CUSTOM_TEXT",_textPos select [0,2]];
	[] spawn {
		uiSleep 1;
		["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At",false,"fast"] call test2;
		uiSleep 1;
		["Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At",false,"slow"] call test2;
	}
};
createDialog "THR_Central";
[] spawn {
sleep 1;
["TEXT1",false,"fast"] call test2;
sleep 1;
["TEXT2",false,"fast"] call test2;
sleep 1;
["TEXT3",false,"fast"] call test2;
sleep 1;
["TEXT4",false,"fast"] call test2;
};
	profilenamespace setVariable ["DE100_NOTIFY_CUSTOM_HEADER",nil];
	profilenamespace setVariable ["DE100_NOTIFY_CUSTOM_TEXT",nil];
	["TEXT",false,"fast"] call life_fnc_notification_system;





//Normal ca. 27 sek
"Land_Billboard_F","Land_Atm_02_F","Land_Atm_01_F","Land_Device_assembled_F","Land_InfoStand_V2_F",



A3Log = {
	params[
		["_message", "", ["",[]]],
		["_type", "", [""]],
		"_return"
	];
	_return = "";
	if(_type != "") then {
		if (_message isEqualType []) then {
			{
				_return = "A3Log" callExtension (_type + toString[31] + _x);
			} forEach _message;
		} else {
			_return = "A3Log" callExtension (_type + toString[31] + _message);
		};
	} else {
		if (_message isEqualType []) then {
			{
				_return = "A3Log" callExtension _x;
			} forEach _message;
		} else {
			_return = "A3Log" callExtension _message;
		};
	};
	_return
};








private _addZero = {
	params[
		["_number", 0, [0]]
	];
	if (_number < 10) exitWith {
		format ["0%1",_number];
	};
	_number;
};


private _obj = allMissionObjects "Man";
private _side = [0,0,0];

{
  _obj set [_forEachIndex, get3DENEntityID _x];
} forEach _obj;

_obj sort true;

{
	_t = get3DENEntity _x;
  if ((_t get3DENAttribute "ControlMP")select 0 || (_t get3DENAttribute "ControlSP")select 0) then {
  	switch (side _t) do { 
  		case west : {
	  		private _c = _side select 0;
	  		_c = _c + 1;
	  		_side set [0,_c];
	  		_t set3DENAttribute ["name",format["Cop_%1",_c call _addZero]];
	  		_t set3DENAttribute ["description",format["Polizist %1",_c]];
	  		_t set3DENAttribute ["ItemClass","B_Survivor_F"];
	  	}; 
  		case civilian : {
	  		private _c = _side select 1;
	  		_c = _c + 1;
	  		_side set [1,_c];
	  		_t set3DENAttribute ["name",format["Civ_%1",_c call _addZero]];
	  		_t set3DENAttribute ["description",format["Zivilist %1",_c ]];
	  		_t set3DENAttribute ["ItemClass","C_man_1"];
	  	}; 
  		case independent : {
	  		private _c = _side select 2;
	  		_c = _c + 1;
	  		_side set [2,_c];
	  		_t set3DENAttribute ["name",format["THR_%1",_c call _addZero]];
	  		_t set3DENAttribute ["description",format["THR %1",_c]];
	  		_t set3DENAttribute ["ItemClass","I_Survivor_F"];
	  	}; 
  	};



  };
} forEach _obj;





private _enableInitExec = true;
private _enableVarExec = true;

private _obj = allMissionObjects "All";
private _white = ["Logic", "B_Survivor_F" ,"C_man_1","I_Survivor_F", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_euro", "C_man_polo_1_F_asia", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_euro", "C_man_polo_2_F_asia", "C_man_polo_3_F", "C_man_polo_3_F_afro", "C_man_polo_3_F_euro", "C_man_polo_3_F_asia", "C_man_polo_4_F", "C_man_polo_4_F_afro", "C_man_polo_4_F_euro", "C_man_polo_4_F_asia", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_euro", "C_man_polo_5_F_asia", "C_man_polo_6_F", "C_man_polo_6_F_afro", "C_man_polo_6_F_euro", "C_man_polo_6_F_asia", "C_man_p_fugitive_F", "C_man_p_fugitive_F_afro", "C_man_p_fugitive_F_euro", "C_man_p_fugitive_F_asia", "C_man_p_beggar_F", "C_man_p_beggar_F_afro", "C_man_p_beggar_F_euro", "C_man_p_beggar_F_asia", "C_man_w_worker_F", "C_scientist_F", "C_man_hunter_1_F", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro", "C_man_p_shorts_1_F_euro", "C_man_p_shorts_1_F_asia", "C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_euro", "C_man_shorts_1_F_asia", "C_man_shorts_2_F", "C_man_shorts_2_F_afro", "C_man_shorts_2_F_euro", "C_man_shorts_2_F_asia", "C_man_shorts_3_F", "C_man_shorts_3_F_afro", "C_man_shorts_3_F_euro", "C_man_shorts_3_F_asia", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_euro", "C_man_shorts_4_F_asia", "C_man_pilot_F", "C_journalist_F", "C_Orestes", "C_Nikos", "C_Nikos_aged", "C_Driver_1_F", "C_Driver_2_F", "C_Driver_3_F", "C_Driver_4_F", "C_Driver_1_random_base_F", "C_Driver_1_black_F", "C_Driver_1_blue_F", "C_Driver_1_green_F", "C_Driver_1_red_F", "C_Driver_1_white_F", "C_Driver_1_yellow_F", "C_Driver_1_orange_F", "C_Marshal_F", "B_Soldier_F", "B_RangeMaster_F", "B_Soldier_lite_F", "B_Soldier_GL_F", "B_soldier_AR_F", "B_Soldier_SL_F", "B_Soldier_TL_F", "B_soldier_M_F", "B_soldier_LAT_F", "B_medic_F", "B_soldier_repair_F", "B_soldier_exp_F", "B_Helipilot_F", "B_Soldier_A_F", "B_soldier_AT_F", "B_soldier_AA_F", "B_engineer_F", "B_crew_F", "B_officer_F", "B_Competitor_F", "B_Pilot_F", "B_helicrew_F", "B_soldier_PG_F", "B_soldier_UAV_F", "B_Soldier_unarmed_F", "B_diver_F", "B_diver_TL_F", "B_diver_exp_F", "B_recon_F", "B_recon_LAT_F", "B_recon_exp_F", "B_recon_medic_F", "B_recon_TL_F", "B_recon_M_F", "B_recon_JTAC_F", "B_spotter_F", "B_sniper_F", "B_Story_SF_Captain_F", "B_Story_Protagonist_F", "B_Story_Engineer_F", "B_Story_Colonel_F", "B_Story_Pilot_F", "B_Story_Tank_Commander_F", "b_soldier_survival_F", "B_CTRG_soldier_GL_LAT_F", "B_CTRG_soldier_engineer_exp_F", "B_CTRG_soldier_M_medic_F", "B_CTRG_soldier_AR_A_F", "B_soldier_AAR_F", "B_soldier_AAT_F", "B_soldier_AAA_F", "B_support_MG_F", "B_support_GMG_F", "B_support_Mort_F", "B_support_AMG_F", "B_support_AMort_F", "B_G_Soldier_F", "B_G_Soldier_lite_F", "B_G_Soldier_SL_F", "B_G_Soldier_TL_F", "B_G_Soldier_AR_F", "B_G_medic_F", "B_G_engineer_F", "B_G_Soldier_exp_F", "B_G_Soldier_GL_F", "B_G_Soldier_M_F", "B_G_Soldier_LAT_F", "B_G_Soldier_A_F", "B_G_officer_F", "B_G_Soldier_unarmed_F", "B_G_Survivor_F", "I_G_Story_Protagonist_F", "I_G_Story_SF_Captain_F", "I_G_resistanceLeader_F", "I_G_resistanceCommander_F", "B_Soldier_VR_F", "B_Protagonist_VR_F", "B_ghillie_lsh_F", "B_ghillie_sard_F", "B_ghillie_ard_F", "B_Sharpshooter_F", "B_Recon_Sharpshooter_F", "B_CTRG_Sharphooter_F", "B_HeavyGunner_F", "B_G_Sharpshooter_F", "I_TargetSoldier", "I_G_Soldier_F", "I_G_Soldier_lite_F", "I_G_Soldier_SL_F", "I_G_Soldier_TL_F", "I_G_Soldier_AR_F", "I_G_medic_F", "I_G_engineer_F", "I_G_Soldier_exp_F", "I_G_Soldier_GL_F", "I_G_Soldier_M_F", "I_G_Soldier_LAT_F", "I_G_Soldier_A_F", "I_G_officer_F", "I_G_Soldier_unarmed_F", "I_G_Survivor_F", "I_soldier_F", "I_Soldier_lite_F", "I_Soldier_A_F", "I_Soldier_GL_F", "I_Soldier_AR_F", "I_Soldier_SL_F", "I_Soldier_TL_F", "I_Soldier_M_F", "I_Soldier_LAT_F", "I_Soldier_AT_F", "I_Soldier_AA_F", "I_medic_F", "I_Soldier_repair_F", "I_Soldier_exp_F", "I_engineer_F", "I_crew_F", "I_helipilot_F", "I_pilot_F", "I_helicrew_F", "I_officer_F", "I_Story_Colonel_F", "I_soldier_UAV_F", "I_Soldier_unarmed_F", "I_diver_F", "I_diver_exp_F", "I_diver_TL_F", "I_Spotter_F", "I_Sniper_F", "I_Soldier_AAR_F", "I_Soldier_AAT_F", "I_Soldier_AAA_F", "I_support_MG_F", "I_support_GMG_F", "I_support_Mort_F", "I_support_AMG_F", "I_support_AMort_F", "I_Soldier_VR_F", "I_Protagonist_VR_F", "I_ghillie_lsh_F", "I_ghillie_sard_F", "I_ghillie_ard_F", "I_G_Sharpshooter_F", "Land_Airport_Tower_F", "Land_Airport_center_F", "Land_Airport_left_F", "Land_Airport_right_F", "Land_BarGate_F", "Land_i_Barracks_V1_F", "Land_i_Barracks_V2_F", "Land_u_Barracks_V2_F", "Land_i_House_Small_03_V1_F", "Land_Ca2ice_F", "Land_Carousel_01_F", "Land_City_Gate_F", "Land_cmp_Shed_F", "Land_i_House_Big_01_V1_dam_F", "Land_i_House_Big_01_V2_dam_F", "Land_i_House_Big_01_V3_dam_F", "Land_u_House_Big_01_V1_dam_F", "Land_i_House_Big_02_V1_dam_F", "Land_i_House_Big_02_V2_dam_F", "Land_i_House_Big_02_V3_dam_F", "Land_i_Shop_01_V1_dam_F", "Land_i_Shop_01_V2_dam_F", "Land_i_Shop_01_V3_dam_F", "Land_i_Shop_02_V1_dam_F", "Land_i_Shop_02_V2_dam_F", "Land_i_Shop_02_V3_dam_F", "Land_i_House_Small_01_V1_dam_F", "Land_i_House_Small_01_V2_dam_F", "Land_i_House_Small_01_V3_dam_F", "Land_i_House_Small_03_V1_dam_F", "Land_i_Stone_HouseSmall_V1_dam_F", "Land_i_Stone_HouseSmall_V2_dam_F", "Land_i_Stone_HouseSmall_V3_dam_F", "Land_spp_Tower_dam_F", "Land_i_Barracks_V1_dam_F", "Land_i_Barracks_V2_dam_F", "Land_Dome_Small_F", "Land_Dome_Big_F", "Land_FuelStation_Build_F", "Land_i_Garage_V1_F", "Land_i_Garage_V2_F", "Land_Hospital_main_F", "Land_Hospital_side1_F", "Land_Hospital_side2_F", "Land_i_House_Big_02_V3_F", "Land_i_House_Big_02_V1_F", "Land_i_House_Big_02_V2_F", "Land_u_House_Big_01_V1_F", "Land_d_House_Big_01_V1_F", "Land_i_House_Big_01_V3_F", "Land_i_House_Big_01_V1_F", "Land_i_House_Big_01_V2_F", "Land_i_House_Small_02_V3_F", "Land_i_House_Small_02_V1_F", "Land_i_House_Small_02_V2_F", "Land_i_House_Small_01_V3_F", "Land_i_House_Small_01_V1_F", "Land_i_House_Small_01_V2_F", "Land_i_Addon_02_V1_F", "Land_u_Addon_02_V1_F", "Land_i_Shed_Ind_F", "Land_InfoStand_V1_F", "Land_i_Addon_03_V1_F", "Land_Kiosk_blueking_F", "Land_Kiosk_gyros_F", "Land_Kiosk_papers_F", "Land_Kiosk_redburger_F", "Land_LightHouse_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Medevac_house_V1_F", "Land_Cargo_House_V2_F", "Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V1_F", "Land_Medevac_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Tower_V1_No1_F", "Land_Cargo_Tower_V1_No2_F", "Land_Cargo_Tower_V1_No3_F", "Land_Cargo_Tower_V1_No4_F", "Land_Cargo_Tower_V1_No5_F", "Land_Cargo_Tower_V1_No6_F", "Land_Cargo_Tower_V1_No7_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V2_F", "Land_MilOffices_V1_F", "Land_Net_Fence_Gate_F", "Land_Noticeboard_F", "Land_Radar_F", "Land_Radar_Small_F", "Land_Research_house_V1_F", "Land_Research_HQ_F", "Land_i_Shop_02_V3_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_02_V2_F", "Land_i_Shop_01_V3_F", "Land_i_Shop_01_V1_F", "Land_i_Shop_01_V2_F", "Sign_F", "SignAd_SponsorS_ARMEX_F", "SignAd_Sponsor_ARMEX_F", "SignAd_SponsorS_ION_F", "SignAd_Sponsor_ION_F", "SignAd_SponsorS_Larkin_F", "SignAd_Sponsor_Larkin_F", "Land_Sign_WarningMilAreaSmall_F", "Land_Sign_WarningMilitaryArea_F", "Land_Sign_WarningMilitaryVehicles_F", "Land_Sign_Mines_F", "SignAd_SponsorS_Quontrol_F", "SignAd_Sponsor_Quontrol_F", "Land_Sign_WarningUnexplodedAmmo_F", "SignAd_SponsorS_F", "SignAd_Sponsor_F", "SignAd_SponsorS_Vrana_F", "SignAd_Sponsor_Vrana_F", "Sign_Direction_F", "Land_Slum_House02_F", "Land_Slum_House03_F", "Land_spp_Tower_F", "Land_i_Stone_HouseSmall_V3_F", "Land_i_Stone_HouseSmall_V1_F", "Land_i_Stone_Shed_V2_F", "Land_d_Stone_Shed_V1_F", "Land_i_Stone_Shed_V1_F", "Land_i_Stone_Shed_V3_F", "Land_i_Stone_HouseSmall_V2_F", "Land_Stone_Gate_F", "Land_Swing_01_F", "Land_MapBoard_F", "MapBoard_altis_F", "MapBoard_stratis_F", "MapBoard_seismic_F", "Land_Offices_01_V1_F"];
private _objWhite = ["bank_obj", "gold_safe", "air_sp", "fed_bank", "locker_01", "locker_02", "locker_03"];
private _count = 0;
private _nameCounter = 1;
private _name = "buildings_1";
['private _fnc={private _obj=(_this select 0)createVehicleLocal(_this select 1);_obj setPosWorld(_this select 1);_obj setVectorDir(_this select 2);_obj setVectorUp(_this select 3);_obj enableSimulation(_this select 4);_obj allowDamage(_this select 5);if(count(_this select 6)>0)then{_obj call compile(_this select 6);};if(count(_this select 7)>0)then{missionNamespace setVariable[(_this select 7),_obj]};};',_name] call A3Log;

{
    if !(typeOf _x in _white || ((_x get3DENAttribute "name") select 0) in _objWhite) then {
        if (_count >= 250) then {
            _count = 0;
            _nameCounter = _nameCounter + 1;
            _name = format["buildings_%1",_nameCounter];
            ['private _fnc={private _obj=(_this select 0)createVehicleLocal(_this select 1);_obj setPosWorld(_this select 1);_obj setVectorDir(_this select 2);_obj setVectorUp(_this select 3);_obj enableSimulation(_this select 4);_obj allowDamage(_this select 5);if(count(_this select 6)>0)then{_obj call compile(_this select 6);};if(count(_this select 7)>0)then{missionNamespace setVariable[(_this select 7),_obj]};};',_name] call A3Log;
        };

        private _sim = (_x get3DENAttribute "enableSimulation") select 0;
        private _dam = (_x get3DENAttribute "allowDamage") select 0;
		private _init =(_x get3DENAttribute "Init") select 0;
		_init = toArray _init;
		_init = _init - [10];
		_init = toString _init;
        _init =  "regex_replace" callExtension format["|(this)|_this|%1",_init];
        private _varName = ((_x get3DENAttribute "name") select 0);
        if (!_enableInitExec) then {
        	_init = "";
        };
        if (!_enableVarExec) then {
        	_varName = "";
        };
        private _str = format['%1 call _fnc;', [typeOf _x, getPosWorld _x, vectorDir _x, vectorUp _x, _sim, _dam,_init,_varName]];
        [_str,_name] call A3Log;;
        delete3DENEntities[_x];
        _count = _count + 1;
    };
} forEach _obj;


0 - type
1 - posWorld
2 - vectorDir
3 - vectorUp
4 - enableSimulation
5 - allowDamage
6 - init-Code
7 - Varname






_toNext = {
	params[
		["_t", "", [""]],
		["_s", "", [""]]
	];
	private _i = (toLower _t) find (toLower _s);
	systemChat str _i;
	if (_i < 0) exitwith {
		_t;
	};
	private _str = "";
	private _tmp = -1;
	private _pSim = (_t select [0,_i]) find ";";
	while {((_t select [_pSim+1,_i-_pSim]) find ";") >= 0} do {
		_pSim = _pSim + ((_t select [_pSim+1,_i-_pSim]) find ";") + 1;
	};
	private _aSim = _i + ((_t select [_i]) find ";");
	private _tis = (_t select [0,_i]) find "this";
	while {((_t select [_tis+1,_i-_tis]) find "this") >= 0} do {
		_tis = _tis + ((_t select [_tis+1,_i-_tis]) find "this") +1;
	};
	systemChat str _pSim;
	systemChat str _aSim;
	systemChat str _tis;
	if (_tis > _pSim) then {
		if (_tis > 0) then {
			_str = _str + _t select [0,_tis];
		};
		systemChat str _str;
		_str = _str + (_t select [_aSim+1]);
		systemChat str _str;
		_t = _str;
	} else {
		_t;
	};
	systemChat "-------";
	_t;
};


gg = ["this enableSimulation true;this setdir 220.795;this setposATL [26684.849609,24607.787109,0.254229];this setVectorUp (surfacenormal (getPosATL this))","setPos"] call _toNext;


"this enableSimulation true;this setdir 220.795;this setposATL [26684.849609,24607.787109,0.254229];this setVectorUp (surfacenormal (getPosATL this))"
"this enableSimulation true;this setdir 220.795;this setVectorUp (surfacenormal (getPosATL this))"



private _enableInitExec = true;
private _enableVarExec = true;

private _obj = all3DENEntities select 0;
private _white = ["Land_Billboard_F","Land_Atm_02_F","Land_Atm_01_F","Land_Device_assembled_F","Land_InfoStand_V2_F","Logic","C_man_p_beggar_F"];
private _objWhite = ["bank_obj", "gold_safe", "air_sp", "fed_bank", "locker_01", "locker_02", "locker_03"];
private _count = 0;
private _nameCounter = 1;
private _name = "buildings_1";


{
    if !(typeOf _x in _white || ((_x get3DENAttribute "name") select 0) in _objWhite) then {
		private _init =(_x get3DENAttribute "Init") select 0;
		if ((count _init) > 0) then {
			_x set3DENAttribute ["Init",""];
			_count = _count +1;
		};
    };
} forEach _obj;

gg = _count;

closeDialog 0;
[] spawn {
	systemChat "go";
	disableSerialization;
	with uiNamespace do {
		private _c = allControls (findDisplay 0);
		{
			if !(ctrlIDC _x in [1026,1028,1027]) then {
				diag_log format["%2 :: type %3 :: %1",ctrlText _x,_x,ctrlType _X];
				_x ctrlSetText format["%1",ctrlIDC _x];
				_x ctrlSetTooltip format["%1",ctrlIDC _x];
				_x ctrlAddEventHandler ["onMouseEnter",{systemChat (str _x)}];
				diag_log format ["Code %1",buttonAction _x];
			} else {
				_x ctrlshow false;
			};
		} forEach _c;
	};
};

[] spawn {
disableSerialization;
	for "_i" from 1020 to 1022 do {
		with uiNamespace do {
			_ctrl = findDisplay 0 displayCtrl _i;
			if (!isNull _ctrl) then {
				_ctrl ctrlShow false;
			};
		};
	};
}

closeDialog 0;
[player,player,player,"market"] call life_fnc_virt_menu;


_array = vehicles;
test = [];
{
	if (!isNull _x) then {
		 test pushBackUnique (typeOf _x);
	};
} forEach _array;



0.00114

0.00134


0.0014
["_te = '123123123123';count _te > 0","",300000] call BIS_fnc_codePerformance;

0.0011
["_te = '123123123123';_te != ''","",300000] call BIS_fnc_codePerformance;

0.0011
["_te = '123123123123';!(_te isEqualTo '')","",300000] call BIS_fnc_codePerformance;


_br = toString [13,10];
_out = "";
{
	_val = profilenamespace getVariable [_x,"DEFAULT WAS USED -DE100"];
	_out = _out+ format["%1 = %2 %3",_x,_val,_br]
} forEach (allVariables profilenamespace);
copyToClipboard _out;



mres = {
params[
	["_in", "", ["",[],0,true]]
];

if (_in isEqualType []) exitWith {
	toString(toArray(str _in) apply {if (_x == 34) then {96;} else {_x;};});
};

if (_in isEqualType "") exitWith {
	toString(toArray _in - toArray "'/\`:|;,{}-""<>");
};

if (_in isEqualType true) exitWith {
	[0,1] select _in;
};

if (_in isEqualType 0) exitWith {
	 [false,true] select _in;
};
};
blub = [test] call mres;

mres2 = {
params[
	["_in", "", [""]]
];

if (_in isEqualTo "") exitwith {
	[];
};

toString(toArray _in apply {if (_x == 96) then {34;} else {_x;};});
};


amk = toArray str inp;

amk = amk apply {
	if (_x == 34) then {
		96
	} else {
		_x
	};
};



["spoody",true,"fast"] call life_fnc_notification_system;















findDisplay 12 setVariable ["MarkerSearchBtn",findDisplay 12  ctrlCreate ["RscButtonTextOnly", -1]];
private _btn = findDisplay 12 getVariable ["MarkerSearchBtn",controlNull];
_btn ctrlSetText "Marker-Suche";
_btn ctrlSetPosition [0.412344 * safezoneW + safezoneX, 0.00500001 * safezoneH + safezoneY, 0.175313 * safezoneW, 0.022 * safezoneH];
_btn ctrlSetFont "PuristaMedium";
_btn ctrlSetFontHeight 0.065;
_btn ctrlCommit 0;
_btn buttonSetAction "[] call  handleSearchEdit";



handleSearchEdit = {
	private _search = findDisplay 12 getVariable ["MarkerSearchEdit",controlNull];
	private _lb = findDisplay 12 getVariable ["MarkerSearchLb",controlNull];
	if (!isNull _search) then {
		ctrlDelete _search;
		if (!isNull _lb) then {
			ctrlDelete _lb;
		};
	} else {
		_search = findDisplay 12  ctrlCreate ["RscEdit", -1];
		findDisplay 12 setVariable ["MarkerSearchEdit",_search];
		_search ctrlSetPosition [0.40203 * safezoneW + safezoneX, 0.04 * safezoneH + safezoneY, 0.195937 * safezoneW, 0.033 * safezoneH];
		_search ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.3];
		_search ctrlCommit 0;
		_search ctrlAddEventHandler ["keyUp", {_this call handleLb}];
		_search call handleLB;
	};
};

handleLb = {
	params[
		["_edit", controlNull, [controlNull]]
	];
	private _lb = findDisplay 12 getVariable ["MarkerSearchLb",controlNull];

	if (isNull _lb) then {
		_lb = findDisplay 12  ctrlCreate ["RscListbox", -1];
		findDisplay 12 setVariable ["MarkerSearchLb",_lb];
		_lb ctrlSetPosition [0.402031 * safezoneW + safezoneX, 0.073 * safezoneH + safezoneY, 0.195937 * safezoneW, 0.143 * safezoneH];
		_lb ctrlCommit 0;
		_lb ctrlAddEventHandler ["LBSelChanged", {_this call handleLbSel}];
	};
	_input = ctrlText _edit;
	lbClear _lb;

	{
		if ((toLower markerText _x find toLower _input) >= 0) then {
			_lb lbSetData [_lb lbAdd markerText _x,_x];
		};
	} forEach (allMapMarkers select {markerAlpha _x > 0 && !(markerText _x isEqualTo "")});

	if (lbSize _lb isEqualTo 0) exitWith {
		_lb lbSetData [_lb lbAdd "Kein Suchergebniss","error"]; 
	};
	lbSort _lb;
};


handleLbSel = {
	params[
		["_lb", controlNull, [controlNull]],
		["_i", 0, [0]]
	];
	_m = _lb lbData _i;
	if (_m isEqualTo "error") exitWith {};

	mapAnimAdd [0.5, 0.1, markerPos _m];
	mapAnimCommit
};




life_action_inUse = false

[] spawn {
	kawaii = true;
	while {kawaii} do {
	 	hintSilent str (cursorObject getVariable["trunkUser",""]);
	};
}

life_fnc_index = {
private _i = _this select 0;
private _s = _this select 1;
private _r = -1;

if (count _s == 0) exitwith {_r};
private _c = 0;
{
	if(_i in _x) exitWith {
		_r = _c;
	};
	_c = _c + 1;
	nil
} count _s;

_r;
};

private _crntM = magazinesAmmo player;
private _canP = [];
{
	private _c = getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count");
	if (_c > 1) then {
		private _i = [_x select 0, _canP] call life_fnc_index;
		if (_i >= 0) then {
			private _t = _canP select _i select 1;
			_t = _t + (_x select 1);
			_canP set [_i,[_x select 0,_t]];
		} else {
			_canP pushBackUnique [_x select 0,_x select 1];
		};
	};
	nil
} count _crntM;

canP = _canP;

{
	private _m = _x select 0;
	private _h = _x select 1;
	private _c = getNumber(configFile >> "CfgMagazines" >> _m >> "count");
	if (_h > _c) then {
		player removeMagazines _m;
		private _t = _h % _c;
		private _f = (_h-_t)/_c;
		if (_f > 0) then {
			player addMagazines [_m,_f];
		};
		if (_t > 0) then {
			player addMagazine [_m,_t];
		};
	};
	nil
} count _canP;

_Tx = "";
_br = toString [13,10];
_data = nearestLocations [position player, ["NameCityCapital","NameCity","NameVillage","NameLocal","Airport","NameMarine"], 222222222222222222222222222222222222222];

{
	_Tx = _Tx + format[",%1",_br,str(text _x),position _x];
} forEach _data;
copyToClipboard _Tx



private _data = ["SELECT playerid,timeciv,timecop,timethr FROM arma_main_server.players WHERE timetotal > 0;",2,true] call DB_fnc_asyncCall;

{
	private _query = "INSERT INTO arma_main_server.playtime(value,type,timestamp,playerid)VALUES";
	if ((_x select 1) > 0) then {
		_query = _query + format["('%1','0','2017-04-16 20:00:00',%2),",_x select 1,_x select 0];
	};
	if ((_x select 2) > 0) then {
		_query = _query + format["('%1','1','2017-04-16 20:00:00',%2),",_x select 2,_x select 0];
	};
	if ((_x select 3) > 0) then {
		_query = _query + format["('%1','2','2017-04-16 20:00:00',%2),",_x select 3,_x select 0];
	};
	_query = _query select [0,count _query -1];
	_query = _query + ";";
	[_query,1] call DB_fnc_asyncCall;
} count _data;
diag_log "done-------------------------------------------";



private _data = ["SELECT id,space_data FROM arma_main_server.houses WHERE owned = 1;",2,true] call DB_fnc_asyncCall;
diag_log "start-----------------------------------";
{
	private _id = _x select 0;
	private _spaceData = [_x select 1] call DB_fnc_toArray;
	if (_spaceData isEqualType "") then {_spaceData = call compile format["%1", _spaceData];};
	if (_spaceData isEqualTo []) then {_spaceData = [[],[],[]];};
	if (((["rifle",(_spaceData select 0)] call life_fnc_dataFromKey) isEqualTo false)) then {
		private _old = (_spaceData select 0)+(_spaceData select 1)+(_spaceData select 2);
		private _newW = [
			["rifle",[]],
			["sniper",[]],
			["pistole",[]],
			["scope",[]],
			["muzzle",[]],
			["siderail",[]],
			["bipod",[]],
			["magazine",[]],
			["grenate",[]],
			["binocular",[]]
		];

		private _newC = [
			["uniform",[]],
			["vest",[]],
			["backpack",[]],
			["headgear",[]],
			["glasses",[]]
		];

		private _newO = [
			["other",[]]
		];

		{
			private _info = (_x select 0) call BIS_fnc_itemType;
			switch (true) do { 
				case ((_info select 1) in ["AssaultRifle","MachineGun","MachineGun","Rifle","SubmachineGun"]) : {
					(["rifle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["SniperRifle"]) : {
					(["sniper",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Handgun"]) : {
					(["pistole",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessorySights"]) : {
					(["scope",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryMuzzle"]) : {
					(["muzzle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessoryPointer"]) : {
					(["siderail",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryBipod"]) : {
					(["bipod",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Bullet","Shell"]) : {
					(["magazine",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["SmokeShell","Grenade","Artillery","Flare"]) : {
					(["grenate",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Binocular","LaserDesignator","NVGoggles"]) : {
					(["binocular",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Glasses"]) : {
					(["glasses",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Headgear"]) : {
					(["headgear",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Vest"]) : {
					(["vest",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Uniform"]) : {
					(["uniform",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Backpack"]) : {
					(["backpack",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Watch","Compass","GPS","Radio","Map","FirstAidKit","Medikit","Toolkit","UAVTerminal"]) : {
					(["other",_newO] call life_fnc_dataFromKey) pushBack _x;
				}; 
				default {
					diag_log format["UnkownTpye%1 %2",_info,_x];
				}; 
			};
		} forEach _old;
		private _arr = [_newW,_newC,_newO];
		_arr = [_arr] call DB_fnc_mres;

		private _query = format["UPDATE arma_main_server.houses SET space_data='%1' WHERE id='%2'",_arr,_id];
		[_query,1] call DB_fnc_asyncCall;
	};
} count _data;
diag_log "done Houses-------------------------------------------";

private _data = ["SELECT id,space_data FROM arma_main_server.storehouses WHERE owned = 1;",2,true] call DB_fnc_asyncCall;
diag_log "start-----------------------------------";
{
	private _id = _x select 0;
	private _spaceData = [_x select 1] call DB_fnc_toArray;
	if (_spaceData isEqualType "") then {_spaceData = call compile format["%1", _spaceData];};
	if (_spaceData isEqualTo []) then {_spaceData = [[],[],[]];};
	if (((["rifle",(_spaceData select 0)] call life_fnc_dataFromKey) isEqualTo false)) then {
		private _old = (_spaceData select 0)+(_spaceData select 1)+(_spaceData select 2);
		private _newW = [
			["rifle",[]],
			["sniper",[]],
			["pistole",[]],
			["scope",[]],
			["muzzle",[]],
			["siderail",[]],
			["bipod",[]],
			["magazine",[]],
			["grenate",[]],
			["binocular",[]]
		];

		private _newC = [
			["uniform",[]],
			["vest",[]],
			["backpack",[]],
			["headgear",[]],
			["glasses",[]]
		];

		private _newO = [
			["other",[]]
		];

		{
			private _info = (_x select 0) call BIS_fnc_itemType;
			switch (true) do { 
				case ((_info select 1) in ["AssaultRifle","MachineGun","MachineGun","Rifle","SubmachineGun"]) : {
					(["rifle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["SniperRifle"]) : {
					(["sniper",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Handgun"]) : {
					(["pistole",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessorySights"]) : {
					(["scope",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryMuzzle"]) : {
					(["muzzle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessoryPointer"]) : {
					(["siderail",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryBipod"]) : {
					(["bipod",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Bullet","Shell"]) : {
					(["magazine",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["SmokeShell","Grenade","Artillery","Flare"]) : {
					(["grenate",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Binocular","LaserDesignator","NVGoggles"]) : {
					(["binocular",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Glasses"]) : {
					(["glasses",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Headgear"]) : {
					(["headgear",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Vest"]) : {
					(["vest",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Uniform"]) : {
					(["uniform",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Backpack"]) : {
					(["backpack",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Watch","Compass","GPS","Radio","Map","FirstAidKit","Medikit","Toolkit","UAVTerminal"]) : {
					(["other",_newO] call life_fnc_dataFromKey) pushBack _x;
				}; 
				default {
					diag_log format["UnkownTpye%1 %2",_info,_x];
				}; 
			};
		} forEach _old;
		private _arr = [_newW,_newC,_newO];
		_arr = [_arr] call DB_fnc_mres;

		private _query = format["UPDATE arma_main_server.storehouses SET space_data='%1' WHERE id='%2'",_arr,_id];
		[_query,1] call DB_fnc_asyncCall;
	};
} count _data;
diag_log "done Storehouses-------------------------------------------";

private _data = ["SELECT id,space_data FROM arma_main_server.lockers;",2,true] call DB_fnc_asyncCall;
diag_log "start-----------------------------------";
{
	private _id = _x select 0;
	private _spaceData = [_x select 1] call DB_fnc_toArray;
	if (_spaceData isEqualType "") then {_spaceData = call compile format["%1", _spaceData];};
	if (_spaceData isEqualTo []) then {_spaceData = [[],[],[]];};
	if (((["rifle",(_spaceData select 0)] call life_fnc_dataFromKey) isEqualTo false)) then {
		private _old = (_spaceData select 0)+(_spaceData select 1)+(_spaceData select 2);
		private _newW = [
			["rifle",[]],
			["sniper",[]],
			["pistole",[]],
			["scope",[]],
			["muzzle",[]],
			["siderail",[]],
			["bipod",[]],
			["magazine",[]],
			["grenate",[]],
			["binocular",[]]
		];

		private _newC = [
			["uniform",[]],
			["vest",[]],
			["backpack",[]],
			["headgear",[]],
			["glasses",[]]
		];

		private _newO = [
			["other",[]]
		];

		{
			private _info = (_x select 0) call BIS_fnc_itemType;
			switch (true) do { 
				case ((_info select 1) in ["AssaultRifle","MachineGun","MachineGun","Rifle","SubmachineGun"]) : {
					(["rifle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["SniperRifle"]) : {
					(["sniper",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Handgun"]) : {
					(["pistole",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessorySights"]) : {
					(["scope",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryMuzzle"]) : {
					(["muzzle",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["AccessoryPointer"]) : {
					(["siderail",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["AccessoryBipod"]) : {
					(["bipod",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Bullet","Shell"]) : {
					(["magazine",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["SmokeShell","Grenade","Artillery","Flare"]) : {
					(["grenate",_newW] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Binocular","LaserDesignator","NVGoggles"]) : {
					(["binocular",_newW] call life_fnc_dataFromKey) pushBack _x;
				};
				case ((_info select 1) in ["Glasses"]) : {
					(["glasses",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Headgear"]) : {
					(["headgear",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Vest"]) : {
					(["vest",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Uniform"]) : {
					(["uniform",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Backpack"]) : {
					(["backpack",_newC] call life_fnc_dataFromKey) pushBack _x;
				}; 
				case ((_info select 1) in ["Watch","Compass","GPS","Radio","Map","FirstAidKit","Medikit","Toolkit","UAVTerminal"]) : {
					(["other",_newO] call life_fnc_dataFromKey) pushBack _x;
				}; 
				default {
					diag_log format["UnkownTpye%1 %2",_info,_x];
				}; 
			};
		} forEach _old;
		private _arr = [_newW,_newC,_newO];
		_arr = [_arr] call DB_fnc_mres;

		private _query = format["UPDATE arma_main_server.lockers SET space_data='%1' WHERE id='%2'",_arr,_id];
		[_query,1] call DB_fnc_asyncCall;
	};
} count _data;
diag_log "done-------------------------------------------";



res = diag_codePerformance [
{test = 0;},
"",
10000
];

[0.0005,10000]

res = diag_codePerformance [
{test;},
"",
10000
];

[0.0005,10000]

res = diag_codePerformance [
{test = test+1;},
"",
10000
];

[0.001,10000]


res = diag_codePerformance [
{missionNamespace setVariable ["test",0];},
"",
10000
];
[0.0009,10000]

res = diag_codePerformance [
{missionNamespace getVariable ["test",0];},
"",
10000
];
[0.001,10000]

res = diag_codePerformance [
{missionNamespace getVariable "test";},
"",
10000
];
[0.0008,10000]

res = diag_codePerformance [
{missionNamespace setVariable ["test",(missionNamespace getVariable ["test",0])+1];},
"",
10000
];

[0.0022,10000]







res = diag_codePerformance [
{
	private _BL_VARS = ["lutrRAM","oxBOB","..."];

	private _error=[];
	{
		if(_x in _BL_VARS)then{
			_error pushBack[_x,missionNamespace getVariable _x]
		};
		nil;
	} count allVariables(missionNamespace);
},
"",
10000
];



res = diag_codePerformance [
{
	private _BL_VARS = ["lutrRAM","oxBOB","..."];

	private _error=[];
	private _vars = toLower str (allVariables missionNamespace);
	{
		if(_vars find(toLower _x)>=0)then{
			_error pushBack[_x,missionNamespace getVariable _x]
		};
		nil;
	} count _BL_VARS;
},
"",
10000
];

call {
	scopeName "main";
	if (alive player) then {
		if (true) exitWith {
			breakOut "main";
		};
	};
	systemChat "blyat";
}





private _data = ["SELECT aliases,playerid FROM arma_main_server.players;",2,true] call DB_fnc_asyncCall;
private _query = [];

{
	private _tmp = [_x select 0] call DB_fnc_toArray;
	private _pid = _x select 1;
	{
		_x params[
			["_timeData", [], [[]]],
			["_name", "", [""]]
		];

		private _cre = _timeData select 0;
		if ((toLower _cre) isEqualTo "to old") then {
			_cre = "01.01.2016 00:00:00";
		};
		private _lSee = _timeData select 1;
		if ((toLower _lSee) isEqualTo "to old") then {
			_lSee = "01.01.2016 00:00:00";
		};
		_query pushBackUnique format["('%1','%2',STR_TO_DATE('%3','%5d.%5m.%5Y %5H:%5i:%5s'),STR_TO_DATE('%4','%5d.%5m.%5Y %5H:%5i:%5s'))",_pid,_name call DB_fnc_mres,_cre,_lSee,'%'];
		nil;
	} count _tmp;
	nil;
} count _data;

systemChat format ["Count %1",count _query];
for "_i" from 0 to count _query step 50 do {

	[format["INSERT INTO arma_main_server.`aliases`(`pid`,`name`,`create`,`lastConnect`)VALUES %1;",(_query select [_i,50]) joinString ","],1] call DB_fnc_asyncCall;
};

systemChat "eennnd";

[
	[["30.03.2017 18:47","31.03.2017 15:33"],"Ramon Carlos Garcias"],
	[["31.03.2017 15:41","31.03.2017 20:14"],"Colton Brown"],
	[["01.04.2017 00:11","03.04.2017 16:01"],"[DK] Colton Brown"]
]











private _cfg = "true" configClasses (missionConfigFile >> "Clothing");
private _query = [];


{
	{
		if !((_x select 0) isEqualTo "NONE") then {
			_query pushBackUnique format["('%1',5)",_x select 0];
		};
	} forEach (getArray(_x >> "uniforms"));
	{
		if !((_x select 0) isEqualTo "NONE") then {
			_query pushBackUnique format["('%1',6)",_x select 0];
		};
	} forEach (getArray(_x >> "headgear"));
	{
		if !((_x select 0) isEqualTo "NONE") then {
			_query pushBackUnique format["('%1',7)",_x select 0];
		};
	} forEach (getArray(_x >> "goggles"));
	{
		if !((_x select 0) isEqualTo "NONE") then {
			_query pushBackUnique format["('%1',8)",_x select 0];
		};
	} forEach (getArray(_x >> "vests"));
	{
		if !((_x select 0) isEqualTo "NONE") then {
			_query pushBackUnique format["('%1',9)",_x select 0];
		};
	} forEach (getArray(_x >> "backpacks"));
	nil;
} count _cfg;

systemChat str count _query;

for "_i" from 0 to (count _query-1) step 50 do {
	[format["INSERT INTO arma_cfgs.`a3_items`(`classname`,`type`)VALUES %1;",(_query select [_i,50]) joinString ","],1] call DB_fnc_asyncCall;
};

systemChat "Hoe";



private _itemArr = ["SELECT id,lower(classname) FROM arma_cfgs.a3_items",2,true] call DB_fnc_asyncCall;
private _shopId = 10;
private _sum = 0;
{
	private _q = [];
	{
		_x params[
			"_classname",
			"_cName",
			"_price",
			"_perm"
		];
		if !(_classname isEqualTo "NONE") then {
			_q pushBackUnique format["('%1','%7','%2','%3','%4','%5','%6')",_shopId,_cName,_price call life_fnc_number,_perm select 0, _perm select 2,toLower (_perm select 1),_itemArr select ([toLower _classname,_itemArr] call life_fnc_index) select 0];
		};
		nil;
	} count (getArray (_x >> "uniforms")+getArray (_x >> "headgear")+getArray (_x >> "goggles")+getArray (_x >> "vests")+getArray (_x >> "backpacks"));
	_sum = _sum + (count _q);
	for "_i" from 0 to (count _q-1) step 25 do {
		[format["INSERT INTO `arma_cfgs`.`al_shopitems` (`shop_id`,`item_id`,`customName`,`price`,`perm_var`,`perm_val`,`perm_type`)VALUES %1;",(_q select [_i,25]) joinString ","],1] call DB_fnc_asyncCall;
	};

	_shopId = _shopId + 1;
	nil;
} count ("true" configClasses (missionConfigFile >> "Clothing"));


("getText(_x >> 'descriptionShort') find '7,62x51'" configClasses (configfile >> "CfgWeapons"))
configfile >> "CfgWeapons" >> "srifle_EBR_ARCO_pointer_F" >> "descriptionShort"



systemChat str _sum;
systemChat "Hoe";

configfile >> "CfgWeapons" >> "srifle_EBR_ARCO_pointer_F" >> "descriptionShort"

loadFile (MISSION_ROOT + "debug_console.hpp");


sprayPaint ={
params [
    ["_unit", player],
    ["_texture", ""]
];

private _startPosASL = eyePos _unit;
private _cameraPosASL =  AGLToASL positionCameraToWorld [0, 0, 0];
private _cameraDir = (AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff _cameraPosASL;
private _endPosASL = _startPosASL vectorAdd (_cameraDir vectorMultiply 2.5);


private _intersections = lineIntersectsSurfaces [_startPosASL, _endPosASL, _unit, objNull, true, 1, "GEOM", "FIRE"];

if (_intersections isEqualTo []) exitWith {
	hint "kein Surface gefunden";
    false
};

(_intersections select 0) params ["_touchingPoint", "_surfaceNormal", "", "_object"];
systemChat format["%1|%2|%3",_touchingPoint, _surfaceNormal, _object];


if ((!isNull _object) && {
    
    if (_object isKindOf "Static") exitWith {false};
	if ((getModelInfo _object )select 0 in ["city2_8m_f.p3d","city2_4m_f.p3d"]) exitWith {false;};
	true;
}) exitWith {
    hint "cant apply";
    false
};



if (_surfaceNormal vectorDotProduct  (_endPosASL vectorDiff _startPosASL) > 0) then {
    _surfaceNormal = _surfaceNormal vectorMultiply -1;
};


private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
private _v2 = vectorNormalized (_v1 vectorCrossProduct (_endPosASL vectorDiff _startPosASL));

if (abs (_v1 select 2) < 0.94) then {
    private _v3Temp = _v1 vectorCrossProduct [0, 0, 1];
    _v2 = _v3Temp vectorCrossProduct _v1;
};
private _v3 = _v2 vectorCrossProduct _v1;
systemChat format["%1|%2|%3",_v1, _v2, _v3];

private _fnc_isOk = {
    params ["_rx", "_ry"];
    private _startPosASL2 = _touchingPoint vectorAdd (_v2 vectorMultiply _rx) vectorAdd (_v3 vectorMultiply _ry) vectorAdd (_v1 vectorMultiply (-0.06));
    private _endPosASL2   = _startPosASL2 vectorAdd (_v1 vectorMultiply (0.12));
    private _intersections = lineIntersectsSurfaces [_startPosASL2, _endPosASL2, _unit, objNull, true, 1, "GEOM", "FIRE"];
    
    if (_intersections isEqualTo []) exitWith {false;};

    if !(((_intersections select 0) select 3) isEqualTo _object) exitWith {false;};

    true
};

if ( !([ 0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) ||
    {!([ 0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk) ||
    {!([-0.5 * 0.6, 0.5 * 0.6] call _fnc_isOk) ||
    {!([-0.5 * 0.6,-0.5 * 0.6] call _fnc_isOk)}}}) exitWith {
    hint "keinen Platz";
    false
};
private _vectorDirAndUp = if (abs (_v1 select 2) < 0.94) then {
	[_surfaceNormal vectorMultiply -1, _v2];
	} else {
	[_surfaceNormal vectorMultiply -1, _v3];
};
	

[_touchingPoint vectorAdd (_surfaceNormal vectorMultiply 0.06), _vectorDirAndUp, _texture, _object, _unit] call {
	params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_object", "_unit"];
	private _tag = createSimpleObject ["UserTexture1m_F", _tagPosASL];
	_tag setObjectTextureGlobal [0, _texture];
	_tag setVectorDirAndUp _vectorDirAndUp;
	if (isNull _object) exitWith {true};
}}