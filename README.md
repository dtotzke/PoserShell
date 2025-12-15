# PoserShell

A PowerShell 7+ module and script collection for various utilities and automation tasks.

## Workspace Structure

```
PoserShell/
├── src/                    # C# binary module source
│   └── PoserShell/        # Main module project (net8.0)
├── modules/               # Built module output
│   └── PoserShell/        # Module folder for Publish-Module
│       ├── net8.0/        # Framework-specific DLL
│       ├── PoserShell.psd1   # Module manifest
│       └── PoserShell.psm1   # Loader shim
├── scripts/               # Standalone PowerShell scripts
└── tests/                 # Pester tests
```

## Requirements

- PowerShell 7.0 or higher
- .NET 8.0 SDK (for building the C# module)

## Building

```powershell
# Build the C# module
dotnet build src/PoserShell/PoserShell.csproj -c Release

# Import the module
Import-Module ./modules/PoserShell/PoserShell.psd1
```

## Testing

```powershell
# Run Pester tests
Invoke-Pester ./tests/
```

## Publishing

```powershell
# Publish module to PowerShell Gallery
Publish-Module -Path ./modules/PoserShell -Repository PSGallery

# Publish standalone scripts
Publish-Script -Path ./scripts/YourScript.ps1 -Repository PSGallery
```
