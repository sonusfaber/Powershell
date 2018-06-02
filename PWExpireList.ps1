#tcausey PW expire script updated 5/31
Get-ADUser -Filter * -SearchBase "ou=ACAGROUP,dc=advisercompliance,dc=com" -Properties enabled, passwordlastset, passwordneverexpires `
| Select-Object enabled, passwordneverexpires, passwordlastset, name `
| Where-Object -Filter { $_.passwordneverexpires -eq $false -AND $_.enabled -eq $true} `
| Sort-Object passwordlastset | ft name, passwordlastset -AutoSize

