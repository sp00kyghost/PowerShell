## Author: Seth Prevott
# 06/20/2023 13:22:20
#A simple back-up script using Parameters for Path, and a few IF checks / statements for input validation.  
<# It will throw error unless a 'app' folder exists, to use run script with -Path "Path\Wherever" and it will create.#>  
Param( [string]$Path = './app',   
       [string]$DestinationPath = './' ) 
       
 If (-Not (Test-Path $Path)){
            Throw "The source directory $Path does not exist, please specify an existing directory" }

$date = Get-Date -format "yyyy-MM-dd" 

$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')" 
            If (-Not (Test-Path $DestinationFile))  {
                    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
            Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')" } 
            Else {   Write-Error "Today's backup already exists" }
