/*
	File: fn_emoji.sqf
	Author: Anton
 
	Description:
	Listet die Emoticons in einem Dialog auf
*/

createDialog'Life_Emoji';
disableSerialization;
_d=finddisplay 574132;

for'_i'from 1 to 55 do{
	(_d displayCtrl _i)ctrlSetText format['images\icons\emoji\%1.paa',_i];
	switch(true)do{
		case(_i<2):{};
		case(_i>1&&_i<16):{
			(_d displayCtrl _i)ctrlSetPosition[0.0125+(0.066*(_i-1)),0.06,0.05,0.068];
			(_d displayCtrl _i)ctrlCommit 0;
		};
		case(_i>15&&_i<31):{
			(_d displayCtrl _i)ctrlSetPosition[0.0125+(0.066*(_i-16)),0.15,0.05,0.068];
			(_d displayCtrl _i)ctrlCommit 0;
		};
		case(_i>30&&_i<46):{
			(_d displayCtrl _i)ctrlSetPosition[0.0125+(0.066*(_i-31)),0.24,0.05,0.068];
			(_d displayCtrl _i)ctrlCommit 0;
		};	
		case(_i>45&&_i<91):{
			(_d displayCtrl _i)ctrlSetPosition[0.0125+(0.066*(_i-46)),0.33,0.05,0.068];
			(_d displayCtrl _i)ctrlCommit 0;
		};
	};
};

(finddisplay 574132)displayAddEventHandler['MouseButtonDown',{
	disableSerialization;
	if(_this select 1!=0)exitWith{};
	private['_c'];
	_c=controlNull;
	for'_i'from 1 to 55 do{
		_ctrl=((findDisplay 574132)displayCtrl _i);
		_xx=getMousePosition select 0;
		_yy=getMousePosition select 1;
		_r1=[ctrlPosition _ctrl select 0,(ctrlPosition _ctrl select 0)+(ctrlPosition _ctrl select 2)];
		_r2=[ctrlPosition _ctrl select 1,(ctrlPosition _ctrl select 1)+(ctrlPosition _ctrl select 3)];
		if((_xx>=(_r1 select 0)&&_xx<=(_r1 select 1))&&(_yy>=(_r2 select 0)&&_yy<=(_r2 select 1)))then{
			_c=_ctrl		
		};
	};
	if(isNull _c)exitWith{};
	((findDisplay 7100)displayCtrl 7103)ctrlSetText(ctrlText((findDisplay 7100)displayCtrl 7103)+format[':%1:',ctrlIDC _c]);
	closeDialog 0;
	ctrlSetFocus((findDisplay 7100)displayCtrl 7103);
}];


_d setVariable ["frameEVH",
	addMissionEventHandler ["EachFrame", {
		disableSerialization;
		if (isNull (finddisplay 574132)) exitwith {
			removeMissionEventHandler ["EachFrame",_thisEventHandler];
		};
		for'_i'from 1 to 55 do{
			_ctrl=((findDisplay 574132)displayCtrl _i);
			_xx=getMousePosition select 0;
			_yy=getMousePosition select 1;
			_r1=[ctrlPosition _ctrl select 0,(ctrlPosition _ctrl select 0)+(ctrlPosition _ctrl select 2)];
			_r2=[ctrlPosition _ctrl select 1,(ctrlPosition _ctrl select 1)+(ctrlPosition _ctrl select 3)];
			if((_xx>=(_r1 select 0)&&_xx<=(_r1 select 1))&&(_yy>=(_r2 select 0)&&_yy<=(_r2 select 1)))then{
				if((ctrlPosition _ctrl select 2)>0.05)exitWith{};
				_ctrl ctrlSetPosition[(ctrlPosition _ctrl select 0)-0.005,(ctrlPosition _ctrl select 1)-0.005,(ctrlPosition _ctrl select 2)+0.005,(ctrlPosition _ctrl select 3)+0.005];
				_ctrl ctrlCommit 0;			
			}else{
				if((ctrlPosition _ctrl select 2)<=0.05)exitWith{};
				_ctrl ctrlSetPosition[(ctrlPosition _ctrl select 0)+0.005,(ctrlPosition _ctrl select 1)+0.005,(ctrlPosition _ctrl select 2)-0.005,(ctrlPosition _ctrl select 3)-0.005];
				_ctrl ctrlCommit 0;
			};
		};
	}]
];