:: OADB - control android device
:: > oadb [<command>] [<args>...]
@echo off
setlocal enabledelayedexpansion

:: prepare
set s=
if not "%ANDROID_SERIAL%"=="" set s=-s
call %~dp0adb\devices %s%

:: run command
if "%~1"=="" goto :eof
if "%~1"=="devices" goto :eof
call %~dp0adb\%*
