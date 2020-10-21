@echo off
:: Limit the download speed, example: 1M, 500K "empty means unlimited"
set speedLimit=

set "_work=%~dp0"
set "_work=%_work:~0,-1%"
set "_batn=%~nx0"
setlocal EnableDelayedExpansion
pushd "!_work!"
set exist=0
if exist "curl.exe" set exist=1
for %%i in (curl.exe) do @if not "%%~$PATH:i"=="" set exist=1
if %exist%==0 echo.&echo Error: curl.exe is not detected&echo.&popd&pause&exit /b
set "uri=temp_curl.txt"
if defined speedLimit set "speedLimit=--limit-rate %speedLimit%"
echo Downloading...
echo.
if exist "%uri%" del /f /q "%uri%"
call :GenTXT TXinfo > "%uri%"
curl.exe -q --create-dirs --retry 5 --retry-connrefused %speedLimit% -k -L -C - -K "%uri%"
if exist "%uri%" del /f /q "%uri%"
echo.
echo Download complete.
echo Press any key to continue installation.
popd
pause >nul
exit /b

:GenTXT
set [=&for /f "delims=:" %%s in ('findstr /nbrc:":%~1:\[" /c:":%~1:\]" "!_batn!"') do if defined [ (set /a ]=%%s-3) else set /a [=%%s-1
<"!_batn!" ((for /l %%i in (0 1 %[%) do set /p =)&for /l %%i in (%[% 1 %]%) do (set txt=&set /p txt=&echo(!txt!)) &exit/b

:TXinfo:[
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/v64_16.0.13231.20390.cab
-o C2R_Monthly\Office\Data\v64.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/v64_16.0.13231.20390.cab
-o C2R_Monthly\Office\Data\v64_16.0.13231.20390.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/i641033.cab
-o C2R_Monthly\Office\Data\16.0.13231.20390\i641033.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/s641033.cab
-o C2R_Monthly\Office\Data\16.0.13231.20390\s641033.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/i640.cab
-o C2R_Monthly\Office\Data\16.0.13231.20390\i640.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/s640.cab
-o C2R_Monthly\Office\Data\16.0.13231.20390\s640.cab
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/stream.x64.en-US.dat
-o C2R_Monthly\Office\Data\16.0.13231.20390\stream.x64.en-US.dat
url http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/Office/Data/16.0.13231.20390/stream.x64.x-none.dat
-o C2R_Monthly\Office\Data\16.0.13231.20390\stream.x64.x-none.dat
:TXinfo:]
exit /b
