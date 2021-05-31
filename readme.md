# Formation Powershell Hydro-Québec

- [Formation Powershell Hydro-Québec](#formation-powershell-hydro-québec)
  - [Introduction](#introduction)
  - [Manipulation de IIS](#manipulation-de-iis)
  - [Variable et création de fonction](#variable-et-création-de-fonction)
  - [Modules](#modules)
  - [Tester du powershell](#tester-du-powershell)

## Introduction

Présenter powershell en 5 minutes

* Exemples de fonctions: Get-Process Get-Service Get-ChildItem
* Alias
* Les opérations boolean: eq ne gt ge lt le like match is contains in not and or xor
* Les unités de mesure: kb mb gb

``` powershell
# utiliser control+space après $_. pour démontrer le auto-complete
ls c:\Windows | Where-Object { $_.Length -gt 3mb}
```

* PS Drives
* Piping

``` powershell
# utiliser control+space après $_. pour démontrer le auto-complete
Get-ChildItem HKCU:\SOFTWARE\Classes\ | Where-Object { $_.PSChildName.StartsWith(".") -and ($_ | Get-ItemProperty)."(default)" -like "7-zip*" }
```

* Dotnet en arrière
``` powershell
"test".GetType()

"Test".ToCharArray()

"Test".ToCharArray() | Where-Object { $_ -ge 65 -and $_ -le 90 }

"test" -split ""

[Convert]::ToInt32("65")

[int]"65"

[uri]"http://google.com"
```

* 

## Manipulation de IIS

Présenter IIS 2-3 minutes

``` powershell
Import-Module WebAdministration

ls IIS:\ApplicationPools | Restart-WebAppPool

New-WebAppPool -Name "nuEVA"

Set-ItemProperty -Path IIS:\AppPools\NewAppPool managedRuntimeVersion "v4.0"

New-Website -Name nuEVA -Port 80 -HostHeader nueva.hydro.qc.ca -ApplicationPool nuEVA -PhysicalPath c:\inetpub\nueva

```

## Variable et création de fonction

Environ 15 minutes

* L'utilisation des variables.

``` powershell
$name = "WinRM"
Get-Service -Name $name
```

* Hash table

``` powershell
$spell = @{
    Name = "Fire"
    Mana = "7"
}

$item.Name
```

* Arrays

``` powershell
$arr = @("a", "b", "c")
$arr = ("a", "b", "c")
$arr = "a", "b", "c"

$arr.GetType()


$spells = @(
    @{
        Name = "Fire"
        Mana = "7"
    },
    @{
        Name = "Blizzard"
        Mana = "8"
    },
    @{
        Name = "Thunder"
        Mana = "7"
    }
)

$spells.Name
```

* Json

``` powershell
$hq = Get-Content .\hydroquebec.json | ConvertFrom-Json
$hq.employees
$hq.employees.name
```


* Création de fonction

Dans VS Code, utiliser le snippet function

``` powershell
Get-Verb
```

* Paramètres de fonction

Dans VS Code, utiliser le snippet function


* Multiple returns

``` powershell
function Test-ArrayReturn {
    "valeur1"
    "valeur2"
    "valeur3"
}

Test-ArrayReturn -join ", "
(Test-ArrayReturn) -join ", "
```

* Splatting de variable

``` powershell
$service = @{ Name = "WinRM" }
Get-Service @service
```

## Modules

Présentation des modules. En 5 à 10 minutes

## Tester du powershell

Présenter Pester pour 10 minutes