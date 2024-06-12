# Check ad group names, excluse the -T and -RO groups:
Get-ADGroup -Filter {name -like "*XXXX*"} -Properties Description,info | 
Where-Object { $_.Name -notmatch "-RO$" -and $_.Name -notmatch "-T$" } | 
Select-Object Name, info | Format-Table -AutoSize -Wrap


# Check for groups names including all groups
Get-ADGroup -Filter {name -like "*XXXX*"} -Properties Description,info | 
Select-Object Name, info | Format-Table -AutoSize -Wrap


# Check for group names and export the result into a Excel file
Get-ADGroup -Filter 'name -like "*XXXX*"' -Properties Description,info | 
Where-Object { $_.Name -notmatch "-RO$" -and $_.Name -notmatch "-T$" } | 
Select-Object Name,@{Name='info'; Expression={$_.info -replace "`n", "  "}} | 
Export-Csv -Path C:\test4.csv
