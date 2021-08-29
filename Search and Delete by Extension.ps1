Get-ChildItem c:\ -include *.dmp -Recurse | foreach { Remove-Item -Path $_.FullName -WhatIf}

# Change the *.dmp for the format that you want to search and remove