@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
color 0A
title python Tools - pro Launcher

REM ===============================
REM CONFIG
REM ===============================
set "PYCFG=python_default.cmd"
set "PYTHON_CMD=python"
set "REQ=requirements.txt"

set BASE_LIBS=requests websockets websocket-client ccxt numpy tzdata
set OPT_LIBS=pandas matplotlib mplfinance plyer psutil

REM ===============================
REM CARICA PYTHON DEFAULT
REM ===============================
if exist "%PYCFG%" (
    set /p PYTHON_CMD=<"%PYCFG%"
)

call :CHECK_PYTHON
if errorlevel 1 call :AUTO_DEFAULT

REM ===============================
REM MENU PRINCIPALE
REM ===============================
:MENU
cls
echo ==============================================
echo        PYTHON TOOLS PRO LAUNCHER - MENU PRINCIPALE
echo ==============================================
echo.
echo Python attivo: %PYTHON_CMD%
echo.
echo 1  - Avvia script Python
echo 2  - Impostazioni
echo Q  - Esci
echo.
set /p "SCELTA=>>> "

if /I "%SCELTA%"=="1" goto RUN_SCRIPTS
if /I "%SCELTA%"=="2" goto SETTINGS
if /I "%SCELTA%"=="Q" goto END
goto MENU

REM ===============================
REM MENU IMPOSTAZIONI
REM ===============================
:SETTINGS
cls
echo ==============================================
echo              IMPOSTAZIONI
echo ==============================================
echo.
echo B  - Installa librerie BASE
echo O  - Installa librerie OPZIONALI
echo A  - Installa BASE ed OPZIONALI
echo R  - Installazione manuale dipendenze (requirements.txt)
echo D  - Installazione dipendenze con Auto-detect
echo I  - Installa Python 3.11 (winget)
echo P  - Seleziona versione Python
echo M  - Torna al menu principale
echo.
set /p "SET=>>> "

if /I "%SET%"=="B" goto INSTALL_BASE
if /I "%SET%"=="O" goto INSTALL_OPT
if /I "%SET%"=="A" goto INSTALL_ALL
if /I "%SET%"=="R" goto INSTALL_REQFILE
if /I "%SET%"=="D" goto AUTO_DEPS
if /I "%SET%"=="I" goto INSTALL_PY311
if /I "%SET%"=="P" goto SELECT_PYTHON
if /I "%SET%"=="M" goto MENU
goto SETTINGS

REM ===============================
REM RUN PY
REM ===============================
:RUN_SCRIPTS
cls
set "n=0"
for %%f in (*.py) do (
    set /a n+=1
    set "FILE[!n!]=%%f"
)

if !n! EQU 0 (
    echo Nessun file .py trovato.
    goto RETURN_MENU
)

for /L %%i in (1,1,!n!) do echo %%i^) !FILE[%%i]!
echo.
set /p "NUM=Selezione >>> "

set "SCRIPT=!FILE[%NUM%]!"
if not defined SCRIPT goto RETURN_MENU
start "PYTHON" cmd /k %PYTHON_CMD% "%SCRIPT%"
goto RETURN_MENU

REM ===============================
REM INSTALL PYTHON 3.11
REM ===============================
:INSTALL_PY311
cls
where winget >nul 2>&1 || (
    echo winget non disponibile.
    goto RETURN_MENU
)
winget install --id Python.Python.3.11 -e
goto RETURN_MENU

REM ===============================
REM AUTO-DETECT DIPENDENZE
REM ===============================
:AUTO_DEPS
cls
call :CHECK_PYTHON || goto RETURN_MENU

echo import ast, sys> _autodeps.py
echo from pathlib import Path>> _autodeps.py
echo mods=set()>> _autodeps.py
echo try: stdlib=set(sys.stdlib_module_names)>> _autodeps.py
echo except: stdlib=set()>> _autodeps.py
echo built=set(sys.builtin_module_names)>> _autodeps.py
echo IGNORE={'__future__'}>> _autodeps.py
echo for p in Path('.').glob('*.py'):>> _autodeps.py
echo ^    try: tree=ast.parse(p.read_text(encoding='utf-8',errors='ignore'))>> _autodeps.py
echo ^    except: continue>> _autodeps.py
echo ^    for n in ast.walk(tree):>> _autodeps.py
echo ^        if isinstance(n,ast.Import):>> _autodeps.py
echo ^            for a in n.names: mods.add(a.name.split('.')[0])>> _autodeps.py
echo ^        elif isinstance(n,ast.ImportFrom) and n.module:>> _autodeps.py
echo ^            if not n.module.startswith('.'): mods.add(n.module.split('.')[0])>> _autodeps.py
echo mods={m for m in mods if m not in stdlib and m not in built and m not in IGNORE}>> _autodeps.py
echo Path('requirements_auto.txt').write_text('\n'.join(sorted(mods)))>> _autodeps.py

%PYTHON_CMD% _autodeps.py
del _autodeps.py
%PYTHON_CMD% -m pip install -r requirements_auto.txt
goto RETURN_MENU

REM ===============================
REM INSTALL LIB
REM ===============================
:INSTALL_BASE
call :INSTALL_LIST %BASE_LIBS%
goto RETURN_MENU

:INSTALL_OPT
call :INSTALL_LIST %OPT_LIBS%
goto RETURN_MENU

:INSTALL_ALL
call :INSTALL_LIST %BASE_LIBS% %OPT_LIBS%
goto RETURN_MENU

:INSTALL_LIST
call :CHECK_PYTHON || exit /b
%PYTHON_CMD% -m pip install --upgrade pip
for %%L in (%*) do %PYTHON_CMD% -m pip install %%L
exit /b

:INSTALL_REQFILE
call :CHECK_PYTHON || goto RETURN_MENU
if exist "%REQ%" %PYTHON_CMD% -m pip install -r "%REQ%"
goto RETURN_MENU

REM ===============================
REM PYTHON SELECT
REM ===============================
:SELECT_PYTHON
cls
where py >nul 2>&1 && py -0p
echo.
set /p "CMD=Python cmd >>> "
%CMD% --version >nul 2>&1 || goto RETURN_MENU
echo %CMD%> "%PYCFG%"
set "PYTHON_CMD=%CMD%"
goto RETURN_MENU

REM ===============================
REM UTILS
REM ===============================
:CHECK_PYTHON
%PYTHON_CMD% --version >nul 2>&1 || exit /b 1
exit /b 0

:AUTO_DEFAULT
where py >nul 2>&1 && set "PYTHON_CMD=py -3.11"
exit /b

:RETURN_MENU
pause
goto MENU

:END
exit /b
