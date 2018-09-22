:: EADB - control android device
:: > eadb [<command>] [<args>...]
@echo off
setlocal enabledelayedexpansion

:: prepare
set s=
if not "%ANDROID_SERIAL%"=="" set s=-s
call %~dp0eadb\devices %s%

:: run command
if "%~1"=="" goto :eof
if "%~1"=="devices" goto :eof
call %~dp0eadb\%*
