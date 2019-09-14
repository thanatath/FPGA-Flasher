@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=FPGAFLAHSER
REM BFCPEVERDESC=FPGAFLAHSER
REM BFCPEVERCOMPANY=SHIBASAN
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND
@ECHO OFF
:index
SET bitfile="%1"
if %bitfile%=="" goto error
if "%~x1" NEQ ".bit" goto error
:con
cls
@ECHO OFF
color E
echo ----------------------------------------------------------------------------------------
echo  ______ _____   _____            ______ _ By Shi_ba'San  _____ _    _ ______ _____  
echo ^|  ____^|  __ \ / ____^|   /\     ^|  ____^| ^|        /\    / ____^| ^|  ^| ^|  ____^|  __ \ 
echo ^| ^|__  ^| ^|__) ^| ^|  __   /  \    ^| ^|__  ^| ^|       /  \  ^| (___ ^| ^|__^| ^| ^|__  ^| ^|__) ^|
echo ^|  __^| ^|  ___/^| ^| ^|_ ^| / /\ \   ^|  __^| ^| ^|      / /\ \  \___ \^|  __  ^|  __^| ^|  _  /   
echo ^| ^|    ^| ^|    ^| ^|__^| ^|/ ____ \  ^| ^|    ^| ^|____ / ____ \ ____) ^| ^|  ^| ^| ^|____^| ^| \ \ 
echo ^|_^|    ^|_^|     \_____/_/    \_\ ^|_^|    ^|______/_/    \_\_____/^|_^|  ^|_^|______^|_^|  \_\   
echo -----------------------------------------------------------------------------------------
echo -----------------------------
echo File Bit From %bitfile%
echo -----------------------------
echo   1 For Normal Rom (Fast)
echo   2 For PROM Rom (Slow)
echo -----------------------------
set /P INPUT=Type of Flash: %=%
if %input%==1 goto normal
if %input%==2 goto prom if NOT goto index
:normal
"%~dp0"xc3sprog.exe -c ftdi -L -v -p 0 %bitfile%
PAUSE
goto con
:prom
"%~dp0"xc3sprog.exe -c ftdi %cd%\spiflasherLX9.bit
"%~dp0"xc3sprog.exe -c ftdi -L -v -p 0 -I %bitfile%
cls
echo -----------------------------------------------------------
echo In Prom rom flashed. it's need to press reset on the board.
echo -----------------------------------------------------------
PAUSE
goto con
:error
cls
color c
echo ----------------------------------------
echo ERROR. Don't just Run me only 
echo Please Drag *.bit file type only from your project to me !.
echo ----------------------------------------
PAUSE  
