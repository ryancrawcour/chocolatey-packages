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
  checksum      = 'DAB2CFFB254142000E7F011CEA3CF6CA2FB96E755A146EEBB06117B000869CBC'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

if(! (test-path "${Env:ProgramFiles}\Azure Cosmos DB Emulator\Microsoft.Azure.Cosmos.Emulator.exe")){
  Install-ChocolateyPackage @packageArgs
}
else{
  throw “Cosmos DB Emulator already installed. Nothing to do.”
}
