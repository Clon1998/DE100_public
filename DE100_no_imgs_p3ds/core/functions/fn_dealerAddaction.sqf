/*
	File : fn_dealerAddaction.sqf
	Date:   12.11.2015	
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	Take a look for yourself.
*/


private["_type"];
_type = _this select 0;

call {
	if (_type isEqualTo  0) exitWith {
		_sign = param [1, objNull, [objNull]];

		if (isNull _sign) exitWith {
		  diag_log "Sign attatchment failed";
		};
		private _markerAlpha = if (findDisplay 12 getVariable ["Dealer_illegal_shown",true]) then {
			1;
		} else {
			0;
		};

		private _markerColor = if (count (profileNamespace getVariable ["Dealer_illegal_color",[]]) > 0) then {
			(profileNamespace getVariable ["Dealer_illegal_color",[]]) select 0;
		} else {
			"ColorEAST";
		};

		_markerSize = call {
			if ((profileNamespace getVariable ["Dealer_illegal_size","default"]) isEqualTo "big") exitWith {[2,2];};
			if ((profileNamespace getVariable ["Dealer_illegal_size","default"]) isEqualTo "default") exitWith {[1,1];};
			if ((profileNamespace getVariable ["Dealer_illegal_size","default"]) isEqualTo "small") exitWith {[0.5,0.5];};
		};	

		{
			_x setMarkerAlphaLocal _markerAlpha;
			_x setMarkerColorLocal _markerColor;
			_x setMarkerSizeLocal _markerSize;
		} forEach ["Marker_Dealer_1","Marker_Dealer_2","Marker_Dealer_3"];
		_sign addAction["Drogen Dealer",life_fnc_virt_menu,"drugdealer",0,false,false,"",' isNull objectParent player && player distance _target < 5 && playerSide == civilian ']; 
		_sign addAction["Dealer abfragen",life_fnc_questionDealer,"",0,false,false,"",' isNull objectParent player && player distance _target < 5 && playerSide == west && !life_action_inUse ']; 
	};

	if (_type isEqualTo  1) exitWith {
		{
		 	_sign = _x select 0;
			if (isNull _sign) exitWith {
			  	diag_log "Sign attatchment failed";
			};

			_sign addAction["Drogen Dealer",life_fnc_virt_menu,"drugdealer",0,false,false,"",' isNull objectParent player && player distance _target < 5 && playerSide == civilian ']; 
			_sign addAction["Dealer abfragen",life_fnc_questionDealer,"",0,false,false,"",' isNull objectParent player && player distance _target < 5 && playerSide == west && !life_action_inUse ']; 
		} forEach DealerMarkers;

		[
			{0.5},
			time,{
			scriptName "Dealer-Marker-Update";
			{
				private _sign = _x select 0;
				private _timer = _x select 1;
				private _marker = _x select 2;

			    _marker setMarkerTextLocal format["Drogen Dealer Noch: %1", ([if ((_timer - serverTime) > 0) then {(_timer - serverTime);} else {0;},"MM:SS"] call BIS_fnc_secondsToString)];
			} forEach DealerMarkers;
		}]call life_fnc_threadControl;
	};
};