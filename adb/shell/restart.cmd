:: RESTART - restart all services in android device
:: > restart
@echo off
setlocal enabledelayedexpansion

:: stop and start
adb shell stop
adb shell start
