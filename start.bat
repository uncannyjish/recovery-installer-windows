@echo off

:: Recovery Installer 0.3 by @uncannyjish

cls

title Recovery Installer 0.3
:entry
cls
echo.
echo ================================================
echo.
echo    Recovery Installer 0.3 by @ uncannyjish
echo.
echo ================================================
echo.
echo.
echo What do you want to do?
echo.
echo.
echo 1] Install Drivers
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
pause>nul
goto entry


:first

cls
echo.
echo Installing Drivers...
echo.
runas /user:Administrator pnputil /add-driver "%~dp0Driver\android_winusb.inf" /subdirs /install
echo.
echo Press Any Key to Continue...
pause>nul
goto entry


:second

cls
echo.
echo Have you downloaded the recovery image, renamed it and placed it in images folder according to the insructions?
echo.
set /p conf=(y/n):
if /i '%conf%' == 'n' (
	echo Please do that first. Press Enter after you're done.
	pause>nul
	goto second
)
if /i '%conf%' == 'y' (
	goto confirmed
)

echo.
echo.
echo Can't you read?  Try again.
pause>nul
goto second

:confirmed

cls
echo.
echo Select Your Device
echo.
echo.
echo 1] Redmi Note 4X [Mido]
echo.
echo 2] Redmi Note 8 [Ginkgo]
echo.
echo 3] Redmi 4X [Santoni]
echo.
echo 4] Redmi Note 8T [Willow]
echo.
echo 5] Redmi K20 Pro [Raphael]
echo.
echo 6] Return to Main Menu
echo.
echo.
set /p device=Enter your choice:  

if /i '%device%' == '1' (
	call "%~dp0Batch\install.bat" mido
	goto second
)
if /i '%device%' == '2' (
	call "%~dp0Batch\install.bat" ginkgo
	goto second
)
if /i '%device%' == '3' (
	call "%~dp0Batch\install.bat" santoni
	goto second
)
if /i '%device%' == '4' (
	call "%~dp0Batch\install.bat" willow
	goto second
)
if /i '%device%' == '5' (
	call "%~dp0Batch\install.bat" raphael
	goto second
)
if /i '%device%' == '6' goto entry

echo.
echo.
echo Can't you read?  Try again.
pause>nul
goto second

:third

cls
echo.
echo Select Your Device
echo.
echo.
echo 1] Ginkgo
echo.
echo 2] Return to Main Menu
echo.
echo.
set /p fix=Enter your choice:

if /i '%fix%' == '1' ( 
	call "%~dp0Batch\fix.bat" ginkgo
	goto third
)
if /i '%fix%' == '2' goto entry

echo.
echo.
echo Can't you read? Try again.
pause>nul
goto third

pause
