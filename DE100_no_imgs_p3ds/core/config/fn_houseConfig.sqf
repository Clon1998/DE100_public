/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for buyable houses?
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
call {
	if (_house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]) exitWith {[15250000,3];};
	if (_house in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]) exitWith {[20450000,4];};
	if (_house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) exitWith {[5750000,0];};
	if (_house in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]) exitWith {[10050000,2];};
	if (_house in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]) exitWith {[10000500,2];};
	if (_house in ["Land_i_House_Small_03_V1_F"]) exitWith {[11250000,2];};
	if (_house in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]) exitWith {[9750000,1];};
	[];
};