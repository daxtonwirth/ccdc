"-----------------------------------------------------------------------------------------------"
"DOMAIN NAME"
Get-ADDomain | Select-Object Name, dnsroot, userscontainer

"-----------------------------------------------------------------------------------------------"
"DC"
Get-ADDomainController | Select-Object Name, OperatingSystem, ldapport, ipv4address

"-----------------------------------------------------------------------------------------------"
"Group info"
get-adgroup -Filter * | Select-Object Name, GroupScope, GroupCategory, DistinguishedName | sort name |ft

"-----------------------------------------------------------------------------------------------"
"GPO"
get-gpo -all | Select-Object displayname, domainname, owner,gpostatus, description, id | ft

"-----------------------------------------------------------------------------------------------"
"ADMINS"
Get-ADGroupMember administrators | Select-Object Name, objectclass, samaccountname | ft

"-----------------------------------------------------------------------------------------------"
"Users"
get-aduser -Filter * | sort name | Select-Object Name, enabled, objectclass, DistinguishedName
"-----------------------------------------------------------------------------------------------"

"-----------------------------------------------------------------------------------------------"
"COMPUTERS (Use these for info.ps1 script for invoke command/remoting to get more info)"
"-----------------------------------------------------------------------------------------------"
Get-ADComputer -Filter * -Properties ipv4Address, OperatingSystem | Select-Object Name, IPv4Address, OperatingSystem, Enabled | ft
"-----------------------------------------------------------------------------------------------"
