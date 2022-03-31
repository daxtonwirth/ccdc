# BlueTeam

## Tasks:
1. Map network (nmap -sn -v <IP RANGE>)
2. Address Firewall/Router vulnerabilities 
3. Log onto machines and harden
* Disable useless accounts (Do not delete them just in case)
* Change passwords (Do not forget services like SQL)
* Stop unnecessary services (remoting, remote desktop)
* Update
* Enable windows defender, firewall
* Vuln scans + patch
4. Monitor


To run Powershell on CMD: 
```
powershell -ep bypass # execution bypass
```
```
pwsh # normal
```
Install PowerShell if not installed:
```
msiexec.exe /package PowerShell-7.2.2-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1
```

## Running the scripts
For computers in a domain (creates the list of computers and runs the script on each):
```
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {COMMAND}
```

## Scoring 
* Availability: Maintain high availability of your systems throughout
* Injects: Completing assigned business tasks graded by the White Team
* Social Engineering: students are expected to deal with social engineering measures appropriately.
* Attacks: Preventing unauthorized access by the Red Team / network intrusion teams
* Incident Reports: Documenting and remediating Red Team attacks
* Change Reports: Documenting and notification of network changes
  
## Useful commands:
Reset remote session if not working well
```
reset session {<sessionname> | <sessionID>} [/server:<servername>] [/v]
```
  
### Basic AD info
* DC contains NTDS.dit - a database that contains all of the information of an Active Directory domain controller as well as password hashes for domain users and stored in %SystemRoot%\NTDS
* forest is a collection of one or more domain trees inside of an Active Directory network
* two default users: Administrator and guest
1. Domain Admins - This is the big boss: they control the domains and are the only ones with access to the domain controller.
2. Service Accounts (Can be Domain Admins) - These are for the most part never used except for service maintenance, they are required by Windows for services such as SQL to pair a service with a service account
3. Local Administrators - These users can make changes to local machines as an administrator and may even be able to control other normal users, but they cannot access the domain controller
4. Domain Users - These are your everyday users. They can log in on the machines they have the authorization to access and may have local administrator rights to machines depending on the organization.
* Security Groups - These groups are used to specify permissions for a large number of users
* Domain Computers group - All workstations and servers joined to the domain
  
## Useful sites:
* https://gist.github.com/alexiasa/fba4466849fde5b9ec3dd3cd7d1b3e9f
* https://github.com/jordanpotti/ccdc
* https://sites.google.com/site/howtoccdc/tips
* https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/web-application-defenders-cookbook-ccdc-blue-team-cheatsheet/
* https://github.com/SouthwestCCDC/PS-CreateADLab
