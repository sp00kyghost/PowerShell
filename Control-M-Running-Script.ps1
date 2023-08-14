##Author: Seth Prevott
# 6/21/2023

# A script to connect to Control-M server, and check services.

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


            if ($session) { Write-Output "Connection Successful! Creating session...`n"         
            Enter-PSSession $session


            Invoke-Command -Session $session -ScriptBlock{
               # After establishing connection, gather services.
               $services = Get-Service | Where-Object { $_.DisplayName -like "*Control-M*"}

               # Set our CPU usage threshold and create our variable to store information for reporting.

               $cpuThresh = 85
               $report = @()

               # To report to teams, we can use webhook URL

               $teamsWebhook = "teamswebhook"

               # Iterate through our found services

     foreach ($service in $services) {
        $serviceStatus = $service.Status
        $cpuUsage = (Get-WmiObject -Class Win32_PerfFormattedData_PerfProc_Process | Where-Object { $_.Name -eq $service.Name}).PercentProcessorTime

        if ($serviceStatus -eq "Running") {
            Write-Host "The $($service.DisplayName) service is running."
            } else {
            $reportEntry = @{
                Service = $service.DisplayName
                Status = "Service is not running"
                CPUUsage = $cpuUsage
                }
                $report += $reportEntry
            }
        if ($cpuUsage -ge $cpuThresh) {
            $reportEntry = @{
                Service = $service.DisplayName
                Status = "High CPU Usage"
                CPUUsage = $cpuUsage
                }
                $report += $reportEntry
            }
        }

    # Generate our reports
    if ($report.Count -gt 0) {
        $message = "Control-M Services Report:`n`n"

        foreach ($entry in $report) {
            $message += "Service: $($entry.Service)`n"
            $message += "-Status: $($entry.Status)`n"
            $message += "-CPU Usage: $($entry.CPUUsage)%`n`n"
            }

        $body = @{
            text = $message} | ConvertTo-Json


            Invoke-RestMethod -Uri $teamsWebhook -Method Post -ContentType "application/json" -Body $body
        } else {
        Write-Host "No Control-M services with issues detected."
        }


        # After we are done with our gathering and report, end connection.

        Write-Output "`nReport generated in Teams. Exiting Session."
        Exit-PSSession}

                }
            }
            
     Get-Server 

     

     

    