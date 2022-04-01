# https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/08-powershell-remoting?view=powershell-7.2 
# One-To-One Remoting: WinRM (Enable-PSRemoting # Winrm; Enter-PSSession COMPUTERNAME) (WinRS (remote-shell): winrs -r: <HOSTNAME or IP> <COMMAND>)
# One-To-Many Remoting: invoke-command (icm)
# Commands that have remoting built in: Get-Command -ParameterName ComputerName
# If running slow, reduce the overhead with sessions: $Cred = Get-Credential; $Session = New-PSSession -ComputerName dc01, sql02, web01 -Credential $Cred

$COMPUTERS = Get-ADComputer -Filter * | % {$_.name} 
Invoke-Command -ComputerName $COMPUTERS -ScriptBlock {

"1. Start windows defender and change startup to auto"
Set-Service -Name Windefend -Status Running -StartupType Automatic 
"2. Enable real-time monitoring"
set-MpPreference -DisableRealtimeMonitoring $False

"3. Enable firewall"
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled True

"4. update antivirus signatures"
Update-MpSignature

"5. Deactivate guest account"
net user Guest /active:NO

"6. Turn off smb1"
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

"7. Updates with community module"
Install-Module PSWindowsUpdate 
Get-WindowsUpdate -AcceptAll -Install -AutoReboot 

"8. Confirm updates using old method"
wuauclt /detectnow /updatenow

"9. Disable ps remoting"
Disable-PSRemoting
"10. Stop PS remoting"
set-service winrm -Status Stopped -StartupType Disabled

} | Tee-Object -file CHANGE-script.txt
