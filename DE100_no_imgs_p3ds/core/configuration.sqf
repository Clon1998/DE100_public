/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_action_delay = 0;
life_session_time = 0;
life_key_delay = 0;
life_thr_request_delay = [0,0];
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_refresh_map = false;
life_siren_active = false;
life_clothing_filter = 0;
life_redgull_effect = nil;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
Life_request_timer = false;
life_civjob = 0;
life_save = true;
taxijobbeansprucht = false;
life_klickcount = 0;
life_taxiMarker =[];
taxionduty=0;
life_smartphoneTarget = objNull;
life_bomb_true = false;
life_fence_true = false;
life_ear_in = false; 
life_prof_noXp = false; 
life_water_boy = false;
life_stamina_bar = 0;
life_preRockets = [];
life_wants_new_spawn = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_escort = false;
DE100_Fortifications_Setup = objNull;
DE100_Core_ScrollWheelFrame = diag_frameno;
life_house_session = false;
life_vehicle_session = false;
life_created_tank_marker = false;
life_dupe_protection = false;
life_clothing_fix_cooldown = 0;
life_open_notifications  = [];
life_taxi_customers = [];
life_taxiDriver = false;
life_perso_seen = [];
life_call_active = false;
life_call_interrupt = false;
life_caller = objNull;
life_call_id = -1;
life_offline_mode = false;
passwordtemp = "**********************************";
life_conf_tp = 0;
life_conf_del = 0;
life_adminmode_delay = 0;
life_dmg_safe_cd = 0;
life_disable_getIn = false;
life_disable_getOut = false;
life_newBought = [];
life_safeGear = [];
life_gang_invite = false;
life_gang_permission_update = false;
life_isUnimpounding = false;
life_curWep_h = "Error";
de100_vd_foot = profilenamespace getVariable ["de100_vd_foot",viewDistance];
de100_vd_car = profilenamespace getVariable ["de100_vd_car",viewDistance];
de100_vd_air = profilenamespace getVariable ["de100_vd_air",viewDistance];
life_pause_pos = false;
de100_3dCache_v = 0;
de100_3dCache_f = 0;
life_gps_tracking = [];

lockers_whitelist = [lockers_obj,locker_01,locker_02,locker_03];

//CREATE NAMESPACES
de100_3dNamespace = createLocation ["fakeTown", [-2000,-2000,-2000], 0, 0];

//User defined Settings
life_sidechat = profileNamespace getVariable["life_sidechat",true];
life_tagson = profileNamespace getVariable["life_settings_tagson",true];
life_revealObjects = profileNamespace getVariable["life_revealObjects",true];
life_skipintro = profileNamespace getVariable["life_skipintro",false];
life_screenshot = profileNamespace getVariable["life_screenshot",false];
life_thirst = profileNamespace getVariable[format["DE100_%1_thirst",playerSide],100];
life_hunger = profileNamespace getVariable[format["DE100_%1_hunger",playerSide],100];
0 fadeSound (profileNamespace getVariable ["de100_fadeSound",1]);
if (life_thirst + 10 < 100) then {life_thirst = life_thirst + 10;}; 
if (life_hunger + 10 < 100) then {life_hunger = life_hunger + 10;};
player setDamage (profileNamespace getVariable[format["DE100_%1_dammage",playerSide],0]);
//Tage, an denen DXp an sein soll.
//Format:  MonatTag
//Bsp. :   1224 = Weinachten
//DatumVar: life_real_date
//ZeitVar : life_real_time
de100_Dxp_days = [0101,0201,0301,0401,0501,0601,0701,0801,0901,1001,1101,1201,
	1224,//xMas
	1225,//XMas1
	1226,//Xmas2
	0330,//Karfreitag
	0402,//OsterMontag
	0510,//Christi Himmelfahrt
	0521,//Pfingstmontag
	1003//Tag der Deutschen Einheit	
];

de100_Dxp_days = compileFinal (if( de100_Dxp_days isEqualType "") then {de100_Dxp_days} else {str de100_Dxp_days});

//Revive constant variables.
life_revive_fee = 5000;
life_revive_fee = compileFinal (if( life_revive_fee isEqualType "") then {life_revive_fee} else {str life_revive_fee});

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_paycheck_period = 5;
life_impound_car = 1500;
life_impound_boat = 1000;
life_impound_air = 3000;


life_paycheck_period = compileFinal (if( life_paycheck_period isEqualType "") then {life_paycheck_period} else {str life_paycheck_period});
life_impound_car = compileFinal (if( life_impound_car isEqualType "") then {life_impound_car} else {str life_impound_car});
life_impound_boat = compileFinal (if( life_impound_boat isEqualType "") then {life_impound_boat} else {str life_impound_boat});
life_impound_air = compileFinal (if( life_impound_air isEqualType "") then {life_impound_air} else {str life_impound_air});

life_bank_fail = false;
life_is_arrested = false;
life_delivery_in_progress = false;
life_battery = 100;
de100_luciandjuli_mula = 0;
life_istazed = false;
life_my_gang = objNull;
life_vehicles = [];
bank_robber = [];
life_taxi_request = false;
life_fuelstation_price = 0;
life_fuelstation_lockVeh = objNull;
life_fuelstation_fueltruck = objNull;
life_fuelstation_amount = 0;
life_fuelstation_fitamount = 0;
life_fuelstation_cfgTrucks = ["C_Van_01_fuel_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","O_Truck_03_fuel_F"];
life_schaf = objNull;
life_drugged_cocaine = -1;
life_drugged_cocaine_duration = 10; 
life_drugged_weed = -1;
life_drugged_weed_duration = 3;

de100_luciandjuli_bc = 50000; //Starting Bank Money

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
life_vShop_rentalOnly = compileFinal (if( life_vShop_rentalOnly isEqualType "") then {life_vShop_rentalOnly} else {str life_vShop_rentalOnly});

//Licenses [license var, civ/cop]
{
    [1,[configName _x,false]] call life_fnc_handleLicense;
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));



life_dp_point1s = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];