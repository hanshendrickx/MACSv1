@echo off
echo ========================================
echo MACS - SLOW File-by-File GitHub Push
echo ========================================
echo.
echo 🐌 PROFESSIONAL APPROACH: One file at a time
echo This method works around network issues by:
echo - Pushing individual files with delays
echo - Allowing network recovery between pushes
echo - Providing detailed progress tracking
echo.

REM Check if we're in the right directory
if not exist "main.py" (
    echo ❌ Error: main.py not found
    echo Please run this script from the MACSv01 folder
    pause
    exit /b 1
)

echo 🔍 Preparing for slow push...

REM Ensure we have the latest remote state
git fetch origin 2>nul

echo.
echo 📋 FILE PUSH SEQUENCE (one by one):
echo ========================================

REM Define the push order - most important files first
set files[0]=main.py
set files[1]=README.md
set files[2]=security_manager.py
set files[3]=feature_manager.py
set files[4]=requirements.txt
set files[5]=LICENSE
set files[6]=SECURITY.md
set files[7]=DEVELOPMENT.md
set files[8]=UX/README.md
set files[9]=UX/design-system.md
set files[10]=UX/icons.md
set files[11]=UX/toggles.md
set files[12]=UX/snippets.md
set files[13]=demo_security.py
set files[14]=pushToGitHub.bat
set files[15]=CreateGHMACS.v1.py

echo 🚀 Starting slow push sequence...
echo.

REM Push files one by one
for /L %%i in (0,1,15) do (
    setlocal enabledelayedexpansion
    if defined files[%%i] (
        echo 📤 Pushing file %%i: !files[%%i]!
        
        REM Stage just this file
        git add "!files[%%i]!" 2>nul
        
        REM Check if file exists and is staged
        git diff --cached --name-only | findstr "!files[%%i]!" >nul
        if not errorlevel 1 (
            REM Commit this single file
            git commit -m "Slow push: Add !files[%%i]!" 2>nul
            if not errorlevel 1 (
                echo    ✅ Committed: !files[%%i]!
                
                REM Push this commit
                git push origin master 2>nul
                if not errorlevel 1 (
                    echo    🌐 Pushed successfully: !files[%%i]!
                ) else (
                    echo    ⚠️ Push failed for: !files[%%i]! - continuing...
                )
            ) else (
                echo    ℹ️ No changes to commit for: !files[%%i]!
            )
        ) else (
            echo    ℹ️ File not found or already committed: !files[%%i]!
        )
        
        REM Slow down to be gentle on network
        echo    ⏸️ Waiting 3 seconds for network recovery...
        timeout /t 3 /nobreak >nul
        echo.
    )
    endlocal
)

echo ========================================
echo 🏁 SLOW PUSH SEQUENCE COMPLETE
echo ========================================
echo.

REM Final status check
echo 📊 Final repository status:
git status --porcelain

echo.
echo 🔍 All files now in repository:
git ls-files

echo.
echo 🌐 Verifying final push:
git log --oneline -3

echo.
echo ✅ SLOW PUSH BENEFITS:
echo    - Gentler on network connections
echo    - Better error isolation per file
echo    - Works around bulk transfer issues
echo    - Provides detailed progress tracking
echo.
echo 💡 Check GitHub now: https://github.com/hanshendrickx/MACSv1
echo    Files should appear one by one in the commit history
echo.

pause
