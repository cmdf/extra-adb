:: ROM - flash rom build images to android device
:: > rom [--system|-s] [--userdata|-u] [--recovery|-r] [--persist|-p] [--cache|-c] [--boot|-b] [--aboot|-a]
@echo off
setlocal enabledelayedexpansion

:: prepare
set w=fastboot flash
if "%~1"=="" set j=surpmcba& goto :lflash

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :eof
if "%i:~0,2%"=="--" set j=%i:~2,1%& goto :lflash
if "%i:~0,1%"=="-" set j=%i:~1%& goto :lflash
goto :lopt

:: flash images
:lflash
if "%j%"=="" goto :lopt
set k=%j:~0,1%
if "%k%"=="s" (
	for %%a in (*system*.img) do %w% system %%a
	for %%a in (*sysfs*.ext4) do %w% system %%a
)
if "%k%"=="u" (
	for %%a in (*userdata*.img) do %w% userdata %%a
	for %%a in (*usrfs*.ext4) do %w% userdata %%a
)
if "%k%"=="r" (
	for %%a in (*recovery*.img) do %w% recovery %%a
	for %%a in (*recovery*.ext4) do %w% recovery %%a
)
if "%k%"=="p" (
	for %%a in (*persist*.img) do %w% persist %%a
	for %%a in (*persist*.ext4) do %w% persist %%a
)
if "%k%"=="m" (
	for %%a in (*mdtp*.img) do %w% mdtp %%a
	for %%a in (*mdtp*.ext4) do %w% mdtp %%a
)
if "%k%"=="c" (
	for %%a in (*cache*.img) do %w% cache %%a
	for %%a in (*cache*.ext4) do %w% cache %%a
)
if "%k%"=="b" (
	for %%a in (*boot*.img) do %w% boot %%a
)
if "%k%"=="a" (
	for %%a in (*appsboot*.mbn) do %w% aboot %%a
)
set j=%j:~1%
goto :lflash
