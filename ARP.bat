@echo off
:: Set a small, clean window size for monitoring
mode 45, 15
title ARP Spoofing Detector
color 0a

:: 1. Setup Phase
echo [!] Setup: Identification
set /p routerIP="Enter Router IP (e.g., 192.168.1.1): "
set /p safeMAC="Enter the CORRECT MAC address of your router: "

:Monitor
cls
echo ===========================================
echo       MONITORING ARP CACHE...
echo ===========================================
echo  Target IP: %routerIP%
echo  Safe MAC:   %safeMAC%
echo ===========================================

:: 2. Extraction Phase (Using filtering skills from sources)
:: We use 'arp -a' to view the cache and 'for /f' to filter for the MAC address
for /f "tokens=2" %%a in ('arp -a ^| findstr /c:"%routerIP% "') do set currentMAC=%%a

:: 3. Comparison Phase
if "%currentMAC%"=="" (
    echo [?] Warning: Router IP not found in ARP table.
    echo Make sure you are actively using the network.
) else (
    if /I "%currentMAC%" neq "%safeMAC%" (
        :: 4. Alert Phase (Attack Detected!)
        color 0c
        echo [!!!] ATTACK DETECTED [!!!]
        echo.
        echo ALERT: Your router's MAC has changed!
        echo REAL MAC:    %safeMAC%
        echo SPOOFED MAC: %currentMAC%
        echo.
        echo Recommendation: Run 'arp -s %routerIP% %safeMAC%'
        echo to lock your connection and prevent spoofing.
    ) else (
        color 0a
        echo [+] Connection Secure. 
        echo [+] Current MAC: %currentMAC%
    )
)

:: Wait for 3 seconds before next check
timeout /t 3 >nul
goto Monitor
