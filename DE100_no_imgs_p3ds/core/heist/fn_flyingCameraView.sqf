/* Author McKenzie

Description:
generates a camera which flies in and takes 2 Focus Point (_this select 0 & _this select 1) after
these 2 Spots where flew over the camera despawns with a swift "flyaway".
Currently used in:
	-fn_heistPrep

Can be called with:
[ObjA,ObjB,7,4] spawn life_fnc_camera;
*/


params [
    ["_CamFirstEnd",ObjNull,[ObjNull]],
    ["_CamEnd",ObjNull,[ObjNull]],
    ["_Duration",7,[0]],
    ["_DurationSpawn",4,[0]],
    ["_cam",objNull,[ObjNull]]
];

titlecut ["","black in",5];
_cam = "camera" camCreate [(getPos _CamFirstEnd select 0)-500,(getPos _CamFirstEnd select 1)-500,100];
_cam camSetTarget [getpos _CamFirstEnd select 0,getpos _CamFirstEnd select 1,getpos _CamFirstEnd select 2];
_cam cameraEffect ["internal", "BACK"];
_cam camCommit 2;


_cam camSetPos [getPos _CamFirstEnd select 0,getPos _CamFirstEnd select 1,(getPos _CamFirstEnd select 2)+75];
_cam camCommit _DurationSpawn;


waituntil {(camCommitted _cam)};
_cam camsetPos [getPos _CamFirstEnd select 0,getPos _CamFirstEnd select 1,(getPos _CamFirstEnd select 2)+75];
_cam camSetTarget [getPos _CamEnd select 0,getPos _CamEnd select 1,getPos _CamEnd select 2];
_cam camCommit 3;

waituntil {(camCommitted _cam)};
_cam camSetPos [getpos _CamEnd select 0,getpos _CamEnd select 1,(getPos _CamEnd select 2)+75];
_cam camSetTarget [getPos _CamEnd select 0,getPos _CamEnd select 1,getPos _CamEnd select 2];
_cam camCommit _Duration-_DurationSpawn;

waituntil {(camCommitted _cam)};
_cam camSetPos [(getPos _CamFirstEnd select 0)+200,(getPos _CamFirstEnd select 1)+250,100];
_cam camSetTarget [getPos _CamEnd select 0,getPos _CamEnd select 1,getPos _CamEnd select 2];
_cam camCommit _DurationSpawn;

waituntil {(camCommitted _cam)};
_cam cameraEffect ["terminate","back"];
camDestroy _cam;
titlecut ["","black in",3];
