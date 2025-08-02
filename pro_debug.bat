@echo off
echo ========================================
echo PROFESSIONAL DEBUGGING METHODOLOGY
echo ========================================
echo.
echo 🎓 LEARNING: How to diagnose Git/GitHub issues like a pro
echo.

echo 📋 STEP 1: ISOLATE THE PROBLEM
echo ----------------------------------------
echo Testing if your files are actually on GitHub...
echo.

echo 1A. Testing direct file access (bypasses GitHub UI):
echo Checking README.md...
curl -s "https://raw.githubusercontent.com/hanshendrickx/MACSv1/master/README.md" | findstr "MACS - Medical Analysis"
if errorlevel 1 (
    echo ❌ README not accessible
) else (
    echo ✅ README is accessible on GitHub
)

echo.
echo 1B. Testing main.py...
curl -s "https://raw.githubusercontent.com/hanshendrickx/MACSv1/master/main.py" | findstr "Medical Analysis" 
if errorlevel 1 (
    echo ❌ main.py not accessible  
) else (
    echo ✅ main.py is accessible on GitHub
)

echo.
echo 1C. Testing GitHub API (machine-readable):
curl -s "https://api.github.com/repos/hanshendrickx/MACSv1/contents" | findstr "name"

echo.
echo 📋 STEP 2: COMPARE LOCAL VS REMOTE
echo ----------------------------------------
echo Local files in Git:
git ls-files | wc -l
echo.
echo Remote commit hash:
git ls-remote origin master

echo.
echo 📋 STEP 3: NETWORK DIAGNOSTICS  
echo ----------------------------------------
echo Testing GitHub connectivity speed:
ping -n 3 github.com | findstr "time="

echo.
echo Testing DNS resolution:
nslookup github.com | findstr "Address"

echo.
echo 📋 STEP 4: BROWSER CACHE TEST
echo ----------------------------------------
echo Professional tip: Test with curl vs browser
echo.
echo If curl shows files but browser doesn't = Cache issue
echo If curl fails = Network/DNS issue  
echo If curl works but git fails = Authentication issue
echo.

echo 🎯 PROFESSIONAL DEBUGGING LOGIC:
echo.
echo ✅ Git push successful + curl success = Cache problem
echo ❌ Git push successful + curl fails = GitHub processing delay
echo ❌ Git push fails = Authentication or network issue
echo ⚠️  Mixed results = Intermittent connectivity (your Dell issue)
echo.

echo 🛠️ PRO TROUBLESHOOTING SEQUENCE:
echo 1. Test raw file access (bypass UI)
echo 2. Compare local vs remote state  
echo 3. Check network fundamentals
echo 4. Identify the specific failure point
echo 5. Apply targeted fix, not shotgun approach
echo.

echo 🎓 WHAT YOU'RE LEARNING:
echo - Systematic elimination of variables
echo - Testing multiple access methods
echo - Understanding the difference between UI and API
echo - Network vs application layer debugging
echo.

pause
