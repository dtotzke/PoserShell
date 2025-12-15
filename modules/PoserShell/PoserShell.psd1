@{
    # Module metadata
    RootModule = 'PoserShell.psm1'
    ModuleVersion = '0.1.0'
    GUID = 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d'
    
    Author = 'David Totzke'
    CompanyName = 'Dark Wizard Software Inc.'
    Copyright = '(c) 2025 David Totzke. All rights reserved.'
    Description = 'PowerShell module for various utilities and automation tasks'
    
    # PowerShell requirements
    PowerShellVersion = '7.0'
    CompatiblePSEditions = @('Core')
    DotNetFrameworkVersion = '8.0'
    
    # Module components
    # RootModule will load the psm1, which loads the appropriate DLL
    RequiredAssemblies = @()
    
    # Functions and cmdlets to export
    FunctionsToExport = @()
    CmdletsToExport = @('Get-PoserInfo')
    VariablesToExport = @()
    AliasesToExport = @()
    
    # Private data
    PrivateData = @{
        PSData = @{
            Tags = @('PowerShell', 'Utilities', 'Automation')
            LicenseUri = ''
            ProjectUri = ''
            ReleaseNotes = 'Initial release of PoserShell module'
        }
    }
}
