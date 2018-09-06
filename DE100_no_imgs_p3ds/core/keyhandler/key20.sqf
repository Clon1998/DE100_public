private["_shif","_ctrl","_altk","_stop","_inta"];
_shif=_this select 0;
_ctrl=_this select 1;
_altk=_this select 2;
_stop=_this select 3;
_inta=_this select 4;

private _gang = group player;
private _playerPermissions = if (count (_gang getVariable ["gang_MEMBERS",[]]) > 0) then {
	((_gang getVariable ["gang_MEMBERS",[]]) select ([getPlayerUID player,(_gang getVariable ["gang_MEMBERS",[]])] call life_fnc_index)) select 1;
} else {
	[[getPlayerUID player,[]]];
};

if(!_altk && !_ctrl && !life_is_processing) then
{
	if(!isNull objectParent player && alive vehicle player) then {
		if ((vehicle player) in life_vehicles) then {
			["life_fnc_openTrunk", [vehicle player]] call SOCK_fnc_ping;
		};
	} else {
		if ((cursorObject isKindOf "Car" or cursorObject isKindOf "Air" or cursorObject isKindOf "Ship" or cursorObject isKindOf "Pod_Heli_Transport_04_base_F") && player distance cursorObject < 10 && isNull objectParent player && alive cursorObject) then {
			if (cursorObject in life_vehicles or {!(cursorObject getVariable ["locked",true])}) then {
				["life_fnc_openTrunk", [cursorObject]] call SOCK_fnc_ping;
			};
		};
		if ((cursorObject isKindOf "House_F") && player distance cursorObject < 7 && isNull objectParent player && alive cursorObject) then {
			if (cursorObject in life_vehicles) then {
				if (cursorObject getVariable ["isStorehouse",false] && !("HOUSE" in _playerPermissions)) exitwith {["Du hast keine Berechtigung, um auf das Lagerhaus zuzugreifen.",true,"fast"] call life_fnc_notification_system;};
				if (cursorObject getVariable ["isStorehouse",false] && !(((cursorObject getVariable ["house_owner",["",""]]) select 0) isEqualTo (_gang getVariable ["gang_ID",0]))) exitwith {["Nur Gangmitglieder können auf das Lagerhaus zugreifen.",true,"fast"] call life_fnc_notification_system;};
				if (missionNamespace getVariable ["auc_isLoading", false]) exitWith {
					["Aufgrund eines potenziellen Netzwerklags darfst du das Inventar erst öffnen wenn das Auktionshaus alle Daten geladen hat.",true,"fast"] call life_fnc_notification_system;
				};
				createDialog "virt_houseMenu";
			};
		};
	};
};

_stop