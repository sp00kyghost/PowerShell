## Author: Seth Prevott
# 06/20/2023 13:22:20
# Testing for Control-M  

# Prompt user for log in and Select which server to connect to 

function Get-Server { Write-Host "Servers available are `n1. DEV`n2. DEV02`n" -ForegroundColor Green     
            $server = Read-Host "Please select which server to connect to"     
            $session = $null
            

            Switch ($server) {         
            1 {$credential = Get-Credential -Message "Please enter your credentials for the server to continue"             
            $session = New-PSSession -ComputerName "example.com" -Credential $credential
            }

            2 {$credential = Get-Credential -Message "Please enter your credentials for the server to continue"             
            $session = New-PSSession -ComputerName "example.com" -Credential $credential
            }

            Default {"Input does not match. Please select from the above list." 
            Get-Server}     
            }

            if ($session) { Write-Output "`nConnection Successful! Creating session..."         
            Enter-PSSession $session

            <# Change directory to Control-M Common folder. Using Invoke-Command we can run on local and remote computers.
            -ScriptBlock allows us to run the commands #>

            Invoke-Command -Session $session -ScriptBlock {

            # First step, change folder to Control-M Common folder.
            $path = 'C:\Program Files\BMC Software\Control-M Common\bmcperl\bmcperl_V1'
            Set-Location -Path $path
            Write-Output "We are now inside the Control-M Common folder. `nIf you wish to begin converting OrderID's please call the 'orderIDConversion' function. It will also use our force_end_job script."

            # Created a way for the user to decide when to end session.
            Write-Output "You may exit the session at any time using '& `$ExitCmdlet'."
            $ExitCmdlet = {
                Write-Host "Exiting Session..."
                Exit-PSSession
            }

            # Create our functions that will convert our orderID / continue for more ID's.
            
            function moreID {
            
            $contChoice = Read-Host -Prompt "`nAre there more ID's you wish to convert / force end? {Y}/{N}"
            $contChoice = $contChoice.ToLower()
                
                switch ($contChoice) {
                    "y"{
                    $orderID = Read-Host -Prompt "Please enter the next order ID"
                    if($orderID -ne " "){
                        Invoke-Command -ScriptBlock {
                        $convertedID = p_36.exe $orderID
                        Write-Host "Converted ID $convertedID"

                        ECHO 'Y' | & .\perl.bat .\force_end_job.pl $orderID

                        moreID
                    }
           
                } 
        }
                    "n" {
                        Write-Host "Selected no, you will now return to the folder."
                        Set-Location $path
                        Write-Host "You may also use '& `$ExitCmdlet' to exit session."
                        break
                    }
                    default {
                     Write-Host "Input error detected, please enter Y or N"
                     moreID
                     }

        }
    }

            function orderIDConversion { 
            $userInput = Read-Host -Prompt "Would you like to convert order ID's to base 36 and force end? {Y}/{N}"
            # To account for all entries, Y/y or N/n use ToLower()
            $userInput = $userInput.ToLower()
                Switch ($userInput) {
                    "y" {
                    Write-Host "Selected yes, beginning process..."
                    $orderID = Read-Host -Prompt "Order ID"
                    if($orderID -ne " "){
                        Invoke-Command -ScriptBlock {
                            $convertedID = p_36.exe $orderID
                            Write-Host "Converted ID $convertedID`n"

                            ECHO 'Y' | & .\perl.bat .\force_end_job.pl $orderID

                            moreID
                           
                            }
                        }
                }
                    "n" {
                    Write-Host "Selected no, you will now return to the folder."
                    Set-Location $path
                    break
                     }
                     default {
                     Write-Host "Input error detected, please enter Y or N"
                     orderIDConversion
                             }
                         }
                     }
                  }
                }
            }
    

            
     Get-Server
     