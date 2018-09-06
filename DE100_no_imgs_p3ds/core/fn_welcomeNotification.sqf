private _time = [life_playTime,"HH:MM:SS",true] call BIS_fnc_secondsToString;
[format["Willkommen %1,<br/>Sie haben bereits %2 Stunden %3 Minuten auf DE100 gespielt.",player call life_fnc_name,_time select 0,_time select 1], false, "slow"] call life_fnc_notification_system;

private _scripter = "Lucian";
[
	format["<t color='#c18c48' size='1.0'>%1 willkommen</t><br/><t size='0.7'> auf dem DE100-Server</t>",player call life_fnc_name],
	[safezoneX + safezoneW - 2.3,0.50],
	[safezoneY + safezoneH - 0.7,0.7],
	3,
	0.5
] spawn BIS_fnc_dynamicText;
sleep 5;
[
	format["<t color='#c18c48'  size='1.0'>De100 Entwickler:</t><br/><t size='0.7'> %1</t>",_scripter],
	[safezoneX + safezoneW - 0.7,0.50],
	[safezoneY + safezoneH - 1,0.7],
	3,
	0.5
] spawn BIS_fnc_dynamicText;

sleep 5;

[ 
	format["<t color='#c18c48' size='1.5'>Das DE100-Team</t><br/><t size='0.7'> wünscht Dir viel Spaß</t>"], 
	[safezoneX + 0.2 * safezoneW,1.50], 
	[safezoneY + 0.1 * safezoneH,1.7], 
	3, 
	0.5 
] spawn BIS_fnc_dynamicText; 
if (!life_skipintro) then {
	sleep 5;
	[   
		format["<t size='.55' align='left'>Introsong: Nathex - Feeling Good by IntroBeats</t>"],   
		[safezoneX + safezoneW - 2.43,0.90],   
		[safezoneY + safezoneH -1.822,0.7],   
		10,   
		0.5   
	] spawn BIS_fnc_dynamicText;
};

[format["Wusstest du, %1",selectRandom(getArray(missionConfigFile >> "Life_Settings" >> "did_you_know"))],false,"slow"] call life_fnc_notification_system;

if (missionNamespace getVariable  ["de100_Ty_ShopAktivated",false]) then {
	["Der Spendenshop ist aktiviert",false,"slow"] call life_fnc_notification_system;	
};