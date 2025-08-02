@echo off
echo ========================================
echo MACS - Git Diagnostic Tool
echo ========================================
echo.

echo 🔍 DIAGNOSTIC 1: Repository Status
git status
echo.

echo 🔍 DIAGNOSTIC 2: All tracked files
git ls-files
echo.

echo 🔍 DIAGNOSTIC 3: Remote configuration
git remote -v
echo.

echo 🔍 DIAGNOSTIC 4: Branch information
git branch -a
echo.

echo 🔍 DIAGNOSTIC 5: Commit history
git log --oneline -10
echo.

echo 🔍 DIAGNOSTIC 6: Last commit details
git show --stat HEAD
echo.

echo 🔍 DIAGNOSTIC 7: Check GitHub connectivity
echo Testing connection to GitHub...
git ls-remote origin
echo.

echo 🔍 DIAGNOSTIC 8: Repository size
echo Local repository size:
dir /s | find "File(s)"
echo.

echo 🔍 DIAGNOSTIC 9: Check .gitignore impact
echo Files ignored by .gitignore:
git status --ignored
echo.

echo ========================================
echo 🩺 DIAGNOSIS COMPLETE
echo ========================================
echo.
echo Please share this output to identify the issue.
echo.
pause
