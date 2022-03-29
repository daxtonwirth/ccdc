# Windows Hardening

1. Run the info scipt
2. Run the updates script
3. Disable user accounts https://github.com/daxtonwirth/prccdc/blob/main/Windows/domain.md#user-disable-accounts

  
## Other useful commands:
* Remote firewall rules:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```
* Inbound traffic:
```
Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
```  
Search for files (useful in injects):
```
Get-ChildItem -Path D:\ -Recurse -ErrorAction SilentlyContinue -Filter *.txt
```
