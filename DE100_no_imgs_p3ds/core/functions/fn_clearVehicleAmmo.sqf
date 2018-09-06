/*
	File:   fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(_veh == "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};
if(_veh == "B_APC_Wheeled_01_cannon_F") then 
{
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};

if(_veh == "B_Heli_Transport_01_F") then 
{
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};


if(_veh == "B_Heli_Attack_01_F") then 
{
	_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
	_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
};

if(_veh in ["O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F","O_Heli_Attack_02_black_F"]) then 
{
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};


if(_veh == "B_Plane_Fighter_01_F") then 
{
	_vehicle removeMagazinesTurret ["magazine_Fighter01_Gun20mm_AA_x450",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonRack_Missile_AMRAAM_D_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonRack_Missile_AGM_02_x2",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];

};

if(_veh == "O_Plane_Fighter_02_F") then 
{
	_vehicle removeMagazinesTurret ["magazine_Fighter02_Gun30mm_AA_x180",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Missile_AA_R77_INT_x1",[-1]];
	_vehicle removeMagazinesTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;