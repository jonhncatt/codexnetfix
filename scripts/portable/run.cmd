@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "CODEX_HOME=%SCRIPT_DIR%.codex-home"
set "PATH=%SCRIPT_DIR%;%PATH%"

if not exist "%CODEX_HOME%" (
  mkdir "%CODEX_HOME%" >nul 2>nul
)

if exist "%SCRIPT_DIR%company-env.cmd" (
  call "%SCRIPT_DIR%company-env.cmd"
)

"%SCRIPT_DIR%codex.exe" %*
exit /b %ERRORLEVEL%
