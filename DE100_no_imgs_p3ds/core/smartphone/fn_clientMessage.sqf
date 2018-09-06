/*
	File:	fn_clientMessage.sqf
	Date:   11.06.2016
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one has the permission to use and edit my scripts without my permission.
	
	Description:
	0 = private message
	1 = police message
	2 = message to admin
	3 = cop an alle
	4 = admin message to all
	5 = thr
*/

private["_msg","_from", "_type"];
params[
	["_msg", "", [""]],
	["_from", "", [""]],
	["_type", 0, [0]],
	["_pos", false]
];

if(_from == "") exitWith {};

if (!(player diarySubjectExists "sos") && _type != 0) then {
	player createDiarySubject ["sos","Nachrichten"];
};
switch (_type) do
{
	case 0 :
	{
		private["_message"];
		if(!("ItemRadio" in (assignedItems  player))) exitWith {hint "Du hast eine Nachricht, um sie lesen zu können benötigst du ein Smartphone!"};
		_message = format[">>> Nachricht von %1",_from];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
		private _uid = _this select 3;
		private _flag = call {if (playerSide isEqualTo civilian) exitWith {"civ";};if (playerSide isEqualTo west) exitWith {"cop";};if (playerSide isEqualTo independent) exitWith {"thr";};};
		private _msgArray = profileNamespace getVariable[format["DE100_%1_%2",_flag,_uid],[]];

		private _timeData = [2] call life_fnc_timeToStr;
		_msgArray = [["recive",format["%1",_msg],format["%1 %2",_timeData select 0,_timeData select 1]]] + _msgArray;
		if (count _msgArray > 15) then {
			_msgArray resize 15;
		};
		profileNamespace setVariable [format["DE100_%1_%2",_flag,_uid],_msgArray];
		["TextMessage",[format["Du hast eine neue Nachricht von %1 bekommen",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		if (!isNull (findDisplay 7100) && !isNull life_smartphoneTarget) then {
			if ((getPlayerUID life_smartphoneTarget) isEqualTo _uid) then {
				['write'] spawn life_fnc_smartphoneMsgView;
			};
		};
	};
	
	case 1 :
	{
		if(side player != west) exitWith {};
		private["_message"];
		if (_pos isEqualType []) then {
			_pos = format["<t color='#33CC33'>Position:</t> %1<br/>",mapGridPosition _pos];
		} else {
			_pos = "";
		};
		_message = format[">>> Notruf von %1: %2",_from,_msg];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos];
		["PoliceDispatch",[format["Ein neuer THR-Bericht: %1",_from]]] call bis_fnc_showNotification;
		player createDiaryRecord ["sos",["Verlauf Notrufe",format ["<t color='#316dff'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos]]];
		systemChat _message;
	};
	
	case 2 :
	{
		if((call life_adminlevel) < 1) exitWith {};
		private["_message"];
		if (_pos isEqualType []) then {
			_pos = format["Position: %1",mapGridPosition _pos];
		} else {
			_pos = "";
		};
		_message = format[">>> Admin Anfrage von %1: %2",_from,_msg];
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos];
		player createDiaryRecord ["sos",["Verlauf Anfragen",format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos]]];
		["AdminDispatch",[format["%1 hat einen Admin angefragt!",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};
	
	case 3 :
	{
		private["_message","_cop"];
		_message = format[">>> Polizei Mitteilung: %1",_msg];
		_cop = format["Pressesprecher: %1", _from];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Polizei Mitteilung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Bewohner<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg,_from];
		player createDiaryRecord ["sos",["Verlauf THR Mitteilung",format ["<t color='#316dff'><t size='2'><t align='center'>THR Mitteilung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Bewohner<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg,_from]]];
		["AdminMessage",["Du hast eine THR Mitteilung erhalten!"]] call bis_fnc_showNotification;
		systemChat _message;
		systemChat _cop;
	};
	
	case 4 :
	{
		private["_message","_admin"];
		_message = format[">>> ADMIN NACHRICHT: %1",_msg];
		_admin = format["Nachricht von Admin: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Den Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];
		player createDiaryRecord ["sos",["Verlauf Admin Nachrichten",format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Den Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg]]];
		["AdminMessage",["Du hast eine Nachricht von einem Admin erhalten!"]] call bis_fnc_showNotification;
		systemChat _message;
		if((call life_adminlevel) > 0) then {systemChat _admin;};
	};
	
	case 5: {
		private["_message"];
		_message = format[">>> Notruf von %1: %2",_from,_msg];
		if (_pos isEqualType []) then {
			_pos = format["Position: %1",mapGridPosition _pos];
		} else {
			_pos = "";
		};
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle THR-Mitglieder<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos];
		player createDiaryRecord ["sos",["Verlauf Notrufe",format ["<t color='#FFCC00'><t size='2'><t align='center'>Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle THR-Mitglieder<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/>%3<br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg,_pos]]];
		["TextMessage",[format["THR Anfage von %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 6:
	{
		private["_message","_cop"];
		_message = format[">>> THR Mitteilung: %1",_msg];
		_cop = format["Pressesprecher: %1", _from];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>THR Mitteilung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Bewohner<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg,_from];
		player createDiaryRecord ["sos",["Verlauf THR Mitteilung",format ["<t color='#316dff'><t size='2'><t align='center'>THR Mitteilung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Bewohner<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg,_from]]];
		["AdminMessage",["Du hast eine THR Mitteilung erhalten!"]] call bis_fnc_showNotification;
		systemChat _message;
		systemChat _cop;
	};
};