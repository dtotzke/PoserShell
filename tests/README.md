# Tests Folder

This folder contains Pester tests for the PoserShell module and scripts.

## Prerequisites

Ensure Pester 5 is installed:

```powershell
Install-Module -Name Pester -MinimumVersion 5.0.0 -Force -SkipPublisherCheck
```

## Running Tests

Run all tests:

```powershell
Invoke-Pester
```

Run specific test file:

```powershell
Invoke-Pester -Path .\tests\PoserShell.Tests.ps1
```

Run with detailed output:

```powershell
Invoke-Pester -Output Detailed
```

Generate code coverage report:

```powershell
Invoke-Pester -CodeCoverage ..\src\**\*.cs -Output Detailed
```

## Test Structure

- `PoserShell.Tests.ps1` - Tests for the binary module cmdlets
- `Get-Greeting.Tests.ps1` - Tests for the example script

## Best Practices

- Use `Describe`, `Context`, and `It` blocks to organize tests
- Use `BeforeAll`/`AfterAll` for setup and cleanup
- Test both success and error scenarios
- Use meaningful test descriptions
- Mock external dependencies when appropriate
