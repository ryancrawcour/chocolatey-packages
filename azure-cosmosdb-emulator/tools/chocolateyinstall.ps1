$ErrorActionPreference = 'Stop';

$packageName= 'azure-cosmosdb-emulator'
$softwareName = 'Azure Cosmos DB Emulator'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://aka.ms/documentdb-emulator'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  softwareName  = $softwareName 
  checksum      = '2ADE54AC7430771BAAC2213754BA6E1780D86F93DAF260513E1E5FD5895C9CF0'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

if(! (test-path "${Env:ProgramFiles}\Azure Cosmos DB Emulator\Microsoft.Azure.Cosmos.Emulator.exe")){
  Install-ChocolateyPackage @packageArgs
}
