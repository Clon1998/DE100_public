/*
	File:	fn_bBoxDistance.sqf
	Date:   2017-06-01 23:41:07
	Author: Patrick "Lucian" Schmidt
	Disclaimer: No one is allowed to use and edit my Script except for the DE100-ALTIS.life server and me.
	
	Description:
	Returns the shortest distance from the EyePos to the boundingBoxReal Sides,Top and Bottom level-Vector are excluded;
*/

params[
	["_obj", objNull, [objNull]],
	["_user", objNull, [objNull]]
];
if (isNull _obj) exitWith {
	0;
};
private _eyePos = _obj worldToModel(ASLToAGL eyePos _user);
private _boundingBox = _obj modelToWorld (boundingBox _obj select 0);
private _boundingBoxR = boundingBoxReal _obj;

//check if the player isnt in the bBox so that we have no infinit level-vectors
if ((_user distance2D _obj) > (_obj distance2d _boundingBox)) exitwith {_obj distance2D _user};

private _bBox_FRD = _boundingBoxR select 0;
private _bBox_BLU = _boundingBoxR select 1;

private _bBox_FRU = (_bBox_FRD select [0,2]) + [_bBox_BLU select 2];
private _bBox_BRU = [_bBox_BLU select 0] + (_bBox_FRU select [1,2]);

private _bBox_BLD = (_bBox_BLU select [0,2]) + [_bBox_FRD select 2];
private _bBox_FLD = [_bBox_FRD select 0] + (_bBox_BLD select [1,2]);

private _nVA = (_bBox_FRU vectorDiff _bBox_FRD) vectorCrossProduct (_bBox_BRU vectorDiff _bBox_FRD);
private _rA = _nVA vectorDotProduct _bBox_FRD;
private _dA = abs(((_nVA vectorDotProduct _eyePos)-_rA)/(vectorMagnitude _nVA));

private _nVB = (_bBox_BLD vectorDiff _bBox_BLU) vectorCrossProduct (_bBox_FLD vectorDiff _bBox_BLU);
private _rB = _nVB vectorDotProduct _bBox_BLU;
private _dB = abs(((_nVB vectorDotProduct _eyePos)-_rB)/(vectorMagnitude _nVB));

private _nVC = (_bBox_BLD vectorDiff _bBox_BLU) vectorCrossProduct (_bBox_BRU vectorDiff _bBox_BLU);
private _rC = _nVC vectorDotProduct _bBox_BLU;
private _dC = abs(((_nVC vectorDotProduct _eyePos)-_rC)/(vectorMagnitude _nVC));

private _nVD = (_bBox_FRU vectorDiff _bBox_FRD) vectorCrossProduct (_bBox_FLD vectorDiff _bBox_FRD);
private _rD = _nVD vectorDotProduct _bBox_FRD;
private _dD = abs(((_nVD vectorDotProduct _eyePos)-_rD)/(vectorMagnitude _nVD));

_dA min _dB min _dC min _dD min (_user distance2d _obj);
