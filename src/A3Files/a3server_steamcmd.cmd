@echo off
@rem http://media.steampowered.com/installer/steamcmd.zip
SETLOCAL ENABLEDELAYEDEXPANSION

       :: DEFINE the following variables where applicable to your install

    SET STEAMLOGIN=duckfine	und?????
    SET A3serverBRANCH=233780 -beta
        :: For stable use 233780 -beta
        :: For Dev use 233780 -beta development
                :: Note, the missing qotation marks, these need to be wrapped around the entire "+app_data......"
                :: There is no DEV branch data yet for Arma 3 Dedicated Server package !!!

    SET A3serverPath=P:\a3servertest\A3Master
        SET STEAMPATH=P:\a3servertest\Steam

:: _________________________________________________________

echo.
echo     You are about to update ArmA 3 server
echo        Dir: %A3serverPath%
echo        Branch: %A3serverBRANCH%
echo.
echo     Key "ENTER" to proceed
pause
P:\a3server\Steam\steamcmd.exe +login %STEAMLOGIN% +force_install_dir %A3serverPath% +"app_update %A3serverBRANCH%" validate +quit
echo .
echo     Your ArmA 3 server is now up to date
echo     key "ENTER" to exit
pause