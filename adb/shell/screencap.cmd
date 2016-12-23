:: SCREENCAP - get screen capture from android device
:: > screencap [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: prepare
set f=screencap.png

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :lget
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

:: get screen capture
:lget
adb shell "screencap -p /sdcard/%f%"
adb pull /sdcard/%f% .
adb shell "rm /sdcard/%f%"
