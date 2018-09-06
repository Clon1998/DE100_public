/*
	File: fn_initAdminFunctions.sqf
	Author: Anton
	
	Description:
	Initialisiert das Admin Menü für Admins
*/
de100_mSpace = createLocation ["fakeTown", [-2000,-2000,-2000], 0, 0];
life_admin_options=[
	["Spieler Optionen",
		[
			[["Spectaten","A3\3den\Data\CfgWaypoints\seekAndDestroy_ca.paa"],2,[false,{['specate']call life_fnc_adminFunction}]],
			[["Einfrieren","A3\ui_f\data\gui\Rsc\RscDisplaySingleMission\locked_ca.paa"],3,[false,{['freeze']call life_fnc_adminFunction}]],
			[["Z-Item geben","images\items\ico_apple.paa"],5,[false,{['vitemspawn']call life_fnc_adminFunction}]],
			[["Zum Spieler tpn","A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"],3,[false,{['tpto']call life_fnc_adminFunction}]],
			[["Spieler zu mir tpn","A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"],2,[false,{['tphere']call life_fnc_adminFunction}]],
			[["Teleportieren","A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"],3,[false,{['tpplayer']call life_fnc_adminFunction}]],
			[["Heilen","A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"],3,[false,{['healplayer']call life_fnc_adminFunction}]],
			[["Wiederbeleben","A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"],3,[false,{['revive']call life_fnc_adminFunction}]],
			[["Spieler Geld geben (Bankkonto)","images\icons\ico_bank.paa"],5,[false,{['givemoneytoplayer']call life_fnc_adminFunction}]],
			[["Spieler Geld geben (Hand)","images\icons\ico_money.paa"],5,[false,{['givemoneytoplayerbar']call life_fnc_adminFunction}]],
			[["Kontoinformationen abragen","images\icons\ico_hasid.paa"],3,[false,{['getplayermoney']call life_fnc_adminFunction}]],
			[["Spieler kicken","images\icons\ico_perm.paa"],3,[false,{['kick']call life_fnc_adminFunction}]]
		]
	],
	["Eigene Optionen",
		[
			[["GodMode",""],5,[true,{['godon']call life_fnc_adminFunction},{['godoff']call life_fnc_adminFunction},"life_godmode"]],
			[["Speed Modus",""],5,[true,{['speedmodeon']call life_fnc_adminFunction},{['speedmodeoff']call life_fnc_adminFunction},"life_speedmode"]],
			[["Unsichtbar",""],5,[true,{['invisibleon']call life_fnc_adminFunction},{['invisibleoff']call life_fnc_adminFunction},"life_invisible"]],
			[["Spieler ESP",""],3,[true,{['espon']call life_fnc_adminFunction},{['espoff']call life_fnc_adminFunction},"life_esp"]],
			[["Spieler ESP (Erweitert)",""],3,[true,{['esponfancy']call life_fnc_adminFunction},{['espofffancy']call life_fnc_adminFunction},"life_espfancy"]],
			[["Map Marker",""],5,[true,{['pmarkeron']call life_fnc_adminFunction},{['pmarkeroff']call life_fnc_adminFunction},"life_marker_player"]],
			[["Selbst heilen","A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"],3,[false,{['healmyself']call life_fnc_adminFunction}]],
			[["Arsenal","A3\3den\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa"],5,[false,{['arsenal']call life_fnc_adminFunction}]],
			[["Klon-Menü","A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_toolbox_groups_ca.paa"],5,[false,{['clonemenu']call life_fnc_adminFunction}]],
			[["Teleportieren","A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"],1,[false,{['tp']call life_fnc_adminFunction}]],
			[["Entfesseln","A3\ui_f\data\gui\Rsc\RscDisplaySingleMission\locked_ca.paa"],5,[false,{['unrestrain']call life_fnc_adminFunction}]],
			[["DE100-Infocenter","A3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa"],1,[false,{['infoCenter']call life_fnc_adminFunction}]],
			[["In die Lobby begeben","A3\ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa"],5,[false,{['logout']call life_fnc_adminFunction}]]
		]
	],
	["Debug Optionen",
		[
			[["Debug Konsole","A3\3den\Data\Displays\Display3DEN\EntityMenu\findconfig_ca.paa"],5,[false,{['debug']call life_fnc_adminFunction}]],
			[["Vehicle Spawner","A3\3den\Data\Displays\Display3DEN\EntityMenu\garage_ca.paa"],5,[false,{['vehspawner']call life_fnc_adminFunction}]],
			[["Item Spawner","A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\uniform_ca.paa"],5,[false,{['itemspawner']call life_fnc_adminFunction}]],
			[["Diagnose Modus",""],3,[true,{['diagModeOn']call life_fnc_adminFunction},{['diagModeOff']call life_fnc_adminFunction},"life_diag_mode"]]
		]
	],
	["Events",
		[
			[["Air Drop rufen","A3\3den\Data\Displays\Display3DEN\EntityMenu\garage_ca.paa"],4,[false,{['airDropCaller']call life_fnc_adminFunction}]],
			[["Doppel-XP","images\ui\ui_dxp.paa"],5,[false,{['doppelxp']call life_fnc_adminFunction}]]
		]
	]	
];

life_fnc_toggle_menu={
	_menu=param [0,'',['']];

	switch(_menu)do{
		case'vehspawner':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 1111);
			if(_open)then{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[1111,1112,1113,1114,1115,1116,1117,1118,1119,1120];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,3331,3332,3333,3334,3335,3336,3337,3338,4441,4442,4443,4444,4445,4446,4447,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[1111,1112,1113,1114,1115,1116,1117,1118,1119,1120];
			};
		};
		case'airDropCaller':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 7771);
			if(_open)then{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,3331,3332,3333,3334,3335,3336,3337,3338,4441,4442,4443,4444,4445,4446,4447,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
			};
		};
		case'itemspawner':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 2221);
			if(_open)then{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[2221,2222,2223,2224,2225,2226,2227,2228,2229,2230];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,3331,3332,3333,3334,3335,3336,3337,3338,4441,4442,4443,4444,4445,4446,4447,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[2221,2222,2223,2224,2225,2226,2227,2228,2229,2230];
			};
		};
		case'debug':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 3331);
			if(_open)then{
				profileNamespace setVariable ['DE100_Debug_code',(ctrlText(findDisplay 2900 displayCtrl 3334))];
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[3331,3332,3333,3334,3335,3336,3337,3338];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				(findDisplay 2900 displayCtrl 3334) ctrlSetText (profileNamespace getVariable ['DE100_Debug_code','']);
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,4441,4442,4443,4444,4445,4446,4447,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[3331,3332,3333,3334,3335,3336,3337,3338];
			};
		};
		case'zitems':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 4441);
			if(_open)then{
				profileNamespace setVariable ['DE100_Debug_code',(ctrlText(findDisplay 2900 displayCtrl 3334))];
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[4441,4442,4443,4444,4445,4446,4447];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				(findDisplay 2900 displayCtrl 3334) ctrlSetText (profileNamespace getVariable ['DE100_Debug_code','']);
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,3331,3332,3333,3334,3335,3336,3337,3338,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[4441,4442,4443,4444,4445,4446,4447];
			};
		};
		case'clonemenu':{
			_open=ctrlShown(findDisplay 2900 displayCtrl 5551);
			if(_open)then{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[5551,5552,5553,5554,5555,5556,5557,5558,5559];
				(findDisplay 2900 displayCtrl 6)ctrlShow true;
			}else{
				{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[6,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,3331,3332,3333,3334,3335,3336,3337,3338,4441,4442,4443,4444,4445,4446,4447,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
				{(findDisplay 2900 displayCtrl _x)ctrlShow true}forEach[5551,5552,5553,5554,5555,5556,5557,5558,5559];
			};
		};
		case'none':{
			{(findDisplay 2900 displayCtrl _x)ctrlShow false}forEach[1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,3331,3332,3333,3334,3335,3336,3337,3338,4441,4442,4443,4444,4445,4446,4447,5551,5552,5553,5554,5555,5556,5557,5558,5559,6661,6662,6663,6664,6665,6666,6667,6668,6669,6670,7771,7772,7773,7774,7775,7776,7777,7778,7779,7780,7781,7782,7783];
			(findDisplay 2900 displayCtrl 6)ctrlShow true;
		};
	};
};

life_fnc_listOption={
	disableSerialization;
	_index=_this select 0;
	_x=_this select 1;
	_expand=_this select 2;
	_displayName=(_x select 0)select 0;
	_picture=(_x select 0)select 1;
	_level=_x select 1;
	_switch=(_x select 2)select 0;
	_code1=(_x select 2)select 1;

	if((call life_adminlevel)>=_level)then{
		if(_switch)then{
			_code2=(_x select 2)select 2;
			_var=(_x select 2)select 3;
			_i2=_list tvAdd[[_index],_displayName];
			_list tvSetData[[_index,_i2],str(_x select 2)];
			_list tvSetPicture[[_index,_i2],if(missionNamespace getVariable[_var,false])then{'images\icons\ico_switchon.paa'}else{'images\icons\ico_switchoff.paa'}];
			_list tvSetPictureRight[[_index,_i2],_picture];
		}else{
			_i2=_list tvAdd[[_index],_displayName];
			_list tvSetData[[_index,_i2],str(_x select 2)];
			_list tvSetPicture[[_index,_i2],_picture];
		};
		if(_expand)then{
			_list tvExpand[_index];
		};
	};
};

