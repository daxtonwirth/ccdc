# Windows Hardening
### 1. Map network for Domain Computer names and IPs. Once you get a windows machine, run this command to get others on domain: 
```
Get-ADComputer -Filter * -Properties ipv4Address, OperatingSystem | Select-Object Name, IPv4Address, OperatingSystem, Enabled | ft
```
### 2. Run the info scripts (info.ps1, domain-info.ps1)
### 3. Run the change script (change.ps1)
### 4. Disable local AND domain accounts OR change passwords (info.md AND domain.md):
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#active-users
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/domain.md#user-disable-accounts
### 5. Discover and disable unused services, changed necessary service passwords (info.md):
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#running-services
* https://github.com/daxtonwirth/prccdc/blob/main/Windows/info.md#ports
### 6. Record and Remove Creds and PII from systems (txt, excel (.xlsx), service config files, img, etc.)
* Search for files: "Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.txt"
### 7. Monitor
  
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
## Search for files 
Watch for DLP (there are lots of creds laying around which are sometimes useful in other injects: protect them(txt, excel (.xlsx), service config files, img, etc.)):
```
Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.txt
Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.xlsx
```
### Remote firewall rules:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```
Inbound traffic:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```  

### PrivEsc auto enumeration scripts
* WinPEAS
https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS
* PowerUp.ps1
https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1

### Script ideas
* Powershell/python that checks # of users/new user
* Account lockout policy
