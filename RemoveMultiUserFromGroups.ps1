# Variables
$users = @("User1", "User2", "User3")
$groups = @(
    "Group1", 
    "Group2", 
    "Group3")

# Remove users from each group
foreach ($user in $users) {
    foreach ($group in $groups) {
        try {
            # Check if the user is a member of the group
            $isMember = Get-ADGroupMember -Identity $group -Recursive | Where-Object { $_.SamAccountName -eq $user }

            if ($isMember) {
                Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false -ErrorAction Stop
                Write-Output "$user successfully removed from $group"
            } else {
                Write-Output "$user is not a member of $group"
            }
        } catch {
            Write-Error "Failed to remove $user from $group Error: $_"
        }
    }
}


# Define the search pattern and the user to be removed
$searchPattern = "*XXXXX*"
$userToRemove = "XXXX" 

# Find all groups that match the search pattern
try {
    $groups = Get-ADGroup -Filter "Name -like '$searchPattern'"

    # Check if any groups were found
    if ($groups) {
        foreach ($group in $groups) {
            $groupName = $group.Name

            try {
                # Remove the user from the group
                Remove-ADGroupMember -Identity $groupName -Members $userToRemove -Confirm:$false
                Write-Output "`nRemoved user from group: $groupName"
            }
            catch {
                Write-Error "Failed to remove user from group: $groupName"
            }
        }
    } else {
        Write-Output "No groups found matching the pattern: $searchPattern"
    }
}
catch {
    Write-Error "Failed to retrieve groups"
}

