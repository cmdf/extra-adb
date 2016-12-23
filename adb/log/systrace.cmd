:: SYSTRACE - get systrace from android device
:: > systrace [--time|-t] [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: prepare
set t=30& set f=systrace.html

:: options
:lopt
set i=%~1& shift
if "%i%"=="" goto :llog
if "%i:~0,2%"=="--" set a=%i:~2,1%& goto :luse
if "%i:~0,1%"=="-" set a=%i:~1%& goto :luse
goto :lopt

:: use options
:luse
if "%a%"=="" goto :lopt
set b=%a:~0,1%
if "%b%"=="t" set t=%~1& shift
if "%b%"=="o" set f=%~1& shift
set a=%a:~1%
goto :luse

:: collect systrace
:llog
if "%ANDROID_HOME%"=="" goto :lerr
set p=%ANDROID_HOME%\platform-tools\systrace
python %p%\systrace.py --time=%t% -o %f% sched gfx view wm
goto :eof

:lerr
echo systrace: ANDROID_HOME variable not defined>2
