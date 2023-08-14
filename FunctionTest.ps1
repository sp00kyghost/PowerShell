## Author: Seth Prevott
# 06/20/2023 13:22:20
#Small function script.  

function Greeting { param ([string]$greeting,
                            [string]$recipient     )     
# begin executes before function is processed.     

begin {Write-Output "Greeting function beginning."}

process { Write-Output "Data: $_"
Write-Output "$greeting, $recipient!" } 
end { "Function has ended.`n"}}  

"Value" | Greeting -greeting "Hello" -recipient "World"  "Random string" | Greeting -greeting "Hey there" -recipient "Seth"
