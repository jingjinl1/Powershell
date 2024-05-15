# Check ad group names:
	
Get-ADGroup -Filter {name -like "*XXXX*"} -Properties Description,info | 
Where-Object { $_.Name -notmatch "-RO$" -and $_.Name -notmatch "-T$" } | 
Select-Object Name, info | Format-Table -AutoSize -Wrap

Get-ADGroup -Filter {name -like "*XXXX*"} -Properties Description,info | Select-Object Name, info | Format-Table -AutoSize -Wrap

Get-ADGroup -Filter 'name -like "*XXXX*"' -Properties Description,info | Where-Object { $_.Name -notmatch "-RO$" -and $_.Name -notmatch "-T$" } | Select-Object Name,@{Name='info'; Expression={$_.info -replace "`n", "  "}} | Export-Csv -Path C:\test4.csv
