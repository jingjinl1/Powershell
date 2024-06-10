# Define the group name and the new notes
$groupName = "XXXXX"
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

# Update the group's notes
Set-ADGroup -Identity $groupName -Replace @{info=$newNotes}




# Update multiple group notes to the same one
$groupNames = @("Group1", 
                "Group2", 
                "Group3")  

# Define the new notes
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

# Loop through each group and update the notes
foreach ($groupName in $groupNames) {
    Set-ADGroup -Identity $groupName -Replace @{info=$newNotes}
    Write-Output "Updated notes for group: $groupName"
}

