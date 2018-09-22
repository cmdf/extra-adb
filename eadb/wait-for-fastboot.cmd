:: WAIT-FOR-FASTBOOT - wait for android device to be in fastboot mode
:: > wait-for-fastboot
@echo off
setlocal enabledelayedexpansion

:: prepare
set s=& set d=0
if not "%ANDROID_SERIAL%"=="" set s=-s

:: if in fastboot, switch to adb mode, wait
for /f "tokens=1,2" %%a in ('%~dp0devices %s%') do if "%%b"=="device" set d=1
if "%d%"=="1" adb reboot bootloader
fastboot pragma 1>NUL 2>&1
