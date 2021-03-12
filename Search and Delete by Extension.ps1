

Get-ChildItem c:\ -include *.dmp -Recurse | foreach { Remove-Item -Path $_.FullName -WhatIf}
