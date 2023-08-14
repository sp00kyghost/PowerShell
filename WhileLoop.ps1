## Author: Seth Prevott
# 06/20/2023 13:22:20
# while loop will occur when our condition is true. using -gt (greater than)  

$x = 50 

while ($x -gt 0){
                $x--     
                $x      
# this if statement checks if our $x is divisible by 25, if so it will break the loop.      

if ($x % 25 -eq 0) {         break         }     }
