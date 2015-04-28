# Packer Community Plugins Chocolatey Package

A [Chocolatey](http://chocolatey.org/) Package installer for Packer Community Plugins.

[![Build status](https://ci.appveyor.com/api/projects/status/gaun5h7g26f8mq98?svg=true)](https://ci.appveyor.com/project/mefellows/packer-community-chocolatey)

## Usage

From a Windows Powershell, run the following:

```
choco install packer-windows-plugins
```

## Development
 
``` 
cd C:\chocolateypackages
vagrant up
$env:build_number='23'
.\build.ps1 package
choco install packer-windows-plugins -source C:\chocolateypackages\Output\Packages -preRelease
```