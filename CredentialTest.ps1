## Author: Seth Prevott
# 06/20/2023 13:22:20
# Credential test 

$credential = Get-Credential $credential | Export-Clixml -Path 'c:\users\sprevott\OneDrive - OptumCare\Desktop\Intern Notes\Powershell Test\pwtest.xml'
