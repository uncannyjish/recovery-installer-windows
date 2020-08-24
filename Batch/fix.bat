@echo off

:: Uncanny Recovery Installer 0.7 by @uncannyjish

title System Destroyed Fix 0.7

echo Detecting you device(should be on fastboot screen[Power+volume down])... 

fastboot getvar product 2>&1 | findstr /r /c:"^product: *%1" || echo Missmatching image and device
fastboot getvar product 2>&1 | findstr /r /c:"^product: *%1" || exit /B 1

fastboot --disable-verity --disable-verification flash vbmeta "%~dp0..\images\vbmeta.img" || @echo "Flash vbmeta error" && exit /B 1

echo Issue solved... Flashing recovery and booting...

fastboot flash recovery "%~dp0..\images\%1.img" || @echo "Flash recovery error" && exit /B 1

fastboot boot "%~dp0..\images\%1.img"

pause