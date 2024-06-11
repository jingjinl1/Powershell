# Define the group name and the new notes
$groupName = "XXXXX"
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

try {
    # Update the group's notes
    Set-ADGroup -Identity $groupName -Replace @{info=$newNotes} 
    Write-Output "`nUpdated notes for group: $groupName"

    # Get and display the group's updated notes
    $groupInfo = Get-ADGroup -Identity $groupName -Properties Description, info | Select-Object Name, info
    $groupInfo | Format-Table -AutoSize -Wrap
}
catch {
    Write-Error "Failed to update notes for group: $groupName"
}





# Update multiple group notes to the same one
$groupNames = @("Group1", 
                "Group2", 
                "Group3")  

# Define the new notes
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

# Loop through each group and update the notes
foreach ($groupName in $groupNames) {
    try {
        Set-ADGroup -Identity $groupName -Replace @{info=$newNotes}
        Write-Output "Updated notes for group: $groupName"
        
        $groupInfo = Get-ADGroup -Identity $groupName -Properties Description,info | Select-Object Name, info
        $groupInfo | Format-Table -AutoSize -Wrap
    }
    catch {
        Write-Error "Failed to update notes for group: $groupName"
    }
}


