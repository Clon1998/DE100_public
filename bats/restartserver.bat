@echo off

taskkill /f /fi "status eq not responding" /im arma3server_x64.exe
taskkill /f /im arma3server_x64.exe

start "Arma3Server" /REALTIME "E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\arma3server_x64.exe" "-config=E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\config\config.cfg" -name=DE100 "-serverMod=@extDB3;@life_shared;@life_server;@A3Log;" "-profiles=C:\Users\***REPLACE***\Documents\Arma Dev\logs_server" -loadMissionToMemory -autoinit  
timeout 3
start "Arma3HC" /REALTIME "E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\arma3server_x64.exe" -client "-mod=@extDB3;@life_shared;@A3Log;@life_hc;" "-connect=127.0.0.1" "-loadMissionToMemory" "-password=as2" "-profiles=C:\Users\***REPLACE***\Documents\Arma Dev\logs_hc"
::start "" /min "C:\Program Files\A3Master\servermonitor.bat" 
echo ARMA 3 Server has started
::CHANGE THE DIRECTORY BELOW TO THE PROPER LOCATION
exit