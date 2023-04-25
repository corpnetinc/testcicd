$DmgcmdPath = "C:\Program Files\Microsoft Integration Runtime\5.0\Shared\dmgcmd.exe"
# $ShirUrl = "https://go.microsoft.com/fwlink/?linkid=839822&clcid=0x409"
$ShirUrl = "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/IntegrationRuntime_5.28.8488.1.msi"
$VCUrl = "https://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe"
#$JDKUrl = "https://aka.ms/download-jdk/microsoft-jdk-17.0.3-windows-x64.msi"
$JDKUrl = "https://objects.githubusercontent.com/github-production-release-asset-2e65be/372924428/fe574225-df23-47c7-900e-98a68c919248?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230421%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230421T174541Z&X-Amz-Expires=300&X-Amz-Signature=a843c7e9190c0fc93ea0fefb0fc3f335d3753580df64aae7a45abeb77d8c9894&X-Amz-SignedHeaders=host&actor_id=16370118&key_id=0&repo_id=372924428&response-content-disposition=attachment%3B%20filename%3DOpenJDK8U-jdk_x64_windows_hotspot_8u372b07.msi&response-content-type=application%2Foctet-stream"

function Write-Log($Message) {
    function TS { Get-Date -Format 'MM/dd/yyyy hh:mm:ss' }
    Write-Host "[$(TS)] $Message"
}

function DownloadAndInstall($Name, $Uri, $FileName) {
    Write-Log "Install the $Name in the Windows container"

    $Files = (Get-ChildItem -Path C:\SHIR | Where-Object { $_.Name -eq $FileName })
    if ($Files) {
        $FileName = $Files[0].Name
        Write-Log "Using $Name file: $FileName"
    }
    else {
        Write-Log "Downloading latest version of $Name file"

        # Temporarily disable progress updates to speed up the download process. (See https://stackoverflow.com/questions/69942663/invoke-webrequest-progress-becomes-irresponsive-paused-while-downloading-the-fil)
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -Uri $Uri -OutFile "C:\SHIR\$FileName"
        $ProgressPreference = 'Continue'
    }


    Write-Log "Installing $Name"
    if ($FileName.endsWith(".msi")) {
        Start-Process msiexec.exe -Wait -ArgumentList "/i C:\SHIR\$FileName /qn"
    } else {
        Start-Process "C:\SHIR\$FileName" -Wait -ArgumentList '/q /norestart'
    }
    if (!$?) {
        Write-Log "$Name Install Failed"
        exit 1
    }
    Remove-Item -Path "C:\SHIR\$FileName"

    Write-Log "$Name Install Successfully"
}

function Install-SHIR() {
    DownloadAndInstall 'SHIR MSI' $ShirUrl 'IntegrationRuntime.latest.msi'
}

function Install-VC() {
    DownloadAndInstall 'VC++ Runtime' $VCUrl 'vc_redist.exe'
}

function Install-Java() {
    DownloadAndInstall 'Oracle JRE 8' $JDKUrl 'jre.msi'
    Move-Item -Path "C:\Program Files\Java\jre-1.8" -Destination "C:\Java"
    New-Item -ItemType SymbolicLink -Path "C:\Program Files\Java\jre-1.8" -Target "C:\Java" | out-null
}

function SetupEnv() {
    Write-Log "Begin to Setup the SHIR Environment"
    Start-Process $DmgcmdPath -Wait -ArgumentList "-Stop -StopUpgradeService -TurnOffAutoUpdate"
    Write-Log "SHIR Environment Setup Successfully"
}

function CleanUp-Space() {
    Remove-Item -Recurse -Force C:\Windows\Installer
    Remove-Item -Recurse -Force "C:\ProgramData\Microsoft\Data Transfer\DataManagementGatewayUpgrade\Version"
    Remove-Item -Recurse -Force "C:\Program Files\Microsoft Integration Runtime\5.0\Shared\ODBC Drivers"
}

Install-VC
Install-Java
Install-SHIR
SetupEnv
CleanUp-Space

exit 0
