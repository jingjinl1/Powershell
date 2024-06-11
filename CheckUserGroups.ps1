# Define the username
$userName = "XXX"

# Retrieve user's groups that contain "XXXX" in the name
$groupsContaining = Get-ADUser -Identity $userName -Properties MemberOf |
    Select-Object -ExpandProperty MemberOf |
    Get-ADGroup | Where-Object { $_.Name -like "*XXXX*" }

# Retrieve the notes for each group and output the results
$groupsContaining | Get-ADGroup -Property info | Select-Object Name, info | Format-Table -AutoSize -Wrap
