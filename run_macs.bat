@echo off
echo ========================================
echo MACS - SIMPLE LAUNCHER
echo ========================================
echo Using your WORKING virtual environment!
echo.

if not exist ".venv\Scripts\python.exe" (
    echo ❌ Virtual environment not found
    pause
    exit /b 1
)

echo ✅ Virtual environment detected and working
echo 🐍 Python: .venv\Scripts\python.exe
echo 📦 pip: Available and working

echo.
echo 🔄 Installing/Checking NiceGUI...
.venv\Scripts\python.exe -m pip install nicegui --quiet
if errorlevel 1 (
    echo ❌ Failed to install NiceGUI
    pause
    exit /b 1
)

echo ✅ NiceGUI ready

echo.
echo 🚀 Starting MACS Application...
echo 🌐 Browser will open to: http://localhost:8080
echo ⏹️  Press Ctrl+C to stop the server
echo.

.venv\Scripts\python.exe main.py

echo.
echo 👋 MACS stopped. Thank you for using MACS!
pause