life_fnc_listPlayer={
	disableSerialization;
	_x=param [0,objNull,[objNull]];
	if(isNull _x)exitWith{
		};
	_11=headgear _x;
	_22=goggles _x;
	_33=uniform _x;
	_44=vest _x;
	_55=backpack _x;
	_i=_list tvAdd[[],[_x] call life_fnc_name];
	_picture=(switch(side _x)do{case west:{'side_west_ca.paa'};case independent:{'side_guer_ca.paa'};case civilian:{'side_civ_ca.paa'};case default{'side_empty_ca.paa'}});
	_picture=(if(_x getVariable['isAdmin',0]>0)then{'side_civ_ca.paa'}else{_picture});
	_list tvSetPicture[[_i],'A3\3den\Data\Displays\Display3DEN\PanelRight\'+_picture];
	_list tvSetPictureColor[[_i],(if(_x getVariable['isAdmin',0]>0)then{[1,0,0,1]}else{[1,1,1,1]})];
	_list tvSetPictureColorSelected[[_i],(if(_x getVariable['isAdmin',0]>0)then{[1,0,0,1]}else{[1,1,1,1]})];
	_list tvSetData[[_i],netID _x];
	_1=_list tvAdd [[_i],format["UID: %1",getPlayerUID _x]];
	_list tvSetPicture[[_i,_1],'A3\3den\Data\Cfg3DEN\History\changeAttributes_ca.paa'];
	if(call(life_adminlevel)==5)then{
		_1=_list tvAdd [[_i],format['NetID: "%1"',netId _x]];
		_list tvSetPicture[[_i,_1],'A3\3den\Data\Cfg3DEN\group\iconcustomcomposition_ca.paa'];
		_1=_list tvAdd [[_i],format["Position: %1",mapGridPosition _x]];
		_list tvSetPicture[[_i,_1],'A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa'];

		if(_11!='')then{	
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgWeapons" >> _11 >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgWeapons" >> _11 >> "picture"))];
		};
		if(_22!='')then{	
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgGlasses" >> _22 >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgGlasses" >> _22 >> "picture"))];
		};
		if(_33!='')then{	
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgWeapons" >> _33 >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgWeapons" >> _33 >> "picture"))];
		};
		if(_44!='')then{	
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgWeapons" >> _44 >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgWeapons" >> _44 >> "picture"))];
		};
		if(_55!='')then{	
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgVehicles" >> (backpack _x) >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgWeapons" >> (backpack _x) >> "picture"))];
		};				
		{
			_1=_list tvAdd [[_i],(getText(configFile >> "CfgWeapons" >> _x >> "displayName"))];
			_list tvSetPicture[[_i,_1],(getText(configFile >> "CfgWeapons" >> _x >> "picture"))];
		}forEach(weapons _x);
	};
};

life_fnc_searchArray={
	disableSerialization;
	_mode=param [0,'',['']];

	switch(_mode)do{
		case'players':{
			_text=ctrlText(findDisplay 2900 displayCtrl 2);
			_list=(findDisplay 2900 displayCtrl 4);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_players",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					tvClear _list;

					_admins=[];
					_cops=[];
					_medics=[];
					_civs=[];

					{
						if(_x getVariable['isAdmin',0]>0)then{
							_admins pushBackUnique[[_x]call life_fnc_name,_x];
						}
					}forEach allPlayers;

					{
						if!([[_x]call life_fnc_name,_x]in _admins)then{
							switch(side _x)do{
								case west:{
									_cops pushBack[[_x]call life_fnc_name,_x];
								};
								case independent:{
									_medics pushBack[[_x]call life_fnc_name,_x];
								};
								case civilian:{
									_civs pushBack[[_x]call life_fnc_name,_x];
								};
							};
						};
					}forEach allPlayers;

					_admins sort true;
					_cops sort true;
					_medics sort true;
					_civs sort true;
					reverse _admins;
					_admins pushBack[[hc_1]call life_fnc_name,hc_1];
					reverse _admins;

					{
						if(toLower(_x select 0)find(toLower _text)>-1)then{
							[_x select 1]call life_fnc_listPlayer;
						};
					}forEach(_admins+_cops+_medics+_civs);
				};
			};
			(findDisplay 2900)setVariable["lastsearch_players",_text];

			tvClear _list;

			_admins=[];
			_cops=[];
			_medics=[];
			_civs=[];

			{
				if(_x getVariable['isAdmin',0]>0)then{
					_admins pushBackUnique[[_x]call life_fnc_name,_x];
				}
			}forEach allPlayers;

			{
				if!([[_x]call life_fnc_name,_x]in _admins)then{
					switch(side _x)do{
						case west:{
							_cops pushBack[[_x]call life_fnc_name,_x];
						};
						case independent:{
							_medics pushBack[[_x]call life_fnc_name,_x];
						};
						case civilian:{
							_civs pushBack[[_x]call life_fnc_name,_x];
						};
					};
				};
			}forEach allPlayers;

			_admins sort true;
			_cops sort true;
			_medics sort true;
			_civs sort true;
			reverse _admins;
			_admins pushBack[[hc_1]call life_fnc_name,hc_1];
			reverse _admins;

			{
				if(toLower(_x select 0)find(toLower _text)>-1)then{
					[_x select 1]call life_fnc_listPlayer;
				};
			}forEach(_admins+_cops+_medics+_civs);
		};
		case'options':{
			_text=ctrlText(findDisplay 2900 displayCtrl 3);
			_list=(findDisplay 2900 displayCtrl 5);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_options",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					tvClear _list;
					{
						_title=_x select 0;
						_options=_x select 1;
						_i=_list tvAdd[[],_title];
						{
							[_i,_x,true]call life_fnc_listOption;
						}forEach _options;
					}forEach life_admin_options;
				};
			};
			(findDisplay 2900)setVariable["lastsearch_options",_text];

			tvClear _list;
			{
				_title=_x select 0;
				_options=_x select 1;
				_i=_list tvAdd[[],_title];
				{
					if(toLower((_x select 0)select 0)find(toLower _text)>-1)then{
						[_i,_x,true]call life_fnc_listOption;
					};
				}forEach _options;
			}forEach life_admin_options;
		};
		case'items':{
			_text=ctrlText(findDisplay 2900 displayCtrl 2230);
			_list=(findDisplay 2900 displayCtrl 2226);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_items",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					lbClear _list;
					_items=[];
					_clothshopsraw='true'configClasses(missionConfigFile>>'Clothing');
					{
						_uniforms=getArray(missionConfigFile>>'Clothing'>>configName _x>>'uniforms');
						_headgear=getArray(missionConfigFile>>'Clothing'>>configName _x>>'headgear');
						_goggles=getArray(missionConfigFile>>'Clothing'>>configName _x>>'goggles');
						_vests=getArray(missionConfigFile>>'Clothing'>>configName _x>>'vests');
						_backpacks=getArray(missionConfigFile>>'Clothing'>>configName _x>>'backpacks');

						{
							_items pushBackUnique(_x select 0);
						}forEach(_uniforms+_headgear+_goggles+_vests+_backpacks);
					}forEach _clothshopsraw;

					_weaponshopsraw='true'configClasses(configFile>>'CfgWeapons');

					{
						_items pushBackUnique(configName _x);
					}forEach _weaponshopsraw;

					{
						private['_cfg'];
						if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
						if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
						if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
						if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
						_displayName=getText(configFile>>_cfg>>_x>>'displayName');
						_picture=getText(configFile>>_cfg>>_x>>'picture');
						if(_displayName!=''&&_picture!='')then{
							_i=_list lbAdd _displayName;
							_list lbSetData[_i,_x];
							_list lbSetPicture[_i,_picture];
						};
					}forEach _items;
				};
			};
			(findDisplay 2900)setVariable["lastsearch_items",_text];

			lbClear _list;
			_items=[];
			_clothshopsraw='true'configClasses(missionConfigFile>>'Clothing');
			{
				_uniforms=getArray(missionConfigFile>>'Clothing'>>configName _x>>'uniforms');
				_headgear=getArray(missionConfigFile>>'Clothing'>>configName _x>>'headgear');
				_goggles=getArray(missionConfigFile>>'Clothing'>>configName _x>>'goggles');
				_vests=getArray(missionConfigFile>>'Clothing'>>configName _x>>'vests');
				_backpacks=getArray(missionConfigFile>>'Clothing'>>configName _x>>'backpacks');

				{
					_items pushBackUnique(_x select 0);
				}forEach(_uniforms+_headgear+_goggles+_vests+_backpacks);
			}forEach _clothshopsraw;

			_weaponshopsraw='true'configClasses(configFile>>'CfgWeapons');

			{
				_items pushBackUnique(configName _x);
			}forEach _weaponshopsraw;

			{
				private['_cfg'];
				if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
				if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
				if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
				if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
				_displayName=getText(configFile>>_cfg>>_x>>'displayName');
				_picture=getText(configFile>>_cfg>>_x>>'picture');
				if(_displayName!=''&&_picture!=''&&{toLower(_displayName)find(toLower _text)>-1})then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,_x];
					_list lbSetPicture[_i,_picture];
				};
			}forEach _items;	
		};
		case'vehicles':{
			_text=ctrlText(findDisplay 2900 displayCtrl 1120);
			_list=(findDisplay 2900 displayCtrl 1116);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_vehicles",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					lbClear _list;
					_raw='true'configClasses(missionConfigFile>>'lifeVehicles');
					_vehs=[];
					{_vehs pushBackUnique configName _x}forEach _raw;
					{
						_displayName=getText(configFile>>'CfgVehicles'>>_x>>'displayName');
						_picture=getText(configFile>>'CfgVehicles'>>_x>>'icon');
						if(_displayName!=''&&_picture!=''&&_x!='Land_Pod_Heli_Transport_04_box_black_F')then{
							_i=_list lbAdd _displayName;
							_list lbSetData[_i,_x];
							_list lbSetPicture[_i,_picture];
						};
					}forEach _vehs;
				};
			};
			(findDisplay 2900)setVariable["lastsearch_vehicles",_text];

			lbClear _list;
			_raw='true'configClasses(missionConfigFile>>'lifeVehicles');
			_vehs=[];
			{_vehs pushBackUnique configName _x}forEach _raw;
			{
				_displayName=getText(configFile>>'CfgVehicles'>>_x>>'displayName');
				_picture=getText(configFile>>'CfgVehicles'>>_x>>'icon');
				if(_displayName!=''&&_picture!=''&&_x!='Land_Pod_Heli_Transport_04_box_black_F'&&{toLower(_displayName)find(toLower _text)>-1})then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,_x];
					_list lbSetPicture[_i,_picture];
				};
			}forEach _vehs;
		};
		case'zitems':{
			_text=ctrlText(findDisplay 2900 displayCtrl 4446);
			_list=(findDisplay 2900 displayCtrl 4444);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_zitems",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					_items = "true" configClasses (missionConfigFile >> "VirtualItems");

					lbClear _list;
					{
						_var=getText(_x >> 'variable');
						_displayName=localize getText(_x >> 'displayName');
						_icon=getText(_x >> 'icon');

						if(_displayName!=''&&_var!=''&&_icon!='')then{
							_i=_list lbAdd _displayName;
							_list lbSetData[_i,configName _x];
							_list lbSetPicture[_i,_icon];
						};
					}forEach _items;
					lbSort _list;
				};
			};
			(findDisplay 2900)setVariable["lastsearch_zitems",_text];

			lbClear _list;

			_items = format["(toLower localize getText(_x >> 'displayName') find toLower '%1') >= 0 || (toLower configName _x find toLower '%1') >= 0",_text] configClasses (missionConfigFile >> "VirtualItems");
			lbClear _list;
			{
				_var=getText(_x >> 'variable');
				_displayName=localize getText(_x >> 'displayName');
				_icon=getText(_x >> 'icon');

				if(_displayName!=''&&_var!=''&&_icon!='')then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,configName _x];
					_list lbSetPicture[_i,_icon];
				};
			}forEach _items;
			lbSort _list;
		};
		case'armaInv':{
			_text=ctrlText(findDisplay 2900 displayCtrl 7783);
			_list=(findDisplay 2900 displayCtrl 7780);
			lbClear _list;

			private _items = [];
			private _weapons =+ (missionNamespace getVariable ["de100_Shops",[]]);

			{
				private _rifles = ["rifles",_x select 1] call life_fnc_dataFromKey;
				private _pistols = ["pistols",_x select 1] call life_fnc_dataFromKey;
				private _ammunition = ["ammunition",_x select 1] call life_fnc_dataFromKey;
				private _accessoires = ["accessoires",_x select 1] call life_fnc_dataFromKey;
				private _misc = ["misc",_x select 1] call life_fnc_dataFromKey;
				if (_rifles isEqualTo false) then {_rifles = [];};
				if (_pistols isEqualTo false) then {_pistols = [];};
				if (_ammunition isEqualTo false) then {_ammunition = [];};
				if (_accessoires isEqualTo false) then {_accessoires = [];};
				if (_misc isEqualTo false) then {_misc = [];};
				private _u = ["uniform",_x select 1] call life_fnc_dataFromKey;
				private _h = ["headgear",_x select 1] call life_fnc_dataFromKey;
				private _g = ["goggle",_x select 1] call life_fnc_dataFromKey;
				private _v = ["vest",_x select 1] call life_fnc_dataFromKey;
				private _b = ["backpack",_x select 1] call life_fnc_dataFromKey;
				if (_u isEqualTo false) then {_u = [];};
				if (_h isEqualTo false) then {_h = [];};
				if (_g isEqualTo false) then {_g = [];};
				if (_v isEqualTo false) then {_v = [];};
				if (_b isEqualTo false) then {_b = [];};
				{
					_items pushBackUnique(_x select 0);
					nil;
				} count (_rifles+_pistols+_ammunition+_accessoires+_misc+_u+_h+_g+_v+_b);
				nil;
			} count _weapons;


			{
				private _cfg = "";
				if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
				if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
				if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
				if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
				private _displayName=getText(configFile>>_cfg>>_x>>'displayName');
				private _picture=getText(configFile>>_cfg>>_x>>'picture');
				if ((toLower _displayName find toLower _text) >= 0) then {				
					private _i = _list lbAdd _displayName;
					_list lbSetPicture [_i,_picture];
					_list lbSetData [_i,_x];
				};
				nil;
			} count _items;
		};
		case'gear':{
			_text=ctrlText(findDisplay 2900 displayCtrl 5555);
			_list=(findDisplay 2900 displayCtrl 5554);

			_lastsearch=(findDisplay 2900)getVariable["lastsearch_gear",""];
			if(_text==""||_text==_lastsearch)exitWith{
				if(_text==""&&_lastsearch!="")then{
					lbClear _list;
					{
						_x params[
							["_name", '', ['']],
							["_var", '', ['']],
							["_data", [], [[]]]
						];

						if(_name!=''&&_var!=''&&count(_data)>0)then{
							_i=_list lbAdd _name;
							_list lbSetData[_i,_var];
						};
					}forEach(profileNamespace getVariable["DE100_Saved_Gear",[]]);
				};
			};
			(findDisplay 2900)setVariable["lastsearch_gear",_text];

			lbClear _list;
			{
				_x params[
					["_name", '', ['']],
					["_var", '', ['']],
					["_data", [], [[]]]
				];

				if(_name!=''&&_var!=''&&count(_data)>0&&{toLower(_name)find(toLower _text)>-1})then{
					_i=_list lbAdd _name;
					_list lbSetData[_i,_var];
				};
			}forEach(profileNamespace getVariable["DE100_Saved_Gear",[]]);
		};
	};	
};

