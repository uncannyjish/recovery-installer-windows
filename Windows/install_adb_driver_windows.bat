@ECHO OFF

:: This batch file installs necessary USB drivers and sets up adb...

TITLE ADB & Driver Installer

ECHO Installing latest drivers...

pnputil /add-driver "%~dp0Driver\android_winusb.inf" /subdirs /install

ECHO Congratulations! You're ready to go...

PAUSE
