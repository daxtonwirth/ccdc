get-adcomputer -Filter * | ft

$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 

Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {.\info.ps1}
