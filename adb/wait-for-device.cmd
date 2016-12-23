:: WAIT-FOR-DEVICE - wait for android device to be in adb mode
:: > wait-for-device
@echo off
setlocal enabledelayedexpansion

:: prepare
set s=& set f=0
if not "%ANDROID_SERIAL%"=="" set s=-s

:: if in fastboot, switch to adb mode, wait
for /f "tokens=1,2" %%a in ('%~dp0devices %s%') do if "%%b"=="fastboot" set f=1
if "%f%"=="1" fastboot continue
adb wait-for-device
