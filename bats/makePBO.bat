"C:\Users\***REPLACE***\Documents\Arma Dev\de100\vs_dev\L_makePBO\L_makePBO\bin\Release\L_makePBO.exe" "C:\Users\***REPLACE***\Documents\Arma Dev\de100\Altis_Life.Altis" "C:\Users\***REPLACE***\Documents\Arma Dev\de100\@life_server\addons\life_server\Functions\AntiHack\fn_deCryptFiles.sqf" "C:\Users\***REPLACE***\Documents\Arma Dev\de100\@life_server\addons\life_server\Functions\AntiHack\fn_deCryptFiles.sqf"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Users\***REPLACE***\Documents\Arma Dev\de100\Altis_Life.Altis_Obfu" "E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\mpmissions\Altis_Life.Altis.pbo"
copy "E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\mpmissions\Altis_Life.Altis.pbo" "C:\Users\***REPLACE***\AppData\Local\Arma 3\MPMissionsCache"
copy "E:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\mpmissions\Altis_Life.Altis.pbo" "C:\Users\***REPLACE***\Documents\Arma Dev\de100\output"
call makeServerFiles.bat
timeout 20
call restartserver.bat