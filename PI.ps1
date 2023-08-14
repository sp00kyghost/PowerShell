## Author: Seth Prevott
# 06/20/2023 13:22:20
# PI.ps1 quick intro script, with some extra cmdlets 

$PI = 3.14 

Write-Host "The value of `$PI is $PI" 

# backtick ` allows us to escape first interpolation 

Write-Host "An expression of `$PI + 1 is $($PI + 1)`n" # An expression of PI + 1  

# Get-Location tells us the current directory we are in. 

Write-Host "Our Current location is:" Get-Location  

# Write-Host places this text above Get-Location, Write-Output shows below as intended.

Write-Output "`nLet's create a new file using New-Item or ni."  

#New-Item -Path xxx -ItemType xxx -Confirm for test purposes. -Confirm:$false will skip prompt to create file yes/no 

New-Item -Path . -Name "test.txt" -ItemType "file" -Confirm:$false  

#Get-Childitem -Path helps us see the files we created or already in directory. 

ls -Path "c:\users\sprevott\OneDrive - OptumCare\Desktop\Intern Notes\Powershell Test" -name 
