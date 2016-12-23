:: FLASH - flash build on android device
:: > flash <type> [<args>...]
@echo off
setlocal enabledelayedexpansion

:: flash build
call %~dp0wait-for-fastboot
call %~dp0flash\%*
fastboot continue
