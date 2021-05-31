Get-Module HydroQuebec | Remove-Module
Import-Module $PSScriptRoot\..\HydroQuebec\HydroQuebec.psm1

Describe "DescribeName" {
    Context "ContextName" {
        It "ItName" {
            Assertion
        }
    }
}