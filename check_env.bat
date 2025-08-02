@echo off
echo ===========================================
echo MACS Environment Checker
echo ===========================================
echo.

echo Current directory:
cd

echo.
echo Python version:
python --version

echo.
echo Python executable path:
python -c "import sys; print(sys.executable)"

echo.
echo Checking if this is a virtual environment:
python -c "import sys; print('Virtual environment:', hasattr(sys, 'real_prefix') or (hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix))"

echo.
echo Installed packages:
pip list | findstr -i nicegui

echo.
echo Trying to import NiceGUI:
python -c "try: import nicegui; print('NiceGUI version:', nicegui.__version__); except Exception as e: print('Error:', e)"

echo.
echo ===========================================
echo If NiceGUI is missing, run: pip install nicegui
echo ===========================================
pause
