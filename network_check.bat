@echo off
echo ========================================
echo MACS - Network Diagnostics for Dell
echo ========================================
echo.

echo 🔍 CHECKING GITHUB CONNECTIVITY...
echo.

echo 1️⃣ Testing GitHub.com response time:
ping -n 4 github.com
echo.

echo 2️⃣ Testing DNS resolution speed:
nslookup github.com
echo.

echo 3️⃣ Testing HTTPS connection:
powershell -Command "Measure-Command { Invoke-WebRequest -Uri 'https://github.com' -UseBasicParsing | Out-Null }"
echo.

echo 4️⃣ Checking network adapter status:
ipconfig /all | findstr /i "ethernet\|wireless\|dhcp\|dns"
echo.

echo 🖥️ DELL-SPECIFIC CHECKS:
echo.

echo 5️⃣ Dell network drivers (common issue):
driverquery | findstr /i "network\|ethernet\|wireless"
echo.

echo 6️⃣ Power management (Dell laptops):
powercfg /query | findstr /i "wireless\|ethernet"
echo.

echo 🛠️ QUICK FIXES TO TRY:
echo.
echo ✅ Dell Command Update - Update network drivers
echo ✅ Device Manager - Disable/re-enable network adapter
echo ✅ Network Reset: netsh winsock reset
echo ✅ DNS Flush: ipconfig /flushdns
echo ✅ Power Options - Turn off "Allow computer to turn off this device"
echo.

echo 🌐 GITHUB-SPECIFIC SOLUTIONS:
echo.
echo ✅ Use different DNS: 8.8.8.8 or 1.1.1.1
echo ✅ Try GitHub CLI: gh repo view hanshendrickx/MACSv1
echo ✅ Use mobile hotspot to test if it's ISP-specific
echo ✅ Clear browser cache and try private/incognito mode
echo.

echo 📊 EXPECTED GITHUB PERFORMANCE:
echo    Ping: Under 50ms
echo    Page load: 1-3 seconds
echo    Repository view: Instant after initial load
echo.

pause
