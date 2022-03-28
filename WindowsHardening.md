Priority|Task|Procedure
--|--|--|--|
High|Windows Defender + Firewall|
High|AD passwords|Set-ADAccountPassword -Identity <sAMAccountName> -Reset -NewPassword <password>
High|Change local passwords|net user <username> <PASSWORD>
High|Install Patches|
High|Disable SMB1|Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol 
