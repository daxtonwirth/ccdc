# $COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
# Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {}

Invoke-Command -ScriptBlock {

"COMP"
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion, CsDomainRole, WindowsRegisteredOwner, OsRegisteredUser, OsArchitecture, OsNumberOfUsers, OsNumberOfProcesses, OsMaxProcessMemorySize, CsModel

"----------------------------------------------------------------------------------------------------------------------------"
"IP"
Get-NetIPaddress | sort ifIndex | Select-Object ifIndex, IPAddress, InterfaceAlias | ft

"----------------------------------------------------------------------------------------------------------------------------"
"PORTS"
get-nettcpconnection | select local*,remote*,state,@{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}} |?{$_.localport -le 49000} |sort localport |group-object localport,process| ft

"----------------------------------------------------------------------------------------------------------------------------"
"ARP"
Get-NetNeighbor | sort IPAddress | % {if (!($_.IPAddress -match '.255') -and !($_.IPAddress -match '224.') -and !($_.IPAddress -match 'ff02:') -and !($_.IPAddress -match 'fe80:')){$_}} | Select-Object ifindex, ipaddress, LinkLayerAddress, interfacealias | ft

"----------------------------------------------------------------------------------------------------------------------------"
"ACTIVE USERS (consider using get-aduser for domain users)(CMD: net user)"
Get-LocalUser | ? {$_.enabled -eq "True"} | Select-Object Name, Enabled, PrincipalSource, ObjectClass, Description, LastLogin, passwordlastset |ft

"----------------------------------------------------------------------------------------------------------------------------"
"SMBv1"
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State | ft

"----------------------------------------------------------------------------------------------------------------------------"
"WinRM (Disable if not using: stop-service winrm)"
get-service winrm

"----------------------------------------------------------------------------------------------------------------------------"
"Windows Defender (enable: start-service Windefend) (set-MpPreference -DisableRealtimeMonitoring $False)"
Get-service Windefend
Get-MpPreference | Select-Object DisableRealtimeMonitoring

"----------------------------------------------------------------------------------------------------------------------------"
"Firewall"
Get-NetFirewallProfile | Format-Table Name, Enabled

"----------------------------------------------------------------------------------------------------------------------------"
"Non-windows services"
Get-wmiobject win32_service | where { $_.Caption -notmatch "Windows" -and $_.PathName -notmatch "Windows" -and $_.PathName -notmatch "policyhost.exe" -and $_.Name -ne "LSM" -and $_.PathName -notmatch "OSE.EXE" -and $_.PathName -notmatch "OSPPSVC.EXE" -and $_.PathName -notmatch "Microsoft Security Client" } | ft

} | Tee-Object -file COMPUTER-INFOMATION.txt
