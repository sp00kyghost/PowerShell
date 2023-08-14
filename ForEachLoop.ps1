## Author: Seth Prevott
# 06/20/2023 13:22:20
# Using foreach, we can go through an array titled $values.  

$values = 'A', 'mixed', 7, 'array', 4, 'of', 2, 'values' 
foreach ($s in $values){     Write-Host $s -ForegroundColor Green     }
