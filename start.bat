@echo off

:: Uncanny Recovery Installer 0.6 by @uncannyjish

cls

title Uncanny Recovery Installer 0.6
:entry
cls
echo.
echo ================================================
echo.
echo    Uncanny Recovery Installer 0.6 by @uncannyjish
echo.
echo ================================================
echo.
echo.
echo What do you want to do?
echo.
echo.
echo 1] Install ADB and Drivers
echo.
echo 2] Install Recovery
echo.
echo 3] Fix System Destroyed
echo.
echo 4] Exit
echo.
echo.

set /p choice=Enter your choice:

if /i '%choice%' == '1' goto first
if /i '%choice%' == '2' goto second
if /i '%choice%' == '3' goto third
if /i '%choice%' == '4' goto end

echo.
echo.
echo Can't you read?  Try again.
pause >nul
goto entry


:first

cls
echo.
echo Installing Drivers...
echo.
pnputil /add-driver "%~dp0Driver\android_winusb.inf" /subdirs /install
echo.
echo Installing ADB System-Wide...
md "C:\Android\adb-fastboot"
copy "%~dp0adb-fastboot" "C:\Android\adb-fastboot"
setx ANDROID_HOME "C:\Android\adb-fastboot" /M
echo.
echo Closing Command Window...
timeout /t 5 /nobreak
exit


:second

cls
echo.
echo Have you downloaded the recovery image, renamed it and placed it in images folder according to the insructions?
echo.
set /p conf=(y/n):
if /i '%conf%' == 'n' (
	echo Please do that first. Press Enter after you're done.
	pause >nul
	goto second
)
if /i '%conf%' == 'y' (
	goto confirmed
)

echo.
echo.
echo Can't you read?  Try again.
pause >nul
goto second

:confirmed

cls
echo.
echo Select Your Device
echo.
echo.
echo 1] Redmi 4X [Santoni]
echo.
echo 2] Redmi Note 4X [Mido]
echo.
echo 3] Redmi Note 5/Redmi 5 Plus [Vince]
echo.
echo 4] Redmi Note 5 Pro [Whyred]
echo.
echo 5] Redmi Note 6 Pro [Tulip]
echo.
echo 6] Redmi Note 7/7S [Lavender]
echo.
echo 7] Redmi Note 7 Pro [Violet]
echo.
echo 8] Redmi Note 8 [Ginkgo]
echo.
echo 9] Redmi Note 8T [Willow]
echo.
echo 10] Redmi K20 [Davinci]
echo.
echo 11] Redmi K20 Pro [Raphael]
echo.
echo 12] Pocophone F1 [Beryllium]
echo.
echo 13] Return to Main Menu
echo.
echo.
set /p device=Enter your choice:  

if /i '%device%' == '1' (
	call "%~dp0Batch\install.bat" santoni
	goto second
)
if /i '%device%' == '2' (
	call "%~dp0Batch\install.bat" mido
	goto second
)
if /i '%device%' == '3' (
	call "%~dp0Batch\install.bat" vince
	goto second
)
if /i '%device%' == '4' (
	call "%~dp0Batch\install.bat" whyred
	goto second
)
if /i '%device%' == '5' (
	call "%~dp0Batch\install.bat" tulip
	goto second
)
if /i '%device%' == '6' (
	call "%~dp0Batch\install.bat" lavender
	goto second
)
if /i '%device%' == '7' (
	call "%~dp0Batch\install.bat" violet
	goto second
)
if /i '%device%' == '8' (
	call "%~dp0Batch\install.bat" ginkgo
	goto second
)
if /i '%device%' == '9' (
	call "%~dp0Batch\install.bat" willow
	goto second
)
if /i '%device%' == '10' (
	call "%~dp0Batch\install.bat" davinci
	goto second
)
if /i '%device%' == '11' (
	call "%~dp0Batch\install.bat" raphael
	goto second
)
if /i '%device%' == '12' (
	call "%~dp0Batch\install.bat" beryllium
	goto second
)
if /i '%device%' == '13' goto entry

echo.
echo.
echo Can't you read?  Try again.
pause >nul
goto second

:third

cls
echo.
echo Select Your Device
echo.
echo.
echo 1] Ginkgo
echo.
echo 2] Violet
echo.
echo 3] Return to Main Menu
echo.
echo.
set /p fix=Enter your choice:

if /i '%fix%' == '1' ( 
	call "%~dp0Batch\fix.bat" ginkgo
	goto third
)
if /i '%fix%' == '2' ( 
	call "%~dp0Batch\fix.bat" violet
	goto third
)
if /i '%fix%' == '3' goto entry
echo.
echo.
echo Can't you read? Try again.
pause >nul
goto third

pause
