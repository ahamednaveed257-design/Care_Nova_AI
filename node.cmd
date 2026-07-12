@echo off
setlocal

set "NODE_EXE="

if defined CARE_NOVA_NODE_EXE if exist "%CARE_NOVA_NODE_EXE%" set "NODE_EXE=%CARE_NOVA_NODE_EXE%"
if not defined NODE_EXE if exist "%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe" set "NODE_EXE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if not defined NODE_EXE if exist "C:\Program Files\nodejs\node.exe" set "NODE_EXE=C:\Program Files\nodejs\node.exe"
if not defined NODE_EXE (
  for /f "delims=" %%N in ('where node.exe 2^>nul') do if not defined NODE_EXE set "NODE_EXE=%%N"
)

if not defined NODE_EXE (
  echo Node.js runtime not found. >&2
  echo Set CARE_NOVA_NODE_EXE or use start-care-nova.cmd from the project root. >&2
  exit /b 1
)

"%NODE_EXE%" %*
