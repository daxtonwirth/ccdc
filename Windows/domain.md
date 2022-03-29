# Computer
ALL COMPUTERS, Put them in a variable:
```
get-adcomputer -Filter * | ft
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
```
Run commands on them from that variable:
```
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {COMMAND}
```

* Domain controller info (name, ip)
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
Get-ADGroupMember Administrators
```
* If there is someone that should NOT be there,
```
Remove-AdGroupMember -Identity Administrators -Members NAME
```
## DOMAIN USERS 
```
get-aduser -Filter * | sort name | Select-Object Name, enabled, DistinguishedName
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

* Ad group info
```
get-adgroup
```



## Other possible useful commands
```
Remove-adcomputer
Remove-aduser
```
https://docs.microsoft.com/en-us/powershell/module/activedirectory/disable-adaccount?view=windowsserver2022-ps
