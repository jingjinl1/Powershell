# Define the group name and the new notes
$groupName = "XXXXX"
$newNotes = "Primary Owner: XXX `r`nSecondary Owner: XXX"

# Update the group's notes
Set-ADGroup -Identity $groupName -Replace @{info=$newNotes}
