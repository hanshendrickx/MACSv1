@echo off
echo ==================================================
echo MACS Environment Fixer
echo ==================================================
echo.

REM Step 1: Check current directory
if not exist "main.py" (
    echo Error: main.py not found. Please run from MACSv01 folder.
    pause
    exit /b 1
)

echo Step 1: Checking Python installations...
echo.

REM Check different Python commands
echo Testing 'python' command:
python --version 2>nul
if errorlevel 1 (
    echo   ❌ 'python' command not found
) else (
    echo   ✅ 'python' command works
)

echo Testing 'py' command:
py --version 2>nul
if errorlevel 1 (
    echo   ❌ 'py' command not found
) else (
    echo   ✅ 'py' command works
)

echo.
echo Step 2: Looking for virtual environment...

if exist ".venv\Scripts\python.exe" (
    echo   ✅ Found .venv virtual environment
    echo   📍 Location: %CD%\.venv
    
    echo.
    echo Step 3: Activating virtual environment...
    call .venv\Scripts\activate.bat
    
    echo   ✅ Virtual environment activated
    echo   🐍 Python: %CD%\.venv\Scripts\python.exe
    
    echo.
    echo Step 4: Checking pip in virtual environment...
    .venv\Scripts\python.exe -m pip --version 2>nul
    if errorlevel 1 (
        echo   ❌ pip not found in virtual environment
        echo   🔄 Installing pip...
        .venv\Scripts\python.exe -m ensurepip --upgrade
    ) else (
        echo   ✅ pip is available
    )
    
    echo.
    echo Step 5: Installing NiceGUI...
    .venv\Scripts\python.exe -m pip install nicegui
    if errorlevel 1 (
        echo   ❌ Failed to install NiceGUI
        pause
        exit /b 1
    ) else (
        echo   ✅ NiceGUI installed successfully
    )
    
    echo.
    echo Step 6: Testing installation...
    .venv\Scripts\python.exe -c "import nicegui; print('NiceGUI version:', nicegui.__version__)"
    if errorlevel 1 (
        echo   ❌ NiceGUI import failed
        pause
        exit /b 1
    ) else (
        echo   ✅ NiceGUI working correctly
    )
    
    echo.
    echo ==================================================
    echo ✅ Environment setup complete!
    echo ==================================================
    echo To run MACS:
    echo   1. .venv\Scripts\activate.bat
    echo   2. python main.py
    echo.
    echo Or use: run_macs_venv.bat
    echo ==================================================
    
) else (
    echo   ❌ No virtual environment found
    echo.
    echo Step 3: Creating new virtual environment...
    
    REM Try different Python commands
    py -m venv .venv 2>nul
    if errorlevel 1 (
        echo   ❌ Failed with 'py' command, trying alternatives...
        
        REM Try python3
        python3 -m venv .venv 2>nul
        if errorlevel 1 (
            REM Try finding Python in common locations
            if exist "C:\Python39\python.exe" (
                echo   🔍 Found Python 3.9, using it...
                C:\Python39\python.exe -m venv .venv
            ) else if exist "C:\Python310\python.exe" (
                echo   🔍 Found Python 3.10, using it...
                C:\Python310\python.exe -m venv .venv
            ) else if exist "C:\Python311\python.exe" (
                echo   🔍 Found Python 3.11, using it...
                C:\Python311\python.exe -m venv .venv
            ) else (
                echo   ❌ Cannot create virtual environment
                echo   💡 Please install Python with pip support
                pause
                exit /b 1
            )
        )
    )
    
    if exist ".venv\Scripts\python.exe" (
        echo   ✅ Virtual environment created
        echo   🔄 Now run this script again to install NiceGUI
    ) else (
        echo   ❌ Virtual environment creation failed
    )
)

echo.
pause
