@echo off

:: TWRP Installer 0.1 by @uncannyjish

title TWRP Installer 0.1

echo Detecting you device(should be on fastboot screen[Power+volume down])... 

"~dp0\adb-fastboot\fastboot.exe" %* getvar product 2>&1 | findstr /r /c:"^product: *ginkgo" || echo Missmatching image and device
"~dp0\adb-fastboot\fastboot.exe" %* getvar product 2>&1 | findstr /r /c:"^product: *ginkgo" || exit /B 1

"~dp0\adb-fastboot\fastboot.exe" %* flash recovery "%~dp0..\images\recovery.img" || @echo "Flash recovery error" && exit /B 1

echo Install Successful!!! Booting to recovery...

"~dp0\adb-fastboot\fastboot.exe" %* boot "%~dp0..\images\recovery.img"
pause
