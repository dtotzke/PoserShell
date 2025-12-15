# Get-Greeting Script Tests

BeforeAll {
    $scriptPath = Join-Path $PSScriptRoot "..\scripts\Get-Greeting.ps1"
    
    if (-not (Test-Path $scriptPath)) {
        throw "Script not found at $scriptPath"
    }
}

Describe "Get-Greeting Script" {
    Context "Parameter Handling" {
        It "Should run with default parameters" {
            $output = & "$PSScriptRoot\..\scripts\Get-Greeting.ps1"
            $output | Should -Match "Hello, User!"
        }

        It "Should accept custom Name parameter" {
            $output = & "$PSScriptRoot\..\scripts\Get-Greeting.ps1" -Name "PowerShell"
            $output | Should -Match "Hello, PowerShell!"
        }

        It "Should provide detailed output when requested" {
            $output = & "$PSScriptRoot\..\scripts\Get-Greeting.ps1" -Detailed
            $output | Should -Match "System Information"
        }
    }

    Context "Script Functions" {
        BeforeAll {
            . "$PSScriptRoot\..\scripts\Get-Greeting.ps1"
        }

        It "Should define Get-SystemInfo function when dot-sourced" {
            Get-Command Get-SystemInfo -ErrorAction SilentlyContinue | Should -Not -BeNullOrEmpty
        }

        It "Get-SystemInfo should return valid information" {
            $info = Get-SystemInfo
            $info.PSVersion | Should -Not -BeNullOrEmpty
            $info.PSEdition | Should -Be "Core"
            $info.Platform | Should -Not -BeNullOrEmpty
        }
    }
}
