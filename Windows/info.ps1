"COMP"
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion, CsDomainRole, WindowsRegisteredOwner, OsRegisteredUser, OsArchitecture, OsNumberOfUsers, OsNumberOfProcesses, OsMaxProcessMemorySize, CsModel

"IP"
Get-NetIPaddress | sort ifIndex | Select-Object ifIndex, IPAddress, InterfaceAlias

"PORTS"
Get-NetTcpConnection | sort LocalPort | Group-Object LocalPort

"ACTIVE USERS (consider using get-aduser for domain users)(CMD: net user)"
Get-LocalUser | ? {$_.enabled -eq "True"}

"SMBv1"
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State

"WinRM (Disable if not using: stop-service winrm)"
get-service winrm

"Windows Defender (enable: start-service Windefend) (set-MpPreference -DisableRealtimeMonitoring $False)"
Get-service Windefend
Get-MpPreference | Select-Object DisableRealtimeMonitoring

"ARP"
Get-NetNeighbor | sort IPAddress | % {if (!($_.IPAddress -match '.255') -and !($_.IPAddress -match '224.') -and !($_.IPAddress -match 'ff02:') -and !($_.IPAddress -match 'fe80:')){$_}}

"Scheduled tasks"
Get-ScheduledTask | Sort-Object State , TaskName | % {if ($_.state -ne "Disabled") {$_}}


"Running Services (alternative: net start)"
Get-Service | ? {$_.Status -eq "Running"} | sort Name

"Non-windows services"
Get-wmiobject win32_service | where { $_.Caption -notmatch "Windows" -and $_.PathName -notmatch "Windows" -and $_.PathName -notmatch "policyhost.exe" -and $_.Name -ne "LSM" -and $_.PathName -notmatch "OSE.EXE" -and $_.PathName -notmatch "OSPPSVC.EXE" -and $_.PathName -notmatch "Microsoft Security Client" } | ft
