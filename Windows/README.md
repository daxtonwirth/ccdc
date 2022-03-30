# Windows Hardening

1. Get Domain Computer names and IPs: 
```
Get-ADComputer -Filter * -Properties ipv4Address, OperatingSystem | Select-Object Name, IPv4Address, OperatingSystem, Enabled | ft
```
2. Run the info scipt
3. Run the updates script
4. Disable accounts & change passwords:
https://github.com/daxtonwirth/prccdc/blob/main/Windows/domain.md#user-disable-accounts
5. Monitor
6. Remove Creds and PII from systems (txt, excel, img)
  
## Other useful commands:
* Display information about sessions on a Remote Desktop Session Host server:
```
qwinsta
```
### KILL SESSION 
(get ID)
```
qwinsta /server:<NAME>
```
Kill ID
```
rwinsta /server:<NAME> <ID>
```
### Search for files and watch for DLP (there are lots of creds laying around which are sometimes useful in other injects: protect them):
```
 Get-ChildItem -Path C:\Users -Recurse -ErrorAction SilentlyContinue -Filter *.txt
```
* Remote firewall rules:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```
Inbound traffic:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```  


## PrivEsc auto enumeration scripts
* WinPEAS
https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS
* PowerUp.ps1
https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1

### Script ideas
Powershell/python that checks # of users

### Other ideas
Account lockout policy
