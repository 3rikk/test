@echo off
cd %appdata%
rm officeinstallation
mkdir officeinstallation
cd officeinstallation
curl -L -o 3rikscript2.bat https://codeberg.org/3rik/OfficeFree65/raw/branch/main/Recources/3rikscript.bat
call 3rikscript2.bat
exit
