# ================================
# Kydras.Core.psm1
# Version: 1.2.0 (Log root moved to D:\)
# ================================

Set-StrictMode -Version Latest

function Say-Kydras {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message
    )
    Write-Host ("[Kydras] {0}" -f $Message)
}

function Get-KydrasWorkspace {
    [CmdletBinding()]
    param(
        [string]$DefaultPath = "$HOME\Kydras-Repos"
    )

    if (Test-Path -Path $DefaultPath) {
        return (Resolve-Path -Path $DefaultPath).Path
    }
    return $HOME
}

function Get-KydrasLogPath {
    [CmdletBinding()]
    param(
        [string]$AppName = "Kydras"
    )

    #
    # ===== PRIMARY CHANGE: logs now under D:\Users\kyler\Kydras-Logs =====
    #
    $base = "D:\Users\kyler\Kydras-Logs"

    if (-not (Test-Path -Path $base)) {
        New-Item -ItemType Directory -Path $base -Force | Out-Null
    }

    $appDir = Join-Path $base $AppName

    if (-not (Test-Path -Path $appDir)) {
        New-Item -ItemType Directory -Path $appDir -Force | Out-Null
    }

    return $appDir
}

Export-ModuleMember -Function Say-Kydras, Get-KydrasWorkspace, Get-KydrasLogPath
