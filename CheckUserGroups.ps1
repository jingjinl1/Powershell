# Define the username
$userName = "XXX"

# Retrieve user's groups that contain "XXXX" in the name
$groupsContainingXXXX = Get-ADUser -Identity $userName -Properties MemberOf |
    Select-Object -ExpandProperty MemberOf |
    Get-ADGroup |
    Where-Object { $_.Name -like "*XXXX*" }

# Output the groups
$groupsContainingXXXX | Format-Table Name, DistinguishedName