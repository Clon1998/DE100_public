private["_display","_jobList","_jobs","_job"];

if(!dialog) then
{
	if(!(createDialog "life_jobcenter")) exitWith {};
};
disableSerialization;

_display = findDisplay 4800;
if(isNull _display) exitWith {};
_jobList = _display displayCtrl 4802;
lbClear _jobList;
_jobs = ["Tanklastfahrer"];

for "_i" from 0 to (count _jobs)-1 do
{
	_job = _jobs select _i;
	

		_jobList lbAdd format["%1",_job];
	//	_cars lbSetPicture [(lbSize _cars)-1,_pic];
	//	_cars lbSetData [(lbSize _cars)-1,str(_i)];
	//	_cars lbSetValue [(lbSize _cars)-1,1];
	
};