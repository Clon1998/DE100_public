#define SYSTEM_TAG "life"
#define ITEM_TAG format["%1%2",SYSTEM_TAG,"item_"]
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define DE100_CASH de100_luciandjuli_mula
#define DE100_BANCACC de100_luciandjuli_bc
#define GANG_FUNDS grpPlayer getVariable ["gang_bank",0];

/*
	remoteExec Section
	When uncommented it enables proper testing via local testing
	Otherwise leave it commented out for "LIVE" servers
*/
#define DEBUG 1

#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global

//Namespace Macros
#define SVAR_MNS missionNamespace setVariable 
#define SVAR_UINS uiNamespace setVariable 
#define SVAR_PNS parsingNamespace setVariable 
#define GVAR_MNS missionNamespace getVariable 
#define GVAR_UINS uiNamespace getVariable

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
#define GVAR getVariable
#define SVAR setVariable
#define RIFLE primaryWeapon player
#define RIFLE_ITEMS primaryWeaponItems player
#define PISTOL handgunWeapon player
#define PISTOL_ITEMS handgunItems player
#define LAUNCHER secondaryWeapon player
#define EXTDB "extDB3" callExtension
#define EXTDB_SETTING(TYPE,SETTING) TYPE(configFile >> "Life_Server_Settings" >> "EXTDB" >> SETTING)
#define EXTDB_FAILED(MESSAGE) \
	life_server_extDB_notLoaded = [true,##MESSAGE]; \
	PVAR_ALL("life_server_extDB_notLoaded"); \
	diag_log MESSAGE;

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index
#define CONTROL_DATA_LNB(ctrl) (lnbData[##ctrl,[(lnbCurSelRow ##ctrl),0]])
#define CONTROL_VALUE_LNB(ctrl) (lnbValue[##ctrl,[(lnbCurSelRow ##ctrl),0]])
	
//System Macros
#define grpPlayer group player
#define steamid getPlayerUID player
#define LICENSE_VARNAME(varName,flag) format["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) GVAR_MNS [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) GVAR_MNS [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SAFETODB(varName) M_CONFIG(getNumber,"VirtualItems",varName,"safeToDB")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_ICON(varName) M_CONFIG(getText,"VirtualItems",varName,"icon")
#define ITEM_PROF(varName) M_CONFIG(getText,"VirtualItems",varName,"profVar")

//DynMarket 
#define DYN_ITEM_TO_TRACK ("getNumber(_x >> 'dynTracker') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"))
#define DYN_ITEM_MAXPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"maxPrice")
#define DYN_ITEM_MINPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"minPrice")
#define DYN_ITEM_AVGPRICE(varName) DYN_ITEM_MINPRICE(varName) + (DYN_ITEM_MAXPRICE(varName) - DYN_ITEM_MINPRICE(varName)) / 2

#define DYN_ITEM_CRNT_PRICE(varName) call {if ([varName,DYN_Price_array] call life_fnc_index >= 0) then { DYN_Price_array select ([varName,DYN_Price_array] call life_fnc_index) select 1} else {-1}}
#define DYN_ITEM_GET_RELATED_ITEMS(varName) M_CONFIG(getArray,"VirtualItems",varName,"relatedItems")
#define DYN_ITEM_CHECK(varName) (M_CONFIG(getNumber,"VirtualItems",varName,"dynTracker") isEqualTo 1)


#define PROF_NAME(varName) M_CONFIG(getText,"ProfSys",varName,"displayName")
#define PROF_VARNAME(varName) M_CONFIG(getText,"ProfSys",varName,"variable")
#define PROF_flag(varName) M_CONFIG(getText,"ProfSys",varName,"flag")
#define PROF_type(varName) M_CONFIG(getText,"ProfSys",varName,"type")
#define PROF_skilltype(varName) M_CONFIG(getText,"ProfSys",varName,"skilltype")

//Condition Macros
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_WEAPONS "CfgWeapons"
#define CONFIG_MAGAZINES "CfgMagazines"
#define CONFIG_GLASSES "CfgGlasses"

//StaffManager Macros
#define ERROR -1
#define ONLINE 0
#define STAFFREQUEST 1
#define STAFFANWSER 2
#define COP 0
#define THR 1