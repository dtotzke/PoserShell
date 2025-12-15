<#
.SYNOPSIS
    Example PowerShell script demonstrating common patterns.

.DESCRIPTION
    This script serves as a template for standalone PowerShell scripts in the PoserShell workspace.
    It demonstrates parameter handling, error handling, and verbose output.

.PARAMETER Name
    The name to greet.

.PARAMETER Detailed
    Show detailed output including system information.

.EXAMPLE
    .\Get-Greeting.ps1 -Name "World"
    Displays a greeting message.

.EXAMPLE
    .\Get-Greeting.ps1 -Name "PowerShell" -Detailed -Verbose
    Displays a detailed greeting with verbose output.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Name = "User",

    [Parameter(Mandatory = $false)]
    [switch]$Detailed
)

$ErrorActionPreference = 'Stop'

function Get-SystemInfo {
    [CmdletBinding()]
    param()

    Write-Verbose "Gathering system information..."
    
    [PSCustomObject]@{
        PSVersion = $PSVersionTable.PSVersion.ToString()
        PSEdition = $PSVersionTable.PSEdition
        OS = $PSVersionTable.OS
        Platform = $PSVersionTable.Platform
    }
}

try {
    Write-Verbose "Starting Get-Greeting script"
    
    $greeting = "Hello, $Name!"
    Write-Output $greeting

    if ($Detailed) {
        Write-Output "`nSystem Information:"
        $sysInfo = Get-SystemInfo
        $sysInfo | Format-List
    }

    Write-Verbose "Script completed successfully"
}
catch {
    Write-Error "An error occurred: $_"
    exit 1
}
