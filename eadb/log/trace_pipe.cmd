:: TRACE_PIPE - get trace event logs from android device
:: > trace_pipe [--out|-o <file>]
@echo off
setlocal enabledelayedexpansion

:: prepare
set f=trace_pipe.log

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
if "%b%"=="o" set f=%~1& shift
set a=%a:~1%
goto :luse

:: collect logs
:llog
type NUL > %f%
adb shell "echo > /d/tracing/trace_pipe"
:llog1
adb shell "cat /d/tracing/trace_pipe" | tee -a %f%
goto :llog1