life_fnc_adminMenu={
	createDialog'life_admin_menu';
	setMousePosition [0.5, 0.5];
	disableSerialization;
	finddisplay 2900 call life_fnc_bgBlure;
	['none']call life_fnc_toggle_menu;

	_text=ctrlText(findDisplay 2900 displayCtrl 2);
	_list=(findDisplay 2900 displayCtrl 4);

	tvClear _list;

	_admins=[];
	_cops=[];
	_medics=[];
	_civs=[];

	{
		if(_x getVariable['isAdmin',0]>0)then{
			_admins pushBackUnique[[_x]call life_fnc_name,_x];
		}
	}forEach allPlayers;

	{
		if!([[_x]call life_fnc_name,_x]in _admins)then{
			switch(side _x)do{
				case west:{
					_cops pushBack[[_x]call life_fnc_name,_x];
				};
				case independent:{
					_medics pushBack[[_x]call life_fnc_name,_x];
				};
				case civilian:{
					_civs pushBack[[_x]call life_fnc_name,_x];
				};
			};
		};
	}forEach allPlayers;

	_admins sort true;
	_cops sort true;
	_medics sort true;
	_civs sort true;
	reverse _admins;
	_admins pushBack[[hc_1]call life_fnc_name,hc_1];
	reverse _admins;

	{
		if(toLower(_x select 0)find(toLower _text)>-1)then{
			[_x select 1]call life_fnc_listPlayer;
		};
	}forEach(_admins+_cops+_medics+_civs);

	[((findDisplay 2900) displayCtrl 6),0.5,0.05,getPos player] call life_fnc_setMapPosition;

	_text=ctrlText(findDisplay 2900 displayCtrl 3);
	_list=(findDisplay 2900 displayCtrl 5);

	tvClear _list;
	{
		_title=_x select 0;
		_options=_x select 1;
		_i=_list tvAdd[[],_title];
		{
			[_i,_x,true]call life_fnc_listOption;
		}forEach _options;
	}forEach life_admin_options;
};

life_fnc_executeOption={
	disableSerialization;
	params[
		["_list", controlNull, [controlNull]],
		["_selected", [], [[]]]
	];
	if(count _selected<2)exitWith{};

	_data=call compile(_list tvData _selected);

	_switch=_data select 0;
	_code1=_data select 1;

	if(_switch)exitWith{
		_code2=_data select 2;
		_var=_data select 3;

		if(missionNamespace getVariable[_var,false])then{
			_list tvSetPicture[_selected,"images\icons\ico_switchoff.paa"];
			missionNamespace setVariable[_var,false];
			[]spawn _code2;
		}else{
			_list tvSetPicture[_selected,"images\icons\ico_switchon.paa"];
			missionNamespace setVariable[_var,true];
			[]spawn _code1;
		};

	};

	[]spawn _code1;
};

