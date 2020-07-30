@echo off

:: TWRP Installer 0.1 by @uncannyjish

title System Destroyed Fix 0.2

echo Detecting you device(should be on fastboot screen[Power+volume down])... 

"%~dp0..\adb-fastboot\fastboot.exe" getvar product 2>&1 | findstr /r /c:"^product: *%1" || echo Missmatching image and device
"%~dp0..\adb-fastboot\fastboot.exe" getvar product 2>&1 | findstr /r /c:"^product: *%1" || exit /B 1

"%~dp0..\adb-fastboot\fastboot.exe" --disable-verity --disable-verification flash vbmeta "%~dp0..\images\vbmeta.img" || @echo "Flash vbmeta error" && exit /B 1

echo Issue solved... Flashing recovery and booting...

"%~dp0..\adb-fastboot\fastboot.exe" flash recovery "%~dp0..\images\recovery_%1.img" || @echo "Flash recovery error" && exit /B 1

"%~dp0..\adb-fastboot\fastboot.exe" boot "%~dp0..\images\recovery_%~1.img"

pause
