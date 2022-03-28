Priority|Task|Command
--|--|--|
High|Windows Defender + Firewall|
High|AD passwords|Set-ADAccountPassword -Identity <sAMAccountName> -Reset -NewPassword <password>
High|Change local passwords|net user <username> <PASSWORD>
High|Install Patches|
High|Disable SMB1|Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol 

  
  
  Other useful commands:
  
  Services:
  Get-Service | ? {$_.Status -eq "Running"}
  
  Remote firewall rules:
 Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
  Inbound traffic
   Get-NetFirewallRule -DisplayGroup Remote* -Enabled True | ft
  
  
  
  useful links:
  https://gist.github.com/alexiasa/fba4466849fde5b9ec3dd3cd7d1b3e9f
