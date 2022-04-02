@echo off
color A
:start
title Shutdown timer
set /p time= "Enter Time:"
set /a check=%time% 2>nul
if "%time%" == "%check%" (echo "you have entered: %time%" && goto :end) else (echo "not valid number, you have entered: '%time%' " && goto :start)
:end
shutdown.exe /s /t %time%
:loop
cls
set /a time=%time%-1
echo Seconds Left= %time%, Press C to cancel the shutdown
choice /t 1 > nul /c c2 /n /d 2
if %errorlevel% EQU 1 (shutdown.exe /a && echo #shutdown canceled,& echo.i ###,& color 0C &echo. Shutdown in 10 sec , GoodBye cruel world :')  && timeout /t 10 > nul && exit)
if %errorlevel% EQU 2 color E
if %time% EQU 0 (goto :Timesup) else (goto loop)
:Timesup
title Time Is Up!
cls
echo The Time is up! :3 Bye
exit