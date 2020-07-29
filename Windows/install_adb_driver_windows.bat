@echo off

:: This batch file installs necessary USB drivers and sets up adb...

title ADB & Driver Installer

echo Installing latest drivers...

pnputil /add-driver "%~dp0Driver\android_winusb.inf" /subdirs /install

echo Congratulations! You're ready to go...

pause
