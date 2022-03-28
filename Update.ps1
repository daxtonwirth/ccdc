set-MpPreference -DisableRealtimeMonitoring $False

Update-MpSignature


Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
