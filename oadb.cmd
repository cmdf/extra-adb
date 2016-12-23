:: OADB - control android device
:: > oadb [<command>] [<args>...]
@echo off
setlocal enabledelayedexpansion

:: prepare
set zs=
if not "%ANDROID_SERIAL%"=="" set zs=-s
call %~dp0adb\devices %zs%

:: run command
if "%~1"=="" goto :eof
if "%~1"=="devices" goto :eof
call %~dp0adb\%*
