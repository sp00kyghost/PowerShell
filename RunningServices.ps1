## Author: Seth Prevott
# 06/20/2023 13:22:20
# Small script to gather running services, and print to file. 
# You can change $_.Status -eq "Stopped" to get a different list.  

Get-Service | Where-Object {$_.Status -eq "Running"} | Out-File "c:\users\sprevott\Desktop\Intern Notes\Powershell Test\Running_Services.txt"  

Get-Service | Where-Object {$_.Status -eq "Stopped"} | Out-File "c:\users\sprevott\Desktop\Intern Notes\Powershell Test\Stopped_Services.txt"
