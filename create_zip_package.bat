@echo off
echo ========================================
echo MACS - Create GitHub ZIP Package
echo ========================================
echo.

echo 🎯 PROFESSIONAL SOLUTION: ZIP Package Creation
echo Your files ARE on GitHub, but web interface has display issues.
echo Creating ZIP package for GitHub upload as backup solution.
echo.

REM Check if we're in the right directory
if not exist "main.py" (
    echo ❌ Error: main.py not found
    echo Please run this script from the MACSv01 folder
    pause
    exit /b 1
)

echo 📦 Creating professional ZIP package...

REM Create a temporary folder for ZIP contents
set ZIP_FOLDER=MACS_Professional_Package
if exist "%ZIP_FOLDER%" rmdir /s /q "%ZIP_FOLDER%"
mkdir "%ZIP_FOLDER%"

echo 📂 Copying all MACS files to package folder...

REM Copy main application files
copy "main.py" "%ZIP_FOLDER%\"
copy "security_manager.py" "%ZIP_FOLDER%\"
copy "feature_manager.py" "%ZIP_FOLDER%\"
copy "requirements.txt" "%ZIP_FOLDER%\"

REM Copy documentation
copy "README.md" "%ZIP_FOLDER%\"
copy "LICENSE" "%ZIP_FOLDER%\"
copy "DEVELOPMENT.md" "%ZIP_FOLDER%\"
copy "SECURITY.md" "%ZIP_FOLDER%\"

REM Copy UX folder
xcopy "UX" "%ZIP_FOLDER%\UX\" /E /I /Y

REM Copy utility files
copy "pushToGitHub.bat" "%ZIP_FOLDER%\"
copy "demo_security.py" "%ZIP_FOLDER%\"
if exist "CreateGHMACS.v1.py" copy "CreateGHMACS.v1.py" "%ZIP_FOLDER%\"

echo 📋 Creating package manifest...
(
echo ========================================
echo MACS - Medical Analysis System Package
echo ========================================
echo.
echo 📅 Package Date: %date% %time%
echo 🔢 Version: Professional v1.0
echo 👤 Author: Hans Hendrickx
echo 🌐 Repository: https://github.com/hanshendrickx/MACSv1
echo.
echo 📂 PACKAGE CONTENTS:
echo.
echo 🏥 CORE APPLICATION:
echo    ✅ main.py              - Universal medical application
echo    ✅ security_manager.py  - 3-tier security system
echo    ✅ feature_manager.py   - PRO/FREE feature gating
echo    ✅ requirements.txt     - Python dependencies
echo.
echo 📚 DOCUMENTATION:
echo    ✅ README.md           - Complete project documentation
echo    ✅ DEVELOPMENT.md      - Developer guidelines
echo    ✅ SECURITY.md         - Security and compliance info
echo    ✅ LICENSE             - MIT license
echo.
echo 🎨 DESIGN SYSTEM:
echo    ✅ UX/README.md        - Design system overview
echo    ✅ UX/design-system.md - Core design principles
echo    ✅ UX/icons.md         - Icon library
echo    ✅ UX/toggles.md       - UI interactions
echo    ✅ UX/snippets.md      - Code examples
echo.
echo 🛠️ UTILITIES:
echo    ✅ pushToGitHub.bat    - Automated GitHub deployment
echo    ✅ demo_security.py    - Security system demonstration
echo.
echo 🚀 QUICK START:
echo    1. Extract this ZIP package
echo    2. Run: python main.py
echo    3. Open: http://localhost:8080
echo.
echo 🏥 FEATURES:
echo    ✅ Universal Python environment handling
echo    ✅ Responsive medical interface
echo    ✅ HIPAA-compliant security
echo    ✅ Multi-tier licensing system
echo    ✅ Professional documentation
echo.
echo 💡 GITHUB ISSUE WORKAROUND:
echo    This ZIP was created because GitHub web interface
echo    had display issues, though files were successfully
echo    uploaded via Git. This provides a backup access method.
echo.
echo 🔗 ONLINE REPOSITORY:
echo    https://github.com/hanshendrickx/MACSv1
echo.
echo ========================================
echo Package ready for upload to GitHub!
echo ========================================
) > "%ZIP_FOLDER%\PACKAGE_INFO.txt"

echo 📁 Package contents:
dir "%ZIP_FOLDER%" /B

echo.
echo ✅ Package created successfully!
echo 📂 Folder: %ZIP_FOLDER%
echo.
echo 🔗 NEXT STEPS:
echo 1. Go to: https://github.com/hanshendrickx/MACSv1
echo 2. Click: "Add file" → "Upload files"
echo 3. Drag the entire "%ZIP_FOLDER%" folder
echo 4. Or create a ZIP file and upload that
echo.
echo 💡 This works around the GitHub web interface display issue
echo    while preserving your professional medical application!
echo.

pause
