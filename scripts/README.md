# Scripts Folder

This folder contains standalone PowerShell scripts that can be used independently or published to the PowerShell Gallery using `Publish-Script`.

## Usage

Run scripts directly from this folder:

```powershell
.\Get-Greeting.ps1 -Name "World"
```

Or dot-source them to import functions into your session:

```powershell
. .\Get-Greeting.ps1
```

## Publishing Scripts

To publish a script to the PowerShell Gallery:

```powershell
Publish-Script -Path .\Get-Greeting.ps1 -Repository PSGallery
```

## Best Practices

- Use proper comment-based help (`.SYNOPSIS`, `.DESCRIPTION`, etc.)
- Include `[CmdletBinding()]` for advanced function features
- Use approved verbs from `Get-Verb`
- Handle errors appropriately with try/catch
- Include examples in help documentation
