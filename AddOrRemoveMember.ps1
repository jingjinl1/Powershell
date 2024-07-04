#Add group member with output:
$GroupName = "XXXX"
$UserName = "XXXX"

if(Get-ADGroupMember -Identity $GroupName | Where-Object { $_.SamAccountName -eq $UserName }) {
    Write-Output "User $UserName is already a member of the group $GroupName"
} else {
    # If not, add the user to the group
    Add-ADGroupMember -Identity $GroupName -Members $UserName
    Write-Output "User $UserName has been added to the group $GroupName"
}




#remove member
$GroupName = "XXXX"
$UserName = "XXXX"

# Check if the user is a member of the group
if (Get-ADGroupMember -Identity $GroupName | Where-Object { $_.SamAccountName -eq $UserName }) {
    # If the user is a member, remove them from the group
    Remove-ADGroupMember -Identity $GroupName -Members $UserName -Confirm:$false
    Write-Output "User $UserName has been removed from the group $GroupName"
} else {
    Write-Output "User $UserName is not a member of the group $GroupName"
}