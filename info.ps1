"INFO"
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion, CsDomainRole, WindowsRegisteredOwner, OsRegisteredUser, OsArchitecture, OsNumberOfUsers, OsNumberOfProcesses, OsMaxProcessMemorySize, CsModel

Get-NetIPaddress | sort ifIndex | Select-Object ifIndex, IPAddress, InterfaceAlias

Get-NetTcpConnection | sort LocalPort | Group-Object LocalPort

Get-LocalUser     # net user

"SMBv1"
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State
