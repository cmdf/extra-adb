:: SHELL - run shell commands on android device
:: > shell [<command>] [<args>...]
@echo off
setlocal enabledelayedexpansion

:: run command
if "%~1"=="" call %~dp0root & adb shell & goto :eof
call %~dp0shell\%*
