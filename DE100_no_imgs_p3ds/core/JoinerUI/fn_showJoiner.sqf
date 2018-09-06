_handle = CreateDialog "GJoiner";
["Klicke den Namen des Squads an, dem du beitreten möchtest",true,"fast"] call life_fnc_notification_system;
sleep 1;

While {dialog} do {

[] spawn Group_LB_Refresh;
sleep 0.1;
};