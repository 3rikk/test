@echo off
#DO NOT USE THIS SCRIPT ALONE
goto online
:online
# ##Export to online version from here onwards##
# ##(Thats for myself, dont worry if you have no idea what I mean)##
cls
:check_Permissions
        echo Administrative permissions required. 
	echo Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
	echo Error:
        echo Current permissions inadequate.
	echo Please close this window and right click and run the script as administrator.
	pause
	exit
    )

echo ===========================================================================================
echo Version 1.2 OFFLINE
echo Codeburg Edition
echo Channel: Monthly
echo Created by 3rik
echo made with scripts by abbodi1406 (https://github.com/abbodi1406) and KMS Activator
echo Always make sure you get this from the official source.
echo Fake versions could have malicious code implanted into them.
echo The original script is available at https://github.com/3rikk/officefree65/ 
echo and https://codeberg.org/3rik/OfficeFree65/
echo ===========================================================================================

:start
ECHO.
set choice=
set /p choice=Type 1 and hit enter to start installation, or press 2 to cancel it.  
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto officepreinstalled
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:officepreinstalled
ECHO.
set officepreinstalled=
set /p officepreinstalled=Press 1 and hit enter if you already have another version of Office installed. Press 2 if you do not.  
if not '%officepreinstalled%'=='' set officepreinstalled=%officepreinstalled:~0,1%
if '%officepreinstalled%'=='1' goto deleteoldoffice
if '%officepreinstalled%'=='2' goto continue
ECHO "%officepreinstalled%" is not valid, try again
ECHO.
goto start

:cancel
exit

:deleteoldoffice
curl -L -o officepurger.bat "https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/officepurger.bat"
call officepurger.bat
goto :continue

:continue
echo Installing Microsoft Office 365
mkdir officeinstallation
cd officeinstallation
curl -L -o curlofficemonthly.bat https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/curlofficemonthly.bat
call curlofficemonthly.bat
echo Starting Installation
cd C2R_Monthly
curl -L -o C2R_Config_20201021-1618.ini "https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/C2R_Config.ini"
curl -L -o YAOCTRI_Installer.cmd "https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/YAOCTRI_Installer.cmd"
call YAOCTRI_Installer.cmd
echo Activating Office
echo It is reccomended to disable your antivirus. KMS activation often triggers them.
echo For Windows Security/Windows Defender, open the app, go to 
echo "virus and threat protection", "virus and threat protection settings" 
echo and turn it off, or add an exclusion for the "officeinstallation" folder 
echo created by this script.
pause
goto antiviruscheck

:antiviruscheck
set antiviruscheck=
set /p antiviruscheck=Press 1 and hit enter if you want to try without disabling it, Press 2 if you have disabled it.    
if not '%antiviruscheck%'=='' set antiviruscheck=%antiviruscheck:~0,1%
if '%antiviruscheck%'=='1' goto attemptwithoutdisable
if '%antiviruscheck%'=='2' goto normalcontinue
ECHO "%antiviruscheck%" is not valid, try again
ECHO.
goto antiviruscheck

:attemptwithoutdisable
echo This has not been implemented yet. 
echo Continuing the normal process. 
echo If it fails, disable your antivirus, delete the "officeinstallation" folder and try again.
pause
goto normalcontinue

:normalcontinue
cd ..
curl -L -o KMS_VL_ALL_AIO.cmd "https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/KMS_VL_ALL_AIO.cmd"
echo Please wait while office is activated...
call KMS_VL_ALL_AIO.cmd
color a
echo Cleaning up...
cd ..
rm officeinstallation
echo Office has been installed and activated.
pause
exit
