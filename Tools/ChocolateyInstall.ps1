$packageName = "packer-windows-plugins"
$url64 = "https://github.com/packer-community/packer-windows-plugins/releases/download/v1.0.0/windows_amd64.zip"
$url = "https://github.com/packer-community/packer-windows-plugins/releases/download/v1.0.0/windows_386.zip"
$unzipLocation = "${env:APPDATA}\packer.d\plugins"

Install-ChocolateyZipPackage $packageName $url $unzipLocation $url64
