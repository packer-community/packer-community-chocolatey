$packageName = "PackerCommunityPlugins"
$url64 = "https://github.com/packer-community/packer-windows-plugins/releases/download/pre-release/windows_amd64.zip"
$url = "https://github.com/packer-community/packer-windows-plugins/releases/download/pre-release/windows_386.zip"
$unzipLocation = "${env:APPDATA}\packer.d"

Install-ChocolateyZipPackage $packageName $url $unzipLocation $url64