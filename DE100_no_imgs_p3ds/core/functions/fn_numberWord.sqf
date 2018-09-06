/*
	File:	fn_numberWord.sqf
	Date:   2016-09-24 21:51:32
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Converts a Number into a Number Word
*/

params[
	["_number", 0, [0]],
	["_capitalLetter", true, [true]],
	"_word"
];

_word = if (_capitalLetter) then {
	switch (_number) do { 
		case 0 : {"Null";};
		case 1 : {"Ein";}; 
		case 2 : {"Zwei";};
		case 3 : {"Drei";};
		case 4 : {"Vier";};
		case 5 : {"Fünf";};
		case 6 : {"Sechs";};
		case 7 : {"Sieben";};
		case 8 : {"Acht";};
		case 9 : {"Neun";};
		case 10 : {"Zehn";};
		case 11 : {"Elf";};
		case 12 : {"Zwölf";}; 
		default {_number;}; 
	};
} else {
	switch (_number) do { 
		case 0 : {"null";};
		case 1 : {"ein";}; 
		case 2 : {"zwei";};
		case 3 : {"drei";};
		case 4 : {"vier";};
		case 5 : {"fünf";};
		case 6 : {"sechs";};
		case 7 : {"sieben";};
		case 8 : {"acht";};
		case 9 : {"neun";};
		case 10 : {"zehn";};
		case 11 : {"elf";};
		case 12 : {"zwölf";}; 
		default {_number;}; 
	};
};
_word