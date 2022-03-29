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
* Domain ADMIN members:
```
Get-ADGroupMember administrators
```
* If there is someone that should NOT be there,
```
Remove-AdGroupMember -Identity GROUPNAME -Members NAME
```
* DOMAIN USERS 
```
get-aduser -Filter * | sort name | Select-Object Name, enabled, DistinguishedName
```
* Disable unneccessary users:
https://docs.microsoft.com/en-us/powershell/module/activedirectory/disable-adaccount?view=windowsserver2022-ps
```
Disable-ADAccount
```
* Change PASSWORD
It is better to change the important users passwords to update where they need and disable the regular user logins that are not needed. 
```
Set-ADAccountPassword USERNAME
```

Ad group info
```
get-adgroup
```



## Other possible useful commands
Remove-adcomputer
Remove-aduser
