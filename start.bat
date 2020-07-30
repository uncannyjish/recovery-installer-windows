@echo off

:: TWRP Installer 0.2 by @uncannyjish

cls

title TWRP Installer 0.2
:entry
echo.
echo "================================================"
echo.
echo "   TWRP Installer 0.2 by @ uncannyjish"
echo.
echo "================================================"

echo.
echo.
echo.

echo "What do you want to do?"
echo.
echo.
echo "1] Install Drivers"
echo.
echo "2] Install Recovery"
echo.
echo "3] Fix System Destroyed"
echo.
echo "4] Exit"
echo.
echo.

set /p choice=Enter your choice:

if /i '%choice%' == '1' goto first
if /i '%choice%' == '2' goto second
if /i '%choice%' == '3' goto third
if /i '%choice%' == '4' goto end

echo.
echo.
echo "Can't you read?"
pause>nul
goto entry


:first

cls
echo.
echo "Installing Drivers..."
echo.
pnputil /add-driver %~dp0Driver\android_winusb.inf /subdirs /install
cls
echo "Drivers installed successfully..."
pause>nul
goto entry


:second

cls
echo.
echo "Select Your Device"
echo.
echo.
echo "1] Mido"
echo.
echo "2] Ginkgo"
echo.
echo "3] Santoni"
echo.
echo "4] Willow"
echo.
echo "5] Return to Main Menu"
echo.
echo.
set /p device=Enter your choice:

if /i '%choice' == '1' call %~dp0Batch\install.bat mido
if /i '%choice' == '2' call %~dp0Batch\install.bat ginkgo
if /i '%choice' == '3' call %~dp0Batch\install.bat santoni
if /i '%choice' == '4' call %~dp0Batch\install.bat willow
if /i '%choice' == '5' goto entry

echo.
echo.
echo "Can't you read?"
pause>nul
goto second

:third

cls
echo.
echo "Select Your Device"
echo.
echo.
echo "1] Ginkgo"
echo.
echo "2] Return to Main Menu"
echo.
echo.
set /p device=Enter your choice:

if /i '%choice' == '1' call %~dp0Batch\fix.bat ginkgo
if /i '%choice' == '2' goto entry

echo.
echo.
echo "Can't you read?"
pause>nul
goto third

pause
