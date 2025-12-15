# PoserShell Module Tests

BeforeAll {
    # Import the module
    $modulePath = Join-Path $PSScriptRoot "..\modules\PoserShell\PoserShell.psd1"
    
    if (-not (Test-Path $modulePath)) {
        throw "Module manifest not found at $modulePath. Please build the module first."
    }
    
    Import-Module $modulePath -Force
}

Describe "PoserShell Module" {
    Context "Module Loading" {
        It "Should load successfully" {
            Get-Module PoserShell | Should -Not -BeNullOrEmpty
        }

        It "Should have correct version" {
            $module = Get-Module PoserShell
            $module.Version.ToString() | Should -Be "0.1.0"
        }

        It "Should be compatible with Core edition" {
            $module = Get-Module PoserShell
            $module.CompatiblePSEditions | Should -Contain "Core"
        }
    }

    Context "Get-PoserInfo Cmdlet" {
        It "Should exist" {
            Get-Command Get-PoserInfo -Module PoserShell | Should -Not -BeNullOrEmpty
        }

        It "Should return module information" {
            $info = Get-PoserInfo
            $info.ModuleName | Should -Be "PoserShell"
            $info.ModuleVersion | Should -Be "0.1.0"
            $info.TargetFramework | Should -Be "net8.0"
        }

        It "Should support -Detailed parameter" {
            $info = Get-PoserInfo -Detailed
            $info.PSVersion | Should -Not -BeNullOrEmpty
            $info.PSEdition | Should -Be "Core"
            $info.CLRVersion | Should -Not -BeNullOrEmpty
            $info.OSDescription | Should -Not -BeNullOrEmpty
        }
    }
}

AfterAll {
    Remove-Module PoserShell -Force -ErrorAction SilentlyContinue
}
