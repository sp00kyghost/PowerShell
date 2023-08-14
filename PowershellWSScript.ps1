## Author: Seth Prevott
# 06/20/2023 13:22:20
# Simple script to gather processes via WS (Working Size). Using -Descending will make the largest WS appear at the top, however you must use -First. 

Get-Process | Sort-Object -Property WS | Select-Object -Last 10
