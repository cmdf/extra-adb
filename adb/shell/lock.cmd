:: LOCK - lock android device
:: > lock
@echo off
setlocal enabledelayedexpansion

:: lock
adb shell input keyevent 26
