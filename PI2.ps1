## Author: Seth Prevott
# 06/20/2023 13:22:20
#Lets create a script to delete directories / files.  

#Get-Location tells us the current directory we are in. 

Write-Host "Our Current location is:" Get-Location  

Write-Output "`nThe current files in this directory are:" 

#Get-Childitem -Path will show us the files, or using ls. 

ls -Path "c:\users\sprevott\OneDrive - OptumCare\Desktop\Intern Notes\Powershell Test" -Name  

#Remove-Item -Path xxx -Confirm Write-Output "`nWe will now try to remove the newly created text file." 

Remove-Item -Path "c:\users\sprevott\OneDrive - OptumCare\Desktop\Intern Notes\Powershell Test\test.txt" -Confirm:$false  

Write-Output "`n The current files in this directory are:" 

ls -Path "c:\users\sprevott\OneDrive - OptumCare\Desktop\Intern Notes\Powershell Test" -Name
