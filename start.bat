@echo off

::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::

CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::

:: Uncanny Recovery Installer 0.8 by @uncannyjish

cls

title Uncanny Recovery Installer 0.8

:entry

cls
echo.
echo ================================================
echo.
echo    Uncanny Recovery Installer 0.8 by @uncannyjish
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
setx /M path "%path%;C:\Android\adb-fastboot"
echo.
echo Closing This Window. Please run again to install recovery.
timeout /t 5 /nobreak >nul
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
echo 1] Redmi 3S [Land]
echo.
echo 2] Redmi 4X [Santoni]
echo.
echo 3] Redmi Note 3 [Kenzo]
echo.
echo 4] Redmi Note 4X [Mido]
echo.
echo 5] Redmi Note 5/Redmi 5 Plus [Vince]
echo.
echo 6] Redmi Note 5 Pro [Whyred]
echo.
echo 7] Redmi Note 6 Pro [Tulip]
echo.
echo 8] Redmi Note 7/7S [Lavender]
echo.
echo 9] Redmi Note 7 Pro [Violet]
echo.
echo 10] Redmi Note 8 [Ginkgo]
echo.
echo 11] Redmi Note 8T [Willow]
echo.
echo 12] Redmi K20 [Davinci/Davinciin]
echo.
echo 13] Redmi K20 Pro [Raphael/Raphaelin]
echo.
echo 14] Pocophone F1 [Beryllium]
echo.
echo 15] Return to Main Menu
echo.
echo.
set /p device=Enter your choice:  

if /i '%device%' == '1' (
	call "%~dp0Batch\install.bat" land
	goto entry
)
if /i '%device%' == '2' (
	call "%~dp0Batch\install.bat" santoni
	goto entry
)
if /i '%device%' == '3' (
	call "%~dp0Batch\install.bat" kenzo
	goto entry
)
if /i '%device%' == '4' (
	call "%~dp0Batch\install.bat" mido
	goto entry
)
if /i '%device%' == '5' (
	call "%~dp0Batch\install.bat" vince
	goto entry
)
if /i '%device%' == '6' (
	call "%~dp0Batch\install.bat" whyred
	goto entry
)
if /i '%device%' == '7' (
	call "%~dp0Batch\install.bat" tulip
	goto entry
)
if /i '%device%' == '8' (
	call "%~dp0Batch\install.bat" lavender
	goto entry
)
if /i '%device%' == '9' (
	call "%~dp0Batch\install.bat" violet
	goto entry
)
if /i '%device%' == '10' (
	call "%~dp0Batch\install.bat" ginkgo
	goto entry
)
if /i '%device%' == '11' (
	call "%~dp0Batch\install.bat" willow
	goto entry
)
if /i '%device%' == '12' goto din
if /i '%device%' == '13' goto rin
if /i '%device%' == '14' (
	call "%~dp0Batch\install.bat" beryllium
	goto entry
)
if /i '%device%' == '15' goto entry
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
	goto entry
)
if /i '%fix%' == '2' ( 
	call "%~dp0Batch\fix.bat" violet
	goto entry
)
if /i '%fix%' == '3' goto entry
echo.
echo.
echo Can't you read? Try again.
pause >nul
goto third

:din

echo.
echo Indian Variant? [Recovery Image Should be Named Accordingly]
set /p d=(y/n):
if /i '%d%' == 'y' (
	call "%~dp0Batch\install.bat" davinciin
	goto entry
)
if /i '%d%' == 'n' (
	call "%~dp0Batch\install.bat" davinci
	goto entry
)
echo.
echo.
echo Can't you read? Try again.
pause >nul
goto din

:rin

echo.
echo Indian Variant? [Recovery Image Should be Named Accordingly]
set /p d=(y/n):
if /i '%d%' == 'y' (
	call "%~dp0Batch\install.bat" raphaelin
	goto entry
)	
if /i '%d%' == 'n' (
	call "%~dp0Batch\install.bat" raphael
	goto entry
)
echo.
echo.
echo Can't you read? Try again.
pause >nul
goto rin

pause
