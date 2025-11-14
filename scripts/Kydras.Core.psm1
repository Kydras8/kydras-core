# Kydras.Core.psm1
# Shared PowerShell helpers for Kydras environments.

function Say-Kydras {
    param(
        [Parameter(Mandatory)]
        [string]
    )
    Write-Host ("[Kydras] {0}" -f )
}

function Get-KydrasWorkspace {
    param(
        [string] = "C:\Users\kyler\Kydras-Repos"
    )
    if (Test-Path ) {
        return (Resolve-Path ).Path
    }
    return C:\Users\kyler
}

function Get-KydrasLogPath {
    param(
        [string] = "Kydras"
    )
     = Join-Path C:\Users\kyler "Kydras-Logs"
    if (-not (Test-Path )) {
        New-Item -ItemType Directory -Force -Path  | Out-Null
    }
     = Join-Path  
    if (-not (Test-Path )) {
        New-Item -ItemType Directory -Force -Path  | Out-Null
    }
    return 
}

Export-ModuleMember -Function Say-Kydras,Get-KydrasWorkspace,Get-KydrasLogPath
