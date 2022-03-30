# https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/08-powershell-remoting?view=powershell-7.2 
# One-To-One Remoting: WinRM (Enable-PSRemoting # Winrm; Enter-PSSession COMPUTERNAME) (WinRS (remote-shell): winrs -r: <HOSTNAME or IP> <COMMAND>)
# One-To-Many Remoting: invoke-command (icm)
# Commands that have remoting built in: Get-Command -ParameterName ComputerName
# If running slow, reduce the overhead with sessions: $Cred = Get-Credential; $Session = New-PSSession -ComputerName dc01, sql02, web01 -Credential $Cred

$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 


Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {

# Start windows defender and change startup to auto 
Set-Service -Name Windefend -Status Running -StartupType Automatic 
# Enable firewall
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True

# Updates
Install-Module PSWindowsUpdate 
Get-WindowsUpdate -AcceptAll -Install -AutoReboot 
wuauclt /detectnow /updatenow
Update-MpSignature

# Deactivate guest account
net user Guest /active:NO

#Turn off smb1
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

# Turn of ps remoting
Disable-PSRemoting
set-service winrm -Status Stopped -StartupType Disabled

}
