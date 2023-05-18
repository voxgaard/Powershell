$ServiceName = 'WLAN AutoConfig'

$ServiceInfo = Get-Service -Name $ServiceName

if ($ServiceInfo.Status -ne 'Running') {
	Write-Host 'Service is not started, starting service'
	Start-Service -Name $ServiceName
	$ServiceInfo.Refresh()
	Write-Host $ServiceInfo.Status
} else {
	Write-Host 'The service is already running.'
}
Set-Service –Name $ServiceName –StartupType “Automatic” 