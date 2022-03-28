"INFO"
Get-ComputerInfo | Select-Object OsVersion, WindowsRegisteredOwner, CsDomainRole, csname, OsRegisteredUser, OsArchitecture, OsNumberOfUsers, OsNumberOfProcesses, OsMaxProcessMemorySize, OsName, CsModel

Get-NetIPaddress | sort ifIndex | Select-Object ifIndex, IPAddress, InterfaceAlias

Get-NetTcpConnection | sort LocalPort | Group-Object LocalPort

net user

"SMBv1"
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State
