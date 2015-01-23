$nugetHome = ".\.nuget\NuGet.CommandLine.2.8.2\tools"
$nuget = "${nugetHome}\NuGet.exe"
& $nuget install .\.nuget\packages.config -OutputDirectory .\Packages -NonInteractive
Import-Module (Join-Path $PSScriptRoot "Packages\psake.4.3.2\tools\psake.psm1")
Invoke-Psake @args
if (-not $psake.build_success) {
  exit 1
}