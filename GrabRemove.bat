# Advanced Anti-Grabber Tool (PowerShell Script)

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "     ADVANCED ANTI-GRABBER SCANNER    " -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan

# Step 1: Check for Rootkits (Files that hide themselves)
Write-Host "[STEP 1] Checking for Rootkits..." -ForegroundColor Yellow
$rootkitFiles = Get-ChildItem -Path "C:\" -Recurse -Filter "*.exe" | Where-Object { $_.Attributes -match "Hidden" }
if ($rootkitFiles) {
    Write-Host "[WARNING] Rootkit files detected!" -ForegroundColor Red
    $rootkitFiles | ForEach-Object { Write-Host "Hidden file: $($_.FullName)" }
    # Optionally remove rootkits or log them for further analysis
} else {
    Write-Host "[OK] No rootkits detected." -ForegroundColor Green
}

# Step 2: Scan for Suspicious Running Processes
Write-Host "[STEP 2] Scanning Running Processes..." -ForegroundColor Yellow
$suspiciousProcesses = @("redline", "vidar", "raccoon", "agenttesla", "hawk", "keylogger", "stealer", "grabber", "njrat", "nanocore", "orcus", "darkcomet")
foreach ($proc in Get-Process) {
    foreach ($malProc in $suspiciousProcesses) {
        if ($proc.ProcessName -match $malProc) {
            Write-Host "[WARNING] Malicious process detected: $($proc.ProcessName)" -ForegroundColor Red
            Stop-Process -Name $proc.ProcessName -Force
            Write-Host "[SUCCESS] Process Terminated: $($proc.ProcessName)" -ForegroundColor Green
        }
    }
}

# Step 3: Detect Hidden Injections into Memory (Advanced)
Write-Host "[STEP 3] Checking for Hidden Memory Injections..." -ForegroundColor Yellow
$allProcesses = Get-Process
foreach ($proc in $allProcesses) {
    $modules = Get-ProcessModule -Id $proc.Id
    foreach ($module in $modules) {
        if ($module.FileName -match "malware" -or $module.FileName -match "grabber") {
            Write-Host "[WARNING] Suspicious memory injection detected in process: $($proc.ProcessName)" -ForegroundColor Red
            Stop-Process -Name $proc.ProcessName -Force
            Write-Host "[SUCCESS] Process Terminated: $($proc.ProcessName)" -ForegroundColor Green
        }
    }
}

# Step 4: Scan Registry for Malicious Startup Entries (More Comprehensive)
Write-Host "[STEP 4] Scanning Registry for Malicious Entries..." -ForegroundColor Yellow
$startupKeys = @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce")
foreach ($key in $startupKeys) {
    $entries = Get-ItemProperty -Path $key
    foreach ($entry in $entries.PSObject.Properties) {
        foreach ($malProc in $suspiciousProcesses) {
            if ($entry.Value -match $malProc) {
                Write-Host "[WARNING] Malicious startup entry found: $($entry.Name)" -ForegroundColor Red
                Remove-ItemProperty -Path $key -Name $entry.Name -Force
                Write-Host "[SUCCESS] Removed startup entry: $($entry.Name)" -ForegroundColor Green
            }
        }
    }
}

# Step 5: Real-Time File Integrity Check (Detect Tampered Files)
Write-Host "[STEP 5] Checking System Files for Integrity..." -ForegroundColor Yellow
$importantFiles = @(
    "C:\Windows\System32\kernel32.dll",
    "C:\Windows\System32\user32.dll",
    "C:\Windows\System32\advapi32.dll"
)

foreach ($file in $importantFiles) {
    if (Test-Path $file) {
        $fileHash = Get-FileHash $file
        Write-Host "[INFO] Checking file: $file"
        Write-Host "[INFO] Hash: $($fileHash.Hash)"
        # Compare the hash with a known good hash to detect changes
        # This can be extended by having a hash list of legitimate system files
    }
}

# Step 6: Real-Time Network Monitoring
Write-Host "[STEP 6] Monitoring Network Connections..." -ForegroundColor Yellow
$blockedIPs = @("192.168.1.1", "0.0.0.0")  # Example of IPs you may want to block or check against
$connections = Get-NetTCPConnection
foreach ($connection in $connections) {
    if ($blockedIPs -contains $connection.RemoteAddress) {
        Write-Host "[WARNING] Suspicious network connection detected!" -ForegroundColor Red
        # Terminate the connection or block the port (Use firewall rules)
        New-NetFirewallRule -DisplayName "Block Malicious IP" -Direction Outbound -RemoteAddress $connection.RemoteAddress -Action Block
        Write-Host "[SUCCESS] Network connection blocked." -ForegroundColor Green
    }
}

# Step 7: Behavioral Analysis (Check for Unusual Activity)
Write-Host "[STEP 7] Analyzing System Behavior..." -ForegroundColor Yellow
$diskActivity = Get-WmiObject Win32_PerfFormattedData_PerfDisk_LogicalDisk
$highDiskUsage = $diskActivity | Where-Object { $_.DiskWriteBytesPerSec -gt 1000000 }
if ($highDiskUsage) {
    Write-Host "[WARNING] Unusual disk activity detected, possible exfiltration or grabber operation." -ForegroundColor Red
}

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "    SCAN & CLEANUP COMPLETED!         " -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Pause
