@echo off
echo ==================================================
echo Running MACS with Virtual Environment
echo ==================================================
echo.

if not exist ".venv\Scripts\python.exe" (
    echo ❌ Virtual environment not found
    echo 🔧 Please run fix_environment.bat first
    pause
    exit /b 1
)

if not exist ".venv\Scripts\activate.bat" (
    echo ❌ Virtual environment activation script not found
    pause
    exit /b 1
)

echo 🔄 Activating virtual environment...
call .venv\Scripts\activate.bat

echo ✅ Virtual environment activated
echo 🐍 Using Python: %CD%\.venv\Scripts\python.exe

echo.
echo 🔍 Checking NiceGUI...
.venv\Scripts\python.exe -c "import nicegui; print('✅ NiceGUI version:', nicegui.__version__)" 2>nul
if errorlevel 1 (
    echo ❌ NiceGUI not found, installing...
    .venv\Scripts\python.exe -m pip install nicegui
    if errorlevel 1 (
        echo ❌ Failed to install NiceGUI
        pause
        exit /b 1
    )
)

echo.
echo 🚀 Starting MACS Application...
echo 🌐 Open browser to: http://localhost:8080
echo ⏹️  Press Ctrl+C to stop
echo.

.venv\Scripts\python.exe main.py

echo.
echo 👋 MACS application stopped
pause
