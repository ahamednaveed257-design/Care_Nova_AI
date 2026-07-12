@echo off
setlocal
cd /d "%~dp0"
call "%~dp0start-care-nova.cmd"
exit /b %ERRORLEVEL%
