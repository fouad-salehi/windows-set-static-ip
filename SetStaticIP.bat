@echo off
title Static IP Configuration Tool - by Fouad Salehi (github.com/fouad-salehi)
color 0B
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

:MENU
cls
echo.
echo ####  ####  #####    ##  ####
echo ##    ##      ##     ##  ## ##
echo ####  ###     ##     ##  ####
echo   ##  ##      ##     ##  ##
echo ####  ####    ##     ##  ##
echo.
echo Static IP Configuration Tool
echo by Fouad Salehi - github.com/fouad-salehi
echo.
echo [1]  View Current IP Configuration
echo [2]  Set Static IP Address
echo [3]  Set IP to DHCP (Automatic)
echo [4]  Exit
echo.
set /p choice=Select an option [1-4]: 

if "%choice%"=="1" goto VIEWIP
if "%choice%"=="2" goto SETIP
if "%choice%"=="3" goto SETDHCP
if "%choice%"=="4" exit
goto MENU

:VIEWIP
cls
echo.
echo Current IP Configuration
echo.
netsh interface ip show config
echo.
pause
goto MENU

:SETIP
cls
echo.
echo Set Static IP Address
echo.
echo Available network adapters:
echo.
netsh interface show interface
echo.
set /p AdapterName=Enter network adapter name: 
echo.
set /p IP=Enter IP address: 
set /p Mask=Enter subnet mask (Enter for 255.255.255.0): 
if "%Mask%"=="" set Mask=255.255.255.0
set /p Gateway=Enter default gateway (Enter to skip): 
echo.
echo Applying configuration...
if "%Gateway%"=="" (
    netsh interface ip set address "%AdapterName%" static %IP% %Mask% >nul
) else (
    netsh interface ip set address "%AdapterName%" static %IP% %Mask% %Gateway% >nul
)
echo.
echo Configuration Applied!
echo.
netsh interface ip show address "%AdapterName%"
echo.
pause
goto MENU

:SETDHCP
cls
echo.
echo Set IP to DHCP
echo.
echo Available network adapters:
echo.
netsh interface show interface
echo.
set /p AdapterName=Enter network adapter name: 
echo.
echo Switching to DHCP...
netsh interface ip set address "%AdapterName%" dhcp >nul
netsh interface ip set dns "%AdapterName%" dhcp >nul
echo.
echo DHCP Enabled Successfully!
echo.
netsh interface ip show address "%AdapterName%"
echo.
pause
goto MENU
