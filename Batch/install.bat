@echo off

:: TWRP Installer 0.2 by @uncannyjish

title TWRP Installer 0.2

echo Detecting your device(should be on fastboot screen[Power+volume down])... 

"%~dp0..\adb-fastboot\fastboot.exe" getvar product 2>&1 | findstr /r /c:"^product: *%1" || echo Missmatching image and device
"%~dp0..\adb-fastboot\fastboot.exe" getvar product 2>&1 | findstr /r /c:"^product: *%1" || exit /B 1

"%~dp0..\adb-fastboot\fastboot.exe" flash recovery "%~dp0..\images\%1.img" || @echo "Flash recovery error" && exit /B 1

echo Install Successful!!! Booting to recovery...

"%~dp0..\adb-fastboot\fastboot.exe" boot "%~dp0..\images\%1.img"

pause
