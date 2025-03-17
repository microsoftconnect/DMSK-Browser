@ECHO off

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
@IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
@GOTO ADMINTASKS

:ELEVATE

mshta "javascript: var shell = new ActiveXObject('Shell.Application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1); close();"
EXIT /B

:ADMINTASKS

: Elevated commands

cd /d %~dp0
:installing NuancePowerMicWebAdapterSetup...
start NuancePowerMicWebAdapterSetup_123.1.25.0.exe /Uninstall

EXIT