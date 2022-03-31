# Computer
As stated before, get ALL COMPUTERS, Put them in a variable, run commands on them from that variable:
```
get-adcomputer -Filter * | ft
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {COMMAND}
```

### Domain controller info (name, ip)
```
Get-ADDomainController | Select-Object Name, OperatingSystem, ldapport, ipv4address
```
Domain info
```
Get-ADDomain | Select-Object Name, dnsroot, userscontainer
```

# User (DISABLE accounts)
## DOMAIN ADMINS:
```
Get-ADGroupMember administrators | Select-Object Name, objectclass, samaccountname | ft
 ```
* If there is someone that should NOT be there,
```
Remove-AdGroupMember -Identity Administrators -Members NAME
```

## DOMAIN USERS 
```
get-aduser -Filter * | sort name | Select-Object Name, enabled, objectclass, DistinguishedName
```
* Disable unneccessary users:
```
Disable-ADAccount
```

## Change PASSWORD
Determine which users are needed and change their passwords. Then disable users that are not needed. 
```
Set-ADAccountPassword USERNAME
```
---
## Ad group info
Group names for further enumeration with "Get-ADGroupMember"
```
get-adgroup -Filter * | Select-Object Name, GroupScope, GroupCategory, DistinguishedName | sort name |ft
```
## GPO info
```
get-gpo -all | Select-Object displayname, domainname, owner,gpostatus, description, id | ft
```
---
### Other related commands
```
Remove-adcomputer
New-aduser
Remove-aduser
```
https://docs.microsoft.com/en-us/powershell/module/activedirectory/disable-adaccount?view=windowsserver2022-ps
