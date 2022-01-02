@echo off

:: Uncanny Recovery Installer 1.0 by @uncannyjish

title Uncanny Recovery Installer 1.0

cls

echo.
echo Detecting your device(should be on fastboot screen[Power+volume down])... 

fastboot getvar product 2>&1 | findstr /r /c:"^product: *%1" || echo Missmatching image and device
fastboot getvar product 2>&1 | findstr /r /c:"^product: *%1" || exit /B 1

if "%1" == "whyred" (
fastboot flash antirbpass %~dp0..\images\dummy_whyred.img || @echo "Flash antirbpass error" && exit /B 1
)

fastboot flash recovery "%~dp0..\images\%1.img" || @echo "Flash recovery error" && exit /B 1

echo Install Successful! Booting to recovery...

fastboot boot "%~dp0..\images\%1.img"

pause
