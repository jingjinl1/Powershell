# Update notes for one group
$groupName = "XXXXX"
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

# Get and display the group's orginal notes
$groupInfo = Get-ADGroup -Identity $groupName -Properties Description, info | Select-Object Name, info
$groupInfo | Format-Table -AutoSize -Wrap
try {
    # Update the group's notes
    Set-ADGroup -Identity $groupName -Replace @{info=$newNotes} 
    Write-Output "Updated notes for group: $groupName"
}
catch {
    Write-Error "Failed to update notes for group: $groupName"
}
# Get and display the group's updated notes
$groupInfo = Get-ADGroup -Identity $groupName -Properties Description, info | Select-Object Name, info
$groupInfo | Format-Table -AutoSize -Wrap




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



# Update group notes for  all the groups that contains XXXX
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