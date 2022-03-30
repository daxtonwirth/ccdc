# https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/08-powershell-remoting?view=powershell-7.2 
# One-To-One Remoting: WinRM (Enable-PSRemoting # Winrm; Enter-PSSession COMPUTERNAME) (WinRS (remote-shell): winrs -r: <HOSTNAME or IP> <COMMAND>)
# One-To-Many Remoting: invoke-command (icm)
# Commands that have remoting built in: Get-Command -ParameterName ComputerName
# If running slow, reduce the overhead with sessions: $Cred = Get-Credential; $Session = New-PSSession -ComputerName dc01, sql02, web01 -Credential $Cred

$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 


Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {


Disable-PSRemoting
stop-service winrm

start-service Windefend
Update-MpSignature
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True

# Updates
wuauclt /detectnow /updatenow

# Deactivate guest account + admin
net user Guest /active:NO
# net user Administrator /active:NO

Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol


}
