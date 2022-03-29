# BlueTeam

Tasks:
1. Scan network: nmap -sn -v <IP RANGE>
2. Log onto machines and harden
3. Turn off unnessesary services, remoting


To run Powershell on CMD: 
```
pwsh
```


To use the scripts for computers in a domain (put names of computers in a variable and run the command on each machine):
```
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {COMMAND}
```

## Useful commands:
Search for files:
```
Get-ChildItem -Path D:\ -Recurse -ErrorAction SilentlyContinue -Filter *.txt
```
Reset remote session
```
reset session {<sessionname> | <sessionID>} [/server:<servername>] [/v]
```
