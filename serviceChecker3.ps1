# Function to check the status of a given service
function Check-ServiceStatus{
    param($serviceName)
    # Get the status of the specified service
    $service_status = (Get-Service -Name $serviceName).Status
    # If the service is stopped, return false; otherwise return true
    if ($service_status -eq 'Stopped'){
        return $false
    }else{
        return $true
    }
}

# Array of service names to check
$services = @("wuauservf", "Windefend", "spooler", "BITS")


# Loop through each service in the array
foreach ($service in $services){
    # Check the status of the current service using the Check-ServiceStatus function 
    if (Check-ServiceStatus $service){
        # If the service is running, display a message
        Write-Host "$service is running."
    }else{
        # If the service is stopped, display a message and attempt to start it
        Write-Host "$service is stopped. Attempting to start..."
        # The following line is commented out
        #Start-Service -Name $service
    }
}