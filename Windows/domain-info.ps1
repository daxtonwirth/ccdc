"DOMAIN NAME"
Get-ADDomain | Select-Object Name, dnsroot, userscontainer

"DC"
Get-ADDomainController | Select-Object Name, OperatingSystem, ldapport, ipv4address

"Group info"
get-adgroup -Filter * | Select-Object Name, GroupScope, GroupCategory, DistinguishedName | sort name |ft

"ADMINS"
Get-ADGroupMember administrators | Select-Object Name, objectclass, samaccountname | ft

"Users"
get-aduser -Filter * | sort name | Select-Object Name, enabled, objectclass, DistinguishedName
