:: CAT - get logcat from android device
:: > cat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: prepare
set z=& set f=logcat.log
if "%~1"=="" set a=kcmt& goto :luse

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :llog
if "%i:~0,2%"=="--" set a=%i:~2,1%& goto :luse
if "%i:~0,1%"=="-" set a=%i:~1%& goto :luse
goto :lopt

:: use options
:luse
if "%a%"=="" goto :lopt
set b=%a:~0,1%
if "%b%"=="k" set z=%z% -b kernel
if "%b%"=="c" set z=%z% -b crash
if "%b%"=="m" set z=%z% -b main
if "%b%"=="t" set z=%z% -v threadtime
if "%b%"=="o" set f=%~1& shift
set a=%a:~1%
goto :luse

:: collect logs
:llog
type NUL > %f%
:llog1
adb logcat %z% -c
adb logcat %z% | tee -a %f%
goto :llog1
