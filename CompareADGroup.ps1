#Compare groups between two accounts:

# Define usernames
$user1 = "XXXXX"
$user2 = "XXXXX"

# Retrieve groups for the first user
$user1Groups = (Get-ADUser -Identity $user1 -Properties MemberOf).MemberOf |
    Get-ADGroup | Select-Object -ExpandProperty Name | ForEach-Object { $_.Trim().ToLower() }

# Retrieve groups for the second user
$user2Groups = (Get-ADUser -Identity $user2 -Properties MemberOf).MemberOf |
    Get-ADGroup | Select-Object -ExpandProperty Name | ForEach-Object { $_.Trim().ToLower() }

# Find the groups that user2 has but user1 doesn't
$uniqueToUser2 = $user2Groups | Where-Object { $_ -notin $user1Groups } | Sort-Object

# Output the results
Write-Output "Groups that $user2 has but $user1 doesn't:"
$uniqueToUser2