life_fnc_adminFunction={
	disableSerialization;
	_function=param [0,'',['']];

	_list=(findDisplay 2900 displayCtrl 4);
	_selected=tvCurSel _list;
	_unit=objectFromNetId(_list tvData _selected);

	switch(_function)do{
		case'specate':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};
			_unit spawn{
				_unit=_this;
				[format["Du schaust gerade %1 zu.<br/><br/>Um das Spectaten zu beenden, öffne das ESC-Menü.",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
				if (life_HC_isActive) then {
					[format["%1(UID: %4) spectatet %2(UID: %3).",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
				} else {
					[format["%1(UID: %4) spectatet %2(UID: %3).",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
				};
				_unit switchCamera'External';
				waitUntil{isNull _unit||!alive _unit||!isPlayer _unit||!isNull(findDisplay 49)};
				player switchCamera'External';
				if (life_HC_isActive) then {
					[format["%1 spectatet %2(UID: %3) nicht mehr.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit],"AdminLog"] remoteExec ["A3Log",HC_Life];
				} else {
					[format["%1 spectatet %2(UID: %3) nicht mehr.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit],"AdminLog"] remoteExec ["A3Log",2];
				};					
			};
		};
		case'freeze':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};
			if(player isEqualTo _unit)exitWith{["Du kannst dich nicht selber auswählen",true,"fast"]call life_fnc_notification_system};
			[0,passwordtemp,
				(
				'
					_admin=objectFromNetId"'+netID player+'";

					if(userInputDisabled)then{
						disableUserInput false;
						[format["Du hast %1 aufgetaut",player call life_fnc_name],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
						if (life_HC_isActive) then {
							[format["%2(UID: %3) hat %1(UID: %4) aufgetaut.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID _admin,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
						} else {
							[format["%2(UID: %3) hat %1(UID: %4) aufgetaut.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID _admin,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
						};						
					}else{
						disableUserInput true;
						[format["Du hast %1 eingefroren",player call life_fnc_name],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
						if (life_HC_isActive) then {
							[format["%2(UID: %4) hat %1(UID: %3) eingefroren.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",HC_Life];
						} else {
							[format["%2(UID: %4) hat %1(UID: %3) eingefroren.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",2];
						};						
					};					
				'
				)
			,_unit]remoteExec["TON_fnc_execGlobal",2];	
		};
		case'infoCenter':{
			createDialog 'Life_infos';
		};

		case'aDc_transfer_box':{
			private _lbA = (findDisplay 2900) displayCtrl 7780;
			private _lbB = (findDisplay 2900) displayCtrl 7779;
			private _index = lbCurSel _lbA;

			private _class = _lbA lbData _index;
			private _text = _lbA lbText _index;
			private _ico = _lbA lbPicture _index;

			private _i = _lbB lbAdd _text;
			_lbB lbSetPicture [_i,_ico];
			_lbB lbSetData [_i,_class];
		};

		case'aDc_remove_box':{
			private _lbB = (findDisplay 2900) displayCtrl 7779;
			private _index = lbCurSel _lbB;
			_lbB lbDelete _index;
		};

		case'aDc_call':{
			private _list = findDisplay 2900 displayCtrl 7779;
			["Klicke auf die Karte, um den Airdrop zu rufen",false,"fast"] call life_fnc_notification_system;
			if (lbSize _list < 0) exitwith {
				["Du musst etwas in die Box füllen",false,"fast"] call life_fnc_notification_system;
			};
			onMapSingleClick{
				onMapSingleClick {};
				private _list = findDisplay 2900 displayCtrl 7779;
				private _content = [];
				if (isNull _list) exitwith {
					["Ein Fehler ist aufgetreten",true,"fast"] call life_fnc_notification_system;
				};
				for "_i" from (lbSize _list -1) to 0 step -1 do {
					private _class = _list lbData _i;
					if (_class != "") then {
						_content pushBack _class;
					};
				};
				if (life_HC_isActive) then {
					[getPlayerUID player,call life_clientId select 0,[
						["A3Log",false,[format["%1 hat einen Airdrop gerufen (MapGrid %2)",[player] call life_fnc_name,mapGridPosition _pos],"AdminLog"]],
						["AD_fnc_callAirDrop",true,[_pos,_content]]
					]] remoteExecCall ["MSC_fnc_execStack",HC_Life];
				} else {
					[getPlayerUID player,call life_clientId select 0,[
						["A3Log",false,[format["%1 hat einen Airdrop gerufen (MapGrid %2)",[player] call life_fnc_name,mapGridPosition _pos],"AdminLog"]],
						["AD_fnc_callAirDrop",true,[_pos,_content]]
					]] remoteExecCall ["MSC_fnc_execStack",2];
				};
				closeDialog 0;
			};
		};

		case'aDc_safe':{
			private _lbS = (findDisplay 2900) displayCtrl 7775;
			private _lbB = (findDisplay 2900) displayCtrl 7779;
			private _text = (findDisplay 2900) displayCtrl 7776;
			private _items = [];

			if (lbSize _lbB < 0) exitwith {
				["Du musst ein Loadout zusammenstellen",false,"fast"] call life_fnc_notification_system;
			};

			if (ctrlText _text isEqualTo "") exitwith {
				["Du musst einen Loadoutnamen eingeben",false,"fast"] call life_fnc_notification_system;
			};

			for "_i" from (lbSize _lbB -1) to 0 step -1 do {
				_items pushBack (_lbB lbData _i);
			};
			private _arr = profilenamespace getVariable ["DE100_Saved_Airdrop",[]];
			private _index = _arr pushBack [ctrlText _text,_items];
			private _ai = _lbS lbAdd (ctrlText _text);
			_lbS lbSetValue [_ai,_index];

			profilenamespace setVariable ["DE100_Saved_Airdrop",_arr];
		};

		case'aDc_del':{
			private _lbS = (findDisplay 2900) displayCtrl 7775;
			private _text = (findDisplay 2900) displayCtrl 7776;

			if (lbCurSel _lbS < 0) exitwith {
				["Du musst ein Loadout auswählen",false,"fast"] call life_fnc_notification_system;
			};
			private _index = _lbS lbValue (lbCurSel _lbS);
			private _arr = profilenamespace getVariable ["DE100_Saved_Airdrop",[]];
			_arr deleteAt _index;

			profilenamespace setVariable ["DE100_Saved_Airdrop",_arr];
			lbClear _lbS;
			{
				_x params[
					["_text", "", [""]]
				];

				private _i = _lbS lbAdd _text;
				_lbS lbSetValue [_i,_forEachIndex];
			} foreach _arr;
		};


		case'aDc_load':{
			private _lbS = (findDisplay 2900) displayCtrl 7775;
			private _lbB = (findDisplay 2900) displayCtrl 7779;

			if (lbCurSel _lbS < 0) exitwith {
				["Du musst ein Loadout auswählen",false,"fast"] call life_fnc_notification_system;
			};

			private _arr = profilenamespace getVariable ["DE100_Saved_Airdrop",[]];
			private _index = _lbS lbValue (lbCurSel _lbS);
			_arr = (_arr select _index) select 1;

			lbClear _lbB;

			{
				private['_cfg'];
				if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
				if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
				if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
				if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
				private _displayName=getText(configFile>>_cfg>>_x>>'displayName');
				private _picture=getText(configFile>>_cfg>>_x>>'picture');

				private _i = _lbB lbAdd _displayName;
				_lbB lbSetData [_i,_x];
				_lbB lbSetPicture [_i,_picture];
				nil;
			} count _arr;
		};

		case'vitemspawn':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};
			['zitems']call life_fnc_toggle_menu;

			disableSerialization;
			_list=(findDisplay 2900 displayCtrl 4444);
			_items = "true" configClasses (missionConfigFile >> "VirtualItems");

			lbClear _list;
			{
				_var=getText(_x >> 'variable');
				_displayName=localize getText(_x >> 'displayName');
				_icon=getText(_x >> 'icon');

				if(_displayName!=''&&_var!=''&&_icon!='')then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,configName _x];
					_list lbSetPicture[_i,_icon];
				};
			}forEach _items;
			lbSort _list;
		};
		case'spawnzitem':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			_list=(findDisplay 2900 displayCtrl 4444);
			_class=_list lbData lbCurSel _list;
			_count=round(parseNumber ctrlText(findDisplay 2900 displayCtrl 4445));

			if(_class=='')exitWith{[format["Es muss ein Z-Item ausgewählt werden."],true,"fast"] call life_fnc_notification_system};

			if(_count > 0)then{
				[0,passwordtemp,
					(
					'
						_admin=objectFromNetId"'+netID player+'";
						_class="'+_class+'";
						_count=round(parseNumber"'+str _count+'");

						_handle=(_count>0);

						if(([_handle,_class,_count]call life_fnc_handleInv) > 0)then{
							if(_handle)then{
								[format["Du hast %1 die Items erfolgreich gegeben",player call life_fnc_name],false,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
								if (life_HC_isActive) then {
									[format["%2(UID: %6) hat %1(UID: %3) %4 Z-Items vom Typ %5 gegeben.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,[_count]call life_fnc_numberText,_class,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",HC_Life];
								} else {
									[format["%2(UID: %6) hat %1(UID: %3) %4 Z-Items vom Typ %5 abgezogen.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,[_count]call life_fnc_numberText,_class,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",2];
								};								
							}else{
								[format["Du hast %1 die Items erfolgreich abgezogen",player call life_fnc_name],false,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
							};				
						}else{
							if(_handle)then{
								[format["%1 konnte diese Anzahl an Items nicht annehmen",player call life_fnc_name],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
							}else{
								[format["%1 konnte diese Anzahl an Items nicht annehmen",player call life_fnc_name],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
							};					
						};					
					'
					)
				,_unit]remoteExec["TON_fnc_execGlobal",2];				
			}else{
				[format["Es muss minimal eine Anzahl von eins eingegeben werden."],true,"fast"] call life_fnc_notification_system;
			};				
		};
		case'tpto':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			if(!isNull(objectParent player))then{
				(vehicle player)setPosASL getPosASLVisual _unit;
			}else{
				if(!isNull(objectParent _unit))then{
					player moveinAny(objectParent _unit);
				}else{
					player setPosASL getPosASL _unit;
				};
			};

			[format["Du hast dich zu %1 teleportiert",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1 hat sich zu %2(UID: %3) teleportiert.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1 hat sich zu %2(UID: %3) teleportiert.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};
		case'tphere':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};
			
			if(!isNull(objectParent _unit))then{
				(vehicle _unit)setPosASL getPosASLVisual player;
			}else{
				if(!isNull(objectParent player))then{
					_unit action["GetInCargo",(objectParent player)];
				}else{
					_unit setPosASL getPosASL player;
				};
			};

			[format["Du hast %1 zu dir teleportiert",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %4) hat %2(UID: %3) zu sich teleportiert.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %4) hat %2(UID: %3) zu sich teleportiert.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};				
		};
		case'tpplayer':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			[format["Bitte klicke auf die Map, um %1 zu teleportieren",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
			['none']call life_fnc_toggle_menu;
			call compile
			("onMapSingleClick{
				onMapSingleClick {};
				_unit=objectFromNetId'"+netID _unit+"';
				if(isNull _unit)exitWith{['Der ausgewählte Spieler ist nicht mehr online.',true,'fast'] call life_fnc_notification_system};
				(vehicle _unit)setPos _pos;
				[format['Du hast %1 teleportiert (%2)',[_unit] call life_fnc_name,mapGridPosition _unit],false,'fast'] call life_fnc_notification_system;
				if (life_HC_isActive) then {
					[format['%1(UID: %5) hat %2(UID: %4) teleportiert (%3).',player call life_fnc_name,[_unit] call life_fnc_name,mapGridPosition _unit,getPlayerUID _unit,getPlayerUID player],'AdminLog'] remoteExec ['A3Log',HC_Life];
				} else {
					[format['%1(UID: %5) hat %2(UID: %4) teleportiert (%3).',player call life_fnc_name,[_unit] call life_fnc_name,mapGridPosition _unit,getPlayerUID _unit,getPlayerUID player],'AdminLog'] remoteExec ['A3Log',2];
				};						
			}");
		};
		case'healplayer':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			_unit setDamage 0;
			[format["Du hast %1 geheilt",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %4) hat %2(UID: %3) geheilt.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %4) hat %2(UID: %3) geheilt.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};

		case'revive':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			[player call life_fnc_name] remoteExec ['life_fnc_revived',_unit];
			[format["Du hast %1 wiederbelebt",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %4) hat %2(UID: %3) wiederbelebt.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %4) hat %2(UID: %3) wiederbelebt.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID _unit,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};

		case'healmyself':{
			[format["Du hast dich geheilt"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1 hat sich geheilt.",player call life_fnc_name],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1 hat sich geheilt.",player call life_fnc_name],"AdminLog"] remoteExec ["A3Log",2];
			};
		};
		case'arsenal':{
			closeDialog 0;
			["Open",true] spawn BIS_fnc_arsenal;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat das Arsenal geöffnet.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat das Arsenal geöffnet.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};
		case'godon':{
			[format["GodMode aktiviert"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den GodMode aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den GodMode aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};		
			player removeAllEventHandlers"HandleDamage";
			player addEventHandler["HandleDamage",{false}];
			if (!isNull objectParent player) then {
				(vehicle player) addEventHandler["HandleDamage",{false}];
			};
		};
		case'godoff':{
			[format["GodMode deaktiviert"],true,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den GodMode deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den GodMode deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};			
			player removeAllEventHandlers"HandleDamage";
			player addEventHandler["HandleDamage",{_this call life_fnc_handleDamage}];
			player setVariable ["godMode",nil];
			if (!isNull objectParent player) then {
				(vehicle player) removeAllEventHandlers"HandleDamage";
			};
		};
		case'invisibleon':{
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat die Unsichtbarkeit aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat die Unsichtbarkeit aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
			[passwordtemp,player]remoteExec["TON_fnc_invisible",2];
		};
		case'invisibleoff':{
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat die Unsichtbarkeit deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat die Unsichtbarkeit deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};		
			[passwordtemp,player]remoteExec["TON_fnc_invisible",2];
		};
		case'espon':{
			[format["ESP aktiviert"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den ESP aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den ESP aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
			if(!isNil'life_pesp_sc')then{
				[format["ESP (Erweitert) deaktiviert"],true,"fast"] call life_fnc_notification_system;
				if (life_HC_isActive) then {
					[format["%1(UID: %2) hat den erweiterten ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
				} else {
					[format["%1(UID: %2) hat den erweiterten ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
				};
				removeMissionEventHandler['Draw3D',life_pesp_sc];
				life_pesp_sc=nil;
			};			
			life_pesp_sc=addMissionEventHandler['Draw3D',{
				{
					if(player distance _x<1500)then{
						drawIcon3D['',[0.2+(1-((player distance _x)/1000)),((player distance _x)/100),0,1],[visiblePosition _x select 0,visiblePosition _x select 1,(visiblePosition _x select 2)+2],0,0,0,format['%1(%2) -- %3',[_x] call life_fnc_name,round(player distance _x),100*(round(1-(damage _x)))],1,0.025,'RobotoCondensed']
					}
				}forEach allPlayers
			}];			
		};
		case'espoff':{
			[format["ESP deaktiviert"],true,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
			removeMissionEventHandler['Draw3D',life_pesp_sc];
			life_pesp_sc=nil;	
		};
		case'esponfancy':{
			if(!isNil'life_pesp_sc')then{
				[format["ESP deaktiviert"],true,"fast"] call life_fnc_notification_system;
				if (life_HC_isActive) then {
					[format["%1(UID: %2) hat den ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
				} else {
					[format["%1(UID: %2) hat den ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
				};
				removeMissionEventHandler['Draw3D',life_pesp_sc];
				life_pesp_sc=nil;
			};

			[format["ESP (Erweitert) aktiviert"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den erweiterten ESP aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den erweiterten ESP aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};

			life_pesp_sc=addMissionEventHandler['Draw3D',{
				_drawLine3D=[];
				_drawText3D=[];

				_temp1=[];
				_temp2=[];
				_temp3=[];
				_temp4=[];

				_count=0;

				{
						
					_h=switch(stance _x)do{
						case'CROUCH':{1.25};
						case'PRONE':{.5};
						default{1.9};
					};
					if(player distance _x<=50)then{
						_count=_count+1;

						_temp2 pushBack[_x modelToWorldVisual[.5,0,_h],_x modelToWorldVisual[-.5,0,_h],switch(true)do{case (_x getVariable["isAdmin",0]>0):{[1,0,0,1]};case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,1]};case (side _x isEqualTo OPFOR):{[0.502,0,0,1]};case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,1]};case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,1]};case default{[0.996,0.655,0.114,1]}},false];
						_temp2 pushBack[_x modelToWorldVisual[-.5,0,0],_x modelToWorldVisual[-.5,0,_h],switch(true)do{case (_x getVariable["isAdmin",0]>0):{[1,0,0,1]};case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,1]};case (side _x isEqualTo OPFOR):{[0.502,0,0,1]};case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,1]};case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,1]};case default{[0.996,0.655,0.114,1]}},false];
						_temp2 pushBack[_x modelToWorldVisual[.5,0,_h],_x modelToWorldVisual[.5,0,0],switch(true)do{case (_x getVariable["isAdmin",0]>0):{[1,0,0,1]};case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,1]};case (side _x isEqualTo OPFOR):{[0.502,0,0,1]};case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,1]};case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,1]};case default{[0.996,0.655,0.114,1]}},false];
						_temp2 pushBack[_x modelToWorldVisual[.5,0,0],_x modelToWorldVisual[-.5,0,0],switch(true)do{case (_x getVariable["isAdmin",0]>0):{[1,0,0,1]};case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,1]};case (side _x isEqualTo OPFOR):{[0.502,0,0,1]};case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,1]};case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,1]};case default{[0.996,0.655,0.114,1]}},false];
						
						_text=if(player distance _x<15)then{
							format[
								"<t align='left'color='%5'size='%6'>Name: %1<br/>UID: %2<br/>Waffe: <img image='%3'/>%4",
								[_x]call life_fnc_name,
								getPlayerUID _x,
								getText(configFile>>'CfgWeapons'>>currentWeapon _x>>'picture'),
								getText(configFile>>'CfgWeapons'>>currentWeapon _x>>'displayName'),
								switch(true)do{
									case (_x getVariable["isAdmin",0]>0):{"#FF0000"};
									case (side _x isEqualTo BLUFOR):{"#004c98"};
									case (side _x isEqualTo OPFOR):{"#800000"};
									case (side _x isEqualTo INDEPENDENT):{"#008000"};
									case (side _x isEqualTo CIVILIAN):{"#660080"};
									case default{"#fea71d"}
								},	
								(800-(player distance _x))/1000
							]
						}else{
							format[
								"<t align='left'color='%3'size='%4'>%1 (%2m)",
								[_x]call life_fnc_name,
								round(player distance _x),
								switch(true)do{
									case (_x getVariable["isAdmin",0]>0):{"#FF0000"};
									case (side _x isEqualTo BLUFOR):{"#004c98"};
									case (side _x isEqualTo OPFOR):{"#800000"};
									case (side _x isEqualTo INDEPENDENT):{"#008000"};
									case (side _x isEqualTo CIVILIAN):{"#660080"};
									case default{"#fea71d"}
								},					
								(800-(player distance _x))/1000
							]
						};	
						
						_temp3 pushBack(_forEachIndex+1);
						_temp4 pushBack[
							_x modelToWorldVisual[if((getDir player-getDirVisual _x)>180)then{.5}else{-.5},0,_h],
							((count(toArray _text))*((800-(player distance _x))/1000)*.0025),
							_text,
							false,
							switch(true)do{
								case (_x getVariable["isAdmin",0]>0):{[1,0,0,.2]};
								case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,.2]};
								case (side _x isEqualTo OPFOR):{[0.502,0,0,.2]};
								case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,.2]};
								case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,.2]};
								case default{[0.996,0.655,0.114,.2]}
							}			
						];			
					};
					if(player distance _x<800&&player distance _x>50)then{
						_text=format[
							"<t align='left'color='%3'size='%4'>%1 (%2m)",
							[_x]call life_fnc_name,
							round(player distance _x),
							switch(true)do{
								case (_x getVariable["isAdmin",0]>0):{"#FF0000"};
								case (side _x isEqualTo BLUFOR):{"#004c98"};
								case (side _x isEqualTo OPFOR):{"#800000"};
								case (side _x isEqualTo INDEPENDENT):{"#008000"};
								case (side _x isEqualTo CIVILIAN):{"#660080"};
								case default{"#fea71d"}
							},					
							(800-(player distance _x))/1000
						];	
						_temp3 pushBack(_forEachIndex+1);
						_temp4 pushBack[
							_x modelToWorldVisual[if((getDir player-getDirVisual _x)>180)then{.5}else{-.5},0,_h],
							((count(toArray _text))*((800-(player distance _x))/1000)*.0025),
							_text,
							false,
							switch(true)do{
								case (_x getVariable["isAdmin",0]>0):{[1,0,0,.2]};
								case (side _x isEqualTo BLUFOR):{[0,0.298,0.596,.2]};
								case (side _x isEqualTo OPFOR):{[0.502,0,0,.2]};
								case (side _x isEqualTo INDEPENDENT):{[0,0.502,0,.2]};
								case (side _x isEqualTo CIVILIAN):{[0.4,0,0.502,.2]};
								case default{[0.996,0.655,0.114,.2]}
							}			
						];
					};
				}forEach allPlayers;

				for'_1'from 1 to(_count*4)do{
					_temp1 pushBack _1;
				};

				_curs=if(isNull cursorObject||!(cursorObject in allUnits))then{cursorTarget}else{cursorObject};

				if(!isNull _curs&&_curs in allPlayers&&player distance _curs<800)then{
					_text=format[
						"<t align='left'color='%5'size='%6'>Name: %1<br/>UID: %2<br/>Waffe: <img image='%3'/>%4",
						name _curs,
						getPlayerUID _curs,
						getText(configFile>>'CfgWeapons'>>currentWeapon _curs>>'picture'),
						getText(configFile>>'CfgWeapons'>>currentWeapon _curs>>'displayName'),
						switch(true)do{
							case(_curs getVariable["isAdmin",0]>0):{"#FF0000"};
							case(side _curs isEqualTo BLUFOR):{"#004c98"};
							case(side _curs isEqualTo OPFOR):{"#800000"};
							case(side _curs isEqualTo INDEPENDENT):{"#008000"};
							case(side _curs isEqualTo CIVILIAN):{"#660080"};
							case default{"#fea71d"}
						},	
						1
					];
					_temp3 pushBack((_temp3 select((count _temp3)-1))+1);	
					_temp4 pushBack[
						[safeZoneX,safeZoneY+(safeZoneH/2)],
						((count(toArray _text))*.0025),
						_text,
						true,
						switch(true)do{
							case(_curs getVariable["isAdmin",0]>0):{[1,0,0,.2]};
							case(side _curs isEqualTo BLUFOR):{[0,0.298,0.596,.2]};
							case(side _curs isEqualTo OPFOR):{[0.502,0,0,.2]};
							case(side _curs isEqualTo INDEPENDENT):{[0,0.502,0,.2]};
							case(side _curs isEqualTo CIVILIAN):{[0.4,0,0.502,.2]};
							case default{[0.996,0.655,0.114,.2]}
						}
					];
				};

				_drawLine3D=[_temp1,_temp2];
				_drawText3D=[_temp3,_temp4];

				_drawLine3D call life_fnc_drawLine3D;
				_drawText3D call life_fnc_drawText3D;
			}];
		};
		case'espofffancy':{
			[format["ESP (Erweitert) deaktiviert"],true,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den erweiterten ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den erweiterten ESP deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
			removeMissionEventHandler['Draw3D',life_pesp_sc];
			44 cutText["","PLAIN"];
			45 cutText["","PLAIN"];
			life_pesp_sc=nil;
		};
		case'diagModeOn':{
			DE100_Diagnostic = 1;
			["Diagnose Modus aktiviert", true, "fast"] call life_fnc_notification_system;
		};
		case'diagModeOff':{
			DE100_Diagnostic = nil;
			["Diagnose Modus deaktiviert", true, "fast"] call life_fnc_notification_system;
		};

		case'pmarkeron':{
			[format["Spieler Marker aktiviert"],false,"fast"] call life_fnc_notification_system;

			[]spawn{
				for'_i'from 0 to 1 step 0 do{
					if(!life_marker_player)exitWith{};
					disableSerialization;
					{
						disableSerialization;
						if(!isNil'_x')then{
							_1=_x;
							_1 ctrlRemoveAllEventHandlers'Draw';
							_1 ctrlAddEventHandler['Draw',{
								_2=_this select 0;
								{
									if(true)then{
										if(!isNull objectParent _x)exitWith{};
										_3=switch(_x getVariable['side',side _x])do{
											case BLUFOR:{[0,0.298,0.596,1]};
											case OPFOR:{[0.502,0,0,1]};
											case INDEPENDENT:{[0,0.502,0,1]};
											case CIVILIAN:{[0.4,0,0.502,1]};
											default{[0.996,0.655,0.114,1]}
										};
										if(!alive _x)then{
											_3=[1,0,0,1]
										};						
										_2 drawIcon[
											(if(vehicle _x==_x&&side _x==west)then{'iconMan'}else{getText(configfile>>'CfgVehicles'>>(typeOf(vehicle _x))>>'Icon')}),
											_3,
											getPosASLVisual _x,
											24,
											24,
											getDirVisual _x,
											([_x] call life_fnc_name),
											1,0.05,'TahomaB','right'
										];
									};
								}forEach allPlayers;
								{
									if(_x isKindOf'Car'||_x isKindOf'Air'||_x isKindOf'Tank'||_x isKindOf'Ship')then{
										_4=getText(configfile>>'CfgVehicles'>>(typeOf(vehicle _x))>>'Icon');
										_6='(';{_6=_6+(if(_forEachIndex==0)then{''}else{', '})+([_x] call life_fnc_name)}forEach(crew(_x));_6=_6+')';
										_5=format['%1%2',getText(configFile>>'CfgVehicles'>>typeOf(vehicle _x)>>'displayName'),_6];
										_3=switch(_x getVariable['side',side _x])do{
											case BLUFOR:{[0,0.298,0.596,1]};
											case OPFOR:{[0.502,0,0,1]};
											case INDEPENDENT:{[0,0.502,0,1]};
											case CIVILIAN:{[0.4,0,0.502,1]};
											case default{[0.996,0.655,0.114,1]}
										};
										if(!alive _x)then{
											_3=[1,0,0,1]
										};
										_2 drawIcon[_4,_3,getPosASLVisual _x,24,24,getDirVisual _x,_5,1,0.05,'TahomaB','right'];
									};
								}forEach vehicles;
							}];
						};
					}forEach[(finddisplay 12 displayCtrl 51),(finddisplay 38500 displayCtrl 38502),(finddisplay 6500 displayCtrl 6703),(finddisplay 2900 displayCtrl 6),(finddisplay 2900 displayCtrl 1117),(finddisplay 2900 displayCtrl 2227)];
					sleep 1;
				};
				{
					if(!isNil'_x')then{
						_x ctrlRemoveAllEventHandlers'Draw';
					};
				}forEach[(finddisplay 12 displayCtrl 51),(finddisplay 38500 displayCtrl 38502),(finddisplay 6500 displayCtrl 6703),(finddisplay 2900 displayCtrl 6),(finddisplay 2900 displayCtrl 1117),(finddisplay 2900 displayCtrl 2227)];				
			};		
		};
		case'pmarkeroff':{
			[format["Spieler Marker deaktiviert"],true,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat die Spieler Marker deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat die Spieler Marker deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};		
		};
		case'tp':{
			[format["Klicke auf die Karte, um dich zu teleportieren."],false,"fast"] call life_fnc_notification_system;
			['none']call life_fnc_toggle_menu;
			onMapSingleClick{
				onMapSingleClick {};
				(vehicle player)setPos _pos;
				[format["Du hast dich teleportiert (%1)",mapGridPosition player],false,"fast"] call life_fnc_notification_system;
				if (life_HC_isActive) then {
					[format["%1(UID: %3) hat sich teleportiert (%2).",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
				} else {
					[format["%1(UID: %3) hat sich teleportiert (%2).",player call life_fnc_name,mapGridPosition player,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
				};				
			};
		};
		case'logout':{
			_confirm=["Möchtest du dich wirklich in die Lobby begeben? Deine Daten werden automatisch gespeichert.","Fortfahren?","Ja","Abbrechen"]call BIS_fnc_GUIMessage;
			if(_confirm)then{
				closeDialog 0;
				[]spawn life_fnc_logout;
			};
		};
		case'debug':{
			['debug']call life_fnc_toggle_menu;
		};
		case'airDropCaller':{
			['airDropCaller']call life_fnc_toggle_menu;
			private _listSafes = findDisplay 2900 displayCtrl 7775;
			private _listBox = findDisplay 2900 displayCtrl 7779;
			private _listArma = findDisplay 2900 displayCtrl 7780;

			lbClear _listSafes;
			lbClear _listBox;
			lbClear _listArma;
			private _items = [];
			private _weapons =+ (missionNamespace getVariable ["de100_Shops",[]]);

			{
				private _rifles = ["rifles",_x select 1] call life_fnc_dataFromKey;
				private _pistols = ["pistols",_x select 1] call life_fnc_dataFromKey;
				private _ammunition = ["ammunition",_x select 1] call life_fnc_dataFromKey;
				private _accessoires = ["accessoires",_x select 1] call life_fnc_dataFromKey;
				private _misc = ["misc",_x select 1] call life_fnc_dataFromKey;
				if (_rifles isEqualTo false) then {_rifles = [];};
				if (_pistols isEqualTo false) then {_pistols = [];};
				if (_ammunition isEqualTo false) then {_ammunition = [];};
				if (_accessoires isEqualTo false) then {_accessoires = [];};
				if (_misc isEqualTo false) then {_misc = [];};
				private _u = ["uniform",_x select 1] call life_fnc_dataFromKey;
				private _h = ["headgear",_x select 1] call life_fnc_dataFromKey;
				private _g = ["goggle",_x select 1] call life_fnc_dataFromKey;
				private _v = ["vest",_x select 1] call life_fnc_dataFromKey;
				private _b = ["backpack",_x select 1] call life_fnc_dataFromKey;
				if (_u isEqualTo false) then {_u = [];};
				if (_h isEqualTo false) then {_h = [];};
				if (_g isEqualTo false) then {_g = [];};
				if (_v isEqualTo false) then {_v = [];};
				if (_b isEqualTo false) then {_b = [];};
				{
					_items pushBackUnique(_x select 0);
					nil;
				} count (_rifles+_pistols+_ammunition+_accessoires+_misc+_u+_h+_g+_v+_b);
				nil;
			} count _weapons;

			{
				private _cfg = "";
				if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
				if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
				if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
				if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
				private _displayName=getText(configFile>>_cfg>>_x>>'displayName');
				private _picture=getText(configFile>>_cfg>>_x>>'picture');
				if (_displayName != "" && _picture != "") then {				
					private _i = _listArma lbAdd _displayName;
					_listArma lbSetPicture [_i,_picture];
					_listArma lbSetData [_i,_x];
				};
				nil;
			} count _items;

			{
				_x params[
					["_text", "", [""]]
				];

				private _i = _listSafes lbAdd _text;
				_listSafes lbSetValue [_i,_forEachIndex];
			} foreach (profileNamespace getVariable["DE100_Saved_Airdrop",[]]);
		};
		case'vehspawner':{
			['vehspawner']call life_fnc_toggle_menu;
			_list=(findDisplay 2900 displayCtrl 1116);
			lbClear _list;
			_raw='true'configClasses(missionConfigFile>>'lifeVehicles');
			_vehs=[];
			{_vehs pushBackUnique configName _x}forEach _raw;
			{
				_displayName=getText(configFile>>'CfgVehicles'>>_x>>'displayName');
				_picture=getText(configFile>>'CfgVehicles'>>_x>>'icon');
				if(_displayName!=''&&_picture!=''&&_x!='Land_Pod_Heli_Transport_04_box_black_F')then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,_x];
					_list lbSetPicture[_i,_picture];
				};
			}forEach _vehs;
		};
		case'vehspawnerlbChanged':{
			_list=(findDisplay 2900 displayCtrl 1116);
			_list2=(findDisplay 2900 displayCtrl 1119);
			_class=_list lbData lbCurSel _list;
			_colorArray = configProperties [
				(missionConfigFile >> "lifeVehicles" >> _class >> "TextureSources"), 
				'true', 
				true
			];	
			lbClear _list2;
			{
				_i=_list2 lbAdd(getText(missionConfigFile>>'lifeVehicles'>>_class>>'TextureSources'>>configName(_x)>>'displayName'));
				_list2 lbSetData[_i,configName(_x)];
			}forEach _colorArray;
			_list2 lbSetCurSel 0;
		};
		case'spawnvehicle':{
			[format["Klicke auf die Karte, um das Fahrzeug an der gewählten Position zu spawnen."],false,"fast"] call life_fnc_notification_system;
			onMapSingleClick{
				onMapSingleClick {};
				_list=(findDisplay 2900 displayCtrl 1116);
				_list2=(findDisplay 2900 displayCtrl 1119);
				_class=_list lbData lbCurSel _list;
				_skin=_list2 lbData lbCurSel _list2;

				if!(isClass(configFile>>'CfgVehicles'>>_class))exitWith{[format["Es wurde kein Fahrzeug ausgewählt."],true,"fast"] call life_fnc_notification_system};

				[player,passwordtemp,_class,_skin,_pos]remoteExec["TON_fnc_VehSpawnerSpawn",2];
			};
		};
		case'itemspawner':{
			['itemspawner']call life_fnc_toggle_menu;
			_list=(findDisplay 2900 displayCtrl 2226);
			lbClear _list;
			
			_items=[];

			_clothshopsraw='true'configClasses(missionConfigFile>>'Clothing');
			{
				_uniforms=getArray(missionConfigFile>>'Clothing'>>configName _x>>'uniforms');
				_headgear=getArray(missionConfigFile>>'Clothing'>>configName _x>>'headgear');
				_goggles=getArray(missionConfigFile>>'Clothing'>>configName _x>>'goggles');
				_vests=getArray(missionConfigFile>>'Clothing'>>configName _x>>'vests');
				_backpacks=getArray(missionConfigFile>>'Clothing'>>configName _x>>'backpacks');

				{
					_items pushBackUnique(_x select 0);
				}forEach(_uniforms+_headgear+_goggles+_vests+_backpacks);
			}forEach _clothshopsraw;

			_weaponshopsraw='true'configClasses(configFile>>'CfgWeapons');

			{
				_items pushBackUnique(configName _x);
			}forEach _weaponshopsraw;

			{
				private['_cfg'];
				if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
				if(isClass(configFile>>'CfgWeapons'>>_x))then{_cfg='CfgWeapons'};
				if(isClass(configFile>>'CfgGlasses'>>_x))then{_cfg='CfgGlasses'};
				if(isClass(configFile>>'CfgVehicles'>>_x))then{_cfg='CfgVehicles'};
				_displayName=getText(configFile>>_cfg>>_x>>'displayName');
				_picture=getText(configFile>>_cfg>>_x>>'picture');
				if(_displayName!=''&&_picture!='')then{
					_i=_list lbAdd _displayName;
					_list lbSetData[_i,_x];
					_list lbSetPicture[_i,_picture];
				};
			}forEach _items;

		};
		case'spawnitem':{
			[format["Klicke auf die Karte, um das Item an der gewählten Position zu spawnen."],false,"fast"] call life_fnc_notification_system;
			onMapSingleClick{
				onMapSingleClick {};
				_list=(findDisplay 2900 displayCtrl 2226);
				_class=_list lbData lbCurSel _list;
				_count=round(parseNumber ctrlText(findDisplay 2900 displayCtrl 2229));

				if(_class=='')exitWith{[format["Es muss ein Item ausgewählt werden."],true,"fast"] call life_fnc_notification_system};

				if(_count > 0)then{
					private['_cfg'];
					if(isClass(configFile>>'CfgMagazines'>>_x))then{_cfg='CfgMagazines'};
					if(isClass(configFile>>'CfgWeapons'>>_class))then{_cfg='CfgWeapons'};
					if(isClass(configFile>>'CfgGlasses'>>_class))then{_cfg='CfgGlasses'};
					if(isClass(configFile>>'CfgVehicles'>>_class))then{_cfg='CfgVehicles'};					
					_2=nearestObjects[_pos,['GroundWeaponHolder'],3];
					_3=(if(count _2<1)then{'GroundWeaponHolder'createVehicle(_pos)}else{_2 select 0});
					_3 addItemCargo[_class,_count];
					_4=(getArray(configFile>>'CfgWeapons'>>_class>>'Magazines')select 0);
					_3 addItemCargo[_4,5*_count];

					[format["Item wurde gespawnt (%1)",getText(configFile>>_cfg>>_class>>'displayName')],false,"fast"] call life_fnc_notification_system;

					if (life_HC_isActive) then {
						[format["%1(UID: %5) hat %4 Item(s) gespawnt (Typ: %2, Position: %3).",player call life_fnc_name,getText(configFile>>_cfg>>_class>>'displayName'),mapGridPosition _3,_count,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
					} else {
						[format["%1(UID: %5) hat %4 Item(s) gespawnt (Typ: %2, Position: %3).",player call life_fnc_name,getText(configFile>>_cfg>>_class>>'displayName'),mapGridPosition _3,_count,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
					};					
				}else{
					[format["Es muss minimal eine Anzahl von eins eingegeben werden."],true,"fast"] call life_fnc_notification_system;
				};
			};
		};
		case'clonemenu':{
			['clonemenu']call life_fnc_toggle_menu;

			_list=(findDisplay 2900 displayCtrl 5554);
			lbClear _list;
			{
				_x params[
					["_name", '', ['']],
					["_var", '', ['']],
					["_data", [], [[]]]
				];

				if(_name!=''&&_var!=''&&count(_data)>0)then{
					_i=_list lbAdd _name;
					_list lbSetData[_i,_var];
				};
			}forEach(profileNamespace getVariable["DE100_Saved_Gear",[]]);			
		};
		case'clonegear':{
			_list=(findDisplay 2900 displayCtrl 5554);
			_text=ctrlText(findDisplay 2900 displayCtrl 5556);

			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};
			if(_text=="")exitWith{["Bitte gib im Textfeld links einen Namen für das Gear an.",true,"fast"] call life_fnc_notification_system};

			_allgears=profileNamespace getVariable["DE100_Saved_Gear",[]];
			_gear=getUnitLoadout _unit;
			_allgears pushBack[_text,str(random 9999999),_gear];
			profileNamespace setVariable["DE100_Saved_Gear",_allgears];
			saveProfileNamespace;

			lbClear _list;
			{
				_x params[
					["_name", '', ['']],
					["_var", '', ['']],
					["_data", [], [[]]]
				];

				if(_name!=''&&_var!=''&&count(_data)>0)then{
					_i=_list lbAdd _name;
					_list lbSetData[_i,_var];
				};
			}forEach(profileNamespace getVariable["DE100_Saved_Gear",[]]);

			[format["Du hast das Gear von %1 geklont.",[_unit] call life_fnc_name],false,"fast"] call life_fnc_notification_system;

			if (life_HC_isActive) then {
				[format["%1(UID: %3) hat das Gear von %2 geklont.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %3) hat das Gear von %2 geklont.",player call life_fnc_name,[_unit] call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};
		case'equipgear':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};		
			_list=(findDisplay 2900 displayCtrl 5554);
			_index=lbCurSel _list;
			if(_index<0)exitWith{[format["Du musst einen Gear-Eintrag auswählen, um das Gear auszurüsten"],true,"fast"] call life_fnc_notification_system};
			_var=_list lbData _index;
			_allgears=profileNamespace getVariable["DE100_Saved_Gear",[]];
			_indexgears={if((_x param [1,'',['']])==_var)exitWith{_forEachIndex}}forEach _allgears;
			_gear=(_allgears select _indexgears) param [2,[],[[]]];
			
			_unit setUnitLoadout _gear;

			[format["Du hast einen Gear-Eintrag für %1 ausgerüstet: %2",[_unit] call life_fnc_name,_list lbText _index],false,"fast"] call life_fnc_notification_system;

			if (life_HC_isActive) then {
				[format["%1(UID: %4) hat einen Gear-Eintrag für %2 ausgerüstet: %3",player call life_fnc_name,[_unit] call life_fnc_name,_list lbText _index,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %4) hat einen Gear-Eintrag für %2 ausgerüstet: %3",player call life_fnc_name,[_unit] call life_fnc_name,_list lbText _index,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
		};
		case'deletegear':{
			_list=(findDisplay 2900 displayCtrl 5554);
			_index=lbCurSel _list;
			if(_index<0)exitWith{[format["Du musst einen Gear-Eintrag auswählen, um ihn zu löschen"],true,"fast"] call life_fnc_notification_system};
			_var=_list lbData _index;
			_allgears=profileNamespace getVariable["DE100_Saved_Gear",[]];
			_indexgears={if((_x param [1,'',['']])==_var)exitWith{_forEachIndex}}forEach _allgears;
			_allgears deleteAt _indexgears;
			profileNamespace setVariable["DE100_Saved_Gear",_allgears];
			saveProfileNamespace;
			[format["Du hast einen Gear-Eintrag gelöscht: %1",_list lbText _index],false,"fast"] call life_fnc_notification_system;

			lbClear _list;
			{
				_x params[
					["_name", '', ['']],
					["_var", '', ['']],
					["_data", [], [[]]]
				];

				if(_name!=''&&_var!=''&&count(_data)>0)then{
					_i=_list lbAdd _name;
					_list lbSetData[_i,_var];
				};
			}forEach(profileNamespace getVariable["DE100_Saved_Gear",[]]);

			if (life_HC_isActive) then {
				[format["%1(UID: %3) hat einen Gear-Eintrag gelöscht: %2",player call life_fnc_name,_list lbText _index,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %3) hat einen Gear-Eintrag gelöscht: %2",player call life_fnc_name,_list lbText _index,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};			
		};
		case'executelocal':{
			_code=ctrlText(findDisplay 2900 displayCtrl 3334);

			profileNamespace setVariable ['DE100_Debug_code',_code];
			if(_code=='')exitWith{};

			if (life_HC_isActive) then {
				[format["%1(UID: %3) hat folgenden Code lokal ausgeführt: %2.",player call life_fnc_name,_code,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %3) hat folgenden Code lokal ausgeführt: %2.",player call life_fnc_name,_code,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};

			[]spawn compile _code;
		};
		case'executeglobal':{
			_code=ctrlText(findDisplay 2900 displayCtrl 3334);
			profileNamespace setVariable ['DE100_Debug_code',_code];
			[_code]spawn{
				_code=param [0,'',['']];
				scriptName"Confirm-Execute";
				if!(["Soll der Code wirklich global ausgeführt werden?","Fortfahren?","Ausführen","Abbrechen"]call BIS_fnc_GUIMessage)exitWith{};
				[1,passwordtemp,_code]remoteExec["TON_fnc_execGlobal",2];
			};
		};
		case'executeonplayer':{
			_code=ctrlText(findDisplay 2900 displayCtrl 3334);
			profileNamespace setVariable ['DE100_Debug_code',_code];
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			[_code,_unit]spawn{
				params[
					["_code", '', ['']],
					["_unit", objNull, [objNull]]
				];
				scriptName"Confirm-Execute";
				if!([format["Soll der Code wirklich auf %1 ausgeführt werden?",[_unit] call life_fnc_name],"Fortfahren?","Ausführen","Abbrechen"]call BIS_fnc_GUIMessage)exitWith{};
				if(isNull _unit)exitWith{['Der ausgewählte Spieler ist nicht mehr online.',true,'fast'] call life_fnc_notification_system};
				[0,passwordtemp,_code,_unit]remoteExec["TON_fnc_execGlobal",2];
			};
		};
		case'executeonserver':{
			_code=ctrlText(findDisplay 2900 displayCtrl 3334);
			profileNamespace setVariable ['DE100_Debug_code',_code];
			[_code]spawn{
				_code=param [0,'',['']];
				scriptName"Confirm-Execute";
				if!(["Soll der Code wirklich auf dem Server ausgeführt werden?","Fortfahren?","Ausführen","Abbrechen"]call BIS_fnc_GUIMessage)exitWith{};
				[2,passwordtemp,_code]remoteExec["TON_fnc_execGlobal",2];
			};
		};
		case'doppelxp':{
			[]call life_fnc_doppelxp;
		};
		case'givemoneytoplayer':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			_unit spawn{
				scriptName"GiveMoney-Input";
				_unit=_this;
				_amount=round parseNumber([format["Bitte gib den Betrag ein, den du %1 geben möchtest.",[_unit] call life_fnc_name],format["Wieviel Geld vergeben?"]]call life_fnc_inputMessage);		
				if(_amount<1)exitWith{['Bitte gib einen Betrag über 0 € ein.',true,'fast'] call life_fnc_notification_system};
				if(isNull _unit)exitWith{['Der ausgewählte Spieler ist nicht mehr online.',true,'fast'] call life_fnc_notification_system};

				[0,passwordtemp,
					(
					'
						_admin=objectFromNetId"'+netID player+'";
						_amount='+str _amount+';
						de100_mSpace setVariable ["cT",diag_tickTime];						
						de100_luciandjuli_bc=de100_luciandjuli_bc+_amount;
						de100_mSpace setVariable ["cV",de100_luciandjuli_bc+de100_luciandjuli_mula];
						[format["Du hast %1 %2 € gegeben",player call life_fnc_name,_amount],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
						if (life_HC_isActive) then {
							[format["%2(UID: %5) hat %1(UID: %3) %4 € geben.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,_amount,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",HC_Life];
						} else {
							[format["%2(UID: %5) hat %1(UID: %3) %4 € geben.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,_amount,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",2];
						};											
					'
					)
				,_unit]remoteExec["TON_fnc_execGlobal",2];				
			};
		};
		case'givemoneytoplayerbar':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			_unit spawn{
				scriptName"GiveMoney-Input";
				_unit=_this;
				_amount=round parseNumber([format["Bitte gib den Betrag ein, den du %1 geben möchtest.",[_unit] call life_fnc_name],format["Wieviel Geld vergeben?"]]call life_fnc_inputMessage);		
				if(_amount<1)exitWith{['Bitte gib einen Betrag über 0 € ein.',true,'fast'] call life_fnc_notification_system};
				if(isNull _unit)exitWith{['Der ausgewählte Spieler ist nicht mehr online.',true,'fast'] call life_fnc_notification_system};

				[0,passwordtemp,
					(
					'
						_admin=objectFromNetId"'+netID player+'";
						_amount='+str _amount+';
						de100_mSpace setVariable ["cT",diag_tickTime];
						de100_luciandjuli_mula=de100_luciandjuli_mula+_amount;
						de100_mSpace setVariable ["cV",de100_luciandjuli_bc+de100_luciandjuli_mula];
						[format["Du hast %1 %2 € gegeben",player call life_fnc_name,_amount],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
						if (life_HC_isActive) then {
							[format["%2(UID: %5) hat %1(UID: %3) %4 € geben.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,_amount,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",HC_Life];
						} else {
							[format["%2(UID: %5) hat %1(UID: %3) %4 € geben.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,_amount,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",2];
						};											
					'
					)
				,_unit]remoteExec["TON_fnc_execGlobal",2];				
			};
		};	
		case'getplayermoney':{
			if(isNull _unit)exitWith{["Du musst einen Spieler auswählen.",true,"fast"] call life_fnc_notification_system};
			if(_unit isEqualTo hc_1)exitWith{["Der Headlessclient ist für diese Aktion nicht verfügbar.",true,"fast"] call life_fnc_notification_system};

			[format["Anfrage an %1 gesendet...",[_unit]call life_fnc_name],false,"fast"] call life_fnc_notification_system;

			[0,passwordtemp,
				(
				'
					_admin=objectFromNetId"'+netID player+'";

					_cash=de100_luciandjuli_mula;
					_atm=de100_luciandjuli_bc;

					[format["Kontoinformationen von %1<br/><br/>Bank: %2 €<br/>Bar: %3 €",player call life_fnc_name,[_atm]call life_fnc_numberText,[_cash]call life_fnc_numberText],true,"fast"]remoteExecCall["life_fnc_notification_system",_admin];
					if (life_HC_isActive) then {
						[format["%2(UID: %4) hat die Kontoinformationen von %1(UID: %3) angefordert.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",HC_Life];
					} else {
						[format["%2(UID: %4) hat die Kontoinformationen von %1(UID: %3) angefordert.",player call life_fnc_name,[_admin] call life_fnc_name,getPlayerUID player,getPlayerUID _admin],"AdminLog"] remoteExec ["A3Log",2];
					};											
				'
				)
			,_unit]remoteExec["TON_fnc_execGlobal",2];				
		};
		case'speedmodeon':{
			[format["Speed-Modus aktiviert"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den Speed-Modus aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den Speed-Modus aktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};		
			player setAnimSpeedCoef 10;
			life_redgull_effect = time;
			life_objdisabled=[];
			while{life_speedmode}do{
				sleep .1;
				{
					player disableCollisionWith _x;
					life_objdisabled pushBackUnique _x;
				}forEach nearestObjects[player,[],25];
			};
		};
		case'speedmodeoff':{
			[format["Speed-Modus deaktiviert"],false,"fast"] call life_fnc_notification_system;
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat den Speed-Modus deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat den Speed-Modus deaktiviert.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};		
			player setAnimSpeedCoef 1;
			life_redgull_effect = nil;
			{player enableCollisionWith _x}forEach life_objdisabled;
		};
		case'unrestrain':{
			if (!(player getVariable["restrained",false])) exitwith {
				[format["Du bist nicht gefesselt"],true,"fast"] call life_fnc_notification_system;
			};
			if (life_HC_isActive) then {
				[format["%1(UID: %2) hat sich entfesselt.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
			} else {
				[format["%1(UID: %2) hat sich entfesselt.",player call life_fnc_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
			};
			[format["Du hast dich entfesselt!"],false,"fast"] call life_fnc_notification_system;
			if (player getVariable ["SackDrauf",false]) then {
				[] call life_fnc_bag;
			};
			detach player;

			player setVariable["restrained",false,true];
			player setVariable["Escorting",false,true];
		};
	};
};

life_fnc_treePlayer_SelChange={
	params[
		["_list", controlNull, [controlNull]],
		["_selected", [], [[]]]
	];
	if (!isNull objectFromNetId (_list tvData _selected)) then {
		[((findDisplay 2900) displayCtrl 6),0.5,0.05,getPos (objectFromNetId (_list tvData _selected))] call life_fnc_setMapPosition;
	};
};