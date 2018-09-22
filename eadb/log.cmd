:: LOG - get logs from android device
:: > log <type> [<args>...]
@echo off
setlocal enabledelayedexpansion

:: get logs
call %~dp0log\%*
