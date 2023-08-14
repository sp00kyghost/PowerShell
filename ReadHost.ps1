## Author: Seth Prevott
# 06/20/2023 13:22:20
#This script uses Read-Host to read input (stdin) from console, saves into variable.  

$name = Read-Host "Please enter your name" 
$date = Get-Date  
Write-Output "Welcome $name!`n" 
Write-Output "Today's date is $date"
