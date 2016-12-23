:: LOGCAT - get logcat from android device
:: > logcat [--kernel|-k] [--crash|-c] [--main|-m] [--threadtime|-t] [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: run log cat
call %~dp0log\cat %*
