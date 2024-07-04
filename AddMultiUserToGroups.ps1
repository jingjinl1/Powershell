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
