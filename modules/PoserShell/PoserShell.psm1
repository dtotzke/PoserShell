# PoserShell Module Loader
# This script detects the PowerShell runtime and loads the appropriate framework-specific binary module

$ErrorActionPreference = 'Stop'

# Get module root directory
$ModuleRoot = $PSScriptRoot

# Verify we're running on PowerShell Core 7+
if ($PSVersionTable.PSEdition -ne 'Core' -or $PSVersionTable.PSVersion.Major -lt 7) {
    throw "PoserShell requires PowerShell 7.0 or higher. Current version: $($PSVersionTable.PSVersion)"
}

# Determine the target framework to load
# For now, we only support net8.0, but this can be extended for future frameworks
$targetFrameworks = @('net8.0', 'net7.0', 'net6.0')
$dllPath = $null

foreach ($framework in $targetFrameworks) {
    $candidatePath = Join-Path $ModuleRoot "$framework\PoserShell.dll"
    if (Test-Path $candidatePath) {
        $dllPath = $candidatePath
        Write-Verbose "Found PoserShell binary at: $dllPath"
        break
    }
}

if (-not $dllPath) {
    throw "Could not find PoserShell.dll for any supported framework ($($targetFrameworks -join ', ')) in $ModuleRoot"
}

# Load the binary module
try {
    # Load the assembly and import its types
    $assembly = [System.Reflection.Assembly]::LoadFrom($dllPath)
    Import-Module -Assembly $assembly -ErrorAction Stop
    Write-Verbose "Successfully loaded PoserShell module from $dllPath"
}
catch {
    throw "Failed to load PoserShell binary module: $_"
}

# Optional: Module cleanup on removal
$ExecutionContext.SessionState.Module.OnRemove = {
    Write-Verbose "PoserShell module is being removed"
    # Add any cleanup logic here if needed
}

# Export module members (cmdlets are exported via the manifest)
# Any additional script functions would be exported here
