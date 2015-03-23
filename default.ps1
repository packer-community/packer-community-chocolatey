properties {
  $chocolateyHome = ".\Packages\chocolatey.0.9.8.27\tools\chocolateyInstall"
  $chocolatey = "${chocolateyHome}\chocolatey.ps1"
  $outputDir = ".\Output"
  $outputPackageDir = "${outputDir}\Packages"
  $outputModuleManifestDir = "${outputDir}\ModuleManifests"
  $version = "1.0.0"
  $buildNumber = $env:BUILD_NUMBER
  $meta = "-RC"
}

task default -depends Clean

task Package -depends Clean {
  if ($buildNumber) {
    $version = "${version}${meta}${buildNumber}"
  }
  if (-not (Test-Path $outputPackageDir)) {
    New-Item -ItemType directory -Path $outputPackageDir
  }
  Get-ChildItem *.nuspec -Recurse | Foreach-Object {
    Update-ModuleManifestVersion -Path $_.DirectoryName -Version $version -OutputDir $outputModuleManifestDir
    # chocolatey pack expects a package name argument only, quotes are necessary to inject the additional OutputDir argument
    exec { & $chocolatey pack """$($_.FullName)"" -OutputDir $(Resolve-Path $outputPackageDir) -Version $version" }
  }
}

task Clean {
  if (Test-Path $outputDir) {
    Remove-Item $outputDir -Recurse -Force
  }
}

function Update-ModuleManifestVersion {
  param (
    [parameter(Mandatory = $true)]
    [string]$Path,

    [parameter(Mandatory = $true)]
    [string]$OutputDir,

    [parameter(Mandatory = $true)]
    [string]$Version
  )

  if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType directory -Path $OutputDir
  }

  Get-ChildItem -Path $Path -Filter *.psd1 | Foreach-Object {
    $updatedModuleManifestPath = "${OutputDir}\$($_.Name)"
    (Get-Content($_.FullName)) | ForEach-Object {$_ -replace "ModuleVersion\s+=\s+'[\d\.]+'", "ModuleVersion = '$Version'"} | Set-Content($updatedModuleManifestPath)
  }
}
