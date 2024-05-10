# Variables
$user = "XXX"
$groups = @(
    "XXXXX",
    "XXXXX",
    "XXXXX"
)

# Add user to each group
foreach ($group in $groups) {
    try {
        Add-ADGroupMember -Identity $group -Members $user -ErrorAction Stop
        Write-Output "Added $user to $group successfully."
    } catch {
        Write-Error "Failed to add $user to $group. Error: $_"
    }
}
