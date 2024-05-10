#Add group member with output:
	
$GroupName = "XXXX"
$UserName = "XXX"

if(Get-ADGroupMember -Identity $GroupName | Where-Object { $_.SamAccountName -eq $UserName }) {
    Write-Output "User $UserName is already a member of the group $GroupName."
} else {
    # If not, add the user to the group
    Add-ADGroupMember -Identity $GroupName -Members $UserName
    Write-Output "User $UserName has been added to the group $GroupName."
}
