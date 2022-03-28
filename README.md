# BlueTeam

Two different scripts: one for info and one for updates. 

To use the scripts for computers in a domain (put names of computers in a variable and run the command on each machine):
```
$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {.\info.ps1}
```
