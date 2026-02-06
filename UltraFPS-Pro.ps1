Clear-Host

# ================================
# X Sukuna | FPS Optimizer PRO
# ================================

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "        X Sukuna FPS Optimizer       " -ForegroundColor Yellow
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Admin Check
if (-NOT ([Security.Principal.WindowsPrincipal]
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "Run PowerShell as Administrator!" -ForegroundColor Red
    pause
    exit
}

function UltraFPS {
    Write-Host "Applying Ultra FPS Optimizations..." -ForegroundColor Green

    powercfg -setactive SCHEME_MIN

    Stop-Service WSearch -Force -ErrorAction SilentlyContinue
    Set-Service WSearch -StartupType Disabled

    Stop-Service SysMain -Force -ErrorAction SilentlyContinue
    Set-Service SysMain -StartupType Disabled

    reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f | Out-Null

    Write-Host "Ultra FPS Applied! Restart PC." -ForegroundColor Yellow
}

function LowEndFPS {
    Write-Host "Applying Low End Mode..." -ForegroundColor Green

    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f | Out-Null

    Write-Host "Low End Optimization Done!" -ForegroundColor Yellow
}

function RestoreDefault {
    Write-Host "Restoring Windows Defaults..." -ForegroundColor Green

    Set-Service WSearch -StartupType Automatic
    Set-Service SysMain -StartupType Automatic

    Write-Host "Defaults Restored!" -ForegroundColor Yellow
}

Write-Host "1 - Ultra FPS Mode"
Write-Host "2 - Low End PC Mode"
Write-Host "3 - Restore Defaults"
Write-Host ""

$choice = Read-Host "Select Option"

switch ($choice) {
    "1" { UltraFPS }
    "2" { LowEndFPS }
    "3" { RestoreDefault }
    default { Write-Host "Invalid Option" -ForegroundColor Red }
}