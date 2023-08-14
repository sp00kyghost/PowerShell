## Author: Seth Prevott
# 06/20/2023 13:22:20
#A script to help manage services.  

#Start by getting a list of all services.  

Get-Service  

# To stop a service, use Stop-Service -Name xxx "use quotes if service name has a space" 

Stop-Service -Name AdobeARMservice  

# To start a service, use Start-Service -Name xxx  

Start-Service -Name AdobeARMservice  

# To set a services' startup type use Set-Service and Startup-Type  

Set-Service -Name AdobeARMservice -StartupType Automatic
