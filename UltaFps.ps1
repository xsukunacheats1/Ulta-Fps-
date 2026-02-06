# ================================
# X Sukuna | ULTRA FPS OPTIMIZER
# Windows PowerShell (Admin)
# ================================

Write-Host "Applying Ultra High FPS Optimizations..." -ForegroundColor Cyan

# 1. Enable Ultimate Performance Power Plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

# 2. Disable Xbox Services (FPS boost)
Get-Service Xbox* | Set-Service -StartupType Disabled
Stop-Service XboxGipSvc -Force
Stop-Service XblAuthManager -Force
Stop-Service XblGameSave -Force

# 3. Disable Game DVR (FPS Boost)
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

# 4. Reduce Input Lag
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 50 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 50 /f

# 5. Disable Background Apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f

# 6. Network Latency Optimization
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled

# 7. CPU Scheduling for Gaming
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f

# 8. Disable Power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

# 9. Clear Temp Files
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Optimization Completed Successfully!" -ForegroundColor Green
Write-Host "Restart Your PC for Best FPS Results" -ForegroundColor Yellow