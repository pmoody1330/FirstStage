function Folder {
    $Date = Get-Date -Format yyyy-MM-dd
    $Get_Name = Read-Host 'What folder name do you want created?'
    $Folder_Name = "$Date $Get_Name"
    $Current_Path = Get-Location
    $Change_Path = Read-Host "Do you want to change the path to a different folder. $Current_Path (y/N) "
    if( ($Change_Path -eq 'y') -or ($Change_Path -eq "Y") )
    {
        $Destination = Read-Host 'Enter the path you would like to have the folder created in.'
    }
    else {
        $Destination = '.'
    }
    Write-Output "Creating $Folder_Name"
    New-Item -ItemType Directory -Path $Destination -Name $Folder_Name
}
Folder