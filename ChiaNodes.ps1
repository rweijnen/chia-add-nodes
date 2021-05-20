$chiaPath = "$ENV:LocalAppData\chia-blockchain\*\resources\app.asar.unpacked\daemon"
$chiaFolder = Resolve-Path $chiaPath | select -First 1
$chiaExe =  Join-Path -Path $chiaPath -ChildPath 'chia.exe'

$apiUri = 'https://chia.powerlayout.com/nodes?block_height=true'
$json = Invoke-RestMethod -Uri $apiUri

foreach ($node in ($json.nodes))
{
    $arguments = "show -a $($node.ip):$($node.port)"
    Start-Process -FilePath $chiaExe -ArgumentList @($arguments) -Wait -NoNewWindow
}
