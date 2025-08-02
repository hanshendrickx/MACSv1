@echo off
echo ===========================================
echo Starting MACS Application
echo ===========================================
echo.

REM Check if we're in the right directory
if not exist "main.py" (
    echo Error: main.py not found in current directory
    echo Please run this script from the MACSv01 folder
    pause
    exit /b 1
)

REM Check if virtual environment exists
if exist "Scripts\activate.bat" (
    echo Activating virtual environment...
    call Scripts\activate.bat
    echo Virtual environment activated
    echo.
) else if exist "venv\Scripts\activate.bat" (
    echo Activating venv virtual environment...
    call venv\Scripts\activate.bat
    echo Virtual environment activated
    echo.
) else (
    echo No virtual environment found, using system Python
    echo.
)

REM Check if NiceGUI is installed
echo Checking NiceGUI installation...
python -c "import nicegui; print('NiceGUI version:', nicegui.__version__)" 2>nul
if errorlevel 1 (
    echo NiceGUI not found. Installing...
    pip install nicegui
    if errorlevel 1 (
        echo Failed to install NiceGUI
        pause
        exit /b 1
    )
)

echo.
echo Starting MACS application...
echo Open your browser to: http://localhost:8080
echo Press Ctrl+C to stop the server
echo.

python main.py
pause
