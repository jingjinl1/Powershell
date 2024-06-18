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
        Write-Output "`nUpdated notes for group: $groupName"
        
        $groupInfo = Get-ADGroup -Identity $groupName -Properties Description,info | Select-Object Name, info
        $groupInfo | Format-Table -AutoSize -Wrap
    }
    catch {
        Write-Error "Failed to update notes for group: $groupName"
    }
}



# Define the search pattern and the new notes
$searchPattern = "*XXXXX*"
$newNotes = "Primary Owner: XXXX`r`nSecondary Owner: XXXX"

try {
    # Find all groups that match the search pattern
    $groups = Get-ADGroup -Filter "Name -like '$searchPattern'"

    # Check if any groups were found
    if ($groups) {
        foreach ($group in $groups) {
            $groupName = $group.Name

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
        }
    } else {
        Write-Output "No groups found matching the pattern: $searchPattern"
    }
}
catch {
    Write-Error "Failed to retrieve groups"
}