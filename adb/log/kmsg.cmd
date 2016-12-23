:: KMSG - get kernel message from android device
:: > kmsg [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: prepare
set f=kmsg.log

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
if "%b%"=="o" set f=%~1& shift
set a=%a:~1%
goto :luse

:: collect logs
:llog
type NUL > %f%
adb shell "echo > /proc/kmsg"
:llog1
adb shell "cat /proc/kmsg" | tee -a %f%
goto :llog1
