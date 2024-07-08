# Variables
$users = @("User1", "User2", "User3")
$groups = @(
    "Group1", 
    "Group2", 
    "Group3")

# Add users to each group
foreach ($user in $users) {
    foreach ($group in $groups) {
        try {
            # Check if the user is already a member of the group
            $isMember = Get-ADGroupMember -Identity $group -Recursive | Where-Object { $_.SamAccountName -eq $user }

            if ($isMember) {
                Write-Output "$user is already in $group"
            } else {
                Add-ADGroupMember -Identity $group -Members $user -ErrorAction Stop
                Write-Output "Added $user to $group"
            }
        } catch {
            Write-Error "Failed to add $user to $group Error: $_"
        }
    }
}




# Define the search pattern and the user to be added
$searchPattern = "*XXXXX*"
$userToAdd = "xxxxx"

# Find all groups that match the search pattern
try {
    $groups = Get-ADGroup -Filter "Name -like '$searchPattern'"

    # Check if any groups were found
    if ($groups) {
        foreach ($group in $groups) {
            $groupName = $group.Name

            # Exclude groups that end with '-T' or '-RO'
            if ($groupName -notmatch "-T$" -and $groupName -notmatch "-RO$") {
                try {
                    # Add the user to the group
                    Add-ADGroupMember -Identity $groupName -Members $userToAdd
                    Write-Output "`nAdded user to group: $groupName"
                }
                catch {
                    Write-Error "Failed to add user to group: $groupName"
                }
            }
        }
    } else {
        Write-Output "No groups found matching the pattern: $searchPattern"
    }
}
catch {
    Write-Error "Failed to retrieve groups"
}

