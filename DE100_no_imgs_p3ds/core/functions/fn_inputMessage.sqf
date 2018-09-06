/*
	File: fn_inputMessage.sqf
	Author: Anton
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/

_msg=param[0,'',['']];
_msg2=param[1,'',['']];
_button1=param[2,'Bestätigen',['',false]];
_button2=param[3,'Abbrechen',['',false]];

createDialog'Life_InputMessage';
disableSerialization;
_display=findDisplay 565444;
_Background=_display displayCtrl 1;
_Title=_display displayCtrl 2;
_Middlepart=_display displayCtrl 3;
_Text=_display displayCtrl 4;
_ButtonConfirm=_display displayCtrl 5;
_ButtonCancel=_display displayCtrl 6;
_Input=_display displayCtrl 7;

_Title ctrlSetStructuredText parseText _msg2;
_Text ctrlSetStructuredText parseText _msg;

_tHeight=ctrlTextHeight _Text;

_PosText=ctrlPosition _Text;
_PosText set[3,_tHeight];
_Text ctrlSetPosition _PosText;
_Text ctrlCommit 0;

_PosBackground=ctrlPosition _Background;
_PosBackground set[3,(_PosBackground select 3)+_tHeight];
_Background ctrlSetPosition _PosBackground;
_Background ctrlCommit 0;

_Pos_Input=ctrlPosition _Input;
_Pos_Input set[1,(_Pos_Input select 1)+_tHeight];
_Input ctrlSetPosition _Pos_Input;
_Input ctrlCommit 0;

_PosMiddlepart=ctrlPosition _Middlepart;
_PosMiddlepart set[1,(_PosMiddlepart select 1)+_tHeight];
_Middlepart ctrlSetPosition _PosMiddlepart;
_Middlepart ctrlCommit 0;

_PosButton1=ctrlPosition _ButtonConfirm;
_PosButton1 set[1,(_PosButton1 select 1)+_tHeight];
_ButtonConfirm ctrlSetPosition _PosButton1;
_ButtonConfirm ctrlCommit 0;

_PosButton2=ctrlPosition _ButtonCancel;
_PosButton2 set[1,(_PosButton2 select 1)+_tHeight];
_ButtonCancel ctrlSetPosition _PosButton2;
_ButtonCancel ctrlCommit 0;

if(typeName _button1=="BOOL")then{
	_ButtonConfirm ctrlEnable false
}else{
	_ButtonConfirm ctrlSetText _button1;
};
if(typeName _button2=="BOOL")then{
	_ButtonCancel ctrlEnable false
}else{
	_ButtonCancel ctrlSetText _button2;
};

waitUntil{isNull(findDisplay 565444)};
(findDisplay 46)getVariable["Confirm",""];