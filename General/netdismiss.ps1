if (Test-Path "C:\IT_Session") {
    Get-WmiObject -ClassName Win32_MappedLogicalDisk | Select-Object PSComputerName, Name,ProviderName | Out-File -FilePath .\Drive_Restore.txt
}
else {
    New-Item -ItemType Directory -Path C:\IT_Session
    Get-WmiObject -ClassName Win32_MappedLogicalDisk | Select-Object PSComputerName, Name,ProviderName | Out-File -FilePath C:\IT_Session\Drive_Restore.txt
}
Write-Host 'Mapped drive paths have been stored within Drive_Restore.txt in the current directory.'
net use * /delete