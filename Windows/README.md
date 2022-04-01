# Windows Hardening
### 1. Map Domain network for Domain Computer names and IPs. Once you get powershell, run "domain-info.ps1": 
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/domain-info.ps1
### 2. Run the info script on each computer (info.ps1)
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.ps1
### 3. Run the change script (change.ps1). If you get an error for a certain task, it was not successful.
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/Change.ps1
### 4. Disable local AND domain accounts OR change passwords (info.md AND domain.md):
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#active-users
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/domain.md#user-disable-accounts
### 5. Discover and disable unused services, changed necessary service passwords (info.md):
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#running-services
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#ports
### 6. Record and Remove Creds and PII from systems (txt, excel (.xlsx), service config files, img, etc.)
* Search for PII files: "Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.txt"
* Record info and delete files 
* CLEAR recycle bin: Clear-RecycleBin
### 7. Run Vuln scans and harden as necessary
### 8. Monitor

---
## To run Powershell: 
```
pwsh 
```
Or bypass execution:
```
powershell -ep bypass 
```
### Powershell version
```
$psversiontable
```

## Install PowerShell:
```
msiexec.exe /package PowerShell-7.2.2-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1
```
* Install or update:
https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/install/installing-windows-powershell?view=powershell-7.2

## Running the scripts
For computers in a domain (creates the list of computers and runs the script on each):
```
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {COMMAND}
```


---
## Other useful commands:
* Display information about sessions on a Remote Desktop Session Host server:
```
qwinsta
```
## KILL SESSION 
It is encouraged NOT to play whack-a-mole: patch the hole then boot
* Get ID
```
qwinsta /server:<NAME>
```
* Kill session with ID
```
rwinsta /server:<NAME> <ID>
```
---
## Search for files 
Watch for DLP (there are lots of creds laying around which are sometimes useful in other injects: protect them(txt, excel (.xlsx), service config files, img, etc.)):
```
Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.txt
Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.xlsx
```
---
### Remote firewall rules:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```
Inbound traffic:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```  
### History
```
(Get-PSReadlineOption).HistorySavePath
```
# Powershell cheatsheet
https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993
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
---
### PrivEsc auto enumeration scripts
* WinPEAS
https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS
* PowerUp.ps1
https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1

### Script ideas
* Powershell/python that checks # of users/new user ( get-localuser | select-object Name, LastLogon)
* New process script that checks and alerts of new processes
* Account lockout policy

