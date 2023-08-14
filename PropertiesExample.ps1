## Author: Seth Prevott
# 06/20/2023 13:22:20
# An example script that helps show us the use of properties.  

# -Path . will get the entire contents of the directory we are inside of. 
# using | to tie Sort-Object with the first cmdlet, sorted by bite size of file.  

Get-ChildItem -Path . | Sort-Object Length -Descending | Format-Table -Property Name, Length   

<# Another example is using Get-Date. By creating our variable, assigning to to Get-Date, we can then use GetType and Select-Object to get more information.#>  

$date = Get-Date $date.GetType() | Select-Object Year, Month, Day  

#Our final example will be Get-Process 

Get-Process | Select-Object ProcessName,Id | Where-Object {$_.ProcessName}
