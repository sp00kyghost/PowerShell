## Author: Seth Prevott
# 06/20/2023 13:22:20
#Powershell Formatting output test. 

Write-Host "`nAn example of Get-Process | Get-Member together shows a verbose list." -ForegroundColor Red 

Get-Process | Get-Member  

<# Let's also create a test function to format our text with color.  This method is essentially just using 'Write-Host' not 'Write-Output' So I will have to change anyway.  
function Green { process { Write-Host $_ -ForegroundColor Green} }#>  

$coloroutput = "`n`n Using Format-Table allows us to see a few properties easier."  
Write-Host -ForegroundColor Green | Write-Output $coloroutput      

<#Write-Output "`n`n Using Format-Table allows us to see a few properties easier." | Green Get-Process | Format-Table | Get-Member#>
