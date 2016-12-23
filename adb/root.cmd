:: ROOT - set adb in root mode for android device
:: > root [--remount|-r] [--setenforce|-s] [--verity-disable|-v]
@echo off
setlocal enabledelayedexpansion

:: prepare
set j=
if "%~1"=="" set j=rs& goto :lroot

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :lroot
if "%i:~0,2%"=="--" set j=%j%%i:~2,1%& goto :lopt
if "%i:~0,1%"=="-"set j=%j%%i:~1%& goto :lopt
goto :lopt

:: root device
:lroot
adb wait-for-device & adb root
if not "0%j:v=%0"=="0%j%0" adb disable-verity & adb reboot & adb wait-for-device & adb root
if not "0%j:r=%0"=="0%j%0" adb remount & adb wait-for-device
if not "0%j:s=%0"=="0%j%0" adb shell su 0 setenforce 0
