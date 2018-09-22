:: UNLOCK - unlock android device
:: > unlock
@echo off
setlocal enabledelayedexpansion

:: unlock
adb shell input keyevent 82
