# BlueTeam

## Tasks:
1. Map network (nmap -sn -v <IP RANGE>)
* https://nmap.org/download#windows
2. Address Firewall/Router vulnerabilities 
3. Log onto machines and harden
* Disable useless accounts (Do not delete them just in case)
* Change passwords (Do not forget services like SQL)
* Stop unnecessary services (remoting, remote desktop)
* Update
* Enable windows defender, firewall
4. Vuln scans + patch
5. Monitor

### Remoting Software
https://mobaxterm.mobatek.net/


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
  
## Useful sites:
* [**Popular Enumeration Scripts**](https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993)
* https://gist.github.com/alexiasa/fba4466849fde5b9ec3dd3cd7d1b3e9f
* https://github.com/jordanpotti/ccdc
* https://sites.google.com/site/howtoccdc/tips
* https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/web-application-defenders-cookbook-ccdc-blue-team-cheatsheet/
* https://github.com/SouthwestCCDC/PS-CreateADLab
