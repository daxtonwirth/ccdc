## COMPUTER
```
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion, CsDomainRole, OsArchitecture, OsNumberOfUsers, OsNumberOfProcesses, CsModel
```
## IP
```
Get-NetIPaddress | sort ifIndex | Select-Object ifIndex, IPAddress, InterfaceAlias | ? {$_.IPAddress -notmatch "169.254" -and $_.InterfaceAlias -notmatch "loopback" -and $_.IPAddress -notmatch "fe80"}
```
## ARP 
Find active connections (Some say unreachable but double check for GW)
```
Get-NetNeighbor | sort IPAddress | ? {$_.State -eq "Reachable" -or $_.State -eq "Unreachable"}
```

## PORTS
```
Get-NetTcpConnection | sort LocalPort | ? {$_.LocalPort -le 49000} | Group-Object LocalPort
```
What services are listening:
```
netstat -anob
```
Figure out if a port is needed before blocking it (example):
```
New-NetFirewallRule -DisplayName "Block Outbound Port 80" -Direction Outbound -LocalPort 80 -Protocol TCP -Action Block
```
## Firewall
```
Get-NetFirewallProfile | Format-Table Name, Enabled
```
If not enabled, enable:
```
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True
```
## ACTIVE USERS (consider using get-aduser for domain users)(CMD: net user)
```
Get-LocalUser | ? {$_.enabled -eq "True"}
```
Disable local admin account if not needed:
```
net user Administrator /active:NO
```
## SMBv1
```
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State
Get-SmbServerConfiguration | Select-Object EnableSMB1Protocol, EnableSMB2Protocol
```
Disable SMBv1 if enabled:
```
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
```
## WinRM 
```
get-service winrm
```
Disable if not using: 
```
stop-service winrm
```
## Windows Defender 
```
Get-service Windefend
Get-MpPreference | Select-Object DisableRealtimeMonitoring
```
Enable if disabled:
```
enable: start-service Windefend
set-MpPreference -DisableRealtimeMonitoring $False
```


## Running Services 
alternative: net start
```
Get-Service | ? {$_.Status -eq "Running"} | sort Name
```
Non-windows services
```
Get-wmiobject win32_service | where { $_.Caption -notmatch "Windows" -and $_.PathName -notmatch "Windows" -and $_.PathName -notmatch "policyhost.exe" -and $_.Name -ne "LSM" -and $_.PathName -notmatch "OSE.EXE" -and $_.PathName -notmatch "OSPPSVC.EXE" -and $_.PathName -notmatch "Microsoft Security Client" } | ft
```
If a service is not necessary, disable it:
```
Set-Service -Name "SERVICE-NAME" -Status stopped -StartupType disabled
```

## Scheduled tasks
```
Get-ScheduledTask | Sort-Object State , TaskName | % {if ($_.state -ne "Disabled") {$_}}
```
If malicious:
```
Disable-ScheduledTask -TaskName "SystemScan"
```
