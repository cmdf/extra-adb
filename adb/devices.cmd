:: DEVICES - lists connected android devices
:: > devices [--adb|-a] [--fastboot|-f] [--specific|-s]
@echo off
setlocal enabledelayedexpansion

:: prepare
set j=&set s=0
if "%~1"=="" set j=af& goto :ldev

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :ldev
if "%i:~0,2%"=="--" set j=%j%%i:~2,1%& goto :lopt
if "%i:~0,1%"=="-" set j=%j%%i:~1%& goto :lopt
goto :lopt

:: list devices
:ldev
if not "0%j:s=%0"=="0%j%0" set s=1
:ldev1
if "%j%"=="" goto :eof
set k=%j:~0,1%
if "%k%"=="a" for /f "skip=1 tokens=1,2" %%a in ('adb devices') do call :lecho %s% %%a %%b
if "%k%"=="f" for /f "tokens=1,2" %%a in ('fastboot devices') do call :lecho %s% %%a %%b
set j=%j:~1%
goto :ldev1

:: echo device id
:lecho
if "%1"=="1" if "%2"=="%ANDROID_SERIAL%" echo %2 %3
if "%1"=="0" echo %2 %3
exit /b
