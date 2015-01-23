$packageName = "PackerCommunityPlugins"
$url64 = "https://github.com/packer-community/packer-windows-plugins/releases/download/pre-release/windows_amd64.zip"
$url = "https://github.com/packer-community/packer-windows-plugins/releases/download/pre-release/windows_386.zip"
$unzipLocation = "${env:chocolateyPackageFolder}"

Install-ChocolateyZipPackage $packageName $url $unzipLocation $url64