@echo off
title POINT BLANK CONTROL SERVER
color 0A
cd /d "%~dp0"

:menu
cls
echo.
echo  ==========================================
echo ^|    POINT BLANK OFFLINE CONTROL SERVER   ^|
echo  ==========================================
echo ^|  Point Blank By : BAKBAKAN              ^|
echo ^|  YT : Kedua Kolo                        ^|
echo ^|  Github : KeishaXD                      ^|
echo  ==========================================
echo.
echo   [1] Start Server
echo   [2] Stop Server
echo   [3] Edit ID Login
echo   [4] Keluar
echo.
echo  ==========================================

set /p pilih=Pilih menu ^> 

if "%pilih%"=="1" goto start
if "%pilih%"=="2" goto stop
if "%pilih%"=="3" goto editid
if "%pilih%"=="4" goto end

echo.
echo Pilihan tidak valid!
timeout /t 2 >nul
goto menu

:start
cls
echo [INFO] Membersihkan process lama...

REM ===== CLEAN PROCESS (ANTI TABRAKAN) =====
taskkill /im PointBlank.exe /f >nul 2>&1
taskkill /im PointBlank.Auth.exe /f >nul 2>&1
taskkill /im PointBlank.Battle.exe /f >nul 2>&1
taskkill /im PointBlank.Game.exe /f >nul 2>&1
taskkill /im PostgreSQLPortable.exe /f >nul 2>&1

timeout /t 2 >nul

echo [INFO] Menjalankan PostgreSQL...
start "" /min "%~dp01-PostgreSQL\PostgreSQLPortable.exe"
timeout /t 5 >nul

echo [INFO] Menjalankan Server...
start "" /min cmd /c "%~dp02-Server\##Start##.bat"
timeout /t 5 >nul

echo [INFO] Menjalankan Game...
start "" "%~dp03-PointBlank\#STARTGAME#.bat"

echo.
echo [SUCCESS] Semua berhasil dijalankan!
pause
goto menu

:stop
cls
echo [INFO] Menutup semua process...

REM ===== STOP GAME =====
taskkill /im PointBlank.exe /f >nul 2>&1

REM ===== STOP SERVER =====
taskkill /im PointBlank.Auth.exe /f >nul 2>&1
taskkill /im PointBlank.Battle.exe /f >nul 2>&1
taskkill /im PointBlank.Game.exe /f >nul 2>&1

REM ===== OPTIONAL SCRIPT CLOSE =====
call "%~dp02-Server\##Close##.bat"

REM ===== STOP DATABASE =====
taskkill /im PostgreSQLPortable.exe /f >nul 2>&1

echo.
echo [SUCCESS] Semua berhasil dihentikan!
pause
goto menu

:editid
cls
echo ==========================================
echo EDIT ID LOGIN
echo ==========================================
echo.

set /p newid=Masukkan ID baru: 

if "%newid%"=="" (
    echo ID tidak boleh kosong!
    pause
    goto menu
)

REM Replace baris idlogin
(
for /f "usebackq delims=" %%a in ("%~dp03-PointBlank\#STARTGAME#.bat") do (
    echo %%a | findstr /i "set idlogin=" >nul
    if not errorlevel 1 (
        echo set idlogin=%newid%
    ) else (
        echo %%a
    )
)
) > "%~dp03-PointBlank\temp.bat"

move /y "%~dp03-PointBlank\temp.bat" "%~dp03-PointBlank\#STARTGAME#.bat" >nul

echo.
echo [SUCCESS] ID berhasil diubah!
echo Backup disimpan sebagai: backup_STARTGAME.bat
pause
goto menu

:end
cls
echo.
echo Keluar dari program dalam:

for /l %%i in (5,-1,1) do (
    echo %%i...
    timeout /t 1 >nul
)

echo.
echo Bye!
timeout /t 1 >nul
exit