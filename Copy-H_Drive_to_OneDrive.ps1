if(!(test-path H:\ -ErrorAction SilentlyContinue))
{
    Write-Host "You are not connected to the H drive. Please connect the drive and run the script again." -ForegroundColor Red
    Break
}
Write-Host -MessageData 'A path that ends in a \ will move what is in the folder. A path that does not have a trailing \ will move whatever that item is (a folder or a document etc.)' -ForegroundColor Yellow
$Path_to_Copy = Read-Host -Prompt 'Please enter the path that you want to copy from (e.g. H:\).'
$Path_length = $Path_to_Copy.Length
if($Path_to_Copy.EndsWith('\'))
{
    cd $Path_to_Copy
    $Items = (Get-ChildItem .\* -Recurse)
}
else
{
    $Items = Get-ChildItem $Path_to_Copy
}
$ItemsCounter = $items.count
$Counter = 0
foreach ($Item in $Items) {
    $FullPath = $Item.FullName.Substring($Path_length)
    Copy-Item -Path $item.fullName -Destination "$env:USERPROFILE\OneDrive - FirstStage\$FullPath"
    $Counter++
    $Percent = (($Counter/$ItemsCounter)*100)
    Write-Progress -Activity "Copying items from $Path_to_Copy to OneDrive" -Status "Copying $Item from H to OneDrive" -PercentComplete $Percent
}
