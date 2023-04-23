$DmgcmdPath = "C:\Program Files\Microsoft Integration Runtime\5.0\Shared\dmgcmd.exe"

function Write-Log($Message) {
    function TS { Get-Date -Format 'MM/dd/yyyy HH:mm:ss' }
    Write-Host "[$(TS)] $Message"
}

function Check-Main-Process() {
    $ProcessResult = Get-WmiObject Win32_Process -Filter "name = 'diahost.exe'"

    if ($ProcessResult) {
        return $TRUE
    }

    Write-Log "diahost.exe is not running"
    return $FALSE
}

if (Check-Main-Process) {
    Write-Log "Stop the node connection"
    Start-Process $DmgcmdPath -Wait -ArgumentList "-Stop"
    Write-Log "Stop the node connection successfully"
}

Write-Log "Geting token"
$body = @{
    grant_type="client_credentials"
    client_id=$Env:CLIENT_ID
    client_secret=$Env:CLIENT_SECRET
    scope="https://management.core.windows.net/.default"
}
$auth = Invoke-WebRequest -Uri "https://login.microsoftonline.com/$Env:TENANT_ID/oauth2/v2.0/token" -Method POST -Body $body -UseBasicParsing
$token = ($auth.Content | ConvertFrom-Json).access_token
Write-Log "Token acquired seccessfully"

Write-Log "Deleting node"
$headers = @{
    'Authorization' = "Bearer $token"
}

$Hostname = hostname
Invoke-WebRequest -Method DELETE -Headers $headers -Uri "https://management.azure.com/subscriptions/$Env:SUBSCRIPTION_ID/resourceGroups/$Env:RESOURCE_GROUP_NAME/providers/Microsoft.DataFactory/factories/$Env:DATA_FACTORY_NAME/integrationRuntimes/$Env:INTEGRATION_RUNTIME_NAME/nodes/$(Hostname)?api-version=2018-06-01" -UseBasicParsing | out-null
Write-Log "Node deleted successfully"
