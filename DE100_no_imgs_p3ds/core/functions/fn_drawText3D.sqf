/*
	File: fn_drawText3D.sqf
	Author: Anton
	
	Description:
	Dialogbasierende Methode der 3D-Text-Zeichnung (Auch bei Nacht sichtbar)
*/

private['_screenPos1','_screenPos2'];

_ids=_this select 0;
_inf=_this select 1;

for'_i'from 1 to 500 do{((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _i)ctrlShow(_i in _ids)};

if(isNull(uiNamespace getVariable['Life_DrawText3D',displayNull]))then{45 cutRsc["Life_DrawText3D","PLAIN"]};

{
	if(true)then{
		_id=_x;

		_array=_inf select _forEachIndex;

		_pos1=_array select 0;
		_pos2=_array select 1;
		_text=_array select 2;
		_screen=[_array,3,false,[false]]call BIS_fnc_param;
		_colorback=_array select 4;

		if(_screen)then{
			_screenPos1=_pos1;
			_screenPos2=_pos2;
		}else{
			_screenPos1=worldToScreen _pos1;
			_screenPos2=_pos2;
		};

		if(count _screenPos1<1)exitWith{((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)ctrlShow false};

		((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)ctrlSetStructuredText parseText _text;
		((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)ctrlSetBackgroundColor _colorback;

		((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)ctrlSetPosition
		[
			_screenPos1 select 0,
			_screenPos1 select 1,
			_screenPos2,
			ctrlTextHeight((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)
		];
		((uiNamespace getVariable['Life_DrawText3D',displayNull])displayCtrl _id)ctrlCommit 0;
	};
}forEach _ids;