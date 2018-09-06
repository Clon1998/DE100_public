/*
	Author: Bryan "Tonic" Boardwine
					modified by XFireFighter
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
private ["_laptop","_mode"];
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

call {
	if (_mode isEqualTo "plaza") exitWith {
		life_fed_scam camSetPos [12100.12,10517.892,6.535];
		life_fed_scam camSetTarget [12090.561,10442.788,-0.25];
		life_fed_scam camCommit 0;
		// erfasst den Breiech um den Vorplatz (Steinmauer und schrankenbereich)
	};

	if (_mode isEqualTo "entrance_front") exitWith {
		life_fed_scam camSetPos [12161.063,10509.715,18.684];
		life_fed_scam camSetTarget [12117.919,10518.251,-0.004];
		life_fed_scam camCommit 0;
		// erfasst von einem hohen weißen Haus den Fahrzeugzugang vor dem Sanitätshaus
	};

	if (_mode isEqualTo "entrance_back") exitWith {
		life_fed_scam camSetPos [12118.852,10559.392,18.461] ;
		life_fed_scam camSetTarget [12156.412,10574.172,0];
		life_fed_scam camCommit 0;
		// erfasst von einem weißen hohen Haus die hintere Barracke, sowie die Docks und den Seiteneingang
	};

	if (_mode isEqualTo "dome") exitWith {
		life_fed_scam camSetPos [12149.623,10551.707,11.251];
		life_fed_scam camSetTarget [12147.967,10541.95,0.013];
		life_fed_scam camCommit 0;
		//innerhalb der Kuppel platziert, visiert den Container an
	};

	if (_mode isEqualTo "dock") exitWith {
		life_fed_scam camSetPos [12229.748,10687.846,14.895];
		life_fed_scam camSetTarget [12143.22,10591.598,0.006];
		life_fed_scam camCommit 0;
		//an einem Container befestigt, schaut auf den hinteren Personeneingang, sowie die Docks
	};

	if (_mode isEqualTo "top_floor") exitWith {
		life_fed_scam camSetPos [12113.517,10561.006,15.393];
		life_fed_scam camSetTarget [12157.964,10500.063,12.155];
		life_fed_scam camCommit 0;
		//auf einer Terasse montiert, schaut auf ein anderen Gebäude
	};

	if (_mode isEqualTo "off") exitWith {
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,""];
		life_fed_scam = nil;
	};
};
